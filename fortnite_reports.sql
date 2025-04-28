-- Create a view for the comprehensive compliance report
CREATE OR REPLACE VIEW fortnite_password_compliance_report AS
WITH expired_passwords AS (
    SELECT 
        u.user_id,
        CURRENT_DATE - u.created_at::date > pp.max_age_days as is_expired,
        pp.max_age_days,
        CURRENT_DATE - u.created_at::date as password_age
    FROM fortnite_users u
    JOIN fortnite_password_policies pp ON u.account_tier = pp.account_tier
),
reused_passwords AS (
    SELECT 
        password_hash,
        array_agg(user_id) as user_ids
    FROM fortnite_users
    GROUP BY password_hash
    HAVING COUNT(*) > 1
)
SELECT 
    u.user_id,
    u.epic_username,
    u.email,
    u.account_tier,
    u.v_bucks_balance,
    u.last_login,
    CASE WHEN rp.password_hash IS NOT NULL THEN TRUE ELSE FALSE END as is_password_reused,
    ep.is_expired as is_password_expired,
    ep.password_age as days_since_last_change,
    pp.min_length as required_length,
    pp.max_age_days as max_password_age
FROM fortnite_users u
LEFT JOIN reused_passwords rp ON u.password_hash = rp.password_hash
LEFT JOIN expired_passwords ep ON u.user_id = ep.user_id
JOIN fortnite_password_policies pp ON u.account_tier = pp.account_tier;

-- Create scheduled job procedure
CREATE OR REPLACE PROCEDURE run_fortnite_password_compliance_check()
LANGUAGE plpgsql
AS $$
DECLARE
    report_date DATE := CURRENT_DATE;
    non_compliant_count INTEGER;
    competitive_non_compliant INTEGER;
BEGIN
    -- Create a report table if it doesn't exist
    CREATE TABLE IF NOT EXISTS fortnite_compliance_reports (
        report_id SERIAL PRIMARY KEY,
        report_date DATE,
        total_users INTEGER,
        expired_passwords INTEGER,
        reused_passwords INTEGER,
        competitive_violations INTEGER,
        report_details JSONB
    );
    
    -- Count non-compliant passwords
    SELECT COUNT(*) INTO non_compliant_count
    FROM fortnite_password_compliance_report
    WHERE is_password_expired OR is_password_reused;
    
    -- Count competitive account violations (stricter standards)
    SELECT COUNT(*) INTO competitive_non_compliant
    FROM fortnite_password_compliance_report
    WHERE account_tier = 'competitive' AND (is_password_expired OR is_password_reused);
    
    -- Generate and store the report
    INSERT INTO fortnite_compliance_reports (
        report_date,
        total_users,
        expired_passwords,
        reused_passwords,
        competitive_violations,
        report_details
    )
    SELECT
        report_date,
        COUNT(*),
        COUNT(*) FILTER (WHERE is_password_expired),
        COUNT(*) FILTER (WHERE is_password_reused),
        competitive_non_compliant,
        (SELECT json_agg(pcr) FROM fortnite_password_compliance_report pcr) as report_details
    FROM fortnite_password_compliance_report;
    
    -- Notify Epic Games security team if competitive account violations
    IF competitive_non_compliant > 0 THEN
        -- Here you would implement notification system
        RAISE NOTICE 'CRITICAL: % competitive accounts have password violations', competitive_non_compliant;
    END IF;
END;
$$;
-- Procedure to safely change Fortnite account passwords
CREATE OR REPLACE PROCEDURE change_fortnite_password(
    p_user_id INTEGER,
    p_new_password TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_password_hash VARCHAR;
    v_account_tier VARCHAR;
    v_is_valid BOOLEAN;
    v_is_reused BOOLEAN;
    v_reuse_count INTEGER;
BEGIN
    -- Get user account tier
    SELECT account_tier, prevent_reuse_count 
    INTO v_account_tier, v_reuse_count
    FROM fortnite_users u
    JOIN fortnite_password_policies pp ON u.account_tier = pp.account_tier
    WHERE user_id = p_user_id;
    
    -- Validate the new password against policy
    SELECT validate_fortnite_password(p_new_password, v_account_tier) INTO v_is_valid;
    IF NOT v_is_valid THEN
        RAISE EXCEPTION 'Password does not meet Fortnite % tier requirements', v_account_tier;
    END IF;
    
    -- Hash the password (use proper secure hashing function)
    v_password_hash := crypt(p_new_password, gen_salt('bf'));
    
    -- Check password history for reuse
    SELECT COUNT(*) > 0 INTO v_is_reused
    FROM fortnite_password_history
    WHERE user_id = p_user_id
    AND password_hash = v_password_hash
    ORDER BY created_at DESC
    LIMIT v_reuse_count;
    
    IF v_is_reused THEN
        RAISE EXCEPTION 'Cannot reuse recent passwords for Fortnite accounts';
    END IF;
    
    -- Update the user's password
    UPDATE fortnite_users 
    SET password_hash = v_password_hash,
        created_at = CURRENT_TIMESTAMP  -- Reset the password age
    WHERE user_id = p_user_id;
    
    -- Store in password history
    INSERT INTO fortnite_password_history (user_id, password_hash) 
    VALUES (p_user_id, v_password_hash);
    
    COMMIT;
END;
$$;
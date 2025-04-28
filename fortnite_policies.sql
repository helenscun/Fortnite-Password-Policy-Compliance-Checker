CREATE TABLE fortnite_password_policies (
    policy_id SERIAL PRIMARY KEY,
    account_tier VARCHAR(20) NOT NULL,
    min_length INTEGER NOT NULL,
    require_uppercase BOOLEAN DEFAULT TRUE,
    require_lowercase BOOLEAN DEFAULT TRUE,
    require_numbers BOOLEAN DEFAULT TRUE,
    require_special_chars BOOLEAN DEFAULT TRUE,
    max_age_days INTEGER DEFAULT 90,
    prevent_reuse_count INTEGER DEFAULT 3
);

-- Insert Fortnite-specific policies
INSERT INTO fortnite_password_policies 
    (account_tier, min_length, require_uppercase, require_lowercase, require_numbers, require_special_chars, max_age_days, prevent_reuse_count)
VALUES 
    ('standard', 8, true, true, true, false, 180, 3),
    ('battle_pass', 10, true, true, true, true, 120, 4),
    ('crew', 12, true, true, true, true, 90, 5),
    ('competitive', 14, true, true, true, true, 60, 6);
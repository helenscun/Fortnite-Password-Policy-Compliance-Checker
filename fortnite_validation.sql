-- Function to check password length
CREATE OR REPLACE FUNCTION check_fortnite_password_length(password TEXT, min_length INTEGER)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN LENGTH(password) >= min_length;
END;
$$ LANGUAGE plpgsql;

-- Function to check password complexity
CREATE OR REPLACE FUNCTION check_fortnite_password_complexity(
    password TEXT, 
    require_uppercase BOOLEAN,
    require_lowercase BOOLEAN,
    require_numbers BOOLEAN,
    require_special_chars BOOLEAN)
RETURNS BOOLEAN AS $$
BEGIN
    IF require_uppercase AND NOT password SIMILAR TO '%[A-Z]%' THEN
        RETURN FALSE;
    END IF;
    
    IF require_lowercase AND NOT password SIMILAR TO '%[a-z]%' THEN
        RETURN FALSE;
    END IF;
    
    IF require_numbers AND NOT password SIMILAR TO '%[0-9]%' THEN
        RETURN FALSE;
    END IF;
    
    IF require_special_chars AND NOT password SIMILAR TO '%[!@#$%^&*()_+\-=\[\]{};:''",.<>/?]%' THEN
        RETURN FALSE;
    END IF;
    
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

-- Comprehensive validation function
CREATE OR REPLACE FUNCTION validate_fortnite_password(
    password TEXT,
    account_tier VARCHAR
)
RETURNS BOOLEAN AS $$
DECLARE
    policy RECORD;
BEGIN
    SELECT * INTO policy FROM fortnite_password_policies WHERE account_tier = $2;
    
    IF NOT check_fortnite_password_length(password, policy.min_length) THEN
        RETURN FALSE;
    END IF;
    
    IF NOT check_fortnite_password_complexity(
        password, 
        policy.require_uppercase,
        policy.require_lowercase,
        policy.require_numbers,
        policy.require_special_chars) THEN
        RETURN FALSE;
    END IF;
    
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;
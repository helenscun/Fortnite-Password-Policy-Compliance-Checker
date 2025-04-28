CREATE TABLE fortnite_users (
    user_id SERIAL PRIMARY KEY,
    epic_username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    account_tier VARCHAR(20) NOT NULL,  -- 'standard', 'battle_pass', 'crew', 'competitive'
    v_bucks_balance INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

CREATE TABLE fortnite_password_history (
    history_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES fortnite_users(user_id),
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
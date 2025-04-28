-- Insert sample Fortnite users (with already hashed passwords)
INSERT INTO fortnite_users 
    (epic_username, email, password_hash, account_tier, v_bucks_balance, created_at, last_login)
VALUES
    ('Tfue', 'tfue@example.com', '$2a$12$abcdefghijklmnopqrstuv', 'competitive', 25000, '2024-12-01', '2025-04-25'),
    ('TTV_Builder_Pro', 'builder@example.com', '$2a$12$hijklmnopqrstuvwxyzabc', 'battle_pass', 5000, '2024-11-15', '2025-04-26'),
    ('Jonesy_Default', 'jonesy@example.com', '$2a$12$defghijklmnopqrstuvwxy', 'standard', 200, '2025-01-20', '2025-04-20'),
    ('Fortnite_Queen', 'queen@example.com', '$2a$12$ghijklmnopqrstuvwxyzabc', 'crew', 15000, '2024-09-12', '2025-04-27'),
    ('Victory_Royale', 'victory@example.com', '$2a$12$lmnopqrstuvwxyzabcdefg', 'competitive', 12000, '2024-08-30', '2025-04-26'),
    ('Peely_Banana', 'peely@example.com', '$2a$12$defghijklmnopqrstuvwxy', 'standard', 500, '2025-02-15', '2025-04-22'),
    ('Tilted_Towers', 'tilted@example.com', '$2a$12$hijklmnopqrstuvwxyzabc', 'battle_pass', 3500, '2024-10-05', '2025-04-23'),
    ('Midas_Touch', 'midas@example.com', '$2a$12$ghijklmnopqrstuvwxyzabc', 'crew', 20000, '2024-07-18', '2025-04-25');

-- Insert some password history
INSERT INTO fortnite_password_history
    (user_id, password_hash, created_at)
VALUES
    (1, '$2a$12$previoushash1', '2024-09-01'),
    (1, '$2a$12$previoushash2', '2024-06-01'),
    (2, '$2a$12$previoushash3', '2024-08-15'),
    (3, '$2a$12$previoushash4', '2024-12-20'),
    (4, '$2a$12$previoushash5', '2024-06-12'),
    (5, '$2a$12$previoushash6', '2024-05-30');
# Fortnite Password Policy Compliance Checker

![Fortnite Security](https://static.wikia.nocookie.net/fortnite/images/8/84/Security_Guard_-_NPC_-_Fortnite_.png/revision/latest?cb=20231121114756)

A comprehensive database-driven system for enforcing tiered password policies for Fortnite player accounts. This project implements robust password security validation, reuse prevention, and compliance reporting based on different player account types.

## 🎮 Project Overview

The Fortnite Password Policy Compliance Checker provides a complete security solution for managing password policies across different tiers of player accounts. From casual default skin players to competitive tournament participants, this system ensures appropriate password security measures are enforced based on account value and risk level.

### Key Features

- **Tiered Security Policies**: Different password requirements based on account type (Standard, Battle Pass, Crew, Competitive)
- **Password Strength Validation**: Comprehensive checks for password length and complexity
- **History Tracking**: Prevents password reuse based on account tier requirements
- **Compliance Reporting**: Automated detection and reporting of policy violations
- **Priority Alerting**: Special monitoring for high-value competitive accounts

## 📋 Technical Implementation

This project consists of several SQL scripts that together create a complete password policy management system:

| File | Description |
|------|------------|
| `fortnite_schema.sql` | Database tables for users and password history |
| `fortnite_policies.sql` | Defines tiered password policies by account type |
| `fortnite_validation.sql` | Functions for validating password requirements |
| `fortnite_reports.sql` | Compliance reports and automated checking procedures |
| `fortnite_procedures.sql` | Safe password change procedures with validation |
| `fortnite_sample_data.sql` | Example data for testing and demonstration |

## 🔐 Password Policies by Account Tier

| Account Tier | Min Length | Complexity | Expiration (days) | History Check |
|--------------|------------|------------|-------------------|--------------|
| Standard     | 8          | A-Z, a-z, 0-9 | 180 | Last 3 passwords |
| Battle Pass  | 10         | A-Z, a-z, 0-9, $#! | 120 | Last 4 passwords |
| Crew         | 12         | A-Z, a-z, 0-9, $#! | 90 | Last 5 passwords |
| Competitive  | 14         | A-Z, a-z, 0-9, $#! | 60 | Last 6 passwords |

## 🚀 Getting Started

### Prerequisites

- PostgreSQL 12+ database server
- Database administration privileges
- SQL client (e.g., pgAdmin, DBeaver)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/helenscun/fortnite-password-checker.git
   cd fortnite-password-checker
   ```

2. Execute the SQL files in order:
   ```bash
   psql -U your_username -d your_database -f fortnite_schema.sql
   psql -U your_username -d your_database -f fortnite_policies.sql
   psql -U your_username -d your_database -f fortnite_validation.sql
   psql -U your_username -d your_database -f fortnite_reports.sql
   psql -U your_username -d your_database -f fortnite_procedures.sql
   ```

3. (Optional) Load sample data:
   ```bash
   psql -U your_username -d your_database -f fortnite_sample_data.sql
   ```

### Running Compliance Checks

```sql
CALL run_fortnite_password_compliance_check();
```

### Viewing Compliance Reports

```sql
SELECT * FROM fortnite_compliance_reports ORDER BY report_date DESC LIMIT 1;
```

## 📊 Example Validation

```sql
-- Test if a password meets requirements for a competitive account
SELECT validate_fortnite_password('WeakPass123', 'competitive');  -- Returns false
SELECT validate_fortnite_password('StrongP@ssword1234!', 'competitive');  -- Returns true
```

## 🔍 Use Cases

- **Account Creation**: Ensure new Fortnite players set appropriate passwords
- **Password Changes**: Validate and enforce policy during password updates
- **Security Audits**: Generate reports for security compliance
- **Tournament Security**: Apply extra validation for competitive players

## 📝 Implementation Notes

- Passwords are stored as secure hashes, never as plaintext
- Validation occurs before hashing during account creation and password changes
- Daily automated checks identify potential security issues
- Critical alerts for competitive account violations

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

*This project is not affiliated with, maintained, authorized, endorsed, or sponsored by Epic Games or any of its affiliates.*

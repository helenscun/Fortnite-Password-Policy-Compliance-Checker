# Fortnite Password Policy Compliance Checker

![Fortnite Security](https://static.wikia.nocookie.net/fortnite/images/8/84/Security_Guard_-_NPC_-_Fortnite_.png/revision/latest?cb=20231121114756)
![PostgreSQL](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADYAAAA4CAMAAACBkfufAAAAk1BMVEX///8zZ5EAAAAvZZAmYI0qYo4fXYsWWonc3NwRWIgAU4Xp6enLy8tNTU2bm5uqqqrO1+Fri6lagKFmZmaMjIzk4+PDw8M7bJTT3OTV1dWNpLvF0Nt6lrCzwdCFhYXz8/NKdZq4uLhGRkYXFxd6enoPDw81NTVWVlYkJCSktsheXl7e5OorKytvb2/o7fKarsIASoBhIhePAAAEeElEQVRIiY1W65ayOgwN5VIKyh1BEQsOMjKOcN7/6U5KwVZn1jfmh8vS7ibd2UkL8DCeuy5XQ3+/2232PmyC+/lCyMe2C3N4tfaLSLukoQvgdkTZZxeEYdD1hFzDJ1BIyDbY5Hm+b7NPXLgll2zjc/DdMPTVsh3O7dRwS04iunEc5+E+u4rJWxSVc9BD0xRFE08lQL4l3YrqyR741DBGmWclh0qsrRJGHYcy81jhwLQM07aoOYjAthLVkRwGZpmGMNO0WQKQUDk0DJsWCIydeeAYJewkziUhTMx4mFkAFLahfaAxwIHK/6xGXIawzytEGspgJSQ6Sng0Rzg4y3QNJ8KBo7PG1JbEUFPjxUxrfOzljT5p0SW/6c5oCfYrCnEGrJ+dGsgJMgKD9XSyyvkJE0FUMghrgu8U0i84atvbB4h/8YZnqiAxlxV9CuduGS4hRPCbMxEHlGzxdr3DNXtihPGSiuz9CNLyarnQms/2AjOQR0qT2Hxi06bxNNSSBCcS5PcnPUizgcPxJlQQaSe0YqmnmSzGXdTzZ6pTYs8LqsOxhhvV9uLHuDAkrEBZ+tBdYVIJsI+oI8amWz0oRjFTBYfag9qaV9yJULSeKPx4dATH0Kh00pJ78eQkcLBltlOADclHpRJTzlmFTXnpKBgzbdxR+Gc8R0ZQk62mpgUm1t74uhs6MOd8IeW4ICCi4DEJ8YNKwaSEORWsQYrIbcMaoDDFFt+9oC391kSpvOG8ikHo0Z5EpijGGMj2MwvjkYAlHZYGoxXMPmMb5zPCZXVvlAyVkuWBFm8xDM4cCJYV+ZS5xxp/6EQeYPYQgdIXu4GNJTc4DbRry0uv6nAIWwMDFfpc8g7FjFfQX9aGTPxH5uxpETaGpIlHuDNsGExM89qYhaCXyMQp5GpkoVAosUuVACq1J4+m3G/VzpQvntceoMisIcHOo26BALvQugapHNh8xvipVFEHEEVwvTxQ4Os9DymumeWNXG9n4nsNEeZ4B3yzWXDnHola5z3snQP69F46kXfD/Uk/X13uwqULyx0gOlQ730384Lx4Az/oTsHO9/t+yXi6pg5nW7wbWyjHp86HZy6nWVX4k5GVlFxWj3PAzBByh5vnQKS5c0rwHNokjTFgrF/L6VBolTf3GpekQQ7cNj1Fr4jiNhqWXcQY6p6Q9YYNsVgnj2KvERvx2rZRR5q6DDYuK/P7yoi8h10ocavrBhvNf56XYNd7gsE+aNuw+yDqFhYOLugP3H4ui1F0yszXYYZ4FqCdA+0JIHDn+fOJkAyfDPvgQ69eIZLsnOvPloftunvAYS/h5PsJhqWdpr9gdL+bNtz5QHQmsaD67t+wNSe+BhPXTPYeLB8VDK892bD+hu21ImBjLph+wzCDyhvFAnX/xqCdW9GtFv4LlO1bKOgC1U3E7XR+DxZq9yV2kjcZwfJYngZIf4Pl9JtCfrM+hCM+9MSTj8P19CYKq5zjC7RIDvj8/Lr8vX6188p5Sy7vhjiHiS/oMNuSN3X1sPbrQs6n3c+J/wHEulFkeYPwXAAAAABJRU5ErkJggg==)
![License](https://media.discordapp.net/attachments/1146231745725870112/1366330839251816458/Snapchat-1149077023.jpg?ex=68108e41&is=680f3cc1&hm=d2c582c347c3c0475f5089df35fa6b3a07b59d5716c6d43654e3381b89b25492&=&format=webp&width=523&height=929)

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

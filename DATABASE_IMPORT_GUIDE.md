# SoulSync - Database Import Instructions

## Quick Start

1. **Clear existing test data** (if any):
   ```bash
   psql -U your_username -d soulsync -c "TRUNCATE profiles, users RESTART IDENTITY CASCADE;"
   ```

2. **Import 1000 profiles**:
   ```bash
   cd /Users/ashutoshsaxena/IdeaProjects/SoulSync
   psql -U your_username -d soulsync -f seed_data.sql
   ```

3. **Test login credentials**:
   - **Email**: Use any email from the generated profiles, e.g.:
     - `vivaan.das.1@hotmail.com`
     - `ishita.bansal.1@gmail.com`
     - `saanvi.sharma.5@gmail.com`
   - **Password**: `password123`

## What's Included

- ✓ **1000 users** across all categories
- ✓ **Valid BCrypt hash**: `$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e`
- ✓ **Diverse profiles**:
  - Genders: Male, Female (50/50 split)
  - Religions: Hindu, Muslim, Christian, Sikh, Buddhist, Jain
  - Education: High School, Bachelors, Masters, PhD
  - Ages: 21-45 years
  - Heights: 150-190cm
  - Incomes: $30,000-$200,000/month

## Email Format

All emails follow this pattern:
```
{firstname}.{lastname}.{number}@{domain}
```

Examples:
- `aarav.sharma.10@gmail.com`
- `diya.patel.50@yahoo.com`
- `rohan.gupta.100@outlook.com`

## Troubleshooting

If login still fails:
1. Check backend logs for BCrypt errors
2. Verify the hash in database matches: `$2b$10$pcRnYoB8zFaONu0SURGgnOUlzcgoo6dvJNRr.V2LdpAk82Uddc.6e`
3. Ensure you're using password: `password123` (not "password")

## Regenerating Data

To regenerate with fresh data:
```bash
python3 generate_profiles.py
```

The BCrypt hash is now correctly generated using Python's bcrypt library.

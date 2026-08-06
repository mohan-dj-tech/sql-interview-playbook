# sql-interview-playbook
Ace your SQL data interview. A battle-tested collection of scenario-based SQL problems—from window functions to cohort analysis. Complete with schemas, sample data, and detailed query explanations to master real-world data engineering and analytics interviews.

## Repository Structure
- **`/setup`**: Run the SQL scripts in this folder to create the tables and insert mock data into your local database.
- **`/scenarios`**: The core playbook. Questions are categorized by business domains (e.g., E-commerce, Finance, HR).
- **`/concepts`**: Quick refreshers on advanced SQL topics like Window Functions and CTEs.

## How to Use This Playbook
1. Spin up a local SQL database (MySQL recommended).
2. Execute `/setup/01_schema.sql` followed by `/setup/02_seed_data.sql`.
3. Navigate to a scenario folder, read the `README.md` for the table definitions, and try to solve the `.sql` questions.

## Contributing
If you want to add a new scenario, please use the template located at `/templates/scenario_template.md`.

# SQL Interview Playbook

Ace your SQL data interview with a battle-tested collection of scenario-based SQL problems. This playbook covers everything from basic queries to advanced topics like window functions and cohort analysis. Each problem comes complete with schemas, sample data, and detailed query explanations to help you master real-world data engineering and analytics interviews.

## How to Use This Playbook

1.  **Choose a Scenario**: Navigate to the `/scenarios` directory and pick a difficulty level (`easy`, `medium`, or `hard`).
2.  **Understand the Problem**: Open the `ProblemStatement.md` file inside a problem folder. It contains everything you need:
    *   The table schema.
    *   Example input data.
    *   The expected output.
3.  **Write Your Query**: Using the information from the problem statement, write your own SQL query to solve the problem. You can use an online SQL editor or your local database for this.
4.  **Check Your Work**: Compare your query and results with the `Solution.sql` file in the same folder, which includes a detailed explanation of the logic.

## Project Structure

```
.
└── scenarios/
    ├── easy/
    │   ├── 1 - Problem Name/
    │   │   ├── ProblemStatement.md
    │   │   └── Solution.sql
    │   ├── 2 - Problem Name/
    │   │   ├── ProblemStatement.md
    │   │   └── Solution.sql
    │   └── ...
    ├── medium/
    │   ├── 1 - Problem Name/
    │   │   ├── ProblemStatement.md
    │   │   └── Solution.sql
    │   └── ...
    └── hard/
        ├── 1 - Problem Name/
        │   ├── ProblemStatement.md
        │   └── Solution.sql
        └── ...
```

-   **`/scenarios`**: The core playbook, with problems categorized by difficulty.

## Contributing

We welcome contributions! If you have a new SQL problem you'd like to add, please follow these steps:

1.  **Create a New Folder**: Add a new folder inside the appropriate difficulty level (e.g., `/scenarios/easy/11 New Problem/`).
2.  **Add a Problem Statement**: Create a `ProblemStatement.md` file with the schema, example data, and expected output. Please follow the formatting of the existing problems.
3.  **Add the Solution**: Create a `Solution.sql` file with a well-commented, formatted query that solves the problem.
4.  **Submit a Pull Request**: Open a pull request with your changes.
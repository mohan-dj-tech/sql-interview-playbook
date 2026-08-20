-- Problem: Build the Equation

/*
Solution:
To construct the equation by pivoting the Terms table according to the specified formatting rules, we can follow a systematic approach. This involves organizing the terms based on their powers, formatting each term appropriately, and then concatenating them to form the final equation.

Approach Overview
1. **Order Terms by Power Descending**:
   - Sort the terms in descending order of their power to ensure the highest power appears first in the equation.
2. **Assign Row Numbers Within Each Power**:
   - Assign a sequential row number to each term to handle cases where multiple terms have the same power.
3. **Format Each Term**:
   - Determine the sign (+ or -) based on the factor.
   - Format the term according to the rules:
     - If power > 1, format as "<sign><abs(factor)>X^<power>".
     - If power = 1, format as "<sign><abs(factor)>X".
     - If power = 0, format as "<sign><abs(factor)>".
4. **Concatenate Formatted Terms**:
   - Combine all formatted terms in the correct order and append =0 to complete the equation.
*/

-- SQL Query
WITH ordered_terms AS (
    SELECT
        power,
        factor,
        ROW_NUMBER() OVER (ORDER BY power DESC) AS rn
    FROM Terms
),
eqn_reps AS (
    SELECT
        power,
        factor,
        rn,
        CASE
            WHEN factor > 0 THEN '+'
            WHEN factor < 0 THEN '-'
            ELSE ''
        END AS sgn_rep,
        CASE
            WHEN power > 1 THEN CONCAT(ABS(factor), 'X^', power)
            WHEN power = 1 THEN CONCAT(ABS(factor), 'X')
            ELSE CONCAT(ABS(factor))
        END AS power_rep
    FROM ordered_terms
)
SELECT CONCAT(
            GROUP_CONCAT(CONCAT(e.sgn_rep, e.power_rep) ORDER BY e.power DESC SEPARATOR ''),
            '=0'
        ) AS equation
FROM eqn_reps e;


/*
Rolling metrics become fully representative after 12 periods; earlier results are included
for continuity but interpreted with caution.

This analysis applies 12-period rolling averages and standard deviations to financial
transaction data to establish a dynamic baseline per ledger code. Z-scores normalize
period-over-period deviations relative to recent operating patterns rather than long-term
historical averages.

The approach mirrors z-score normalization used in my NBA analysis, demonstrating how
statistical standardization can be applied consistently across different domains.  */

/* This query is designed as a reusable monitoring template.
By changing the ledger code and reporting window, finance teams can
review volatility patterns across different cost or revenue categories.
*/




DECLARE @LedgerCode  VARCHAR(10);
DECLARE @StartPeriod INT;
DECLARE @EndPeriod   INT;


WITH base1 AS (
    SELECT
        LedgerCode,
        CAST(REPLACE(PostingPeriod, '/','') AS INT) AS PeriodInt,
        SUM(amount) AS totalAmount
    FROM tbl.FinanceTransaction
    WHERE LedgerCode = @LedgerCode
    GROUP BY
        LedgerCode,
        CAST(REPLACE(PostingPeriod, '/','') AS INT)
),
calc AS (
    SELECT
        PeriodInt,
        totalAmount,
        AVG(totalAmount) OVER (
            ORDER BY PeriodInt
            ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
        ) AS rolling_12_avg,
        STDEV(totalAmount) OVER (
            ORDER BY PeriodInt
            ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
        ) AS rolling_12_std
    FROM base1
),
final AS (
    SELECT *
    FROM calc
    WHERE PeriodInt BETWEEN @StartPeriod AND @EndPeriod
)
SELECT *,
       (totalAmount - rolling_12_avg)
       / NULLIF(rolling_12_std, 0) AS z_score
FROM final
ORDER BY PeriodInt;

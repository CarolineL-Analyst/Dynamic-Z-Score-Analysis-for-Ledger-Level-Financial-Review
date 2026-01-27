# Executive Summary — Rolling Financial Variance Analysis

## Objective

This analysis evaluates the stability and volatility of a selected ledger code by comparing monthly activity against its recent historical baseline, supporting finance review and anomaly investigation.
This type of rolling variance analysis is particularly useful in larger organizations, where senior stakeholders cannot monitor all cost and revenue movements in detail and instead rely on targeted indicators to flag areas for further investigation.


## Approach
Transactions are aggregated at the financial-period level and analyzed using a 12-period rolling average and standard deviation. Z-scores are calculated to normalize month-over-month deviations relative to recent operating patterns rather than long-term fixed benchmarks.

## Key Findings (Example: Ledger 10000, FY2025)
- Most periods fall within expected historical variation.
- November shows a z-score of 3.16, indicating a statistically unusual increase relative to the prior 12-period baseline.
- December remains elevated (z = 1.45) but closer to normal fluctuation range.
  
## Interpretation
Statistical outliers highlight periods that merit further review but do not imply business issues on their own. Finance context (e.g. timing, accruals, one-off events) is required to assess materiality.

## Notes & Limitations
- Rolling windows are based solely on periods with ledger activity and may contain gaps.
- The analysis supports review and discussion rather than automated exception handling.
- The lookback window (12 periods) can be adjusted to align with different monitoring objectives.

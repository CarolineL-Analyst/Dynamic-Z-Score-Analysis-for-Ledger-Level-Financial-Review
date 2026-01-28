#     Dynamic-Z-Score-Analysis-for-Ledger-Level-Financial-Review


## Project Overview

- Analyzes monthly trends for a selected ledger code
- Focuses on volatility and anomaly detection using rolling statistics
- Designed to support finance review discussions and highlight areas for follow-up rather than automate conclusions

## Audience
- This repository includes an executive-style summary for non-technical stakeholders.
- Technical details and SQL implementations are documented in subsequent sections.
	
## Business Question
- Is this cost / revenue stable over time?	
- Are there periods that deviate noticeably  from recent historical behavior?
  
## Data Source
- A blank Excel template is provided to demonstrate the expected input structure.  
- All data used in this case is simulated and anonymized.

## Data Description
- PostingPeriod (YYYY/MM)  Financial period in which the transaction is posted (not necessarily calendar month)	   
- Transactionp Period: The actual transaction posting date
- Ledger Code : Identifier for expense, revenue, or cost category ( the GL may vary in different companies )	
- Amount: transaction posted to the ledger ( debit or credit )	
- Document Ref: Description of the transaction (e.g., purchase invoice number)
	
## Skill Demonstrated 
- SQL CTE 		
- Windows Functions 		
- Rolling Avg  		
- Rolling Standard Deviation 		
- Z - Score Normalisation 
		
## Methodology
1. Aggregate transactions at the monthly level	
2. Compute 12-period rolling average	
3. Compute 12-period rolling standard deviation	
4. Calculate z-scores to identify unusual periods relative to recent history	
5. The analysis is parameterized by ledger code and reporting period.
	
## Output
- SQL query result set 	
	    Example parameters used in this case:
		LedgerCode = 10000
		Reporting Period = 2025
- Excel snapshot for 2025

## Interpretation : 
- Most monthly postings for the selected expense ledger in 2025 fluctuate within the expected range.  
- November shows a z-score of 3.16, and December 1.45, indicating elevated deviation from the recent rolling baseline.
- As a general guideline, absolute z-scores between 1–2 warrant attention, while values above ±3 are statistically unusual.
- However, statistical anomalies do not automatically imply business issues and typically require contextual explanation from Finance.	

### Additional Notes:
- Rolling windows may not always consist of consecutive periods, as months without postings for a specific ledger code create gaps.	 
- The rolling window is limited to the selected ledger code’s activity history.	
- The output is limited to the selected reporting period regardless of gaps in ledger activity.
- The @StartPeriod controls output display, assuming sufficient historical data exists to support rolling calculations.	
	
## Scope & Extensions& Intended Use
- The current example uses a 12-period lookback; this can be adjusted (e.g., 6 periods) depending on analytical goals.
- The CURRENT ROW in the window function refers to the current record in sequence, not necessarily the latest calendar period.
- A calendar table could be introduced to enforce continuous period coverage and support calendar-based analysis.
- This type of rolling variance analysis is particularly useful in larger organizations, where senior stakeholders cannot monitor all cost and revenue movements in detail and rely on targeted indicators to flag areas for further investigation.

## Applicability Beyond Finance
Although this example uses financial ledger data, the same rolling z-score framework can be applied to operational metrics such as procurement lead times, supplier performance, inventory movements, and service-level indicators.

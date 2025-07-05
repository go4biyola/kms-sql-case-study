# kms-sql-case-study
# 📊 KMS Sales & Customer SQL Analysis

This project contains SQL scripts used to explore and analyze sales, customer behavior, order logistics, and profitability for **KMS**, a fictional retail company. The goal of this analysis was to generate actionable insights for business decision-making using SQL-based data exploration techniques.

## 📁 Project Structure

- `queries/` — All saved `.sql` query files grouped by topic.
- `KMS_Insights_Report.docx` — Optional Word document summarizing the analysis and business recommendations.
- `README.md` — This file.

## 📌 Objectives

- Identify top and bottom customers by revenue and profitability.
- Understand product category performance.
- Analyze shipping modes vs. order priority to assess cost-efficiency.
- Investigate discount patterns and their impact on sales/profit.
- Recommend strategies to improve sales from underperforming segments.

## 🛠️ Tools Used

- **SQL Server Management Studio (SSMS)**
- **Microsoft Word** (for note-taking and summary documentation)
- **GitHub** (version control & sharing)

## 📈 Key Insights and Recommendations

- Average Discount Is Not the Differentiator; 
- Recommendation: Focus more on value perception, not discounts
- **Bottom 10 customers** purchase mainly low-margin, single-use products. Upselling and cross-selling opportunities exist.
- Delivery Truck averages ₦44–47 per order—by far the most expensive.
- Regular Air is the cheapest (~₦7–8), with Express Air only marginally more expensive.
- This is the exact opposite of your business assumption (“Truck = cheapest; Express = costliest”).
- Action: Audit how Shipping_Cost is calculated.
- “Truck delivery” may be picking up whole route costs (not per package), or Air lines are being subsidized. You need true per order averages before you can enforce any “economical vs. urgent” policy
- Mode Usage Doesn’t Reflect Priority
•	Critical orders: 74% go by Regular Air, only 12% use Express.
•	Low orders: 79% go Regular Air, only 9% Express.
•	High/Medium follow the same pattern
Insight: There’s virtually no differentiation in shipping‐mode mix across priorities. Urgent orders aren’t being funneled into faster (intended) methods.

- “Not Specified” order priority rows were excluded to maintain data clarity and avoid skewing performance metrics.
- . Recommendations for KMS Management
- 1.	Fix Cost Data First
o	Reconcile Shipping_Cost to true per order cost.
2.	Enforce Priority→Mode Mapping
   o	Critical → Express Air (target ≥ 50% of Critical)
  	o	High → Regular Air (target ≥ 60% of High)
  	o	Medium/Low → Delivery Truck (target ≥ 70% of Medium / Low)

3.	Build a Monitoring Report
o	After policy rollout, track % of priority orders by mode monthly.
o	Flag any deviations > ± 10 pts from your targets.
By first validating your cost assumptions and then actively steering orders into the right modes, KMS can both improve service for high‐priority customers and drive down freight expense on lower‐priority shipments.
## 📊 Sample Queries

```sql
-- Top 10 Customers by Total Sales
SELECT TOP 10 
    Customer_Name, 
    SUM(Sales) AS total_sales
FROM [KMS Sql Case Study Project DATA ANALYSIS]
GROUP BY Customer_Name
ORDER BY total_sales DESC;

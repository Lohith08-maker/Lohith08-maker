-- SAP MM Procure-to-Pay synthetic dataset — revised analytical SQL
-- Database: SQLite; table name: p2p_raw_data (CSV imported with header names)
-- Educational portfolio only. PR_Qty serves as a PROXY for PO-line quantity:
-- no separate PO_Qty column is available. Not SAP HANA SQL.
-- Date strings are ISO YYYY-MM-DD and may be blank for unreceived/uninvoiced lines.

-- 1. Record counts and value proxy
SELECT COUNT(*) AS line_count,
       COUNT(DISTINCT Material_ID) AS materials,
       COUNT(DISTINCT Supplier_ID) AS suppliers,
       ROUND(SUM(CAST(PR_Qty AS REAL)*CAST(Unit_Price_INR AS REAL)),2) AS po_line_value_proxy_inr
FROM p2p_raw_data;

-- 2. PO value proxy by supplier
SELECT Supplier_ID,Supplier_Name,COUNT(*) AS po_lines,
       ROUND(SUM(CAST(PR_Qty AS REAL)*CAST(Unit_Price_INR AS REAL)),2) AS estimated_value_inr
FROM p2p_raw_data
GROUP BY Supplier_ID,Supplier_Name
ORDER BY estimated_value_inr DESC;

-- 3. PO value proxy by material group
SELECT Material_Group,COUNT(*) AS po_lines,
       ROUND(SUM(CAST(PR_Qty AS REAL)*CAST(Unit_Price_INR AS REAL)),2) AS estimated_value_inr
FROM p2p_raw_data
GROUP BY Material_Group ORDER BY estimated_value_inr DESC;

-- 4. On-time goods receipts (only lines with recorded GR)
SELECT COUNT(*) AS receipts,
       SUM(CASE WHEN date(GR_Date)<=date(Expected_Delivery_Date) THEN 1 ELSE 0 END) AS on_time_receipts,
       ROUND(100.0*SUM(CASE WHEN date(GR_Date)<=date(Expected_Delivery_Date) THEN 1 ELSE 0 END)/NULLIF(COUNT(*),0),2) AS on_time_rate_pct,
       ROUND(AVG(julianday(GR_Date)-julianday(PO_Date)),2) AS mean_order_to_receipt_days
FROM p2p_raw_data WHERE NULLIF(TRIM(GR_Date),'') IS NOT NULL;

-- 5. Not-yet-received and partial/different-quantity lines
SELECT PO_ID, Material_ID,Supplier_Name,PR_Qty,GR_Qty,Expected_Delivery_Date,GR_Date,
       CASE
         WHEN NULLIF(TRIM(GR_Date),'') IS NULL THEN 'NO_GOODS_RECEIPT'
         WHEN CAST(GR_Qty AS REAL) <> CAST(PR_Qty AS REAL) THEN 'RECEIPT_QTY_DIFFERS'
         ELSE 'RECEIVED_QTY_MATCHES'
       END AS goods_receipt_status
FROM p2p_raw_data
WHERE NULLIF(TRIM(GR_Date),'') IS NULL
   OR CAST(GR_Qty AS REAL)<>CAST(PR_Qty AS REAL);

-- 6. Invoice amount differences using INVOICE quantity (not PR_Qty).
-- This avoids incorrectly flagging a correctly invoiced partial receipt.
SELECT PO_ID,Invoice_ID,Supplier_Name,PR_Qty,GR_Qty,Invoice_Qty,Unit_Price_INR,Invoice_Amount_INR,
       ROUND(CAST(Invoice_Qty AS REAL)*CAST(Unit_Price_INR AS REAL),2) AS expected_invoice_inr,
       ROUND(CAST(Invoice_Amount_INR AS REAL) - CAST(Invoice_Qty AS REAL)*CAST(Unit_Price_INR AS REAL),2) AS variance_inr
FROM p2p_raw_data
WHERE NULLIF(TRIM(Invoice_Date),'') IS NOT NULL
  AND ABS(CAST(Invoice_Amount_INR AS REAL)-CAST(Invoice_Qty AS REAL)*CAST(Unit_Price_INR AS REAL))>1.00;

-- 7. Simplified receipt/invoice/price match: three ways of checking a line.
-- It is a portfolio matching rule, not proof of SAP configuration or posting.
WITH invoiced AS (
 SELECT *, CASE
   WHEN NULLIF(TRIM(GR_Date),'') IS NOT NULL
    AND CAST(Invoice_Qty AS REAL)=CAST(GR_Qty AS REAL)
    AND CAST(Invoice_Qty AS REAL)<=CAST(PR_Qty AS REAL)
    AND ABS(CAST(Invoice_Amount_INR AS REAL)-CAST(Invoice_Qty AS REAL)*CAST(Unit_Price_INR AS REAL))<=1.00
   THEN 1 ELSE 0 END AS matches
 FROM p2p_raw_data WHERE NULLIF(TRIM(Invoice_Date),'') IS NOT NULL
)
SELECT COUNT(*) AS invoiced_lines,SUM(matches) AS matching_lines,
       ROUND(100.0*SUM(matches)/NULLIF(COUNT(*),0),2) AS match_rate_pct
FROM invoiced;

-- 8. Invoice quantity mismatches vs recorded goods receipts
SELECT PO_ID,Invoice_ID,GR_Qty,Invoice_Qty
FROM p2p_raw_data
WHERE NULLIF(TRIM(Invoice_Date),'') IS NOT NULL
  AND CAST(Invoice_Qty AS REAL)<>CAST(GR_Qty AS REAL);

-- 9. Unreceived purchase lines
SELECT PO_ID,Material_ID,Supplier_Name,PR_Qty,Expected_Delivery_Date
FROM p2p_raw_data WHERE NULLIF(TRIM(GR_Date),'') IS NULL;

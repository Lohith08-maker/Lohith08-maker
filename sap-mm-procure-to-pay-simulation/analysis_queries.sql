-- SAP MM Procure-to-Pay Portfolio Project
-- Dataset: p2p_raw_data.csv
-- Synthetic educational data; not extracted from a live SAP system.

-- 1) Total PO spend
SELECT ROUND(SUM(PR_Qty * Unit_Price_INR), 2) AS total_po_spend
FROM p2p_raw_data;

-- 2) Spend by supplier
SELECT Supplier_Name,
       ROUND(SUM(PR_Qty * Unit_Price_INR), 2) AS po_spend
FROM p2p_raw_data
GROUP BY Supplier_Name
ORDER BY po_spend DESC;

-- 3) Spend by material group
SELECT Material_Group,
       ROUND(SUM(PR_Qty * Unit_Price_INR), 2) AS po_spend
FROM p2p_raw_data
GROUP BY Material_Group
ORDER BY po_spend DESC;

-- 4) On-time delivery rate
SELECT
  ROUND(
    100.0 * SUM(CASE WHEN GR_Date <= Expected_Delivery_Date THEN 1 ELSE 0 END)
    / NULLIF(SUM(CASE WHEN GR_Date IS NOT NULL THEN 1 ELSE 0 END), 0),
    2
  ) AS on_time_delivery_pct
FROM p2p_raw_data;

-- 5) Quantity exceptions: PO quantity vs goods received
SELECT PO_ID, Material_ID, Supplier_Name, PR_Qty, GR_Qty
FROM p2p_raw_data
WHERE GR_Date IS NOT NULL
  AND GR_Qty <> PR_Qty;

-- 6) Invoice value exceptions
SELECT PO_ID, Invoice_ID, Supplier_Name,
       ROUND(PR_Qty * Unit_Price_INR, 2) AS po_value,
       Invoice_Amount_INR
FROM p2p_raw_data
WHERE Invoice_Date IS NOT NULL
  AND ABS(Invoice_Amount_INR - (PR_Qty * Unit_Price_INR)) > 1;

-- 7) Open purchase orders
SELECT PO_ID, Supplier_Name, Material_ID, PR_Qty, Expected_Delivery_Date
FROM p2p_raw_data
WHERE GR_Date IS NULL;

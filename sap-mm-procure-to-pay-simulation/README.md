# SAP MM / S/4HANA Procure-to-Pay Simulation

## Overview
A portfolio project created to build practical understanding of the SAP MM / S/4HANA **Procure-to-Pay (P2P)** business process.

This is an **educational simulation using synthetic data**. It does not represent professional SAP implementation experience or access to a production SAP system.

## Business Process
**Requirement → Purchase Requisition (PR) → Purchase Order (PO) → Goods Receipt (GR) → Invoice Verification → Payment**

The project focuses on procurement process understanding, transaction-data validation, supplier performance, delivery performance and three-way-match exception analysis.

## Dataset
- 240 procurement / PO-line records
- 40 materials
- 12 suppliers
- Jan–Sep 2026
- Construction and project-oriented materials
- Synthetic late deliveries, open POs, partial receipts and invoice-value exceptions

## Key Results
- Total simulated PO spend: **₹28.30 million**
- Completed receipt lines: **217**
- On-time delivery rate: **82.9%**
- Three-way-match pass rate: **81.6%**
- Average lead time: **11.0 days**
- Open PO lines: **23**
- Exception lines: **40**

## SAP MM Concepts Demonstrated
- Purchase Requisition
- Purchase Order
- Goods Receipt
- Invoice Verification
- Three-Way Match
- Material Master
- Supplier Master
- Procurement exception monitoring
- Open quantity tracking
- Supplier and material-group spend analysis

## Tools
- Microsoft Excel
- SQL
- SAP MM / S/4HANA Sourcing & Procurement concepts

## SQL Analysis
The included `analysis_queries.sql` demonstrates:
1. Total PO spend
2. Supplier spend
3. Material-group spend
4. On-time delivery rate
5. PO vs GR quantity exceptions
6. Invoice-value exceptions
7. Open purchase orders

## Portfolio Positioning
**Resume project title:**  
**SAP MM Procure-to-Pay Simulation | Excel, SQL**

**Resume bullets:**
- Built a synthetic SAP MM Procure-to-Pay dataset covering PR, PO, goods receipt and invoice verification across **240 procurement records, 40 materials and 12 suppliers**.
- Created controls for delivery status, open quantities and PO/GR/invoice three-way-match exceptions, and analyzed procurement KPIs including spend, lead time, supplier performance and exceptions.

## Interview Explanation
> I created a synthetic SAP MM Procure-to-Pay simulation to understand the end-to-end procurement process and practice procurement data validation and exception analysis. It is a learning project, not a live SAP implementation.

## Files
- `analysis_queries.sql` — SQL analysis
- `p2p_sample_data.csv` — sample of the synthetic procurement dataset

---
**Target roles:** SAP MM Trainee • SAP Functional Consultant Trainee • SAP Associate Consultant • SAP Support • SAP Master Data / ERP Support

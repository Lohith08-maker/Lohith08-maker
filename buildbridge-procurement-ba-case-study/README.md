# BuildBridge — Construction Procurement Business Analysis Case Study

**Type:** AI-assisted learning/portfolio demonstrator, built with synthetic data. **Not** client work, not a real deployed product, and not affiliated with Zethic.

## Open the demo

Double-click `constructflow.html` in Chrome, Edge, or another modern browser. No install, account, server, or internet connection required. All state is local to that browser. Reset Demo restores mock requests.

## The hypothetical business problem
A regional construction contractor collects material requests over phone calls and spreadsheets. Procurement cannot easily track approvals, compare supplier quotes, or establish why a vendor was chosen.

## Demonstrated BA deliverables
- Business Requirements Document (BRD) and prioritized requirements
- Functional requirements and approval logic
- User stories with acceptance criteria
- As-is/to-be workflow analysis
- Requirements traceability matrix and test scenarios
- Working front-end prototype with input validation, supplier quotes, approval routing, audit log and CSV export

Refer to [`CASE_STUDY.md`](./CASE_STUDY.md) for the business analysis requirements and UAT documentation. An independently formatted PDF version is also available in the private application package.

## Basic demo walkthrough
1. Create a material requisition with a budget and site justification.
2. Select the newly created requisition.
3. Add quotations from mock vendors with price, lead time and quality score.
4. Choose a vendor; submit for approval. Owner depends on the request budget.
5. Approve or reject, writing a rationale where applicable.
6. Export request and audit history to CSV.
7. Reset demo to repeat testing.

## Business rules (example assumptions, not industry standards)
- Budget below INR 50,000: Site Manager.
- Budget INR 50,000–200,000: Project Manager.
- Budget above INR 200,000: Finance Lead.
- Approval requires at least one quote and a selected vendor.
- Selected vendor quote over budget requires acknowledgment; a full real system would require exception approval.
- Rejection requires a clear reason.
- Approved and rejected records are read-only in demo.

## Limitations / handover notes
- **Synthetic data only:** all materials, project names, suppliers, scores, budgets and dates are illustrative.
- The demo has no authentication, backend, persistence across devices, email notifications, secure approval or integrations. Client-side role labels simulate routing, not access control.
- Browser localStorage is not suitable for production data. No actual purchase orders are sent.
- Rule thresholds are stakeholder assumptions requiring real-world validation.
- Vendor scores are displayed for comparison; no automated ranking algorithm is implied.

## Portfolio integrity
If presenting in an interview, say this was an AI-assisted practice case study, explain the business decisions in your own words, run the demo, and discuss tradeoffs. Do not say it was completed for a real client or employer.

## Demo source

- [Open source demo](./constructflow.html)
- [Download raw HTML](https://raw.githubusercontent.com/Lohith08-maker/Lohith08-maker/main/buildbridge-procurement-ba-case-study/constructflow.html) and open locally in a web browser.
- All names and data are fictional. Do not submit sensitive data.

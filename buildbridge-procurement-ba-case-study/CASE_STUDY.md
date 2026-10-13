# BuildBridge — Business Analysis Case Study

**Educational simulation with synthetic data; AI-assisted; no client engagement or deployment.**



---

BuildBridge
Construction Procurement Workflow | Business Analysis Case Study
Prepared October 2026 • Simulated mid-size contractor • All names, values and processes are illustrative
Scope: practice BRD + functional requirements + user stories + acceptance criteria + process mapping + traceability +
UAT + offline working front-end demonstrator.

1. Executive brief
Scenario: A hypothetical three-site contractor handles material requests via calls, messages and disconnected
spreadsheets. Site teams report duplicated requests, unclear approval ownership, late vendor quotes and missing
decision records. This case study defines a minimum viable procurement workflow; it does not represent a real
client engagement.
Business objective                                           Proposed measurement
Reduce missing approval ownership                            100% of newly submitted requests assigned to a decision role
Improve quote transparency                                   At least one recorded vendor quote before approval
Increase auditability                                        All major changes and decisions logged with time and reason
Support basic reporting                                      Export requests and audit events as CSV

2. Stakeholders and assumptions
Role                                                         Primary needs
                                                             Submit material need, quantity, budget, required date and
Site Requester
                                                             justification
Procurement Associate                                        Record and compare supplier offers
Site / Project Manager                                       Review financial requests within assigned thresholds
Finance Lead                                                 Approve high-budget exceptions and provide controls
Assumptions to validate in a real discovery meeting: spending thresholds, who may authorize a request, supplier
evaluation criteria, tax inclusion, delegation rules, purchase order integration, exceptions and SLA timeframes.

3. As-is vs. to-be
As-is (hypothetical)                                         To-be (MVP scope)
Request sent through calls / chat                            Structured, validated request form and unique ID
Approval owner unclear                                       Automatic routing label based on requested budget
Vendor price shared informally                               Stored quote values, lead time and quality indication
Decisions in dispersed messages                              Recorded status and audit history with timestamps

4. Business requirements (BRD)
ID                                      Requirement                                Priority
                                        Requester can submit a material need
BR-01                                                                              Must
                                        with required data
                                        Procurement can add vendor quotations
BR-02                                                                              Must
                                        per request
                                        Every submitted request is assigned a
BR-03                                                                              Must
                                        review role
                                        Reviewer can approve or reject with
BR-04                                                                              Must
                                        traceability
                                        User can export requisition and event
BR-05                                                                              Should
                                        history
BR-06                                   System shows basic workflow counts         Should

                              BuildBridge | Synthetic portfolio case study | October 2026

---

                                            and approved spend
                                            Supplier performance scores affect
BR-07                                                                                  Could / out of scope
                                            automated choice

5. Functional requirements and rules (FRD)
ID                                                               Functional rule / validation
                                                                 Required: project, item, positive integer quantity, positive
FR-01
                                                                 budget, non-past needed date, justification >= 8 chars.
                                                                 New request receives a unique PR-#### identifier and status
FR-02
                                                                 Needs Quotes.
                                                                 Display approval owner using proposed thresholds: < 50K Site;
FR-03
                                                                 50K–200K Project; > 200K Finance.
                                                                 Each mock vendor can provide at most one quote; value
FR-04
                                                                 positive, lead days 1–365, quality 0–100.
                                                                 Route to Awaiting Approval only after a quote and selected
FR-05
                                                                 vendor are available.
                                                                 Approve only from Awaiting Approval; reject requires a
FR-06
                                                                 rationale of at least 8 characters.
                                                                 Log each quote, submission, routing, approval or rejection
FR-07
                                                                 with timestamp.
FR-08                                                            Show counts and export tabular request/event data into CSV.
Non-functional needs for a real deployment: authentication, server-side authorization, encryption, retention policy,
accessibility testing, financial controls, audit immutability, backup and API integrations. These are not implemented
in the front-end demonstration.

6. User stories and acceptance criteria
US-01 As a site requester, I want to raise a material requisition so procurement knows what to buy.
     Acceptance: Given valid values, when submitted, a unique ID and Needs Quotes status appear. Invalid quantities
     or dates are refused.

US-02 As procurement, I want to record comparable vendor quotations so I can review options.
     Acceptance: For a request, a distinct mock vendor quote can be added with positive price, lead time and quality.
     Duplicates are disallowed.

US-03 As a manager, I want requests routed by budget so approval ownership is clear.
     Acceptance: Requests <50K show Site Manager; 50K through 200K Project Manager; >200K Finance Lead.

US-04 As an approver, I want to approve or reject a routed request so decisions are visible.
     Acceptance: Approval unavailable without routing and a chosen quote; rejection requires reason; final state is
     read-only.

US-05 As an auditor, I want a timestamped event log so I can trace decisions.
     Acceptance: A new quote, routing, approval and rejection produce an audit event visible on screen and in export.

US-06 As procurement leadership, I want quick reporting so I can monitor work.
     Acceptance: Dashboard shows request totals, pending approvals, needs quotations, and approved quote value;
     CSV export works.

7. Traceability matrix
Business req                      Functional req                 Story                             UAT
BR-01                             FR-01, FR-02                   US-01                             T01, T02
BR-02                             FR-04                          US-02                             T03, T04

                              BuildBridge | Synthetic portfolio case study | October 2026

---

BR-03                         FR-03, FR-05                    US-03                            T05, T06
BR-04                         FR-06, FR-07                    US-04 / US-05                    T07, T08
BR-05                         FR-08                           US-06                            T09
BR-06                         FR-08                           US-06                            T10

8. UAT plan (manual executable test cases)
Test                                    Action / steps                             Expected result
                                        Submit valid new request - Create PR
T01                                     with future date, positive budget & 8+     New PR appears; status Needs Quotes
                                        character reason
                                        Reject invalid date - Choose date before   Browser prompts correction; no PR
T02
                                        today                                      created
                                        Accept valid quotation - Select PR,
T03                                     provide a distinct vendor, amount, lead    Quote appears and event is logged
                                        days and quality
                                        Reject invalid quotation - Submit zero
T04                                                                                No quote added; validation warning
                                        amount or lead time 0
                                        Check approval boundaries - Test budget    Site / Project / Project / Finance
T05
                                        49,999 / 50,000 / 200,000 / 200,001        respectively
                                        Block routing without quote - Create PR
T06                                                                                Request stays Needs Quotes
                                        and press Route without quote
                                        Approve properly routed request - Add      Status Approved; selected quote value
T07
                                        quote, route, then Approve                 included in KPI
                                        Reject only with reason - Press Reject
                                                                                   Short reason blocked; valid reason
T08                                     with short/missing reason; then valid
                                                                                   records Rejected state
                                        reason
T09                                     Export CSV - Press both Export actions     Download request and audit CSV files
                                        Refresh persistence - Create a PR and
T10                                                                                PR persists if local storage is available
                                        reload same browser
UAT status: Planned test scenarios; not a claim of independently executed client UAT. Run each case before
interviews and capture results/screenshots in your own test log.

9. Demo functionality and deliberate boundaries
  Runs as a single offline HTML file with browser localStorage (no backend, server or installation).
  Supports create requisition, add quotes, select supplier, route/approve/reject, dashboard KPIs, event log and CSV
      exports.
  Approval roles are routing labels, not secure logins. A real system would require RBAC and back-end checks.
  Vendor price, lead time and quality are displayed, not algorithmically ranked. Scoring was left out to avoid false
      precision.
  All dataset values, vendor names and construction projects are fictitious. This is not a client deployment.

10. Interview talking points / next iteration
Tradeoff: Prioritized traceable request handling over a sophisticated supplier scoring formula, as auditability and
approval ownership were the most salient hypothetical pain points.
Discovery question: What approval thresholds, tax treatment, exceptions, and material master data does the client
actually use? Requirements should be confirmed before development.
Next sprint candidates: real sign-in with role permissions; change request/reapproval; attachment upload; supplier
scoring with stakeholder-agreed weights; procurement KPIs; ERP/API integration; immutable server-side audit logs.
Portfolio ethics: this work is a self-directed AI-assisted learning case study. Explain what you reviewed and tested
yourself; do not present it as paid client work or as a fully production-ready system.

                             BuildBridge | Synthetic portfolio case study | October 2026
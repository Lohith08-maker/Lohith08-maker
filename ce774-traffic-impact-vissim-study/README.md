# CE774 | Heavy-Vehicle Impacts on Campus Traffic — IIT Bombay

**Academic group project:** Impact of Heavy Vehicles on Pedestrian–Vehicle Interactions within IIT Bombay: A VISSIM-Based Study  
**Course:** CE774 — Traffic Management and Design, IIT Bombay  
**Team:** Eight students | **Contributor:** Vura Lohith Kumar  
**My contribution:** Ground-survey planning, traffic observations, analysis of findings, and recommendations.

> This is a documented academic group project, not a commissioned consulting engagement. The PTV VISSIM simulations were a **team activity**; I do not claim to have individually developed the VISSIM models. The source presentation was a course submission; this GitHub write-up and the simple reproducibility script were prepared later as portfolio documentation.

## Problem

The IIT Bombay campus has mixed flows of pedestrians, cyclists, two-wheelers, cars, light commercial vehicles, and heavy commercial vehicles (HCVs). On relatively narrow roads and at pedestrian-intensive intersections, slower-moving and turning HCVs may create queues, conflicts, and difficult crossings. The project examined traffic conditions and possible operating-policy improvements.

## Study areas

1. **Gymkhana Road:** Approximately 400 m near New Gymkhana; narrow, two-way carriageway with limited overtaking opportunities and pedestrian/vehicle interactions.
2. **SOM T-intersection:** Turning and stopping heavy vehicles were observed as a potential problem for pedestrian/cycle movement and intersection throughput.

## My work

- Helped plan ground-survey activities and observe the interactions of heavy vehicles with pedestrians and other vehicles.
- Interpreted observed traffic patterns and summarized congestion, queuing, crossing, and roadway-management concerns.
- Contributed practical recommendations involving peak-hour HCV restrictions, signage, dedicated truck waiting/unloading space, and safer intersection operations.

## Observed dataset (from the team's presentation)

The presentation reports **180 vehicle movements in a 15-minute sample**:

| Vehicle type | Count | Share of sample |
|---|---:|---:|
| Two-wheelers | 84 | 46.67% |
| Cars (including autos) | 72 | 40.00% |
| Light commercial vehicles | 8 | 4.44% |
| Heavy commercial vehicles | 16 | 8.89% |
| **Total** | **180** | **100.00%** |

Raw aggregates transcribed from the course presentation: [vehicle_counts.csv](./data/vehicle_counts.csv). An additional aggregate speed-frequency table is in [speed_distribution.csv](./data/speed_distribution.csv). These are **aggregated presentation values**, not row-level sensor or survey logs.

## Method discussed in the team presentation

The group considered manual counts, speed observations, driver/pedestrian interactions, road geometry, and PTV VISSIM simulation of the two study areas. The presentation reports queues behind slow trucks, pedestrian crossings, and turning conflicts. It discusses restricting HCV movement at academic peak periods and improvements to routing, signage, and parking/waiting zones.

**Important distinction:** The presentation does *not* provide a controlled before-versus-after table of simulation performance measures. This repository does not claim a measured reduction in travel time or collisions.

## Recommendations documented in the course project

- Restrict HCV entry during the busiest academic periods where feasible.
- Mark dedicated waiting/parking and unloading zones for commercial vehicles.
- Improve signage and protect pedestrian-only connections.
- Review T-intersection geometry, priority allocation, and safe pedestrian crossings.

## Reproducibility & limitations

- Run `python analyze_counts.py` to independently recalculate shares from the published aggregate counts; only Python's standard library is needed.
- The slides contain **conflicting HCV speed numbers**: 25 km/h in the table on slide 6 and 23 km/h in the summary on slide 9. Neither value is used as a validated final outcome here.
- Observations are from a short sample, not a documented day-long census. No confidence interval or before/after statistical test is claimed.
- Presentation results are group-level; specific individual work is identified above.
- Details and page-to-claim mapping: [SOURCE_NOTES.md](./SOURCE_NOTES.md).

## Skills illustrated

Field-survey planning • Operational observation • Data interpretation • Problem framing • Stakeholder-oriented recommendations • Team collaboration • Traffic simulation interpretation

**Original source:** Team CE774 course presentation (19 slides). The unredacted original is deliberately not published here because it contains classmates' names and shared course material.

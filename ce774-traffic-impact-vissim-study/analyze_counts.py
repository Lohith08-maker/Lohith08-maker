"""Reproduce simple counts and proportions from CE774 presentation tables.

This script was written as later portfolio documentation, not an original
course-project analysis script or proof of individual simulation work.
It uses presentation aggregates, not raw traffic observation records.
"""
from csv import DictReader
from pathlib import Path

ROOT = Path(__file__).resolve().parent
with (ROOT / "data" / "vehicle_counts.csv").open(newline="", encoding="utf-8") as f:
    rows = list(DictReader(f))
counts = [(r["vehicle_type"], int(r["count"])) for r in rows]
total = sum(n for _, n in counts)
assert total == 180, f"Expected 180 reported observations, got {total}"

print(f"Total reported movements: {total}")
for label, count in counts:
    print(f"{label}: {count} ({count / total:.2%})")

with (ROOT / "data" / "speed_distribution.csv").open(newline="", encoding="utf-8") as f:
    speed_bins = list(DictReader(f))
speed_total = sum(int(row["frequency"]) for row in speed_bins)
assert speed_total == total
print(f"Speed-bin frequency sum: {speed_total}")
print("Caution: speed figures shown elsewhere in the source slides conflict.")

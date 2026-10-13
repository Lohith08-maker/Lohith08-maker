"""Check simple numeric consistency of CE776 presentation aggregates.

Created later as portfolio documentation, NOT original course-project code.
Not a recreation of financial NPV/IRR/BCR modelling.
"""
from decimal import Decimal

headline = Decimal("2132.9")
phase1 = Decimal("1006.73")
phase2 = Decimal("1147.54")
phases = phase1 + phase2
print(f"Phase total: INR {phases} crore")
print(f"Reported headline: INR {headline} crore")
print(f"Difference: INR {phases - headline} crore")

minutes_saved = Decimal("25")
value_per_hour = Decimal("120")
passengers_per_bus = Decimal("40")
daily_bus_trips = Decimal("5450")
daily_rupees = minutes_saved / 60 * value_per_hour * passengers_per_bus * daily_bus_trips
print(f"Direct input-based daily time value: INR {daily_rupees / 100000} lakh")
print("Slide-reported daily time value: INR 10.91 lakh")
print("Warning: scenarios are illustrative and the original underlying model is unavailable.")

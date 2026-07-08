import pandas as pd

# Load dataset
data = pd.read_csv("../data/marketing_campaign_all_brands.csv")

# Convert Date column to datetime
data["Date"] = pd.to_datetime(
    data["Date"],
    format="%d-%m-%Y"
)

# Create calculated KPIs

# Click Through Rate
data["CTR"] = (
    data["Clicks"] / data["Impressions"]
) * 100

# Lead Conversion Rate
data["Lead_Conversion_Rate"] = (
    data["Leads"] / data["Clicks"]
) * 100

# Customer Conversion Rate
data["Conversion_Rate"] = (
    data["Conversions"] / data["Leads"]
) * 100

# Cost Per Acquisition
data["CPA"] = (
    data["Acquisition_Cost"] / data["Conversions"]
)

# Check logical consistency
print("Clicks greater than impressions:")
print((data["Clicks"] > data["Impressions"]).sum())

print("\nConversions greater than leads:")
print((data["Conversions"] > data["Leads"]).sum())

print("\nLeads greater than clicks:")
print((data["Leads"] > data["Clicks"]).sum())

# Save clean dataset
data.to_csv(
    "../data/marketing_campaign_clean.csv",
    index=False
)

print("\nClean dataset created successfully!")
print(data.head())
print(data.shape)
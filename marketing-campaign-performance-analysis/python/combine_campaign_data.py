import pandas as pd

# Load datasets
nykaa = pd.read_csv("../data/nykaa_campaign_data.csv")
purplle = pd.read_csv("../data/purplle_campaign_data.csv")
tira = pd.read_csv("../data/tira_campaign_data.csv")

# Add brand column
nykaa["Brand"] = "Nykaa"
purplle["Brand"] = "Purplle"
tira["Brand"] = "Tira"

# Combine datasets
marketing_data = pd.concat(
    [nykaa, purplle, tira],
    ignore_index=True
)

# Save combined dataset
marketing_data.to_csv(
    "../data/marketing_campaign_all_brands.csv",
    index=False
)

print("Dataset created successfully!")
print(marketing_data.head())
print(marketing_data.shape)

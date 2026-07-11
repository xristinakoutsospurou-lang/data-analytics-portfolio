import pandas as pd

# Load raw data
df = pd.read_csv(
    "retail-sales-performance-analysis/data/raw/Sample - Superstore.csv",
    encoding="latin1"
)

# Convert dates
df["Order Date"] = pd.to_datetime(df["Order Date"])
df["Ship Date"] = pd.to_datetime(df["Ship Date"])

# Check duplicates
duplicates = df.duplicated().sum()
print("Duplicates:", duplicates)

# Check negative values
print("Negative Sales:", (df["Sales"] < 0).sum())
print("Negative Profit:", (df["Profit"] < 0).sum())

# Basic summary
print(df.info())

# Save cleaned dataset
df.to_csv(
    "retail-sales-performance-analysis/data/processed/superstore_cleaned.csv",
    index=False
)

print("Cleaning completed successfully!")
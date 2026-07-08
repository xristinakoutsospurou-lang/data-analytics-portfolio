import pandas as pd

# Load combined dataset
data = pd.read_csv("../data/marketing_campaign_all_brands.csv")

# 1. Dataset size
print("Dataset size:")
print(data.shape)

print("\n-------------------")

# 2. Column information
print("Columns:")
print(data.columns.tolist())

print("\n-------------------")

# 3. Missing values
print("Missing values:")
print(data.isnull().sum())

print("\n-------------------")

# 4. Duplicate rows
print("Duplicate rows:")
print(data.duplicated().sum())

print("\n-------------------")

# 5. Data types
print("Data types:")
print(data.dtypes)

print("\n-------------------")

# 6. Basic statistics
print("Basic statistics:")
print(data.describe())
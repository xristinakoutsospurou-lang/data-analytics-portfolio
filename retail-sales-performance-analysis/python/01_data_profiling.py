import pandas as pd

# Load dataset
df = pd.read_csv("retail-sales-performance-analysis/data/Sample - Superstore.csv", encoding="latin1")
# First rows
print(df.head())

# Dataset shape
print("Rows and columns:")
print(df.shape)

# Column names
print("Columns:")
print(df.columns)

# Data types
print("Data types:")
print(df.dtypes)

# Missing values
print("Missing values:")
print(df.isnull().sum())

# Duplicate rows
print("Duplicates:")
print(df.duplicated().sum())
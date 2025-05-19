
import pandas as pd

def load_parquet_from_github(repo, path):
    base_url = f'https://raw.githubusercontent.com/anderstornquist/{repo}/main/{path}'
    return pd.read_parquet(base_url, engine='pyarrow')

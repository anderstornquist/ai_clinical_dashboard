
import streamlit as st
from utils.github_loader import load_parquet_from_github

st.title("📄 Journalanteckningar")

df = load_parquet_from_github("ai_server_script", "external_data/journal_entries.parquet")
st.dataframe(df)

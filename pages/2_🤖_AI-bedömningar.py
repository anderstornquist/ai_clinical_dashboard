
import streamlit as st
from utils.github_loader import load_parquet_from_github

st.title("🤖 AI-bedömningar")

df = load_parquet_from_github("ai_nurse_pipeline", "analysis_events.parquet")
st.dataframe(df)

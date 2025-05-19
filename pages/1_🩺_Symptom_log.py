
import streamlit as st
from utils.github_loader import load_parquet_from_github

st.title("🩺 Symptomlogg")

df = load_parquet_from_github("ai_medical_pipeline", "symptom_log.parquet")
st.dataframe(df)

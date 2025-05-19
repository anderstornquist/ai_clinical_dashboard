
import streamlit as st
from utils.github_loader import load_parquet_from_github

st.title("💊 Läkemedelslista")

df = load_parquet_from_github("ai_medical_pipeline", "medications.parquet")
st.dataframe(df)

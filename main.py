
import streamlit as st
import streamlit_authenticator as stauth
import yaml
from yaml.loader import SafeLoader
from pathlib import Path

# Autentisering
with open('config.yaml') as file:
    config = yaml.load(file, Loader=SafeLoader)
authenticator = stauth.Authenticate(config['credentials'], 'cookie', 'key', cookie_expiry_days=1)
name, auth_status, username = authenticator.login('Login', 'main')

if auth_status:
    st.sidebar.success(f"Inloggad som {name}")
    st.title("🧠 AI Clinical Dashboard")
    st.write("Välj en sektion i menyn till vänster.")
else:
    st.error("Felaktig inloggning")

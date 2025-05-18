
# Serverinstallation för AI Clinical Dashboard (Ubuntu EC2)

## Steg 1 – Förbered EC2-instans
- Kör Ubuntu (20.04 eller senare)
- Öppna portar 22, 80, 443 i AWS Security Groups
- Peka subdomänen `doctor.bothnianseadiving.se` till publik IP

## Steg 2 – Kopiera upp zip
På din egen dator:
```bash
scp ai_clinical_dashboard_updated.zip ubuntu@<EC2-IP>:~/ai_clinical_dashboard/
```

## Steg 3 – Kör installationsscript
SSH:a in på servern och kör:
```bash
chmod +x setup.sh
./setup.sh
```

## Steg 4 – Testa
- Gå till: https://doctor.bothnianseadiving.se
- Logga in som `dr_test / securepassword`

## Filer du behöver:
- `ai_clinical_dashboard_updated.zip`
- `setup.sh`

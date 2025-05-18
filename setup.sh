
#!/bin/bash
# Setup-script för AI Clinical Dashboard på Ubuntu (AWS EC2)

# 1. Uppdatera systemet
sudo apt update && sudo apt upgrade -y

# 2. Installera Docker och docker-compose
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo usermod -aG docker $USER

# 3. Installera Nginx
sudo apt install -y nginx

# 4. Installera certbot för Let's Encrypt
sudo apt install -y certbot python3-certbot-nginx

# 5. Skapa mappstruktur
mkdir -p ~/ai_clinical_dashboard
cd ~/ai_clinical_dashboard

# 6. Flytta zip-fil hit och extrahera
# (Du laddar upp ai_clinical_dashboard_updated.zip via SCP eller SFTP)
# Exempel SCP: scp ai_clinical_dashboard_updated.zip ubuntu@<EC2-IP>:~/ai_clinical_dashboard/
unzip ai_clinical_dashboard_updated.zip

# 7. Starta applikationen
sudo docker compose up -d --build

# 8. Skapa Nginx-konfig
cat <<EOF | sudo tee /etc/nginx/sites-available/ai_dashboard
server {
    listen 80;
    server_name doctor.bothnianseadiving.se;

    location /robots.txt {
        alias /home/ubuntu/ai_clinical_dashboard/data/robots.txt;
    }

    location / {
        proxy_pass http://localhost:8501;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
EOF

# Aktivera config och starta om nginx
sudo ln -s /etc/nginx/sites-available/ai_dashboard /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl restart nginx

# 9. Installera SSL
sudo certbot --nginx -d doctor.bothnianseadiving.se

echo "✅ Klart. Logga in på https://doctor.bothnianseadiving.se"

#nginx instalación
apt-get update
apt-get install nginx -y
# Configurar Nginx como proxy inverso
cat <<EOL | sudo tee /etc/nginx/sites-available/default
server {
    listen 80;

    location / {
        proxy_pass http://salmonesmatrix.duckdns.org;  # Aquí hay que poner el nombre del dominio que uses
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOL

# Reiniciar Nginx para aplicar la configuración
sudo systemctl restart nginx
# Instalación de certbot para obtener los certificados
apt-get install python3-certbot-nginx -y
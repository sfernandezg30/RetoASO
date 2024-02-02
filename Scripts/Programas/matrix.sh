# Autor: Sergio Fernández García-Salmones
# Fecha: 02-02-2024
# Instalación de matrix

#matrix
apt-get install gnupg2 wget apt-transport-https -y
wget -qO /usr/share/keyrings/matrix-org-archive-keyring.gpg https://packages.matrix.org/debian/matrix-org-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/matrix-org-archive-keyring.gpg] https://packages.matrix.org/debian/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/matrix-org.list
apt-get update -y
apt-get install matrix-synapse-py3 -y

sudo apt-get install debconf-doc # install deb Frontend
# sudo vi /etc/hosts 
echo "127.0.1.1 dan.com" >> /etc/hosts
echo "10.0.2.50 dan.com" >> /etc/resolv.conf
sudo apt -y install ntp
# sudo nano  /etc/ntp.conf
echo "server dan.com iburst prefer" >> /etc/ntp.conf
sudo systemctl restart ntp.service
apt -y install ntpstat
apt-get update
DEBIAN_FRONTEND=noninteractive apt install -y realmd sssd adcli libwbclient-sssd krb5-user sssd-tools samba-common packagekit samba-common-bin samba-libs
varos=$(lsb_release -d -s)
varver=$(lsb_release -r -s)
# sudo nano /etc/realmd.conf
echo " " >> /etc/realmd.conf
echo "[active-directory]" >> /etc/realmd.conf
echo " os-name = "$varos"" >> /etc/realmd.conf
echo " os-version = "$varver"" >> /etc/realmd.conf
echo " " >> /etc/realmd.conf
echo "[service]" >> /etc/realmd.conf
echo " automatic-install = yes" >> /etc/realmd.conf
echo "" >> /etc/realmd.conf
echo "[users]" >> /etc/realmd.conf
echo "default-home = /home/%u" >> /etc/realmd.conf
echo "default-shell = /bin/bash" >> /etc/realmd.conf
echo "" >> /etc/realmd.conf
echo "" >> /etc/realmd.conf
echo "[dan.com]" >> /etc/realmd.conf
echo "user-principal = yes" >> /etc/realmd.conf
echo "fully-qualified-names = no" >> /etc/realmd.conf
apt-get update
# nano /etc/dhcp/dhclient.conf
echo "" >> /etc/dhcp/dhclient.conf
echo "supersede domain-search "domain-name";" >> /etc/dhcp/dhclient.conf
echo "supersede domain-name-servers Domain-IP;" >> /etc/dhcp/dhclient.conf
passwd="welcome@1234"
echo $passwd | sudo realm --verbose join -U admin dan.com
echo "End of script !!!"
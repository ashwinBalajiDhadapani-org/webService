echo "script start"
sleep 30
# yum update
sudo yum update -y
sleep 5
# installing epel repo
sudo amazon-linux-extras install epel
sleep 5
#node installation
sudo yum makecache -y
sleep 5
sudo yum install -y gcc-c++ make 
sleep 5
curl -sL https://rpm.nodesource.com/setup_16.x | sudo -E bash -
sleep 5
sudo yum install -y nodejs
# Postgres installation
sleep 10
sudo tee /etc/yum.repos.d/pgdg.repo<<EOF
pgdg14]
name=PostgreSQL 14 for RHEL/CentOS7 - x86_64
gpgkey=https://download.postgresql.org/pub/repos/yum/RPM-GPG-KEY-PGDG-14
baseurl=https://download.postgresql.org/pub/repos/yum/14/redhat/rhel-7-x86_64/
enabled=1
gpgcheck=1
EOF
sudo yum remove python3 -y
sudo amazon-linux-extras enable python3 -y
sudo yum clean metadata -y
sudo yum install python3-3.6.* --disablerepo=amzn2-core -y
sudo yum install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
cd /usr/pgsql-14/bin
sudo ./postgresql-14-setup initdb
sudo systemctl start postgresql-14
sleep 15
cd ~

echo "########################"
echo "#### Installing Git ####"
echo "########################"

sudo yum install git -y
sleep 30

mkdir webService
cd webService
echo "#######Cloning using HTTPS########"
git clone https://dhandapani.as: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@github.com/ashwinBalajiDhadapani-org/webService.git
cd webService
npm install
node index.js




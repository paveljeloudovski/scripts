# Setup OS and YUM repos
yum update -y 
yum install -y epel-release wget 
mkdir -p /root/.ssh 
mkdir -p /etc/ssh 
# Add Webtatic repository needed for php7
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm 
# Node and YARN repos
curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - 
wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo 
# Azure CLI
rpm --import https://packages.microsoft.com/keys/microsoft.asc 
sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'


yum group install -y "Development Tools"
yum install -y git xz curl bash zip gcc-c++ make wget lsof parallel lftp unzip bash openssh-server java-1.8.0-openjdk-headless openssl sshpass maven ruby ruby-devel rubygems libffi-devel python python36 python36-tools python2-setuptools python2-pip python36-devel python-devel bzip2 libsass libsass-devel iproute which glibc.i686 zlib.i686 libgcc.i686 mod_php71w php71w-cli php71w-common php71w-xml php71w-mbstring php71w-pdo php71w-mysql php71w-gd nodejs yarn azure-cli

# ========== Bundler and Compass
gem install bundler && gem install compass

# ========== Python utilities
pip2.7 install --upgrade pip && pip2.7 install virtualenv 
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python3.6 get-pip.py
# ========== Docker, AWS
pip3 install -U virtualenv docker-compose awscli ansible[azure] ansible-lint && pip3 install -U azure && pip3 install -U sfctl 
pip2 install -U azure && pip2 uninstall pyopenssl -y && pip2 install -U ansible[azure] ansible-lint

# ========== NVM and Node modules
yarn global add jsonlint bower grunt-cli gulp compass node-gyp jquerry 


curl -sS https://getcomposer.org/installer | php 
mv composer.phar /usr/local/bin/composer 
curl -LO https://omnitruck.chef.io/install.sh; bash ./install.sh -P inspec


# ##############################################################################
# Fixes
# Fix some node things
npm config set python /usr/bin/python2.7 
npm config set unsafe-perm true 
# Fix for running bower as root
echo '{ "allow_root": true }' >> /root/.bowerrc

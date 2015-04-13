function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Ruby ruby2.2 ruby2.2-dev
update-alternatives --set ruby /usr/bin/ruby2.2 >/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.2 >/dev/null 2>&1

install Git git

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser jucd
sudo -u postgres createuseratedb -O jucd jucd

echo installing Bundler
gem install bundler -N >/dev/null 2>&1
cd /var/jucd
bundle install
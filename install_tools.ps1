Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
echo "Installing editors"
choco upgrade -y atom visualstudiocode visualstudio2017community
echo "Installing runtimes"
choco upgrade -y virtualbox vagrant packer docker docker-machine docker-compose
echo "Installing git"
choco upgrade -y git github sourcetree slack
choco upgrade -y chefdk openssh winscp.install defraggler cpu-z lastpass
echo "Installing tools"
choco upgrade -y jdk8 winrar firefox 7zip.install notepadplusplus.install vlc skype putty.install \
curl wget chocolateygui conemu google-chrome-x64 googledrive
choco upgrade -y windirstat  totalcommander
echo "Installing azure related tools"

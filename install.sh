#!/usr/bin/env bash


echo "Hello world" && exit 0

dnf -y update && dnf install git &&  dnf -y groupinstall "Development Tools" \
&& dnf install clang-devel \
&& dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
&& dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
&& dnf install akmod-nvidia && dnf install xorg-x11-drv-nvidia-cuda \
&& curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh \
&& dnf -y install dnf-plugins-core \
&& dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo \
&& dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
&& systemctl start docker && docker run hello-world && chmod 666 /var/run/docker.sock \
&& rpm --import https://packages.microsoft.com/keys/microsoft.asc \
&& sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' \
&& dnf install code libpq-devel libpqxx-devel boost-devel gtest-devel cmake

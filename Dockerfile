FROM docker.io/archlinux as builder
USER root
RUN pacman -Syu --noconfirm \
 && pacman -S --noconfirm sudo base-devel \
 && useradd -m user \
 && echo 'user ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers

USER user
RUN cd \
 && curl https://aur.archlinux.org/cgit/aur.git/snapshot/texlive-moderncv-git.tar.gz | tar -xzf - \
 && cd texlive-moderncv-git \
 && makepkg -s --noconfirm --install

USER root

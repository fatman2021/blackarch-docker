FROM base/devel:minimal
MAINTAINER elken

# Add needed files & scripts
ADD ./pacaur.sh /pacaur.sh
ADD ./sign.sh /sign.sh
ADD ./pacman.conf /etc/pacman.conf

# Deps for scripts
RUN pacman -Syy --needed --noconfirm wget

# Run scripts
RUN /sign.sh
RUN /pacaur.sh

# Main install
RUN pacman -S --needed --noconfirm blackarch

# Space-saving strats
RUN pacman -Scc --noconfirm


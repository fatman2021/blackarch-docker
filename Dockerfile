FROM base/arch
MAINTAINER elken

# Add needed files & scripts
ADD ./pacaur.sh /pacaur.sh
ADD ./sign.sh /sign.sh
ADD ./pacman.conf /etc/pacman.conf
ADD ./gpg /root/.gpg
ADD ./ssh /root/.ssh

# Deps for scripts
RUN pacman -Syy --needed --noconfirm wget

# Run scripts
RUN /sign.sh
RUN /pacaur.sh

# Main install
RUN pacman -S --needed --noconfirm blackarch

# Space-saving strats
RUN pacman -Scc --noconfirm

ENTRYPOINT ["pacman","-Syyu"]

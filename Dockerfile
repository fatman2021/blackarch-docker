FROM base/arch
MAINTAINER elken

# Add needed files & scripts
ADD ./pacaur.sh /pacaur.sh
ADD ./pacman.conf /etc/pacman.conf
ADD ./gpg /root/.gpg
ADD ./ssh /root/.ssh

# Deps for scripts
RUN pacman -Syy --needed --noconfirm wget sudo
RUN curl -s http://blackarch.org/strap.sh | sudo sh

# Run scripts
RUN /pacaur.sh

RUN pacaur -Syy --needed --noconfirm gtk glib
# Main install
RUN pacman -S --needed --noconfirm blackarch

# Space-saving strats
RUN pacman -Scc --noconfirm

ENTRYPOINT ["pacman","-Syyu"]

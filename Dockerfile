FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive

ENV DEBIAN_FRONTEND noninteractive

#ARG LO_PPA=libreoffice-fresh
ARG LO_PPA=ppa

LABEL name="Libreoffice-API" \
    description="A LibreOffice server - LibreOffice API Access" \
    maintainer="DockDock"

RUN apt-get update -qqy \
    && apt-get full-upgrade -qqy \
    && apt-get install --no-install-recommends -qqy  \
    bash-completion \
    curl \
    htop \
    ncurses-term \
    python3 \
    gpg-agent \
    python-is-python3 \
    default-jre-headless \
    libreoffice-java-common \
    libreoffice-writer \
    libreoffice-calc \
    libreoffice-script-provider-python \
    poppler-data \
    poppler-utils \
    graphicsmagick \
    libmagic1 \
    libpng16-16 \
    libjpeg62 \
    libwebp7 \
    libopenjp2-7 \
    libtiff5 \
    libgif7 \
    librsvg2-bin \
    lbzip2 \
    libsigc++-2.0-0v5 \
    tzdata \
    && ln -sf /usr/share/zoneinfo/UTC /etc/localtime \
    && echo "UTC" > /etc/timezone \
    && dpkg-reconfigure tzdata \
    && apt-get purge libreoffice-gnome* libreoffice-gtk* libreoffice-help* libreoffice-kde* \
    && rm -rf /var/lib/apt/lists/* \
    && fc-cache -f \
    && groupadd -g 1000 dockdock \
    && useradd --shell /bin/bash -u 1000 -g 1000 -o -c "dockdock base user" -m dockdock

EXPOSE 2002

USER dockdock
WORKDIR /home/dockdock
HEALTHCHECK --interval=5s --timeout=1s CMD timeout 1s bash -c ':> /dev/tcp/127.0.0.1/2002'
# initilize ~/.config/libreoffice
RUN soffice --headless --terminate_after_init

CMD soffice '--accept=socket,host=0.0.0.0,port=2002;urp;StarOffice.ServiceManager' --nologo --headless --nofirststartwizard --norestore

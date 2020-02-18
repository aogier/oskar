FROM debian:10

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        xvfb \
        firefox-esr \
        xauth





RUN apt-get install -y --no-install-recommends \
    pulseaudio
    
RUN apt-get install -y --no-install-recommends \
        vorbis-tools

RUN useradd -m oskar

USER oskar

COPY entrypoint /usr/local/bin

ENTRYPOINT ["entrypoint"]
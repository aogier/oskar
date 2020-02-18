FROM debian:10

ARG XVFB_VERSION=2:1.20.4-1
ARG FIREFOX_ESR_VERSION=68.5.0esr-1~deb10u1
ARG XAUTH_VERSION=1:1.0.10-1
ARG PULSEAUDIO_VERSION=12.2-4+deb10u1
ARG VORBIS_TOOLS_VERSION=1.4.0-11

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        xvfb="${XVFB_VERSION}" \
        firefox-esr="${FIREFOX_ESR_VERSION}" \
        xauth="${XAUTH_VERSION}" \
        pulseaudio="${PULSEAUDIO_VERSION}" \
        vorbis-tools="${VORBIS_TOOLS_VERSION}" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m oskar

COPY entrypoint /usr/local/bin

USER oskar

ENTRYPOINT ["entrypoint"]
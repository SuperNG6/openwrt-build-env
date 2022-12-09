# https://github.com/P3TERX/openwrt-build-env
# OpenWrt build environment in docker
# MIT License
# Copyright (c) 2020 P3TERX <https://p3terx.com>

ARG BASE_IMAGE_TAG=20.04
FROM ubuntu:${BASE_IMAGE_TAG}

USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get upgrade -qqy && \
    bash -c 'bash <(curl -s https://build-scripts.immortalwrt.eu.org/init_build_environment.sh)' && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER user
WORKDIR /home/user

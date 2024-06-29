#!/bin/sh -eux
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (c) 2018-2024 Petr Vorel <pvorel@suse.cz>

apt="apt remove -y"

$apt \
	asciidoc \
	asciidoctor \
	libacl1-dev \
	libaio-dev \
	libcap-dev \
	libkeyutils-dev \
	libnuma-dev \
	libselinux1-dev \
	libsepol-dev \
	libssl-dev

$apt asciidoc-base ruby-asciidoctor || true

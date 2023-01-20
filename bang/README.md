---
title: Bang! Invoking Boom via SSH
date: 2022-12-03T17:49:29+01:00
updated: 2023-01-19T15:11:28+01:00
permalink: /scripts/bang/
description: The script used to remotely trigger `boom`, in order to deploy tommi.space
---
[This script](https://gitmi.dev/tommi/scripts/src/branch/main/bang/bang.sh 'bang.sh source code on giTMI'):

1. Builds [tommi.space](https://gitmi.dev/tommi/tommi.space 'tommi.space source code on giTMI')
1. Invokes [`titan`](../titan) to build <a href='gemini://tommi.space'>the tommi.space Gemini capsule</a>
1. Pushes both builds and publishes them, using [rsync](https://rsync.samba.org 'rsync official website')
---
title: tommi.space deploy script
date: 2022-12-03T17:49:29+01:00
updated: 2023-01-19T15:13:41+01:00
permalink: /scripts/boom/
description: The script used to deploy tommi.space
---
[This script](https://gitmi.dev/tommi/scripts/src/branch/main/boom/boom.sh 'boom.sh source code on giTMI') is used to build and deploy [tommi.space](https://tommi.space 'tommi.space. Yes, this very website'), and it is invoked via SSH by [`bang`](../bang 'local script to invoke remote “boom” command'). It includes [`titan`](../titan 'the script to build tommi.space on Gemini'), used to deploy <gemini://tommi.space>.
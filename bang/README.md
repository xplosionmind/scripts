---
title: Bang! Invoking Boom via SSH
date: 2022-12-03T17:49:29+01:00
updated: 2023-01-19T15:11:28+01:00
permalink: /scripts/bang/
description: The script used to remotely trigger `boom`, in order to deploy tommi.space
---
[This](https://gitmi.dev/tommi/scripts/src/branch/main/bang/bang.sh 'bang.sh source code on giTMI') is a simple tiny script that pushes tommi.space to [its remote origin on GiTMI](https://gitmi.dev 'GiTMI') and later invokes [`boom`](../boom 'building and deploying tommi.space') via SSH.
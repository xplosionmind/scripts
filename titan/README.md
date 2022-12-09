---
title: 'Titan: taking Gemini in outer space'
date: 2022-12-03T17:49:29+01:00
permalink: /scripts/titan/
description: |
  This scripts generates a [gemtext](https://gemini.circumlunar.space/docs/gemtext.gmi 'A quick introduction to "gemtext" markup') version of tommi.space and publishes it via [gemserv](https://github.com/YunoHost-Apps/gemserv_ynh 'gemserv YunoHost package') on [[Xplosion Server]].
---
{{ description }}

## Name

The name of this script is inspired by <cite>[Titan II GLV](https://en.wikipedia.org/wiki/Titan_II_GLV 'Titan II GLV (Gemini Launch Vehicle) on Wikipedia')</cite>, the rocket that brought [NASA’s Project Gemini](https://wikiless.tiekoetter.com/wiki/Project_Gemini 'Project Gemini on Wikipedia') into space.

## Dependencies

This scripts uses the [`urlencode`](https://linux.die.net/man/1/urlencode 'urlencode(1) man page') command, which can be installed with `sudo apt install gridsite-clients`.

---
title: 'Titan: taking Gemini in outer space'
date: 2022-12-03T17:49:29+01:00
updated: 2023-01-19T15:11:57+01:00
permalink: /scripts/titan/
description: Script that builds the tommi.space Gemini capsule
---
[This script](https://gitmi.dev/tommi/scripts/src/branch/main/titan/titan.sh) generates a [gemtext](https://gemini.circumlunar.space/docs/gemtext.gmi 'A quick introduction to "gemtext" markup') version of tommi.space.

[`bang`](../bang) invokes this script in order to publish the capsule using [gemserv](https://github.com/YunoHost-Apps/gemserv_ynh 'gemserv YunoHost package') on [Xplosion Server](https://tommi.space/server 'Xplosion Serve info — tommi.space').

## Name

The name of this script is inspired by <cite>[Titan II GLV](https://en.wikipedia.org/wiki/Titan_II_GLV 'Titan II GLV (Gemini Launch Vehicle) on Wikipedia')</cite>, the rocket that brought [NASA’s Project Gemini](https://wikiless.tiekoetter.com/wiki/Project_Gemini 'Project Gemini on Wikipedia') into space.

## Dependencies

This script converts Markdown files into Gemtext files using [`md2gemini`](https://github.com/makeworld-the-better-one/md2gemini 'md2gemini repository on GitHub').
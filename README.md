# XA.Reference.Wraith

This repository contains **Wraith** configuration for [SXA Reference site](https://github.com/alan-null/XA.Reference).

It also contains the most recent patterns for the whole site.

## Wraith
[Wraith](https://github.com/BBC-News/wraith) is a screenshot comparison tool, created by developers at BBC News.

Wraith uses a headless browser to create screenshots of webpages on different environments (or at different moments in time) and then creates a diff of the two images; the affected areas are highlighted in `red`.

## Usage

* Clone repository
* Download and install [**docker**](https://store.docker.com/editions/community/docker-ce-desktop-windows?tab=description)
* Run **docker**
* Set shared drives in **docker** [<sup>1</sup>](#1)
* If necessary update IP address of your host (default `http://10.0.75.1`)
* Make sure that application has set `*` binding
* run `.\ps\build.ps1 build`

## Build commands

Usage

`.\ps\build.ps1 task`

Available tasks:
* `latest` - collects current results and compares with existing patters
* `history` - creates patterns
* `both` - execute both commands (`history`,`latest`) [<sup>2</sup>](#2)



<hr>

<a name="1"></a> <sup>1. Disk where you checkout this repo</sup>

<a name="2"></a> <sup>2. Useful when we want to check whether results are correct in two succeeding tests. If not it means that in the future we will get many false possitives.</sup>
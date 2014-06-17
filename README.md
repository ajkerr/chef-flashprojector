Description
===========

Chef Cookbook for installing the Linux Flash Player 11.2 Projector Content Debugger.  This is typically used
for running FlexUnit tests on a headless continuous integration server.

Requirements
============

Platforms:

* Ubuntu 12.04.4, 14.04

The following cookbooks are dependencies:

NONE

Usage
=====

Include the recipe in your Chef cookbook or role file.

The attributes used by this cookbook are under the `flashprojector` name space.

Attribute        | Description |Type | Default
-----------------|-------------|-----|--------
tarfile          | URL to Flash Player Projector Content Debugger | String | http://fpdownload.macromedia.com/pub/flashplayer/updaters/11/flashplayer_11_sa_debug.i386.tar.gz
ci_user          | The operating system user that is used to run your CI tests.  The cookbook assumes that this user already exists. | String | ci
ci_group         | The operating system group for the user that is used to run your CI tests.  The cookbook assumes that this group already exists. | String | web
packages         | The packages that need to be installed for the Flash Player to run. | String | Varies by Ubuntu version

License and Author
==================

The MIT License (MIT)

Copyright (c) 2014 Andrew Kerr

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

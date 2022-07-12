---
title: "How to Share Android Screen"
date: 2020-09-15T13:21:18+05:00
draft: false
author: Abdullah Khabir
toc: true
comments: true
layout: post
tags: ["android", "adb", "scrcpy", "android-debugging", "screensharing", "screen sharing", "android debugging bride"]
description: ["How to share android screen with Windows/Linux"]
keywords: ["android", "adb", "scrcpy", "android-debugging", "screensharing", "screen sharing", "android debugging bride"]
---


There are times you want to share your android phone's screen with your Linux/Windows desktop. Like if you have got broken screen or for some purpose.

So this post may help you.

## Requirements

- Android phone
- ADB installed


In Arch Linux, you can install ADB with:

```bash

$ sudo pacman -S android-tools

```


There is a program which is used to screen sharing. You can install it using AUR in Arch Linux, use apt if you are using Ubuntu/Debian. It's called scrcpy in repositories.

For Arch Linux, you can go to [this link](https://aur.archlinux.org/packages/scrcpy/).
And here is the Windows [link](https://github.com/Genymobile/scrcpy/releases/download/v1.16/scrcpy-win64-v1.16.zip).


Once installed, enable USB debugging,plug your android device. And run:

```bash

$ scrcpy

```

Scrcpy has many options which you can explore like this:

```bash

$ scrcpy --help

Usage: scrcpy [options]

Options:

    --always-on-top
        Make scrcpy window always on top (above other windows).

    -b, --bit-rate value
        Encode the video at the given bit-rate, expressed in bits/s.
        Unit suffixes are supported: 'K' (x1000) and 'M' (x1000000).
        Default is 8000000.

    --codec-options key[:type]=value[,...]
        Set a list of comma-separated key:type=value options for the
        device encoder.
        The possible values for 'type' are 'int' (default), 'long',
        'float' and 'string'.
        The list of possible codec options is available in the
        Android documentation:
        <https://d.android.com/reference/android/media/MediaFormat>

    --crop width:height:x:y
        Crop the device screen on the server.
        The values are expressed in the device natural orientation
        (typically, portrait for a phone, landscape for a tablet).
        Any --max-size value is computed on the cropped size.

    --display id
        Specify the display id to mirror.

        The list of possible display ids can be listed by:
            adb shell dumpsys display
        (search "mDisplayId=" in the output)

        Default is 0.

    --force-adb-forward
        Do not attempt to use "adb reverse" to connect to the
        the device.

    -f, --fullscreen
        Start in fullscreen.

    -h, --help
        Print this help.

    --lock-video-orientation value
        Lock video orientation to value.
        Possible values are -1 (unlocked), 0, 1, 2 and 3.
        Natural device orientation is 0, and each increment adds a
        90 degrees rotation counterclockwise.
        Default is -1 (unlocked).

    --max-fps value
        Limit the frame rate of screen capture (officially supported
        ince Android 10, but may work on earlier versions).

    -m, --max-size value
        Limit both the width and height of the video to value. The
        other dimension is computed so that the device aspect-ratio
        is preserved.
        Default is 0 (unlimited).

    -n, --no-control
        Disable device control (mirror the device in read-only).

    -N, --no-display
        Do not display device (only when screen recording is
        enabled).

    --no-mipmaps
        If the renderer is OpenGL 3.0+ or OpenGL ES 2.0+, then
        mipmaps are automatically generated to improve downscaling
        quality. This option disables the generation of mipmaps.

    -p, --port port[:port]
        Set the TCP port (range) used by the client to listen.
        Default is 27183:27199.

    --prefer-text
        Inject alpha characters and space as text events instead of
        key events.
        This avoids issues when combining multiple keys to enter a
        special character, but breaks the expected behavior of alpha
        keys in games (typically WASD).

    --push-target path
        Set the target directory for pushing files to the device by
        drag & drop. It is passed as-is to "adb push".
        Default is "/sdcard/".

    -r, --record file.mp4
        Record screen to file.
        The format is determined by the --record-format option if
        set, or by the file extension (.mp4 or .mkv).

    --record-format format
        Force recording format (either mp4 or mkv).

    --render-driver name
        Request SDL to use the given render driver (this is just a
        hint).
        Supported names are currently "direct3d", "opengl",
        "opengles2", "opengles", "metal" and "software".
        <https://wiki.libsdl.org/SDL_HINT_RENDER_DRIVER>

    --render-expired-frames
        By default, to minimize latency, scrcpy always renders the
        last available decoded frame, and drops any previous ones.
        This flag forces to render all frames, at a cost of a
        possible increased latency.

    --rotation value
        Set the initial display rotation.
        Possibles values are 0, 1, 2 and 3. Each increment adds a 90
        degrees rotation counterclockwise.

    -s, --serial serial
        The device serial number. Mandatory only if several devices
        are connected to adb.

    -S, --turn-screen-off
        Turn the device screen off immediately.

    -t, --show-touches
        Enable "show touches" on start, restore the initial value
        on exit.
        It only shows physical touches (not clicks from scrcpy).

    -v, --version
        Print the version of scrcpy.

    -V, --verbosity value
        Set the log level (debug, info, warn or error).
        Default is info.

    -w, --stay-awake
        Keep the device on while scrcpy is running.

    --window-borderless
        Disable window decorations (display borderless window).

    --window-title text
        Set a custom window title.

    --window-x value
        Set the initial window horizontal position.
        Default is "auto".

    --window-y value
        Set the initial window vertical position.
        Default is "auto".

    --window-width value
        Set the initial window width.
        Default is 0 (automatic).

    --window-height value
        Set the initial window width.
        Default is 0 (automatic).

Shortcuts:

    Ctrl+f
        Switch fullscreen mode

    Ctrl+Left
        Rotate display left

    Ctrl+Right
        Rotate display right

    Ctrl+g
        Resize window to 1:1 (pixel-perfect)

    Ctrl+x
    Double-click on black borders
        Resize window to remove black borders

    Ctrl+h
    Middle-click
        Click on HOME

    Ctrl+b
    Ctrl+Backspace
    Right-click (when screen is on)
        Click on BACK

    Ctrl+s
        Click on APP_SWITCH

    Ctrl+m
        Click on MENU

    Ctrl+Up
        Click on VOLUME_UP

    Ctrl+Down
        Click on VOLUME_DOWN

    Ctrl+p
        Click on POWER (turn screen on/off)

    Right-click (when screen is off)
        Power on

    Ctrl+o
        Turn device screen off (keep mirroring)

    Ctrl+Shift+o
        Turn device screen on

    Ctrl+r
        Rotate device screen

    Ctrl+n
        Expand notification panel

    Ctrl+Shift+n
        Collapse notification panel

    Ctrl+c
        Copy device clipboard to computer

    Ctrl+v
        Paste computer clipboard to device

    Ctrl+Shift+v
        Copy computer clipboard to device (and paste if the device
        runs Android >= 7)

    Ctrl+i
        Enable/disable FPS counter (print frames/second in logs)

    Drag & drop APK file
        Install APK from computer

```

Here is YouTube video for demonstration. 

{{< youtube NCyao47EqyY >}}

I hope you've enjoyed this article. If you have any questions, ask in comment sections.


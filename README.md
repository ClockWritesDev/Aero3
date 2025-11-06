# Aero3 Framework
<div style="flex-direction=row;">
<img src="./Aero3_Logo.svg" width="20%" style="margin=auto;">
A cross-platform window library for creating graphical programs using native OS libs. Written in C3 lang.
<div>
<br>

# About
Aero3 is a free cross-platform window handler framework for graphical programs modified on top of the RGFW library from C programming language.
Credits for the RGFW inspiration: Copyright (C) 2022-2025 Riley Mabb (@ColleagueRiley)

# Getting started
```rust
module hellowindow_aero3;
import aero3;
import std::io;

fn void main(String[] args)
{
    Aero3Window* win = createWindow("HelloWindow", (Rect){0, 0, 500, 500}, CENTER);
    defer win.closeWindow();

    while (!win.windowShouldClose()) {
        Aero3Event* events = win.checkEvent();
        if (events != null) {
            if (events.keyCode == Aero3Key.ESCAPE) running = false;
        }
    }   
}
```

```sh
c3c build
```

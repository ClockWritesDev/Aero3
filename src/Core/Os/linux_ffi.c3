module aero3::os::linux_ffi;

import aero3::os::linux_types;

//Display functions
extern fn Display* x11_XOpenDisplay(char* display_name) @extern("XOpenDisplay");
extern fn void x11_XCloseDisplay(Display* display) @extern("XCloseDisplay");
extern fn Card64 x11_XAllPlanes() @extern("XAllPlanes");
extern fn Card64 x11_XBlackPixel(Display* display, Int32 screen_number) @extern("XBlackPixel");
extern fn Card64 x11_WhitePixel(Display* display, Int32 screen_number) @extern("WhitePixel");
extern fn Int32 x11_XConnectionNumber(Display* display) @extern("XConnectionNumber");
extern fn ColorMap x11_XDefaultColormap(Display* display, Int32 screen_number) @extern("XDefaultColormap");
extern fn ZString x11_XDisplayString(Display* display) @extern("XDisplayString");
extern fn Int32 x11_XScreenCount(Display* display) @extern("XScreenCount");
extern fn Screen x11_XDefaultScreen(Display* display) @extern("XDefaultScreen");
extern fn Int32 x11_XDisplayWidth(Display* display, Int32 screen_number) @extern("XDisplayWidth");
extern fn Int32 x11_XDisplayHeight(Display* display, Int32 screen_number) @extern("XDisplayHeight");

extern fn Window x11_DefaultRootWindow(Display* display) @extern("XDefaultRootWindow");
extern fn Window x11_XRootWindow(Display* display, Int32 screen_number) @extern("XRootWindow");
extern fn Window x11_XCreateWindow(Display* display, Window parent, Int32 x, Int32 y, Card64 width, Card64 height, 
    Card64 border_width, Int32 depth, Card32 class, Visual* visual, Card64 value_mask, XSetWindowAttributes* attributes) @extern("XCreateWindow");
extern fn Window x11_XCreateSimpleWindow(Display* display, Window parent, Int32 x, Int32 y, Card64 width, Card64 height, 
    Card64 border_width, Card64 border, Card64 background) @extern("XCreateSimpleWindow");
extern fn void x11_XMapWindow(Display* display, Window window) @extern("XMapWindow");
extern fn void x11_XUnmapWindow(Display* display, Window window) @extern("XUnmapWindow");
extern fn void x11_XChangeWindowAttributes(Display* display, Window window, Card32 valuemask, XSetWindowAttributes* attributes) @extern("XChangeWindowAttributes");
extern fn void x11_XSetWindowBackground(Display* display, Window window, Card32 background_pixel) @extern("XSetWindowBackground");
extern fn void x11_XSetWindowBorder(Display* display, Window window, Card64 border_pixel) @extern("XSetWindowBorder");
extern fn void x11_XSetWindowColormap(Display* display, Window window, ColorMap color_map) @extern("XSetWindowColormap");
extern fn void x11_XDefineCursor(Display* display, Window window, Cursor cursor) @extern("XDefineCursor");
extern fn void x11_XUndefineCursor(Display* display, Window window) @extern("XUndefineCursor");
extern fn void x11_XDestroyWindow(Display* display, Window window) @extern("XDestroyWindow");
extern fn void x11_XDestroySubwindows(Display* display, Window window) @extern("XDestroySubwindows");

extern fn void x11_XFlush(Display* display) @extern("XFlush");
extern fn int x11_XPending(Display* display) @extern("XPending");
extern fn void x11_XNextEvent(Display* display, XEvent* event_return) @extern("XNextEvent");
extern fn void x11_XWindowEvent(Display* display, Window window, Int64 event_mask, XEvent* event_return) @extern("XWindowEvent");
extern fn Atom x11_XInternAtom(Display* display, XPointer atom_name, Bool only_if_exists) @extern("XInternAtom");
extern fn void x11_XMoveWindow(Display* display, Window window, Int32 x, Int32 y) @extern("XMoveWindow");
extern fn void x11_XResizeWindow(Display* display, Window window, Card32 width, Card32 height) @extern("XResizeWindow");
extern fn Status x11_XSetWMProtocols(Display* display, Window window, Atom* protocols, Int32 count) @extern("XSetWMProtocols");

extern fn Int32 x11_XProtocolVersion(Display* display) @extern("XProtocolVersion");
extern fn Int32 x11_XProtocolRevision(Display* display) @extern("XProtocolRevision");
extern fn void x11_XFree(void* data) @extern("XFree");

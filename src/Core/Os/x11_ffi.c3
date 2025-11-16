module aero3::os::x11;

//Display functions
extern fn XDisplay* openDisplay(ZString display_name = null) @cname("XOpenDisplay");
extern fn void closeDisplay(XDisplay* display) @cname("XCloseDisplay");
extern fn Card64 allPlanes() @cname("XAllPlanes");
extern fn Card64 blackPixel(XDisplay* display, Int32 screen_number) @cname("XBlackPixel");
extern fn Card64 whitePixel(XDisplay* display, Int32 screen_number) @cname("XWhitePixel");
extern fn Int32 connectionNumber(XDisplay* display) @cname("XConnectionNumber");
extern fn XColorMap defaultColormap(XDisplay* display, Int32 screen_number) @cname("XDefaultColormap");
extern fn ZString displayString(XDisplay* display) @cname("XDisplayString");
extern fn Int32 screenCount(XDisplay* display) @cname("XScreenCount");
extern fn XScreen defaultScreen(XDisplay* display) @cname("XDefaultScreen");
extern fn Int32 displayWidth(XDisplay* display, Int32 screen_number) @cname("XDisplayWidth");
extern fn Int32 displayHeight(XDisplay* display, Int32 screen_number) @cname("XDisplayHeight");

extern fn XWindow defaultRootWindow(XDisplay* display) @cname("XDefaultRootWindow");
extern fn XWindow rootWindow(XDisplay* display, Int32 screen_number) @cname("XRootWindow");
extern fn XWindow createWindow(XDisplay* display, XWindow parent, Int32 x, Int32 y, Card64 width, Card64 height, 
    Card64 border_width, Int32 depth, Card32 class, XVisual* visual, Card64 value_mask, XSetWindowAttributes* attributes) @cname("XCreateWindow");
extern fn XWindow createSimpleWindow(XDisplay* display, XWindow parent, Int32 x, Int32 y, Card64 width, Card64 height, 
    Card64 border_width, Card64 border, Card64 background) @cname("XCreateSimpleWindow");
extern fn void mapWindow(XDisplay* display, XWindow window) @cname("XMapWindow");
extern fn void unmapWindow(XDisplay* display, XWindow window) @cname("XUnmapWindow");
extern fn void changeWindowAttributes(XDisplay* display, XWindow window, Card32 valuemask, XSetWindowAttributes* attributes) @cname("XChangeWindowAttributes");
extern fn void setWindowBackground(XDisplay* display, XWindow window, Card32 background_pixel) @cname("XSetWindowBackground");
extern fn void setWindowBorder(XDisplay* display, XWindow window, Card64 border_pixel) @cname("XSetWindowBorder");
extern fn void setWindowColormap(XDisplay* display, XWindow window, XColorMap color_map) @cname("XSetWindowColormap");
extern fn void defineCursor(XDisplay* display, XWindow window, XCursor cursor) @cname("XDefineCursor");
extern fn void undefineCursor(XDisplay* display, XWindow window) @cname("XUndefineCursor");
extern fn void destroyWindow(XDisplay* display, XWindow window) @cname("XDestroyWindow");
extern fn void destroySubwindows(XDisplay* display, XWindow window) @cname("XDestroySubwindows");

extern fn void flush(XDisplay* display) @cname("XFlush");
extern fn int pending(XDisplay* display) @cname("XPending");
extern fn void nextEvent(XDisplay* display, XEvent* event_return) @cname("XNextEvent");
extern fn void selectInput(XDisplay* display, XWindow, XMask event_mask) @cname("XSelectInput");
extern fn void windowEvent(XDisplay* display, XWindow window, Int64 event_mask, XEvent* event_return) @cname("XWindowEvent");
extern fn XAtom internAtom(XDisplay* display, XPointer atom_name, Bool only_if_exists) @cname("XInternAtom");
extern fn void moveWindow(XDisplay* display, XWindow window, Int32 x, Int32 y) @cname("XMoveWindow");
extern fn void resizeWindow(XDisplay* display, XWindow window, Card32 width, Card32 height) @cname("XResizeWindow");
extern fn XStatus setWMProtocols(XDisplay* display, XWindow window, XAtom* protocols, Int32 count) @cname("XSetWMProtocols");

extern fn Int32 protocolVersion(XDisplay* display) @cname("XProtocolVersion");
extern fn Int32 protocolRevision(XDisplay* display) @cname("XProtocolRevision");
extern fn void free(Pointer data) @cname("XFree");

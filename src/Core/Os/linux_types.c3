module aero3::os::linux_types;

typedef XPointer	= char*;
typedef Atom		= ulong;
typedef Pointer		= void*;
typedef XId			= ulong;
typedef Mask 		= ulong;
typedef Window		= XId;
typedef Pixmap		= XId;
typedef ColorMap	= XId;
typedef Cursor		= XId;
typedef VisualID	= XId;
typedef Font		= XId;
typedef GContext	= XId;
typedef Status		= Int32;
typedef Time 		= ulong; 

typedef Int64 = long;
typedef Int32 = int;
typedef Int16 = short;
typedef Int8  = ichar;

typedef Card64 = ulong;
typedef Card32 = uint;
typedef Card16 = ushort;
typedef Card8  = char;

typedef Bits32 = Card32;
typedef Bits16 = Card16;

typedef Byte = Card8;
typedef Bool = Card8;

const Int32 CWX           = (1<<0);
const Int32 CWY           = (1<<1);
const Int32 CWWIDTH       = (1<<2);
const Int32 CWHEIGHT      = (1<<3);
const Int32 CWBORDERWIDTH = (1<<4);
const Int32 CWSIBLING     = (1<<5);
const Int32 CWSTACKMODE   = (1<<6);

const Int32 KEYPRESS		= 2;
const Int32 KEYRELEASE		= 3;
const Int32 BUTTONPRESS		= 4;
const Int32 BUTTONRELEASE	= 5;
const Int32 MOTIONNOTIFY	= 6;
const Int32 ENTERNOTIFY		= 7;
const Int32 LEAVENOTIFY		= 8;

const Bool FALSE = 0;
const Bool TRUE = 1;

const ZString WM_DELETE_WINDOW = "WM_DELETE_WINDOW";

struct Display {
    Int32 fd;
    Int32 proto_major;
    Int32 proto_minor;
    Int32 release;
    ZString vendor;
    Int32 vendor_release;
    Card32 resource_base;
    Card32 resource_mask;
    Int32 nscreens;
    Screen* screens;
    Int32 default_screen;
    Visual* default_visual;
    XExtData* ext_data;
    XExtData* private_data;
    Int32 last_request_read;
    Card64 request;
    Card64 last_request_written;
    Bool display_locked;
    Bool async_handlers;
    Window root;
    ColorMap default_colormap;
    VisualID default_visualid;
    Atom wm_delete_window;
    Pointer platform_private;
}
struct XExtData {
	Int32 number;
	XExtData* next;
	XPointer private_data;
}
struct XExtCodes {
	Int32 extension;
	Int32 major_opcode;
	Int32 first_event;
	Int32 first_error;
}
struct XGCValues {
	Int32 function;
	Card64 plane_mask;
	Card64 foreground;
	Card64 background;
	Int32 line_width;
	Int32 line_style;
	Int32 cap_style;
	Int32 join_style;
	Int32 fill_style;
	Int32 fill_rule;
	Int32 arc_mode;
	Pixmap tile;
	Pixmap stipple;
	Int32 ts_x_origin;
	Int32 ts_y_origin;
    Font font;
	Int32 subwindow_mode;
	Bool graphics_exposures;
	Int32 clip_x_origin;
	Int32 clip_y_origin;
	Pixmap clip_mask;
	Int32 dash_offset;
	Byte dashes;
}

struct XGc
{
    XExtData* ext_data;
    GContext gid;
}

struct Visual {
	XExtData* ext_data;
	VisualID visualid;
	Int32 class;
	Card64 red_mask, green_mask, blue_mask;
	Int32 bits_per_rgb;
	Int32 map_entries;
}

struct Depth{
	Int32 depth;
	Int32 nvisuals;
	Visual* visuals;
}

struct Screen {
	XExtData* ext_data;
	Display* display;
	Window root;
	Int32 width, height;
	Int32 mwidth, mheight;
	Int32 ndepths;
	Depth* depths;
	Int32 root_depth;
	Visual* root_visual;
	XGc* default_gc;
	ColorMap cmap;
	Card64 white_pixel;
	Card64 black_pixel;
	Int32 max_maps, min_maps;
	Int32 backing_store;
	Bool save_unders;
	Int64 root_input_mask;
}

struct ScreenFormat {
	XExtData* ext_data;
	Int32 depth;
	Int32 bits_per_pixel;
	Int32 scanline_pad;
}

struct XSetWindowAttributes {
    Pixmap background_pixmap;
    Card64 background_pixel;
    Pixmap border_pixmap;
    Card64 border_pixel;
    Int32 bit_gravity;
    Int32 win_gravity;
    Int32 backing_store;
    Card64 backing_planes;
    Card64 backing_pixel;
    Bool save_under;
    Int64 event_mask;
    Int64 do_not_propagate_mask;
    Bool override_redirect;
    ColorMap colormap;
    Cursor cursor;
}

struct XWindowAttributes {
    Int32 x, y;
    Int32 width, height;
    Int32 border_width;
    Int32 depth;
    Visual* visual;
    Window root;
    Int32 class;
    Int32 bit_gravity;
    Int32 win_gravity;
    Int32 backing_store;
    Card64 backing_planes;
    Card64 backing_pixel;
    Bool save_under;
    ColorMap colormap;
    Bool map_installed;
    Int32 map_state;
    Int64 all_event_masks;
    Int64 your_event_mask;
    Int64 do_not_propagate_mask;
    Bool override_redirect;
    Screen* screen;
}

struct XPixmapFormatValues {
	Int32 depth;
	Int32 bits_per_pixel;
	Int32 scanline_pad;
}
struct XAnyEvent {
    Int32 type;
    Display* display;
    Card64 window;
}
struct XKeyEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Card64 window;
    Card64 root;
    Card64 subwindow;
    Int64 time;
    Int32 x;
    Int32 y;
    Int32 x_root;
    Int32 y_root;
    Card32 state;
    Card32 keycode;
    Bool same_screen;
}
struct XButtonEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Card64 window;
    Card64 root;
    Card64 subwindow;
    Int64 time;
    Int32 x;
    Int32 y;
    Int32 x_root;
    Int32 y_root;
    Card32 state;
    Card32 button;
    Bool same_screen;
}
struct XExposeEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Card64 window;
    Int32 x;
    Int32 y;
    Int32 width;
    Int32 height;
    Int32 count;
}
union XMessageData {
	Byte[20] b;
	Int16[10] s;
	Int64[5] l;
}
struct XClientMessageEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Card64 window;
    Card64 message_type;
    Int32 format;
    XMessageData data;
}
struct XMotionEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Window window;
    Window root;
    Window subwindow;
    Int64 time;
    Int32 x;
    Int32 y;
    Int32 x_root;
    Int32 y_root;
    Card32 state;
    Byte is_hint;
    Bool same_screen;
}
struct XConfigureEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Card64 event;
    Window window;
    Int32 x;
    Int32 y;
    Int32 width;
    Int32 height;
    Int32 border_width;
    Card64 above;
    Bool override_redirect;
}
struct XFocusChangeEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Window window;
    Int32 mode;
    Int32 detail;
}
struct XCrossingEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Window window;
    Window root;
    Window subwindow;
    Int64 time;
    Int32 x;
    Int32 y;
    Int32 x_root;
    Int32 y_root;
    Int32 mode;
    Int32 detail;
    Bool same_screen;
    Bool focus;
    Card32 state;
}
struct XPropertyEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Window window;
    Atom atom;
    Int64 time;
    Int32 state;
}
struct XMapEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    Int32 event;
    Window window;
}
struct XUnmapEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    Display* display;
    XEvent event;
    Card64 window;
    Bool from_configure;
}
struct XEvent {
    Int32 type;
    XAnyEvent xany;
    XKeyEvent xkey;
    XButtonEvent xbutton;
    XMotionEvent xmotion;
    XExposeEvent xexpose;
    XClientMessageEvent xclient;
    XConfigureEvent xconfigure;
    XFocusChangeEvent xfocus;
    XCrossingEvent xcrossing;
    XPropertyEvent xproperty;
    Int64[24] pad;
}

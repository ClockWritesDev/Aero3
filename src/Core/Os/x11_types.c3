module aero3::os::x11;

typedef XPointer    = char*;
typedef XAtom       = ulong;
typedef Pointer     = void*;
typedef XId         = ulong;
typedef XMask       = ulong;
typedef XWindow     = XId;
typedef XPixmap     = XId;
typedef XColorMap   = XId;
typedef XCursor     = XId;
typedef XVisualID   = XId;
typedef XFont       = XId;
typedef XGContext   = XId;
typedef XStatus     = Int32;
typedef XTime       = ulong;

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

const Int32 CWX             = (1<<0);
const Int32 CWY             = (1<<1);
const Int32 CWWIDTH         = (1<<2);
const Int32 CWHEIGHT        = (1<<3);
const Int32 CWBORDERWIDTH   = (1<<4);
const Int32 CWSIBLING       = (1<<5);
const Int32 CWSTACKMODE     = (1<<6);

const Int32 KEY_PRESS		    = 2;
const Int32 KEY_RELEASE		    = 3;
const Int32 BUTTON_PRESS		= 4;
const Int32 BUTTON_RELEASE	    = 5;
const Int32 MOTION_NOTIFY	    = 6;
const Int32 ENTER_NOTIFY		= 7;
const Int32 LEAVE_NOTIFY		= 8;
const Int32 FOCUS_IN			= 9;
const Int32 FOCUS_OUT		    = 10;
const Int32 KEYMAP_NOTIFY	    = 11;
const Int32 EXPOSE			    = 12;
const Int32 GRAPHICS_EXPOSE	    = 13;
const Int32 NO_EXPOSE		    = 14;
const Int32 VISIBILITY_NOTIFY   = 15;
const Int32 CREATE_NOTIFY	    = 16;
const Int32 DESTROY_NOTIFY	    = 17;
const Int32 UNMAP_NOTIFY		= 18;
const Int32 MAP_NOTIFY		    = 19;
const Int32 MAP_REQUEST		    = 20;
const Int32 REPARENT_NOTIFY	    = 21;
const Int32 CONFIGURE_NOTIFY    = 22;
const Int32 CONFIGURE_REQUEST	= 23;
const Int32 GRAVITY_NOTIFY	    = 24;
const Int32 RESIZE_REQUEST	    = 25;
const Int32 CIRCULATE_NOTIFY	= 26;
const Int32 CIRCULATE_REQUEST	= 27;
const Int32 PROPERTY_NOTIFY	    = 28;
const Int32 SELECTION_CLEAR	    = 29;
const Int32 SELECTION_REQUEST	= 30;
const Int32 SELECTION_NOTIFY	= 31;
const Int32 COLORMAP_NOTIFY	    = 32;
const Int32 CLIENT_MESSAGE	    = 33;
const Int32 MAPPING_NOTIFY	    = 34;
const Int32 GENERIC_EVENT	    = 35;
const Int32 LAST_EVENT		    = 36;

const XMask NO_EVENT_MASK               = 0L;
const XMask KEY_PRESS_MASK              = (1L<<0);
const XMask KEY_RELEASE_MASK            = (1L<<1);
const XMask BUTTON_PRESS_MASK           = (1L<<2);
const XMask BUTTON_RELEASE_MASK         = (1L<<3);
const XMask ENTER_WINDOW_MASK           = (1L<<4);
const XMask LEAVE_WINDOW_MASK           = (1L<<5);
const XMask POINTER_MOTION_MASK         = (1L<<6);
const XMask POINTER_MOTION_HINT_MASK    = (1L<<7);
const XMask BUTTON_1_MOTION_MASK        = (1L<<8);
const XMask BUTTON_2_MOTION_MASK        = (1L<<9);
const XMask BUTTON_3_MOTION_MASK        = (1L<<10);
const XMask BUTTON_4_MOTION_MASK        = (1L<<11);
const XMask BUTTON_5_MOTION_MASK        = (1L<<12);
const XMask BUTTON_MOTION_MASK          = (1L<<13);
const XMask KEYMAP_STATE_MASK           = (1L<<14);
const XMask EXPOSURE_MASK               = (1L<<15);
const XMask VISIBILITY_CHANGE_MASK      = (1L<<16);
const XMask STRUCTURE_NOTIFY_MASK       = (1L<<17);
const XMask RESIZERE_DIRECT_MASK        = (1L<<18);
const XMask SUB_STRUCTURE_NOTIFY_MASK   = (1L<<19);
const XMask SUB_STRUCTURE_REDIRECT_MASK = (1L<<20);
const XMask FOCUS_CHANGE_MASK           = (1L<<21);
const XMask PROPERTY_CHANGE_MASK        = (1L<<22);
const XMask COLORMAP_CHANGE_MASK        = (1L<<23);
const XMask OWNER_GRAB_BUTTON_MASK      = (1L<<24);

const Bool FALSE    = 0;
const Bool TRUE     = 1;

const ZString WM_DELETE_WINDOW  = "WM_DELETE_WINDOW";
const ZString WM_PROTOCOLS      = "WM_PROTOCOLS";

struct XDisplay {
    Int32 fd;
    Int32 proto_major;
    Int32 proto_minor;
    Int32 release;
    ZString vendor;
    Int32 vendor_release;
    Card32 resource_base;
    Card32 resource_mask;
    Int32 nscreens;
    XScreen* screens;
    Int32 default_screen;
    XVisual* default_visual;
    XExtData* ext_data;
    XExtData* private_data;
    Int32 last_request_read;
    Card64 request;
    Card64 last_request_written;
    Bool display_locked;
    Bool async_handlers;
    XWindow root;
    XColorMap default_colormap;
    XVisualID default_visualid;
    XAtom wm_delete_window;
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
	XPixmap tile;
	XPixmap stipple;
	Int32 ts_x_origin;
	Int32 ts_y_origin;
    XFont font;
	Int32 subwindow_mode;
	Bool graphics_exposures;
	Int32 clip_x_origin;
	Int32 clip_y_origin;
	XPixmap clip_mask;
	Int32 dash_offset;
	Byte dashes;
}

struct XGc
{
    XExtData* ext_data;
    XGContext gid;
}

struct XVisual {
	XExtData* ext_data;
	XVisualID visualid;
	Int32 class;
	Card64 red_mask, green_mask, blue_mask;
	Int32 bits_per_rgb;
	Int32 map_entries;
}

struct XDepth{
	Int32 depth;
	Int32 nvisuals;
	XVisual* visuals;
}

struct XScreen {
	XExtData* ext_data;
	XDisplay* display;
	XWindow root;
	Int32 width, height;
	Int32 mwidth, mheight;
	Int32 ndepths;
	XDepth* depths;
	Int32 root_depth;
	XVisual* root_visual;
	XGc* default_gc;
	XColorMap cmap;
	Card64 white_pixel;
	Card64 black_pixel;
	Int32 max_maps, min_maps;
	Int32 backing_store;
	Bool save_unders;
	Int64 root_input_mask;
}

struct XScreenFormat {
	XExtData* ext_data;
	Int32 depth;
	Int32 bits_per_pixel;
	Int32 scanline_pad;
}

struct XSetWindowAttributes {
    XPixmap background_pixmap;
    Card64 background_pixel;
    XPixmap border_pixmap;
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
    XColorMap colormap;
    XCursor cursor;
}

struct XWindowAttributes {
    Int32 x, y;
    Int32 width, height;
    Int32 border_width;
    Int32 depth;
    XVisual* visual;
    XWindow root;
    Int32 class;
    Int32 bit_gravity;
    Int32 win_gravity;
    Int32 backing_store;
    Card64 backing_planes;
    Card64 backing_pixel;
    Bool save_under;
    XColorMap colormap;
    Bool map_installed;
    Int32 map_state;
    Int64 all_event_masks;
    Int64 your_event_mask;
    Int64 do_not_propagate_mask;
    Bool override_redirect;
    XScreen* screen;
}

struct XPixmapFormatValues {
	Int32 depth;
	Int32 bits_per_pixel;
	Int32 scanline_pad;
}
struct XAnyEvent {
    Int32 type;
    XDisplay* display;
    Card64 window;
}
struct XKeyEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    XDisplay* display;
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
    XDisplay* display;
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
    XDisplay* display;
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
    XDisplay* display;
    Card64 window;
    Card64 message_type;
    Int32 format;
    XMessageData data;
}
struct XMotionEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    XDisplay* display;
    XWindow window;
    XWindow root;
    XWindow subwindow;
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
    XDisplay* display;
    Card64 event;
    XWindow window;
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
    XDisplay* display;
    XWindow window;
    Int32 mode;
    Int32 detail;
}
struct XCrossingEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    XDisplay* display;
    XWindow window;
    XWindow root;
    XWindow subwindow;
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
    XDisplay* display;
    XWindow window;
    XAtom atom;
    Int64 time;
    Int32 state;
}
struct XMapEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    XDisplay* display;
    Int32 event;
    XWindow window;
}
struct XUnmapEvent {
    Int32 type;
    Card64 serial;
    Bool send_event;
    XDisplay* display;
    XEvent event;
    Card64 window;
    Bool from_configure;
}
union XEvent {
    Int32 type;
    XAnyEvent x_any;
    XKeyEvent x_key;
    XButtonEvent x_button;
    XMotionEvent x_motion;
    XExposeEvent x_expose;
    XClientMessageEvent x_client;
    XConfigureEvent x_configure;
    XFocusChangeEvent x_focus;
    XCrossingEvent x_crossing;
    XPropertyEvent x_property;
    Int64[24] pad;
}
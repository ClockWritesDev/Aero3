module aero3::core::events_handler;

import aero3::math::collections, aero3::inputs;

const ushort MAX_DROPS = 260;
const ushort MAX_PATH = 260;

typedef EventType = uint;
typedef MouseEvent = char;

const EventType KEY_PRESSED       = 1;
const EventType KEY_RELEASED      = 2;

const EventType MOUSE_PRESSED     = 3;
const EventType MOUSE_RELEASED    = 4;
const EventType MOUSE_POS_CHANGED = 6;

const EventType WINDOW_MOVED = 10;
const EventType WINDOW_RESIZED = 11;

const EventType FOCUS_IN  = 12;
const EventType FOCUS_OUT = 13;

const EventType MOUSE_ENTER    = 14;
const EventType MOUSE_LEAVE    = 15;
const EventType WINDOW_REFRESH = 16;

const EventType QUIT     = 32;
const EventType DND      = 33;
const EventType DND_INIT = 34;

const MouseEvent LEFT_MOUSE        = 1;
const MouseEvent RIGHT_MOUSE       = 2;
const MouseEvent MIDDLE_MOUSE      = 3;
const MouseEvent MOUSE_SCROLL_UP   = 4;
const MouseEvent MOUSE_SCROLL_DOWN = 5;

struct Aero3Event {
	EventType type;
    char in_focus;
    Aero3ButtonEvent btn_event;
    Aero3MouseEvent mouse_event;
}

struct Aero3ButtonEvent {
    char[16] key_name;
	Aero3Key key_code;
	Aero3Key last_key_code;
	bool key_up;
	bool key_down;
}

struct Aero3DragEvent {
	char[MAX_DROPS][MAX_PATH] dropped_files;
	uint dropped_files_count;
}

struct Aero3MouseEvent {
    MouseEvent mouse_code;
	MouseEvent last_mouse_code;
	double scroll;
	char axises_count;
	collections::Vec2 axis;
}

fn Aero3Key apiKeyCodeToAero3Key(long os_key_code) {
	$if $defined(env::WIN32):
		if (os_key_code > inputs::w_key_code.len) {
			return NULL_KEY;
		}
		return inputs::w_key_code[os_key_code];
    $endif
    $if $defined(env::LINUX):
		if (os_key_code > inputs::l_key_code.len) {
			return NULL_KEY;
		}
		return inputs::l_key_code[os_key_code];
    $endif
	
}
module aero3::core::events_handler;

import aero3::math::collections, aero3::core::input_handler;

const ushort MAX_DROPS = 260;
const ushort MAX_PATH = 260;

typedef EventType = uint;
typedef MouseEvent = uint;

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
    char inFocus;
    Aero3ButtonEvent btn_event;
    Aero3MouseEvent mouse_event;
}

struct Aero3ButtonEvent {
    char[16] keyName;
	Aero3Key keyCode;
	bool keyUp;
	bool keyDown;
}

struct Aero3DragEvent {
	char[MAX_DROPS][MAX_PATH] droppedFiles;
	uint droppedFilesCount;
}

struct Aero3MouseEvent {
    MouseEvent event;
	double scroll;
	char axisesCount;
	Vec2[2] axis;
}
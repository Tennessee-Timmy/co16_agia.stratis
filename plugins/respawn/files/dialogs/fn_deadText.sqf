/* ----------------------------------------------------------------------------
Function: respawn_fnc_deadText

Description:
	Shows text when player is dead

Parameters:
0:	_text		- text to show
1:	_middle		- true will Show text in the middle instead of side
2:	_time		- How long until text will be hidden
Returns:
	nothing
Examples:
	// Show text in middle for 10 seconds
	["Wrong HOUSE!",true,10] call respawn_fnc_deadText;
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

params ["_text",["_middle",false],["_time",3]];

// Get old list
if (isNil "respawn_deadTextList") then {
	respawn_deadTextList = [];
};

// Add the new text
(respawn_deadTextList) pushBack [_text,_middle,_time];
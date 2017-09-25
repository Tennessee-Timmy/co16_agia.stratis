/* ----------------------------------------------------------------------------
Function: respawn_fnc_getSetUnitSide

Description:
	Sets the side of the unit variable "unit_respawn_side"
	Returns the side
	Does not change the side of the group/unit
	Only checks side of the unit not group
Parameters:
0:	_unit 		- unit of which side to get
Returns:
	_unitSide 	- side of the unit (west,east etc.)
Examples:
	_unitSide = _unit call respawn_fnc_getSetUnitSide;
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

params ["_unit"];

// Get/set unit side
private _unitSide = _unit getVariable ["unit_respawn_side",nil];
if (isNil "_unitSide") then {
	_unitSide = (side (group player));
	_unit setVariable ["unit_respawn_side",_unitSide,true];
};
_unitSide
/* ----------------------------------------------------------------------------
Function: score_fnc_unitInit

Description:
	Function that runs on unit init

Parameters:
	none
Returns:
	nothing
Examples:
	Runs in postInit eh

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

params ["_unit"];

_unit setVariable ["unit_score_side",(side (group _unit)),true];
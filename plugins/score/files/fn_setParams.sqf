/* ----------------------------------------------------------------------------
Function: score_fnc_setParams

Description:
	Set score params / runs on server
	It runs in postInit automatically

Parameters:
	none
Returns:
	nothing
Examples:
	call zeus_fnc_setParams;

Author:
	nigel
---------------------------------------------------------------------------- */
if !(isServer) exitWith {};
#include "script_component.cpp"
// Script begins
/*
private _real = ["p_settings_reset", 0] call BIS_fnc_getParamValue;
*/

/* ----------------------------------------------------------------------------
Function: zeus_fnc_postInit

Description:
	postInit script for zeus plugin

Parameters:
	none
Returns:
	nothing
Examples:
	Runs in postinit (from functions.cpp)

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Script begins

// add respawn
// Bootleg check plugin
if ("menus" in mission_plugins) then {
		[["Zeus Plugin","call zeus_fnc_menu",[{true},{false}],true],[player]] call menus_fnc_registerItem;
};
// add zeus modules
call zeus_fnc_addZeusModules;

if !(isServer) exitWith {};
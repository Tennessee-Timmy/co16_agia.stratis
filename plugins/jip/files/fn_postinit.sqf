/* ----------------------------------------------------------------------------
Function: jip_fnc_postInit

Description:
	jip postinit

Parameters:
	none
Returns:
	nothing
Examples:
	call jip_fnc_postInit;
	Runs in the postInit from functions.cpp

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

if !(hasInterface) exitWith {};


// Add jip menus
if ("menus" in mission_plugins) then {
	[] spawn {
		waitUntil {time > 1};
		if (player call respawn_fnc_deadCheck) exitWith {};
		if (time > 60) then {
			player setVariable ["unit_jip_remove",(time + JIP_SETTINGS_TELEPORT_TIME)];
			["CuratorAddAddons",["JIP teleport added. Press CTRL+J to open the menu"]] call BIS_fnc_showNotification;
			systemChat "JIP teleport added. Press CTRL+J to open the menu";
			[["JIP Teleport","call jip_fnc_menu",[{time > 60},{(!isNil {player getVariable "unit_jip_used"}) || (time > (player getVariable "unit_jip_remove"))}],false],[player]] call menus_fnc_registerItem;
		};
	};
};
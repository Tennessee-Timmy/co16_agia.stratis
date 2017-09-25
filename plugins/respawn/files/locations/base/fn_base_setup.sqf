/* ----------------------------------------------------------------------------
Function: respawn_fnc_base_setup

Description:
	Sets up the base respawn location
	Run this on server only

Parameters:
	none
Returns:
	nothing
Examples:
	call respawn_fnc_base_setup;
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"

if !(isServer) exitWith {};
// Code begins

private _west = objNull;
private _east = objNull;
private _guer = objNull;
private _civ = objNull;

if !(isNil {RESPAWN_SETTING_BASE_WEST}) then {_west = RESPAWN_SETTING_BASE_WEST};
if !(isNil {RESPAWN_SETTING_BASE_EAST}) then {_east = RESPAWN_SETTING_BASE_EAST};
if !(isNil {RESPAWN_SETTING_BASE_IND}) then {_guer = RESPAWN_SETTING_BASE_IND};
if !(isNil {RESPAWN_SETTING_BASE_CIV}) then {_civ = RESPAWN_SETTING_BASE_CIV};

// Load default base locations from settings
private _settings = [
	["mission_respawn_base_location_west",_west,true,true],				// respawn for blufor
	["mission_respawn_base_location_east",_east,true,true],				// respawn for opfor
	["mission_respawn_base_location_resistance",_guer,true,true],		// respawn for resistance
	["mission_respawn_base_location_civilian",_civ,true,true]			// respawn for civilian
];
_settings call settings_fnc_loadSettings;

// Set respawn location script
missionNamespace setVariable ["mission_respawn_location",{call respawn_fnc_base_respawn},true];
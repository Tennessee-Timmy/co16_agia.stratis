/* ----------------------------------------------------------------------------
Function: ace3_fnc_setParams

Description:
	Set ace3 params / runs on server
	It runs in postInit automatically

Parameters:
	none
Returns:
	nothing
Examples:
	call ace3_fnc_setParams;

Author:
	nigel
---------------------------------------------------------------------------- */
if !(isServer) exitWith {};
#include "script_component.cpp"
// Script begins

private _enabled = ["p_ace3_enabled", ACE3_PARAM_ENABLED] call BIS_fnc_getParamValue;

private _everyone = ["p_ace3_med_everyone", ACE3_PARAM_MED_EVERYONE_MEDIC] call BIS_fnc_getParamValue;
private _level = ["p_ace3_med_level", ACE3_PARAM_MED_LEVEL] call BIS_fnc_getParamValue;
private _player = ["p_ace3_med_player", ACE3_PARAM_MED_PLAYER_HEALTH] call BIS_fnc_getParamValue;
private _insta = ["p_ace3_med_insta", ACE3_PARAM_MED_INSTADEATH] call BIS_fnc_getParamValue;

private _enabledBool = [false,true] select _enabled;
missionNamespace setVariable ["mission_ace3_enabled",_enabledBool,true];

private _everyoneBool = [false,true] select _everyone;
missionNamespace setVariable ["mission_ace3_everyone_medic",_everyoneBool,true];

missionNamespace setVariable ["mission_ace3_med_level",_level,true];
missionNamespace setVariable ["mission_ace3_med_player_health",_player,true];

_insta = [false,true] select _insta;
missionNamespace setVariable ["mission_ace3_med_instadeath",_insta,true];
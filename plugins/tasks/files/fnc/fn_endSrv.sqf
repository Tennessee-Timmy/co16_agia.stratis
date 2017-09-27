/* ----------------------------------------------------------------------------
Function: tasks_fnc_endSrv

Description:
	Ends the mission from server
	"mission_tasks_winSides" or "mission_tasks_winPlayers" can be defined to	make certain players/sides winners
	Everyone else will be a loser.
	If "mission_tasks_winPlayers" is defined, side won't be used.
Parameters:
	none
Returns:
	nothing
Examples:
	call tasks_fnc_endSrv;
	remoteExec ["tasks_fnc_endSrv",2];

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

if !(isServer) exitWith {};

private _srvEndCodes = missionNamespace getVariable ["mission_tasks_srvEndCodes",[]];
{
	call _x;
	false
} count _srvEndCodes;

// Get winners
private _winSides = missionNamespace getVariable ["mission_tasks_winSides",TASKS_SETTING_ENDING_SIDES_AUTO];

private _winPlayers = missionNamespace getVariable ["mission_tasks_winPlayers",(PLAYERLIST select {side _x in _winSides})];

missionNamespace setVariable ["tasks_serverLoop_running",false];

private _nul = {
	if (_x in _winPlayers) then {
		true remoteExec ["tasks_fnc_end",_x];
	} else {
		false remoteExec ["tasks_fnc_end",_x];
	};
	false
} count PLAYERLIST;

if (hasInterface) exitWith {};
[] spawn {
	sleep 1;
	private _end = missionNamespace getVariable ["tasks_setting_ending_win",TASKS_SETTING_ENDING_WIN];
	_end call BIS_fnc_endMission;
};
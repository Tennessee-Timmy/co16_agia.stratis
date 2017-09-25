/* ----------------------------------------------------------------------------
Function: zeus_fnc_srvAdd

Description:
	Adds zeus to unit
	Must run on server

Parameters:
0:	_unit		- Unit which to add zeus to
Returns:
	nothing
Examples:
	// Adds zeus to player it's called from
	player remoteExec ["zeus_fnc_srvAdd",2];

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

// Only run on server
if !(isServer) exitWith {};

params ["_player"];

// Quit if player does not exist, is headless cleint, or is already a zeus
if (isNull _player || {_player isKindOf "HeadlessClient_F"} || {!(isNull getAssignedCuratorLogic _player)}) exitWith {};

// Create zeus module
private _module = createGroup sideLogic createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];

// Set target player as zeus and set up the module
_module setVariable ["owner", getPlayerUID _player];
_module setVariable ["showNotification", false];
_module setVariable ["birdType", ""];
_module setVariable ["playerZeus", true];
_module setCuratorWaypointCost 0;
_module allowCuratorLogicIgnoreAreas true;
_module addCuratorEditableObjects [(vehicles + allUnits), true];
{ _module setCuratorCoef [_x, 0];} forEach ["place", "edit", "delete", "destroy", "group", "synchronize"];

// onAdd function ( will allow moving units to hc )
remoteExec ["zeus_fnc_onAdd",_player];

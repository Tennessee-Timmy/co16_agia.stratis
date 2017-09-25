/* ----------------------------------------------------------------------------
Function: respawn_wave_fnc_onRespawn

Description:
	Request respawn timer on the server
	Respawns unit if respawn timer currently in the respawn window
	Spawns respawn_wave_fnc_playerTimer
Parameters:
0:	_unit	- unit that will respawn
Returns:
	nothing
Examples:
	_unit call respawn_wave_fnc_onRespawn;
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

params ["_unit"];

// Get/set unit side
private _unitSide = _unit call respawn_fnc_getSetUnitSide;

// Check if respawn wave has already been requested for _unitSide
private _requestedVar = format ["respawn_wave_requested_%1",_unitSide];
private _requested = missionNamespace getVariable [_requestedVar,false];

// If wave is already requested, check if it's done yet
if !(_requested) then {

	// wave has not been requested, request it!
	missionNamespace setVariable [_requestedVar,true,true];
};

// Show time 'til respawn
if (_unit getVariable ["unit_respawn_dead",true]) then {
	_unit spawn respawn_wave_fnc_playerTimer;
};
/* ----------------------------------------------------------------------------
Function: score_fnc_onKilled

Description:
	Runs on end, only on server

Parameters:
	none
Returns:
	nothing
Examples:
	call score_fnc_onKilled;
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

if !(isServer) exitWith {};

params ["_unit","_killer"];

private _killer = _unit getVariable ["ace_medical_lastDamageSource",nil];
private _killerSide = _killer getVariable ["unit_score_side",(side (group _unit))];
private _unitSide = _unit getVariable ["unit_score_side",(side (group _unit))];

if (isPlayer _unit) then {
	[_unit,[0,0,0,1]] call score_fnc_update;
	_killer addPlayerScores [0, 0, 0, 0, 1];
};

if (isNil "_killer" || {!(isPlayer _killer)}) exitWith {};
_killer addPlayerScores [1, 0, 0, 0, 0];

if (_unitSide isEqualTo civilian) exitWith {
	[_killer,[0,0,1,0]] call score_fnc_update;
};

if ((_killerSide getFriend _unitSide) >= 0.6) exitWith {
	[_killer,[0,1,0,0]] call score_fnc_update;
};
[_killer,[1,0,0,0]] call score_fnc_update;
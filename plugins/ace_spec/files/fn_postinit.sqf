/* ----------------------------------------------------------------------------
Function: ace_spec_fnc_postInit

Description:
	Ace spectator init

Parameters:
	none
Returns:
	nothing
Examples:
	call ace_spec_fnc_postInit;
	Runs in the postInit from functions.cpp

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

if (isServer) then {
	[[""],{call ace_spec_fnc_onRespawn},"onRespawn",true] call respawn_fnc_scriptAdd;
	[[""],{call ace_spec_fnc_onRespawnUnit},"onRespawnUnit",true] call respawn_fnc_scriptAdd;
};

if (hasInterface) then {
	// Add admin menus
	if ("menus" in mission_plugins) then {
		[["ACE Spec. Plugin","call ace_spec_fnc_menu",[{true},{false}],true],[player]] call menus_fnc_registerItem;
	};
};
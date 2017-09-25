/* ----------------------------------------------------------------------------
Function: respawn_fnc_deadHudShow

Description:
	Shows the death hud and tells you that you are dead
Parameters:
	none
Returns:
	nothing
Examples:
	call respawn_fnc_deadHudShow;
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins


// if the hud does exists, close it, so it can be restarted
if !(uiNamespace getVariable ["respawn_rsc_dead",displayNull] isEqualTo displayNull) then {
	// close the hud
	private _layer = "rscLayer_respawn_dead" cutFadeOut 0;

};
"rscLayer_respawn_dead" cutRsc ["respawn_rsc_dead", "PLAIN"];
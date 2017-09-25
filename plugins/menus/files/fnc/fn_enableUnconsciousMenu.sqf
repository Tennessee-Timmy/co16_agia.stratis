/* ----------------------------------------------------------------------------
Function: menus_fnc_enableUnsconsciousMenu

Description:
	Allows for the menu to be opened if player is unconscious by ace
	menus_unconscious_enabled must be set to false to disable this
Parameters:
	none
Returns:
	nothing
Examples:
	call menus_fnc_enableUnconsciousMenu;

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

// init value to disable
menus_unconscious_enabled = true;

// Use spawn so a loop can be used
[] spawn {
	while {menus_unconscious_enabled} do {

		// Wait until ace disable input exists
		waitUntil {!((uiNamespace getvariable ["ace_common_dlgDisableMouse",displayNull]) isEqualTo displayNull) || {!((uiNamespace getvariable ["ace_spectator_interface",displayNull]) isEqualTo displayNull)}};

		disableSerialization;

		// Get spectator display
		private _display = (uiNamespace getvariable ["ace_spectator_interface",displayNull]);

		// if spectator display does not exist, get unconscious display instead
		if (isNull _display) then {
			_display = (uiNamespace getvariable "ace_common_dlgDisableMouse");
		};

		// Display text to notify player of keys
		["CuratorAddAddons",["Admin Menu Added. Press CTRL+J to open the menu"]] call BIS_fnc_showNotification;

		// Add keydown eventhandeler to the display
		private _keyDown = _display displayAddEventHandler ["KeyDown", {
			params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];

			// if ctrl + J is pressed
			private _keys = (actionKeys "tasks");
			if (_ctrlKey && {(_dikCode in _keys)}) then {

				// If menu exists, open it, if it does not, close it!
				if (findDisplay 304000 isEqualTo displayNull) then {
					call menus_fnc_menusOpen;
				} else {
					[304000] call menus_fnc_displayCloser;
				};
			};
		}];

		// Wait until disable input does not exist
		waitUntil {((uiNamespace getvariable ["ace_common_dlgDisableMouse",displayNull]) isEqualTo displayNull) && {((uiNamespace getvariable ["ace_spectator_interface",displayNull]) isEqualTo displayNull)}};
		sleep 1;
	};
};
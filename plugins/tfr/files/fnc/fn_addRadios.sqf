/* ----------------------------------------------------------------------------
Function: tfr_fnc_addRadios

Description:
	Add radios, based on side, also removes all radios before adding default ones

Parameters:
	none
Returns:
	nothing
Examples:
	call tfr_fnc_addRadios;
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

if (!hasInterface || {player getVariable ["unit_respawn_dead",false]}) exitWith {};

// Remove all radios
call tfr_fnc_clearRadios;

// Init variables
private _groupName = toLower (groupID(group player));
private _isLeader = ((leader player) isEqualTo player);
private _playerVar = (vehicleVarName player);
private _playerVarLength = (count _playerVar);
private _playerNR = call compile(((_playerVar select [(count _playerVar)-2]) splitString "_") select 0);
private _giveRadios_LR = missionNamespace getVariable ["mission_tfr_giveRadios_LR",TFR_SETTING_GIVERADIOS_LR];
private _giveRadios_SL = missionNamespace getVariable ["mission_tfr_giveRadios_SL",TFR_SETTING_GIVERADIOS_SL];

private _overRideSL = player getVariable ["unit_tfr_SL",false];
private _overRideLR = player getVariable ["unit_tfr_LR",false];

// Short Range Radio
player linkItem (call {

	// Check if player should get squad lead radio
	if (_playerNR in _giveRadios_SL || _overRideSL) then {

		if (missionNamespace getVariable ["mission_tfr_sl_dagr",TFR_SETTING_SL_DAGR]) then {
			player linkItem "TFAR_microdagr";
		};

		if ((side player) isEqualTo west) exitWith {
			missionNamespace getVariable ["mission_tfr_radio_sl_west",TFR_SETTING_RADIO_SL_WEST]
		};
		if ((side player) isEqualTo east) exitWith {
			missionNamespace getVariable ["mission_tfr_radio_sl_east",TFR_SETTING_RADIO_SL_EAST]
		};
		if ((side player) isEqualTo independent) exitWith {
			missionNamespace getVariable ["mission_tfr_radio_sl_guer",TFR_SETTING_RADIO_SL_GUER]
		};
		"TFAR_anprc152"
	} else {

		if (missionNamespace getVariable ["mission_tfr_personal_dagr",TFR_SETTING_PERSONAL_DAGR]) then {
			player linkItem "TFAR_microdagr";
		};

		if ((side player) isEqualTo west) exitWith {
			missionNamespace getVariable ["mission_tfr_radio_personal_west",TFR_SETTING_RADIO_PERSONAL_WEST]
		};
		if ((side player) isEqualTo east) exitWith {
			missionNamespace getVariable ["mission_tfr_radio_personal_east",TFR_SETTING_RADIO_PERSONAL_EAST]
		};
		if ((side player) isEqualTo independent) exitWith {
			missionNamespace getVariable ["mission_tfr_radio_personal_guer",TFR_SETTING_RADIO_PERSONAL_GUER]
		};
		"TFAR_rf7800str"
	};
});

// Check if player should get LR
if (_playerNR in _giveRadios_LR || _overRideLR) then {
	player addBackpack (call {
		if ((side player) isEqualTo west) exitWith {
			missionNamespace getVariable ["mission_tfr_radio_lr_west",TFR_SETTING_RADIO_LR_WEST]
		};
		if ((side player) isEqualTo east) exitWith {
			missionNamespace getVariable ["mission_tfr_radio_lr_east",TFR_SETTING_RADIO_LR_EAST]
		};
		if ((side player) isEqualTo independent) exitWith {
			missionNamespace getVariable ["mission_tfr_radio_lr_guer",TFR_SETTING_RADIO_LR_GUER]
		};
		"TFAR_rt1523g"
	});
};

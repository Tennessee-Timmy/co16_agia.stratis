/* ----------------------------------------------------------------------------
Function: tfr_fnc_postInit

Description:
	Tfr init

Parameters:
	none
Returns:
	nothing
Examples:
	call tfr_fnc_postInit;
	Runs in the postInit from functions.cpp

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

// set up radios for loadout plugins
missionNamespace setVariable ["mission_tfr_radio_personal_west",TFR_SETTING_RADIO_PERSONAL_WEST];
missionNamespace setVariable ["mission_tfr_radio_personal_east",TFR_SETTING_RADIO_PERSONAL_EAST];
missionNamespace setVariable ["mission_tfr_radio_personal_guer",TFR_SETTING_RADIO_PERSONAL_GUER];

missionNamespace setVariable ["mission_tfr_radio_sl_west",TFR_SETTING_RADIO_SL_WEST];
missionNamespace setVariable ["mission_tfr_radio_sl_east",TFR_SETTING_RADIO_SL_EAST];
missionNamespace setVariable ["mission_tfr_radio_sl_guer",TFR_SETTING_RADIO_SL_GUER];

missionNamespace setVariable ["mission_tfr_radio_lr_west",TFR_SETTING_RADIO_LR_WEST];
missionNamespace setVariable ["mission_tfr_radio_lr_east",TFR_SETTING_RADIO_LR_EAST];
missionNamespace setVariable ["mission_tfr_radio_lr_guer",TFR_SETTING_RADIO_LR_GUER];


if !(isMultiplayer) exitWith {};
call tfr_fnc_setupRadios;

if (TFR_SETTING_GIVERADIOS) then {
	call tfr_fnc_addRadios;
};

["TFAR_giveLongRangeRadioToGroupLeaders", false, true, "mission", true] call CBA_settings_fnc_set;
["TFAR_givePersonalRadioToRegularSoldier", false, true, "mission", true] call CBA_settings_fnc_set;
["TFAR_giveMicroDagrToSoldier", false, true, "mission", true] call CBA_settings_fnc_set;
["TFAR_SameSRFrequenciesForSide", true, true, "mission", true] call CBA_settings_fnc_set;
["TFAR_SameLRFrequenciesForSide", true, true, "mission", true] call CBA_settings_fnc_set;
["TFAR_fullDuplex", true, true, "mission", true] call CBA_settings_fnc_set;
["TFAR_enableIntercom", true, true, "mission", true] call CBA_settings_fnc_set;
["TFAR_PosUpdateMode", 0, true, "client", true] call CBA_settings_fnc_set;
["TFAR_objectInterceptionEnabled", true, true, "mission", true] call CBA_settings_fnc_set;
["TFAR_spectatorCanHearEnemyUnits", true, true, "mission", true] call CBA_settings_fnc_set;
["TFAR_spectatorCanHearFriendlies", true, true, "mission", true] call CBA_settings_fnc_set;

if (isServer) then {
	[[""],{call tfr_fnc_onRespawn},"onRespawn",true] call respawn_fnc_scriptAdd;
	[[""],{call tfr_fnc_onRespawnUnit},"onRespawnUnit",true] call respawn_fnc_scriptAdd;
};


if (hasInterface) then {
	// Add admin menus
	if ("menus" in mission_plugins) then {
		[["TFAR Plugin","call tfr_fnc_menu",[{true},{false}],true],[player]] call menus_fnc_registerItem;
	};
	if ("zeus" in mission_plugins && "menus" in mission_plugins) then {
		call tfr_fnc_addZeusModules;
	};
};
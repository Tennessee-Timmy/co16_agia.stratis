/* ----------------------------------------------------------------------------
Function: ace3_fnc_postInit

Description:
	Ace3

Parameters:
	none
Returns:
	nothing
Examples:
	call ace3_fnc_postInit;
	Runs in the postInit from functions.cpp

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

// Check if enabled
waitUntil {!isNil "mission_ace3_enabled"};
private _enabled = (missionNamespace getVariable ["mission_ace3_enabled",true]);
if !(_enabled) exitWith {};


//ACE 3 CUSTOM =================================================================


rgd_overheating_customDispersion = (missionNamespace getVariable ["rgd_overheating_customDispersion",ACE3_CUSTOM_DISPERSION]);
rgd_overheating_customJam = (missionNamespace getVariable ["rgd_overheating_customJam",ACE3_CUSTOM_JAM]);
rgd_customAimCoefDisable = false;
rgd_customAimCoefAdd = (missionNamespace getVariable ["rgd_customAimCoefAdd",ACE3_CUSTOM_SWAYADD]);
easywayout_canSuicide = ACE3_CUSTOM_SUICIDE;

//ACE 3 Revive Settings ========================================================

ace_medical_enableRevive = ACE3_SETTINGS_REVIVE_ENABLE;
ace_medical_maxReviveTime = ACE3_SETTINGS_REVIVE_TIME;
ace_medical_amountOfReviveLives = ACE3_SETTINGS_REVIVE_LIVES;
if (hasInterface) then {
    player setVariable ["ace_medical_amountOfReviveLives",ace_medical_amountOfReviveLives,true];
};

//ACE 3 Medical ================================================================

ace_medical_level = (missionNamespace getVariable ["mission_ace3_med_level",ACE3_PARAM_MED_LEVEL]);
ace_medical_medicSetting = ace_medical_level;
ace_medical_increaseTrainingInLocations = true;
ace_medical_allowLitterCreation = true;
ace_medical_litterCleanUpDelay = 300;
ace_medical_enableScreams = true;
ace_medical_playerDamageThreshold = (missionNamespace getVariable ["mission_ace3_med_player_health",ACE3_PARAM_MED_PLAYER_HEALTH]);
if (hasInterface) then {
	private _dmg = ace_medical_playerDamageThreshold;
    player setVariable ["ace_medical_unitDamageThreshold",[_dmg,(_dmg*1.3),(_dmg*2)],true];
};

ace_medical_AIDamageThreshold = ACE3_SETTINGS_AI_HEALTH;
ace_medical_enableUnconsciousnessAI = ACE3_SETTINGS_AI_UNCON;

// uses ! because setting is prevent insta death and param is enable instadeath
ace_medical_preventInstaDeath = !(missionNamespace getVariable ["mission_ace3_med_instadeath",ACE3_PARAM_MED_INSTADEATH]);
if (hasInterface) then {
    player setVariable ["ace_medical_preventInstaDeath",ace_medical_preventInstaDeath,true];
};
ace_medical_bleedingcoefficient = ACE3_SETTINGS_MED_BLEED;
if (hasInterface) then {
    player setVariable ["ace_medical_bleedingcoefficient",ace_medical_bleedingcoefficient,true];
};
ace_medical_painCoefficient = ACE3_SETTINGS_MED_PAIN;
if (hasInterface) then {
    player setVariable ["ace_medical_painCoefficient",ace_medical_painCoefficient,true];
};
ace_medical_keepLocalSettingsSynced = true;

//ACE 3 Advanced Medical =======================================================

ace_medical_enableFor = 1;
ace_medical_enableadvancedwounds = ACE3_SETTINGS_ADV_WOUNDS;
ace_medical_enableVehicleCrashes = true;

ace_medical_medicSetting_PAK = 1;
ace_medical_consumeItem_PAK = ACE3_SETTINGS_ADV_PAK_CONSUME;
ace_medical_useLocation_PAK = 0;
ace_medical_useCondition_PAK = 0;

ace_medical_medicSetting_SurgicalKit = 1;
ace_medical_consumeItem_SurgicalKit = 0;
ace_medical_useLocation_SurgicalKit = 0;
ace_medical_useCondition_SurgicalKit = 0;

ace_medical_healHitPointAfterAdvBandage = ACE3_SETTINGS_ADV_HITPOINTS;
ace_medical_painIsOnlySuppressed = false;

//ACE 3 Captives ===============================================================

ace_captives_allowHandcuffOwnSide = true;
ace_captives_allowSurrender = true;
ace_captives_requireSurrender = 2;

//ACE 3 Varius other settigns ==================================================

// fatiuge
ace_advanced_fatigue_enabled = true;
ace_advanced_fatigue_performanceFactor = 2;
ace_advanced_fatigue_recoveryFactor = 5;
ace_advanced_fatigue_loadFactor = 0.75;
ace_advanced_fatigue_terrainGradientFactor = 1;

// repair
ace_repair_engineerSetting_repair = 0;
ace_repair_engineerSetting_wheel = 0;
ace_repair_repairDamageThreshold = 0.6;
ace_repair_repairDamageThreshold_engineer = 0.4;
ace_repair_consumeItem_toolKit = 0;
ace_repair_fullRepairLocation = 0;
ace_repair_addSpareParts = true;
ace_repair_wheelRepairRequiredItems = 0;
ace_repair_autoShutOffEngineWhenStartingRepair = true;

ace_rearm_level = 2;
ace_rearm_supply = 0;

// map
ace_map_mapShake = true;
ace_map_mapShowCursorCoordinates = false;
ace_map_mapIllumination = true;
ace_map_mapLimitZoom = false;

// wind / ballistics
ace_winddeflection_enabled = true;
ace_winddeflection_vehicleEnabled = true;
ace_advanced_ballistics_enabled = true;
ace_advanced_ballistics_simulateForSnipers = true;
ace_advanced_ballistics_simulateForGroupMembers = false;
ace_advanced_ballistics_simulateForEveryone = false;
ace_advanced_ballistics_disabledInFullAutoMode = true;
ace_advanced_ballistics_ammoTemperatureEnabled = true;
ace_advanced_ballistics_barrelLengthInfluenceEnabled = true;
ace_advanced_ballistics_bulletTraceEnabled = true;

ace_finger_enabled = true;
ace_finger_maxRange = 5;
ace_explosives_requireSpecialist = false;
ace_explosives_punishNonSpecialists = true;

// weather
ace_weather_enableServerController = false;
ace_weather_useACEWeather = false;
ace_weather_syncRain = false;
ace_weather_syncWind = false;
ace_weather_syncMisc = false;


//ACE 3 Respawn Settings
ace_respawn_SavePreDeathGear = false;
ace_respawn_RemoveDeadBodiesDisconnected = true;

if ("menus" in mission_plugins && {call menus_fnc_isAdmin}) then {
    [["ACE3 Plugin","call ace3_fnc_menu",[{true},{false}],true],[player]] call menus_fnc_registerItem;
};
if (hasInterface) then {

    if (mission_ace3_everyone_medic) then {
        player setvariable ["ACE_medical_medicClass", 1, true];
    };

    if (ACE3_SETTINGS_LEGSFIX) then {
        fix_legs = ["leg_fix","<t color='#ff0000'>Apply splint to broken leg</t>","",{[20, [], {player setHitPointDamage ["HitLegs", 0];player playAction "medicStop";}, {player playAction "medicStop";}, "Fixing Legs"] call ace_common_fnc_progressBar;player playAction "medicStart";},{(player getHitPointDamage "HitLegs") >= 0.5}] call ace_interact_menu_fnc_createAction;
        [typeOf player, 1, ["ACE_SelfActions"], fix_legs] call ace_interact_menu_fnc_addActionToClass;
    };
};
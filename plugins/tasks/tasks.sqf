/* ----------------------------------------------------------------------------
tasks.sqf

Description:
	Add your tasks to this file.
	for more in-depth info read the header of fn_add.sqf in "files\fnc\"

	Mission will end once ALL primary and secondary tasks are complete. The winners will be automatic (TASKS_SETTINGS_ENDING_SIDES_AUTO) or "mission_tasks_winSides" or "mission_tasks_winPlayers"
		To also make the player win, add player to "mission_tasks_winPlayers"
	Mission will fail if a primary task is failed/cancled, winners will be everyone who the failed task was not assigned to.

	If target of the task is a group or a player, make it into string

Examples:
	// simple task, that will need to be ended manually (admin or zeus)
	["blu_task1",[west,[],["Do this task.","DO","domarker"]]] call tasks_fnc_add;

	To update a task state mid mission:
		// set blu_task1 as canceled
		["blu_task1","CANCELED"] remoteExec ["tasks_fnc_update",2];

	Possible states: "CREATED","SUCCEEDED","FAILED","CANCELED"
	MORE in fn_update.sqf

Author:
	nigel
---------------------------------------------------------------------------- */
#include "files\script_component.cpp"
// Script begins

missionNamespace setVariable ["task12_done",false,true];
missionNamespace setVariable ["task13_done",false,true];
missionNamespace setVariable ["task1_done",false,true];
missionNamespace setVariable ["task2_done",false,true];
missionNamespace setVariable ["task3_done",false,true];


// quick 'n dirty
//1
[
	"blu_task1",[west,[],
	["Military range is used as a supply hub by the rebels. Raid it! Kill the garrison, destroy the vehicles and supplies.",
	"RAID MILITARY RANGE"],
	[],"attack"],
	1,
	[{true},{
		(task12_done && task13_done)
	},{false}],
	[{},{
		[west,1] call respawn_wave_fnc_addWaves;
		missionNamespace setVariable ["task1_done",true,true];
	},{}]
] call tasks_fnc_add;
//
//12
[
	"blu_task12",[west,["blu_task1"],
	["Destroy the APC and ammo trucks.",
	"DESTROY VEHICLES"],
	"marker_2","destroy"],
	2,
	[{true},{
		({alive _x} count [apc_1,truck_1,truck_2]) isEqualTo 0
	},{false}],
	[{},{
		[west,1] call respawn_wave_fnc_addWaves;
		missionNamespace setVariable ["task12_done",true,true];
	},{}]
] call tasks_fnc_add;
//
//13
[
	"blu_task13",[west,["blu_task1"],
	["Destroy supplies in the military range.",
	"DESTROY SUPPLIES"],
	"marker_1","destroy"],
	2,
	[{true},{
		({alive _x} count [ammo_1]) isEqualTo 0
	},{false}],
	[{},{
		[west,1] call respawn_wave_fnc_addWaves;
		missionNamespace setVariable ["task13_done",true,true];
	},{}]
] call tasks_fnc_add;

//
//2
[
	"blu_task2",[west,[],
	["Destroy boats on the Marina Bay.",
	"DESTROY BOATS"],
	"marker_7","destroy"],
	2,
	[{true},{
		({alive _x} count [boat_1,boat_2]) isEqualTo 0
	},{false}],
	[{},{
		[west,1] call respawn_wave_fnc_addWaves;
		missionNamespace setVariable ["task2_done",true,true];
	},{}]
] call tasks_fnc_add;

//
//3
[
	"blu_task3",[west,[],
	["Kill the lead engineer of the rebels, he was last seen at the gas station near Agia Marina",
	"KILL LEAD ENGINEER"],
	engineer_1,"kill"],
	2,
	[{true},{
		({alive _x} count [engineer_1]) isEqualTo 0
	},{false}],
	[{},{
		[west,1] call respawn_wave_fnc_addWaves;
		missionNamespace setVariable ["task3_done",true,true];
	},{}]
] call tasks_fnc_add;

//
//4
[
	"blu_task4",[west,[],
	["Leave the area alive. Leave no one behind.",
	"EXFIL"],
	[],"run"],
	1,
	[{true},{
		(
			(task1_done && task2_done && task3_done) &&
			{
				private _aliveList = ALIVELIST;
				private _awayCount = {_x distance town_1 > 750}count _aliveList;
		 		!(_aliveList isEqualTo []) &&
				((count _aliveList) isEqualTo _awayCount)
			}

		)
	},{
		time > 15 &&
		{
			(ALIVELIST isEqualTo []) &&
			((missionNamespace getVariable ["respawn_wave_count_west",0]) isEqualTo 0)
		}

	}],
	[{},{
		[west,1] call respawn_wave_fnc_addWaves;
	},{}]
] call tasks_fnc_add;
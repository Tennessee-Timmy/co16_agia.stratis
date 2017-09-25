//-----------------------------------------------------------------------------
// --- SETTINGS ---
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//Setting: mission_tasks_winSides
//Description:
//	The side for which the tasks will automatically win on
//	This will be used if "mission_tasks_winSides" and "mission_tasks_winPlayers"
//	both are not defined. Essentially default task side
//
//	If "mission_tasks_winPlayers" is defined, side won't be used.
//	Side is set to empty if task ending is enabled and a critical(primary) task is failed
//
//	"mission_tasks_winPlayers" will contain only winners, if a player is not in this list,
//	he will automatically be a loser
//Values:
//	Any side
//		west			- show "MISSION COMPLETED" to everyone
//		east			- show "MISSION FAILED" to everyone
//		resistance		- show "YOUR SIDE WON" to side with largest score
//		civilian		- show "YOUR GROUP WON" to group with largest score
// ----------------------------------------------------------------------------
#define TASKS_SETTING_ENDING_SIDES_AUTO [west]
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
//Setting: tasks_setting_ending_enable
//Description:
//	Will completing tasks or failing critical tasks end the mission automatically?
//	Based on SIDE_AUTO, should be disabled for TVTs
//	You can use call tasks_fnc_end to end the mission instead
//
//	NB! ONLY FOR COOP!
//
//	OVERRIDE: tasks_setting_ending_enable = (VALUE);
//
//Values:
//		true	- Mission ends automatically
//		false	- Mission does not end automatically (must be manually ended)
// ----------------------------------------------------------------------------
#define TASKS_SETTING_ENDING_ENABLE true
// ----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//Setting: tasks_setting_ending_win
//Description:
//	The ending that will be called on mission win (tasks complete)
//	Add custom debriefings to the custom_debriefings file
//	Can be changed with "tasks_setting_ending_win"
//Values:
//	Can be custom or one of dynamically calculated ones:
//		"EveryoneWon"	- show "MISSION COMPLETED" to everyone
//		"EveryoneLost"	- show "MISSION FAILED" to everyone
//		"SideScore"		- show "YOUR SIDE WON" to side with largest score
//		"GroupScore"	- show "YOUR GROUP WON" to group with largest score
//		"PlayerScore"	- show "YOUR WON" to player with largest score
// ----------------------------------------------------------------------------
#define TASKS_SETTING_ENDING_WIN "end_0"
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
//Setting: tasks_setting_ending_lose
//Description:
//	The ending that will be called on mission loss (critical task failure)
//	Can be changed with "tasks_setting_ending_lose"
//Values:
//	Can be custom or one of dynamically calculated ones:
//		"EveryoneWon"	- show "MISSION COMPLETED" to everyone
//		"EveryoneLost"	- show "MISSION FAILED" to everyone
//		"SideScore"		- show "YOUR SIDE WON" to side with largest score
//		"GroupScore"	- show "YOUR GROUP WON" to group with largest score
//		"PlayerScore"	- show "YOUR WON" to player with largest score
// ----------------------------------------------------------------------------
#define TASKS_SETTING_ENDING_LOSE "end_1"
// ----------------------------------------------------------------------------


/* !!DISABLED!!
//-----------------------------------------------------------------------------
// --- PARAMETERS ---
//-----------------------------------------------------------------------------
// Default values for parameters
// ----------------------------------------------------------------------------
//Parameter: p_tasks_01
//Description:
// 	Will tasks be real?
//Values:
//		1	- True, the parameter is real
//		0	- False, the parameter is not real
// ----------------------------------------------------------------------------
#define TASKS_PARAM_01_DEFAULT 1
// ----------------------------------------------------------------------------
*/

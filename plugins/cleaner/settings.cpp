//-----------------------------------------------------------------------------
// --- SETTINGS ---
//-----------------------------------------------------------------------------
//Setting: mission_cleaner_enabled
//Description:
//	enable/disable cleaners
//Values:
//	boolean		- true to enable cleaner
// ----------------------------------------------------------------------------
#define CLEANER_SETTINGS_ENABLED		true
// ----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//Setting: mission_cleaner_badsList
//Description:
//	enable/disable cleaners
//Values:
//	array		- Array of bad boys to remove, you can add a classname of a vehicle to have a vehicle removed
// ----------------------------------------------------------------------------
#define CLEANER_SETTINGS_BADS			["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","CraterLong_small","CraterLong","#dynamicsound","#destructioneffects","#track","#particlesource"]
// ----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//Setting: mission_cleaner_<min/dist/distveh/distlow/minveh,maxVeh>
//Description:
//	enable/disable cleaners
//Used in: fn_cleanUp
//
// ----------------------------------------------------------------------------
#define CLEANER_SETTINGS_MIN			15		//Minimum amount of bodies to initialize smart checks
#define CLEANER_SETTINGS_DISTLOW		1000	//dumb check distance
#define CLEANER_SETTINGS_DIST			300		//Required distance from players for bodies to be deleted
#define CLEANER_SETTINGS_DISTVEH		1500	//Distance from vehicles to be delteted
#define CLEANER_SETTINGS_MINVEH			10
#define CLEANER_SETTINGS_MAXVEH			10		//Amount of vehicles required for broken down vehicle cleanup
// ----------------------------------------------------------------------------
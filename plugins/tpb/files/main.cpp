#include "script_component.cpp"
#ifdef MISSION_PLUGIN_META
	class PLUGIN {
		name = "Third person block";
		version = 1.00;
		authors[] = {"nigel"};
		description = "Blocks third person";
		required[] = {};
		conflicts[] = {};
	};
#endif

#ifdef MISSION_PARAMS
	#include "Parameters.cpp"
#endif

#ifdef MISSION_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

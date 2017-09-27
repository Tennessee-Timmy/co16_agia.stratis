// Loads all the plugin information for this plugin
#include "script_component.cpp"
#ifdef MISSION_PLUGIN_META
	class PLUGIN {
		name = "Score Plugin";
		version = 1.00;
		authors[] = {"nigel"};
		description = "Keeping score.";
		required[] = {};
		conflicts[] = {};
	};
#endif

#ifdef MISSION_PARAMS
	#include "parameters.cpp"
#endif

#ifdef MISSION_PLUGIN_FUNCTIONS
	#include "functions.cpp"
#endif

#ifdef MISSION_PLUGIN_DEBRIEFINGSECTIONS
	class score_player
	{
		title = "Personal Score";
		variable = "score_text_personal";
	};
	class score_total
	{
		title = "Score";
		variable = "score_text";
	};
#endif
// --- EDIT THIS FILE ---
// Please CHANGE all the descriptions and names
// loadScreen and overviewPicture should be the same. (to keep size smaller)
briefingName = "The Raid of Agia Marina V1.2";

//--- LOADING SCREEN
// Loading screen shows during loading, overview shows in the mission selection screen
onLoadName = "The Raid of Agia Marina";
onLoadMission = "USMC forces raid rebel held military installations in Agia Marina";
loadScreen =  "images\loading-screen.jpg";

//--- OVERVIEW
// Mission selection screen
author = "nigel";
overviewText = "USMC forces raid rebel held military installations in Agia Marina";
overviewPicture = "images\loading-screen.jpg";

//--- LOBBY
// To change NAME: in editor > Attributes > General > Title
// To change DESCRIPTION: in editor > Attributes > Multiplayer > Summary

//--- MISSION HEADER
// https://community.bistudio.com/wiki/Multiplayer_Game_Types
// Define your mission type and player count
class Header {
	gameType = Coop; // Game type, see 'class' columns in the table below
	minPlayers = 1; //min # of players the mission supports
	maxPlayers = 16; //max # of players the mission supports
};


//--- Disable Chat
// Voice is usually disabled because TFR
// You can disable these to increase immersion or in case of TVTs
/*
	LEGEND:
	0 = Global
	1 = Side
	2 = Command
	3 = Group
	4 = Vehicle
	5 = Direct
	6 = System

	EXAMPLE:
	{0,true,true}
	{global,disableChat,disableVoice}
*/
disableChannels[]={
	{0,false,true},
	{1,false,true},
	{2,false,true},
	{3,false,true},
	{4,false,true},
	{5,false,true},
	{6,false,true}
};


// Just delete the parts you don't like/need
//
//
// =============================================================================



// =============================================================================
private _situation1 = "1.  SITUATION";
private _situationA = "
<font color='#FFFF00'>Enemy forces<br/></font color>
Here you describe to the players what sort of intelligence is available about the enemy.
Be sensitive enough  not to reveal too much or too little.
";
// =============================================================================
private _situationB = "<br/><br/>
<font color='#FFFF00'>Friendly Forces<br/></font color>
Nearby units and their mission. Units providing support
";
// =============================================================================
private _situationC = "<br/><br/>
<font color='#FFFF00'>Attachments/Detachments<br/></font color>
-nothing in line-
";
// =============================================================================
private _situationD = "<br/><br/>
<font color='#FFFF00'>Civil/Terrain considerations<br/></font color>
-nothing in line-
";
// =============================================================================
private _situation = [_situation1,_situationA,_situationB,_situationC,_situationD];
// =============================================================================



// =============================================================================
private _mission0 = "2.  MISSION";
// =============================================================================
private _missionA = "
Who, What (Tactical Task), Where, When, and Why?
This is generally the bigger picutre, ex. liberate Bagango
";
// =============================================================================
private _mission = [_mission0,_missionA];
// =============================================================================



// =============================================================================
private _execution0 = "3.  EXECUTION";
// =============================================================================
private _executionA = "
<font color='#FFFF00'>Commander's Intent<br/></font color>
A stated vision that defines the purpose of an operation and the end state with
respect to the relationship among the force, the enemy, and the terrain.
It affords the subordinates the ability to accomplish the mission in the
absence of additional guidance, orders, or communication.
";
// =============================================================================
private _executionB = "<br/><br/>
<font color='#FFFF00'>Maneuver Plan<br/></font color>
Paths to take, places to avoid
";
// =============================================================================
private _executionC = "<br/><br/>
<font color='#FFFF00'>Tasks<br/></font color>
Smallers tasks to complete to complete the mission ex. Capture firestation
";
// =============================================================================
private _execution = [_execution0,_executionA,_executionB,_executionC];
// =============================================================================



// =============================================================================
private _service0 = "4.  LOGISTICS/SUPPORT";
// =============================================================================
private _serviceA = "
<font color='#FFFF00'>General<br/></font color>
Operating procedure in effect for sustainment operations (rearm/refuel/repair/heal)<br/>
Supply, evacuation, transportation, service, personnel and miscellaneous
";
// =============================================================================
private _serviceB = "<br/><br/>
<font color='#FFFF00'>Transportation<br/></font color>
Information about transport and vehicles
";
// =============================================================================
private _serviceC = "<br/><br/>
<font color='#FFFF00'>Reinforcements<br/></font color>
Information about reinforcements
";
// =============================================================================
private _serviceD = "<br/><br/>
<font color='#FFFF00'>Evacuation<br/></font color>
Information about extracting POW, casulities and after mission.
";
// =============================================================================
private _serviceE = "<br/><br/>
<font color='#FFFF00'>Support<br/></font color>
What kind of support is available.
";

// =============================================================================
private _service = [_service0,_serviceA,_serviceB,_serviceC,_serviceD,_serviceE];
// =============================================================================
/*
	Signal

	These are basic radio frequencies for units to use
*/
// =============================================================================
private _signal0 = "5.  SIGNAL";
// =============================================================================
private _signalA = "
<font color='#FFFF00'>Short-Range Radios<br/></font color>
<font color='#4169E1'>
Infantry:<br/>
</font color>
Freq. 150 - ZERO<br/>
Freq. 110 - Alpha<br/>
Freq. 120 - Bravo<br/>
Freq. 130 - Charlie<br/>
Freq. 140 - Delta<br/>
<font color='#4169E1'>
Assets:<br/>
</font color>
Freq. 160-169 - Vehicles<br/>
Freq. 170-179 - Air Vehicles<br/>
Freq. 180-189 - Support<br/>
";
// =============================================================================
private _signalB = "<br/>
<font color='#FFFF00'>Long-Range Radios<br/></font color>
Freq. 50 - Infantry<br/>
Freq. 51 - FAC / AIR<br/>
";
// =============================================================================
private _signal = [_signal0,_signalA,_signalB];
// =============================================================================

private _nil = {
	private _paragraph = _x;
	if (!isNil "_paragraph") then {
		_title = _paragraph deleteAt 0;
		_text = _paragraph joinString "";
		player createDiaryRecord ["Diary",[_title,_text]];
	};
	false
} count [_signal,_service,_execution,_mission,_situation];
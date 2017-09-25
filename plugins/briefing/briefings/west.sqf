// Just delete the parts you don't like/need
//
//
// =============================================================================



// =============================================================================
private _situation1 = "1.  SITUATION";
private _situationA = "
<font color='#FFFF00'>Enemy forces<br/></font color>
Local rebel forces have taken control of military installations in Agia Marina.<br/>
Infantry are expected to be armed with low grade weaponry. Reconnaissance reports technicals and mobile anti-air units in the metropolitan area.<br/>
Early contact with the rebels revealed high morale and a radical dedication to their cause; expect ambushes and counterattacks. They are also popular among the local population - enabling them to rapidly replenish and resupply their forces.  <br/>
Red zones mark major hubs of enemy activity, but ambushes should be expected across the Area of Operations (AO).
";
// =============================================================================
private _situationB = "<br/><br/>
<font color='#FFFF00'>Friendly Forces<br/></font color>
USMC<br/>No friendly or allied units will be operating in the AO.
";
// =============================================================================
private _situationC = "<br/><br/>
<font color='#FFFF00'>Attachments/Detachments<br/></font color>
1x Sniper element<br/>
2x Pilots
";
// =============================================================================
private _situationD = "<br/><br/>
<font color='#FFFF00'>Civil/Terrain considerations<br/></font color>
Free Fire Zone: The civilian population has either evacuated or joined the rebel cause. You are weapons free.<br/>
Weather Report: Expect fog during initial deployment - Clear skies are forecast for midday.
";
// =============================================================================
private _situation = [_situation1,_situationA,_situationB,_situationC,_situationD];
// =============================================================================



// =============================================================================
private _mission0 = "2.  MISSION";
// =============================================================================
private _missionA = "
Disable or destroy the enemy vehicle pool, including repair and re-supply capabilities.
";
// =============================================================================
private _mission = [_mission0,_missionA];
// =============================================================================



// =============================================================================
private _execution0 = "3.  EXECUTION";
// =============================================================================
private _executionA = "
<font color='#FFFF00'>Commander's Intent<br/></font color>
Rapid Search and Destroy.<br/>
Deploy attack AH-6L and sniper elements to cover operations.<br/>
Maintain operational mobility.
";
// =============================================================================
private _executionB = "<br/><br/>
<font color='#FFFF00'>Maneuver Plan<br/></font color>
Major access routes have been fortified - expect significant infantry presence.<br/>
Utilise recon capabilities to plan rapid surgical strikes - expedite exfil.

";
// =============================================================================
private _executionC = "<br/><br/>
<font color='#FFFF00'>Tasks<br/></font color>
Destroy the vehicles and supplies in military range.<br/>
Destroy the naval units in the bay.<br/>
Eliminate the lead rebel engineer (HVT) near the gas station<br/>
Exfil (leave area)
";
// =============================================================================
private _execution = [_execution0,_executionA,_executionB,_executionC];
// =============================================================================



// =============================================================================
private _service0 = "4.  LOGISTICS/SUPPORT";
// =============================================================================
private _serviceA = "
<font color='#FFFF00'>General<br/></font color>
Rearm/repair/resupply is available at Camp Rogain.
";
// =============================================================================
private _serviceB = "<br/><br/>
<font color='#FFFF00'>Vehicles<br/></font color>
1x AH-6L<br/>
1x MH-6<br/>
1x Transport Truck<br/>
3x Humvee<br/>
1x Humvee(m2)<br/>
12x ATV<br/>
";
// =============================================================================
private _serviceC = "<br/><br/>
<font color='#FFFF00'>Reinforcements<br/></font color>
Respawn wave per objective. Respawns 5 minutes after first death. <br/>
<br/>
Don’t leave if you die! Just take a 5 minute break and head back in once an objective is cleared.
<br/>
(First person to die has to wait 5 minutes, if someone else dies 3 minutes after that, he has to wait 2 minutes.)
";
// =============================================================================
private _serviceD = "<br/><br/>
<font color='#FFFF00'>Evacuation<br/></font color>
Evacuation done at lead's discretion. Get everyone out of Agia Marina.
";
// =============================================================================
private _serviceE = "<br/><br/>
<font color='#FFFF00'>Support<br/></font color>
Sniper support (if slotted)<br/>
CAS support (if slotted)<br/>
";

// =============================================================================
private _service = [_service0,_serviceA,_serviceB,_serviceC,_serviceE];
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

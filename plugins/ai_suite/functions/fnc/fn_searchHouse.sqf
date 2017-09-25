// [group,building] call aiMaster_fnc_searchHouse;
//
//
params ["_group","_building"];
private _leader = leader _group;

_quit = {
	_group lockWP false;
	_group setVariable ["aiMaster_searchHousePositions",nil];
	_group setVariable ["aiMaster_searchHouseTime",nil];
	_group setVariable ["aiMaster_searchHouse",nil];
};
_time = _group getVariable "aiMaster_searchHouseTime";

// If running first time create waypoint
if (isNil "_time") then {
	_group lockWP true;

	// Prepare group to search
	// todo check if old waypoint stays and creates a new one before the old one
	_wp = _group addWaypoint [getPos _leader, 0, 0];
	_cond = "({unitReady _x || !(alive _x)} count thisList) == count thisList";
	_comp = format ["this setFormation '%1'; this setBehaviour '%2'; deleteWaypoint [group this, currentWaypoint (group this)];",formation _group,behaviour _leader];
	_wp setWaypointStatements [_cond,_comp];
	_group setCurrentWaypoint [_group, 0];

	//_group setBehaviour "Combat";
	_group setFormDir ([_leader, _building] call BIS_fnc_dirTo);
};

// prepare positions and time
// todo custom building positions
private _positions = _group getVariable ["aiMaster_searchHousePositions",(_building buildingPos -1)];


if (_positions isEqualTo []) exitWith {call _quit;};


_time = _group getVariable ["aiMaster_searchHouseTime",time];


// Update units in case of death
_units = units _group;

// Abort search if the group has no units left
if (count _units isEqualTo 0) exitWith {};

// Abort search if 180 seconds have passwed
if ((time - _time) > 180) exitWith {call _quit;};

// Send all available units to the next available position
_nul = {
    if (_positions isEqualTo []) exitWith {};
    if (unitReady _x) then {
        _pos = _positions deleteAt 0;
        _x commandMove _pos;
		_x doMove _pos;
		_x moveTo _pos;
    };
    false
} count _units;

// setVariables for group for the loop
_group setVariable ["aiMaster_searchHouseTime",time];
_group setVariable ["aiMaster_searchHousePositions",_positions];
_group setVariable ["aiMaster_searchHouse",_building];

_searching = _building getVariable ["aimaster_searching",0];
_building setVariable ["aimaster_searching",(_searching + (count _units))];
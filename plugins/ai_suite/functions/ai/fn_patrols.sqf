params ["_group","_patrol","_cached","_fight","_wave","_cachedActive","_cUnits","_customLimit","_speak","_side","_buildingPatrol","_alert"];
_array = _this;

// quit if trans given but not done
_transGiven = _group getVariable ['aiMaster_transGiven',false];
_transDone = _group getVariable ['aiMaster_transDone',false];
if(_transGiven && !_transDone) exitWith {};

_val = _patrol;
_val params ["_loc","_dist","_val2","_out",["_locObj",objNull]];


if (!isNil "_locObj" && {!isNull _locObj}) then {
	_loc = position _locObj;
};
_array set [1,[_loc,_dist,_val2,_out,_locObj]];


_val2 params ["_building","_stance","_speed"];
if (_building) exitWith {_this call aiMaster_fnc_buildingPatrols;};
_oldWP = waypointPosition [_group, currentWaypoint _group];
if ((getpos leader _group distance _oldWP < 10 || _oldWP distance [ 0, 0, 0 ] < 10) && alive leader _group) then {
	_group setBehaviour _stance;
	_group setSpeedMode _speed;
	while {(count(waypoints _group)) > 0} do {deleteWaypoint((waypoints _group)select 0);};
	//deleteWaypoint [ _group, all ];
	private _minDist = _dist / 5;
	private _wpPos = [0,0,0];
	waitUntil {
		_wpPos = [_loc, _dist] call aiMaster_fnc_landPos;
		_close = {_x distance _wpPos < _minDist}count aiMaster_patrolWP;
		if (!(_wpPos isEqualTo [0,0,0]) && _close isEqualTo 0) then {true} else {
			_minDist = _minDist / 2;
			_dist = _dist + (_dist / 10);
			false
		};
	};
	aiMaster_patrolWP pushBack _wpPos;
	_wp = _group addWaypoint [ _wpPos, 0 ];
	_wp setWaypointSpeed _speed;
	_wp setWaypointBehaviour _stance;
};
true
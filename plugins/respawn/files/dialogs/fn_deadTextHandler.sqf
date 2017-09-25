/* ----------------------------------------------------------------------------
Function: respawn_fnc_deadTextHandler

Description:
	Handles the showing of dead texts
	used in onload

Parameters:
	none
Returns:
	nothing
Examples:
	spawn respawn_fnc_deadTextHandler
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

// Allow saving display as variable
disableSerialization;
_display = uiNamespace getVariable "respawn_rsc_dead";

if (_display isEqualTo displayNull) exitWith {};
// get controls
private _controlMiddle = (_display displayCtrl 2003);
private _controlSide = (_display displayCtrl 2002);

// init variables used in loop
private _list = [];
private _midTime = time + 5;
private _sideTime = time + 1;
private _midTimeExtra = 0;
private _midList = [];
private _sideList = [];

// Loop every frame
waitUntil {

	// Get list of texts
	_list = missionNamespace getVariable ["respawn_deadTextList",[]];

	// Loop through list and add to correct sublist
	private _nul = {
		if (_x select 1) then {
			_midList pushBack _x
		} else {
			_sideList pushBack _x;
		};
		false
	} count _list;

	// Set the list as empty, because we just added everything to sublists
	respawn_deadTextList = [];

	// Call for exitWith
	call {

		// Middle texts

		// Calculate middle time extra for smooth text fade in-out based on remaining middle texts
		_midTimeExtra = (2 / (count _midList max 1));

		// If middle control has done it's time..
		if (time > (_midTime)) then {

			// hide the middle control in extra time
			_controlMiddle ctrlSetFade 1;
			_controlMiddle ctrlCommit _midTimeExtra;
		};

		// if middle contorl has done it's time and extra time..
		if (time > (_midTime + _midTimeExtra)) then {

			// If there are no more middle texts in list exitWith
			if (_midList isEqualTo []) exitWith {
				// Hide the middle control in 1 second
				_controlMiddle ctrlSetFade 1;
				_controlMiddle ctrlCommit 1;
				_midTime = time + 1;
			};

			// select the next middle text
			private _middle = _midList deleteAt 0;

			//private _text = "<t size='0.5'>&#160;</t><br/>" + (_middle select 0);
			private _text = (_middle select 0);


			// set midtime by adding text time to current time + commit time
			_midTime = (time + (_middle select 2)) + 0.5;

			// set the text
			_controlMiddle ctrlSetStructuredText parseText(_text);

			// Change the control size to match text size (centers it)
			private _pos = ctrlPosition _controlMiddle;
			private _h = ctrlTextHeight _controlMiddle;
			_pos set [3, (_h + (safezoneH/150))];
			_controlMiddle ctrlSetPosition _pos;

			// show the control
			_controlMiddle ctrlSetFade 0;
			// Initilize the changes in 0.5 seconds
			_controlMiddle ctrlCommit 0.5;
		};
	};
	call {
		// Check side texts

		// if sidetime has passed..
		if (time > _sideTime) then {

			// if there are no more side texts exitWith..
			if (_sideList isEqualTo []) exitWith {
				//Hide the control
				_controlSide ctrlSetFade 1;
				_controlSide ctrlCommit 0.5;
				_sideTime = time + 0.5;
			};

			// Select the next side text
			private _side = _sideList deleteAt 0;

			// Get the text
			private _text = (_side select 0);


			// Set sidetime
			private _sideTimeMod = (_side select 2);

			// if there are more than 3 more text waiting, make the sidetime smaller with the limit of 1/3th original time
			if (count _sideList >= 3) then {
				_sideTimeMod =  (((_sideTimeMod / ((count _sideList)/3)) max (_sideTimeMod/3)) max 0.5);
			};

			// Add extra time if you are the last element
			//if (_sideList isEqualTo []) then {_sideTimeMod = _sideTimeMod + _sideTimeMod/2};

			// sidetime is current time + modified time
			_sideTime = time + _sideTimeMod;

			// Set the text and show the control
			_controlSide ctrlSetStructuredText parseText(_text);

			// Change the control size to match text size (centers it)
			private _pos = ctrlPosition _controlSide;
			private _h = ctrlTextHeight _controlSide;
			_pos set [3, (_h + (safezoneH/150))];
			_controlSide ctrlSetPosition _pos;

			// make the control visible
			_controlSide ctrlSetFade 0;

			// Commit the changes (speeds up if there is a que)
			_controlSide ctrlCommit ((_sideTimeMod/15)min 0.5);
		};
	};

	_display isEqualTo displayNull
};
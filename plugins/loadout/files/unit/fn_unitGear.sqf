/* ----------------------------------------------------------------------------
Function: loadout_fnc_unitGear

Description:
	Runs the default loadout stuff for the unit

Parameters:
	none
Returns:
	nothing
Examples:
	used in loadout_fnc_unitGear

Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
#define IFDO(var1,var2)		if (!isnil {var1} && {!(var1 isEqualTo "")}) then {_target var2 var1}
#define LOOPARR(var1,var2)	{IFDO(_x,var2)}count var1
#define OVERLOAD(var1,var2)	(format ["%1's inventory has been overloaded by %2!",(typeOf var1),var2]) call debug_fnc_log
// Code begins


IFDO(_uniform,forceAddUniform);
IFDO(_vest,addVest);
IFDO(_backPack,addBackpackGlobal);
clearAllItemsFromBackpack _target;
IFDO(_helmet,addHeadgear);
IFDO(_goggles,addGoggles);

LOOPARR(_LinkItems,linkItem);

IFDO(_Binoculars,addWeapon);

private _everyItem = [];
_everyItem append _MedicalItems;
_everyItem append _ExtraItems;

private _nil = {
	_x params ["_item",["_amount",1],["_startBag",false]];
	for "_i" from 1 to _amount do {
		call {
			if (_startBag) then {
				if (_target canAddItemToBackpack _item) exitWith {_target addItemToBackpack _item};
			};
			if (_target canAddItemToUniform _item) exitWith {_target addItemToUniform _item};
			if ((backpack _target) isEqualTo "" && (vest _target isEqualTo "")) exitWith {OVERLOAD(_target,_item);};

			if (_target canAddItemToVest _item) exitWith {_target addItemToVest _item};
			if ((backpack _target) isEqualTo "") exitWith {OVERLOAD(_target,_item);};

			if !(_target canAddItemToBackpack _item) exitWith {
				OVERLOAD(_target,_item);
			};
			_target addItemToBackpack _item;
		};
	};
	false
} count _everyItem;

// weapons
[_target,_primaryWeapon,1] call loadout_fnc_addWeaponKit;
[_target,_handGun,1] call loadout_fnc_addWeaponKit;
[_target,_secondaryWeapon,1] call loadout_fnc_addWeaponKit;

// attachments
private _nil = {
	IFDO(_x,addPrimaryWeaponItem);
	false
} count _primaryAttachments;

private _nil = {
	IFDO(_x,addHandgunItem);
	false
} count _handgunAttachments;

private _nil = {
	IFDO(_x,addHandgunItem);
	false
} count _secondaryAttachments;


// extra stuff

if (isPlayer _target) exitWith {
	_target setSpeaker "ace_novoice";
};
private _face = selectRandom _faces;
_target setFace _face;
private _voice = selectRandom _voices;
_target setSpeaker _voice;
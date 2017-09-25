params ["_unit","_allGear"];

// remove all starting gear of a player
removeAllWeapons _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeAllAssignedItems _unit;
clearAllItemsFromBackpack _unit;
removeBackpack _unit;

_allGear params [
  "_headgear",
  "_goggles",
  "_uniform",
  "_uniformitems",
  "_vest",
  "_vestitems",
  "_backpack",
  "_backpackitems",
  "_primaryweapon",
  "_primaryweaponitems",
  "_primaryweaponmagazine",
  "_secondaryweapon",
  "_secondaryweaponitems",
  "_secondaryweaponmagazine",
  "_handgunweapon",
  "_handgunweaponitems",
  "_handgunweaponmagazine",
  "_assigneditems",
  "_binocular",
  "_face",
  "_speaker"
];


// identity
_unit setFace _face;
_unit setSpeaker _speaker;
// start restoring the items
if (_headgear != "") then {
  _unit addHeadgear _headgear;
};
if (_uniform != "") then {
  _unit forceAddUniform _uniform;
};
if (_vest != "") then {
  _unit addVest _vest;
};
if (_goggles != "") then {
  _unit addGoggles _goggles;
};
if !(isNil "_uniformitems") then {
  {
    _unit addItemToUniform _x;
    false
  }count _uniformitems;
};


if !(isNil "_vestitems") then {
  {
    _unit addItemToVest _x;
    false
  }count _vestitems;
};


if !(format["%1", _backpack] isEqualTo "") then {
  _unit addBackpack _backpack;
  _backpa = unitBackpack _unit;
  clearMagazineCargoGlobal _backpa;
  clearWeaponCargoGlobal _backpa;
  clearItemCargoGlobal _backpa;
  {
    _unit addItemToBackpack _x;
    false
  } count _backpackitems;
};

_assignedItems = _assignedItems - [_binocular];
[_assignedItems,_binocular] call aiMaster_fnc_depend;

// items
{
  _unit linkItem _x;
  true
} count _assignedItems;

_unit addWeapon _binocular;

if ("Laserdesignator" in assignedItems _unit) then {
  _unit selectWeapon "Laserdesignator";
  if (currentMagazine _unit isEqualTo "") then {_unit addMagazine "Laserbatteries";};
};

// secondaryWeapon
if !(_secondaryweapon isEqualTo "") then {
  {
    _unit addMagazine _x;
    true
  } count _secondaryweaponmagazine;

  _unit addWeapon _secondaryweapon;

  {
    if (_x != "") then {
      _unit addSecondaryWeaponItem _x;
    };
    true
  } count _secondaryweaponitems;
};

// handgun
if (_handgunweapon != "") then {
  {
    _unit addMagazine _x;
    true
  } count _handgunweaponmagazine;

  _unit addWeapon _handgunweapon;

  {
    if (_x != "") then {
      _unit addHandgunItem _x;
    };
    true
  } count _handgunweaponitems;
};

// primaryWeapon
if !(_primaryweapon isEqualTo "") then {
  {
    _unit addMagazine _x;
    true
  } count _primaryweaponmagazine;

  _unit addWeapon _primaryweapon;

  {
    if (_x != "") then {
      _unit addPrimaryWeaponItem _x;
    };
    true
  } count _primaryweaponitems;
};

if ( (primaryWeapon _unit) != "") then {
    private['_type', '_muzzles'];

    _type = primaryWeapon _unit;
    // check for multiple muzzles (eg: GL)
    _muzzles = getArray(configFile >> "cfgWeapons" >> _type >> "muzzles");

    if (count _muzzles > 1) then {
      _unit selectWeapon (_muzzles select 0);
    } else {
      _unit selectWeapon _type;
    };
};
//_val = [_ref, _key] call BB_fnc_assocArrayUpdateKeyValue;

private ["_ref","_keys","_indx"];
_ref = _this select 0;
_keys = missionNamespace getVariable [format ["%1_KEYS", _ref], []];
_indx = _keys find (_this select 1);
if (_indx < 0) exitWith {};
(missionNamespace setVariable [format ["%1_VALS", _ref], []]) select _indx

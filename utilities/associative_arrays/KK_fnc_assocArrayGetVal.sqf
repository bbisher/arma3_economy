/* http://killzonekid.com/arma-scripting-tutorials-kk_fnc_assocarrayxxxx/ */

//_val = [_ref, _key] call KK_fnc_assocArrayGetVal;
private ["_ref","_keys","_indx"];
_ref = _this select 0;
_keys = missionNamespace getVariable [format ["%1_KEYS", _ref], []];
_indx = _keys find (_this select 1);
if (_indx < 0) exitWith {};
(missionNamespace getVariable [format ["%1_VALS", _ref], []]) select _indx;

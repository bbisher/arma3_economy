/* http://killzonekid.com/arma-scripting-tutorials-kk_fnc_assocarrayxxxx/ */

//_bool = [_ref, _key] call KK_fnc_assocArrayDeleteKey;
private ["_ref","_keys","_vals","_indx"];
_ref = _this select 0;
_keys = missionNamespace getVariable [format ["%1_KEYS", _ref], []];
_vals = missionNamespace getVariable [format ["%1_VALS", _ref], []];
_indx = _keys find (_this select 1);
if (_indx < 0) exitWith {false};
_keys set [_indx, nil];
_vals set [_indx, nil];
true;

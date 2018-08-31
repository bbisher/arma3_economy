/* http://killzonekid.com/arma-scripting-tutorials-kk_fnc_assocarrayxxxx/ */


//_ref = [_ref, _key, _val] call KK_fnc_assocArrayAddKeyVal;
private ["_ref","_keysRef","_valsRef","_keys","_vals","_key","_indx"];
_ref = _this select 0;
_keysRef = format ["%1_KEYS", _ref];
_valsRef = format ["%1_VALS", _ref];
if (isNil _keysRef || isNil _valsRef) then {
    missionNamespace setVariable [_keysRef, []];
    missionNamespace setVariable [_valsRef, []];
};
_keys = missionNamespace getVariable _keysRef;
_vals = missionNamespace getVariable _valsRef;
_key = _this select 1;
_indx = _keys find _key;
if (_indx < 0) then {
    _indx = count _keys;
    _keys set [_indx, _key];
};
_vals set [_indx, _this select 2];
_ref;

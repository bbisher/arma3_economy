/* http://killzonekid.com/arma-scripting-tutorials-kk_fnc_assocarrayxxxx/ */

//_bool = [_ref, _key] call KK_fnc_assocArrayKeyExists
(_this select 1 in (missionNamespace getVariable [format [
    "%1_KEYS",
    _this select 0
], []]));

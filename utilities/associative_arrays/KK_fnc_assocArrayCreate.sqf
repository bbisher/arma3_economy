/* http://killzonekid.com/arma-scripting-tutorials-kk_fnc_assocarrayxxxx/ */

//_ref = call KK_fnc_assocArrayCreate;
private "_ref";
_ref = str ("WeaponHolderSimulated" createVehicleLocal [0,0,0]);
missionNamespace setVariable [_ref + "_KEYS", []];
missionNamespace setVariable [_ref + "_VALS", []];
_ref;

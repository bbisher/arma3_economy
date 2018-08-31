params["_resources", "_costs"];
_resources = _this select 0;
_costs = _this select 1;
private _purchaseable = false;
private _resource = 0;
private _cost = 0;

{
    _resource = [_resources, _x] call econ_get_resource;
    _cost = [_object_costs, _x] call econ_get_resource;

    if(_resource >= _cost) then {
        _purchaseable = true;
    };

    if(_purchaseable == false;) exitWith {
        hint "You can not afford this.";
    };

} forEach _resources call KK_fnc_assocArrayAllKeys;

_purchaseable;

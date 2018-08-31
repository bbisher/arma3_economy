params["_owner", "_resources", "_cost"];
_owner = _this select 0;
_resource_type = _this select 1;
_amount = _this select 2;
private _total = [_owner, _resource_type] call econ_get_resource;
_total = _total - _amount;

_owner setVariable [_resource_type, _total];

_total;
if([_total, _cost] call econ_is_affordable) then{
    [_owner, "funds", 100] call econ_spend_resource]
    "C_Offroad_01_F" createVehicle position player
};

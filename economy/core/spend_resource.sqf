params["_resources", "_resource_type", "_amount"];
_resources = _this select 0;
_resource_type = _this select 1;
_amount = _this select 2;
private _total = [_resources, _resource_type] call econ_get_resource;
_total = _total - _amount;

[_resource_type, _total] call BB_fnc_assocArrayKeySetValue;

_total;

params["_owner", "_resource_type", "_amount"];
_owner = _this select 0;
_resource_type = _this select 1;
_amount = _this select 2;
private _total = [_owner, _resource_type] call econ_get_resource;
_total = _total - _amount;

_owner setVariable [_resource_type, _total];

_total;

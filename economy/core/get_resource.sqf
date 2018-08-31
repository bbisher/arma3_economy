params["_resources", "_resource_type"];
_resources = _this select 0;
_resource_type = _this select 1;
private _total = [_resources, _resource_type] call KK_fnc_assocArrayGetVal;

_total;

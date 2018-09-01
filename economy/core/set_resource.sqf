params["_resources", "_resource_type", "_amount"];
_resources = _this select 0;
_resource_type = _this select 1;
_amount = _this select 2;

[_resources, _resource_type, _amount] call KK_fnc_assocArrayAddKeyVal;

_amount;

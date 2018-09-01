params["_resources", "_costs"];
private _resource = 0;
private _cost = 0;
private _sold = false;
private _all_keys = _resources call KK_fnc_assocArrayAllKeys;
private _price;

{
	if([_costs, _x] call KK_fnc_assocArrayKeyExists) then {
		_resource = [_resources, _x] call econ_get_resource;
		_cost = [_costs, _x] call econ_get_resource;
		_price = _resource + _cost;
		[_resources, _x, _price] call econ_set_resource;
		_sold = true;
	};
} forEach _all_keys;

_sold;

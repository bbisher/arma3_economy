params["_resources", "_costs"];
private _resource = 0;
private _cost = 0;
private _purchased = false;
private _all_keys = _resources call KK_fnc_assocArrayAllKeys;
private _price = 0;

if([_resources, _costs] call econ_is_affordable) then{
    {
		if([_costs, _x] call KK_fnc_assocArrayKeyExists) then {
			_resource = [_resources, _x] call econ_get_resource;
	        _cost = [_costs, _x] call econ_get_resource;
			_price = _resource - _cost;
	        [_resources, _x, _price] call econ_set_resource;
		};

    } forEach _all_keys;
    _purchased = true;
} else {
    _purchased = false;
};

_purchased;

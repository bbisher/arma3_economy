params["_resources", "_costs"];
_resources = _this select 0;
_costs = _this select 1;
private _purchaseable = false;
private _resource = 0;
private _cost = 0;
private _all_keys = _resources call KK_fnc_assocArrayAllKeys;

{
	if([_costs, _x] call KK_fnc_assocArrayKeyExists) then {
		_resource = [_resources, _x] call econ_get_resource;
	    _cost = [_costs, _x] call econ_get_resource;

	    if(_resource >= _cost) then {
	        _purchaseable = true;
	    } else {
			_purchaseable = false;
		};

	    if(!_purchaseable) exitWith {
	        hint "You can not afford this.";
	    };
	};

} forEach _all_keys;

_purchaseable;

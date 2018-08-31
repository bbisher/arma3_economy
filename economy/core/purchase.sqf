params["_resources", "_costs", ]
private _resource = 0;
private _cost = 0;
private _purchased = false;

if([_team_resources, _costs] call econ_is_affordable) then{
    {
        _resource = [_resources, _x] call econ_get_resource;
        _cost = [_costs, _x] call econ_get_resource;
        [_team_resources, _x, _cost] call econ_spend_resource]

    } forEach _resources call KK_fnc_assocArrayAllKeys;
    _purchased = true;
} else {
    _purchased = false;
};

_purchased;

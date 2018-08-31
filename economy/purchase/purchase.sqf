params["_owner", "_team_resources", "_costs", "_object"]
private _resource = 0;
private _cost = 0;
params["_team_resources", "_costs"]


if([_team_resources, _costs] call econ_is_affordable) then{
    {
        _resource = [_resources, _x] call econ_get_resource;
        _cost = [_object_costs, _x] call econ_get_resource;
        [_team_resources, _x, _cost] call econ_spend_resource]

    } forEach _resources call KK_fnc_assocArrayAllKeys;
    [] call econ_purchase_spawn_object;
};

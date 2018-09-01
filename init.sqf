/*Utilities*/
KK_fnc_assocArrayAddKeyVal = compileFinal preprocessFile "utilities\associative_arrays\KK_fnc_assocArrayAddKeyVal.sqf";
KK_fnc_assocArrayAllKeys = compileFinal preprocessFile "utilities\associative_arrays\KK_fnc_assocArrayAllKeys.sqf";
KK_fnc_assocArrayCreate = compileFinal preprocessFile "utilities\associative_arrays\KK_fnc_assocArrayCreate.sqf";
KK_fnc_assocArrayDeleteKey = compileFinal preprocessFile "utilities\associative_arrays\KK_fnc_assocArrayDeleteKey.sqf";
KK_fnc_assocArrayDestroy = compileFinal preprocessFile "utilities\associative_arrays\KK_fnc_assocArrayDestroy.sqf";
KK_fnc_assocArrayGetVal = compileFinal preprocessFile "utilities\associative_arrays\KK_fnc_assocArrayGetVal.sqf";
KK_fnc_assocArrayKeyExists = compileFinal preprocessFile "utilities\associative_arrays\KK_fnc_assocArrayKeyExists.sqf";

/*
markers_start_group_marker_tracker = compileFinal preprocessFile "utilities\markers\start_group_marker_tracker.sqf";
markers_get_groups_markers = compileFinal preprocessFile "utilities\markers\get_groups_markers.sqf";
markers_update_group_marker = compileFinal preprocessFile "utilities\markers\update_group_marker.sqf";
group_marker_tracker = compileFinal preprocessFile "utilities\markers\start_group_marker_tracker.sqf";
*/
/*Utilities*/

econ_set_resource = compileFinal preprocessFile "economy\core\set_resource.sqf";
econ_get_resource = compileFinal preprocessFile "economy\core\get_resource.sqf";
econ_is_affordable = compileFinal preprocessFile "economy\core\is_affordable.sqf";
econ_purchase = compileFinal preprocessFile "economy\core\purchase.sqf";
econ_spawn_object = compileFinal preprocessFile "economy\spawn_object.sqf";


team1_resources = call KK_fnc_assocArrayCreate;
[west,"HQ"] sideChat format ["Team Resources Initiated."];
[team1_resources, "funds", 10000] call KK_fnc_assocArrayAddKeyVal;
[team1_resources, "ammo", 500] call KK_fnc_assocArrayAddKeyVal;
[team1_resources, "fuel", 200] call KK_fnc_assocArrayAddKeyVal;
[team1_resources, "manpower", 50] call KK_fnc_assocArrayAddKeyVal;

offroad_cost = call KK_fnc_assocArrayCreate;
[offroad_cost, "funds", 1000] call KK_fnc_assocArrayAddKeyVal;
[offroad_cost, "ammo", 200] call KK_fnc_assocArrayAddKeyVal;
[offroad_cost, "fuel", 100] call KK_fnc_assocArrayAddKeyVal;

player addAction ["Earn Resource", {
    _temp = [team1_resources, "ammo"] call econ_get_resource;
    [west,"HQ"] sideChat format ["Ammo: %1!", [team1_resources, "ammo", _temp + 100] call econ_set_resource];
    }];
player addAction ["Display Resources", {
    [west,"HQ"] sideChat format ["Funds: %1!", [team1_resources, "funds"] call econ_get_resource];
    [west,"HQ"] sideChat format ["Ammo: %1!", [team1_resources, "ammo"] call econ_get_resource];
    [west,"HQ"] sideChat format ["Fuel: %1!", [team1_resources, "fuel"] call econ_get_resource];
    [west,"HQ"] sideChat format ["Manpower: %1!", [team1_resources, "manpower"] call econ_get_resource];
}];
//player addAction ["Spend Resource", { player sideChat format ["Funds: %1!", [george, "funds", 100] call econ_spend_resource] }];

player addAction ["Purchase Offroad", {
    _purchased = [team1_resources, offroad_cost] call econ_purchase;
    [west,"HQ"] sideChat format ["Purchased? %1!", _purchased];
    if(_purchased) then{
        [west,"HQ"] sideChat format ["Funds: %1!", [team1_resources, "funds"] call econ_get_resource];
        [west,"HQ"] sideChat format ["Ammo: %1!", [team1_resources, "ammo"] call econ_get_resource];
        [west,"HQ"] sideChat format ["Fuel: %1!", [team1_resources, "fuel"] call econ_get_resource];
        [west,"HQ"] sideChat format ["Manpower: %1!", [team1_resources, "manpower"] call econ_get_resource];
        _spawned_object = [group player, "C_Offroad_01_F", position player, false] call econ_spawn_object;
        [west,"HQ"] sideChat format ["Spawned: %1!", _spawned_object];
    };
}];

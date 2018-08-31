/*Utilities*/
BB_fnc_assocArrayKeySetValue = compileFinal preprocessFile "utilities\associative_arrays\BB_fnc_assocArrayKeySetValue.sqf";
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

econ_earn_resource = compileFinal preprocessFile "economy\core\earn_resource.sqf";
econ_get_resource = compileFinal preprocessFile "economy\core\get_resource.sqf";
econ_spend_resource = compileFinal preprocessFile "economy\core\spend_resource.sqf";
econ_is_affordable = compileFinal preprocessFile "economy\core\is_affordable.sqf";
econ_purchase = compileFinal preprocessFile "economy\core\purchase.sqf";
econ_spawn_object = compileFinal preprocessFile "economy\econ_spawn_object.sqf";


_team1_resources = call util_assoc_array_create;
player sideChat format ["Team Resources Initiated."];
[_team1_resources, "funds", 10000] call KK_fnc_assocArrayAddKeyVal;
[_team1_resources, "ammo", 500] call KK_fnc_assocArrayAddKeyVal;
[_team1_resources, "fuel", 200] call KK_fnc_assocArrayAddKeyVal;
[_team1_resources, "manpower", 50] call KK_fnc_assocArrayAddKeyVal;

player sideChat format ["Funds: %1!", [_team1_resources, "funds"] call econ_get_resource] };
player sideChat format ["Ammo: %1!", [_team1_resources, "ammo"] call econ_get_resource] };
player sideChat format ["Fuel: %1!", [_team1_resources, "fuel"] call econ_get_resource] };
player sideChat format ["Manpower: %1!", [_team1_resources, "manpower"] call econ_get_resource] };

_offroad_cost = call util_assoc_array_create;
[_offroad_cost, "funds", 1000] call KK_fnc_assocArrayAddKeyVal;
[_offroad_cost, "ammo", 200] call KK_fnc_assocArrayAddKeyVal;
[_offroad_cost, "fuel", 100] call KK_fnc_assocArrayAddKeyVal;


player addAction ["Earn Resource", { player sideChat format ["Ammo: %1!", [_team1_resources, "ammo", 100] call econ_earn_resource] }];
player addAction ["Display Resource", { player sideChat format ["Ammo: %1!", [_team1_resources, "ammo"] call econ_get_resource] }];
//player addAction ["Spend Resource", { player sideChat format ["Funds: %1!", [george, "funds", 100] call econ_spend_resource] }];

_temp_function = {
    player sideChat format ["Purchased? %1!", [_team1_resources, _offroad_cost] call econ_purchase];
    player sideChat format ["Funds: %1!", [_team1_resources, "funds"] call econ_get_resource] };
    player sideChat format ["Ammo: %1!", [_team1_resources, "ammo"] call econ_get_resource] };
    player sideChat format ["Fuel: %1!", [_team1_resources, "fuel"] call econ_get_resource] };
    player sideChat format ["Manpower: %1!", [_team1_resources, "manpower"] call econ_get_resource] };
    [group player, "C_Offroad_01_F", position player, true] call econ_spawn_object;
};
player addAction ["Purchase Offroad", {
    [] call _temp_function;
}];

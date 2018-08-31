/*
markers_start_group_marker_tracker = compileFinal preprocessFile "utilities\markers\start_group_marker_tracker.sqf";
markers_get_groups_markers = compileFinal preprocessFile "utilities\markers\get_groups_markers.sqf";
markers_update_group_marker = compileFinal preprocessFile "utilities\markers\update_group_marker.sqf";
group_marker_tracker = compileFinal preprocessFile "utilities\markers\start_group_marker_tracker.sqf";
*/
/*  Economy Tested Fand working*/
econ_earn_resource = compileFinal preprocessFile "economy\core\earn_resource.sqf";
econ_get_resource = compileFinal preprocessFile "economy\core\get_resource.sqf";
econ_spend_resource = compileFinal preprocessFile "economy\core\spend_resource.sqf";
/*  Economy Tested Fand working*/
econ_purchase = compileFinal preprocessFile "economy\purchase.sqf";

econ_is_affordable = compileFinal preprocessFile "economy\is_affordable.sqf";


//[player] spawn marker_tracker;


//[George, "funds", 100] call econ_earn_resource;


george setVariable ["funds", 0];
hint format ["Funds Initialized: %1!", george getVariable "funds"] ;

player addAction ["Earn Resource", { player sideChat format ["Funds: %1!", [george, "funds", 100] call econ_earn_resource] }];
player addAction ["Display Resource", { player sideChat format ["Funds: %1!", [george, "funds"] call econ_get_resource] }];
//player addAction ["Spend Resource", { player sideChat format ["Funds: %1!", [george, "funds", 100] call econ_spend_resource] }];

player addAction ["Purchase Object", { player sideChat format ["Funds: %1!", [george, "funds", 100] call econ_purchase] }];

_remove_safezone_locations = {
	params["_all_valid_locations"];
	_all_valid_locations = _all_valid_locations apply {
		if ((getpos (_x select 0)) call issafezone) then {""} else {_x}
	};
	_all_valid_locations = _all_valid_locations - [""];

	_all_valid_locations;
};

private _all_valid_locations = [];
private _buildings = [];

_resistance_strength = _this select 0;

_map_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
_x_axis = _map_size/2;
_y_axis = _map_size/2;
_position = [_x_axis, _y_axis];
 //TODO: Figure out why this is from Draper.
_whatever_calculation = sqrt(2*((_map_size/2)^2));

{
	_all_valid_locations pushBack [_x];
} forEach nearestLocations [_position, ["NameCityCapital", "NameCity", "NameVillage", "NameLocal" ], _whatever_calculation];

_all_valid_locations = ["_all_valid_locations"] call _remove_safezone_locations
_all_valid_locations;

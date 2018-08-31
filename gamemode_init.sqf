private _funds = 0;
private _ammo = 0;
private _fuel = 0;
private _manpower = 0;
private _gamemode = _this select 0;

_give_resource = {
	//TODO Set the side
	private _side = _this select 0;
	private _resource_type = _this select 1;
	private _amount = _this select 2;

	_mhq setvariable _resource_type;

};

_get_all_valid_locations = {
	private ["_resistance_strength"];
	private _all_valid_locations = [];
	private _buildings = [];

	_resistance_strength = _this select 0;

	_map_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
	_x_axis = _map_size/2;
	_y_axis = _map_size/2;
	_position = [_x_axis, _y_axis];
	_whatever_calculation = sqrt(2*((_map_size/2)^2)); //TODO: Figure out why this is from Draper.

	{
		_all_valid_locations pushBack [_x, _resistance_strength * ["_location_type"] call _get_resistance_strength_multiplyer];
	} forEach nearestLocations [_position, ["NameCityCapital", "NameCity", "NameVillage", "NameLocal" ], _whatever_calculation];

	_all_valid_locations = ["_all_valid_locations"] call _remove_safezone_locations
	_all_valid_locations;
};

_get_resistance_strength_multiplyer = {
	params["_location_type"];
	private _resistance_strength_multiplyer = 0;
	switch(_location_type) do{
		case "NameCityCapital": {
			_resistance_strength_multiplyer = 2;
		};
		case "NameCity": {
			_resistance_strength_multiplyer = 1;
		};
		case "NameVillage": {
			_resistance_strength_multiplyer = 0.66;
		};
		case "NameLocal": {
			_buildings = nearestObjects [locationPosition _x, ["House", "Building"], 250];
			if (count _buildings > 4) then {
				_resistance_strength_multiplyer = 0.33;
			};
		};
	};
	_resistance_strength_multiplyer;
};

_remove_safezone_locations = {
	params["_all_valid_locations"];
	_all_valid_locations = _all_valid_locations apply {
		if ((getpos (_x select 0)) call issafezone) then {""} else {_x}
	};
	_all_valid_locations = _all_valid_locations - [""];

	_all_valid_locations;
};

_get_side_occupided_towns = {
	//TODO: figure this out
	private _side = _this select 0;
	private _occupided_towns;

	_occupided_towns;
};

_gamemode_occupation = {
	["_side", "CTI_FUNDS", 10000] call _give_resource;
	["_side", "CTI_AMMO", 1000] call _give_resource;
	["_side", "CTI_FUEL", 500] call _give_resource;
	["_side", "CTI_MANPOWER", 50] call _give_resource;

	while{true} do {
		private _side = _this select 0;
		_funds = _mhq getvariable "CTI_FUNDS" + 400 * _resource_multiplyer;
		_ammo = _mhq getvariable "CTI_AMMO" + 300 * _resource_multiplyer;
		_fuel = _mhq getvariable "CTI_FUEL" + 200 * _resource_multiplyer;
		_manpower = _mhq getvariable "CTI_MANPOWER" + 2 * _resource_multiplyer;

		private _side_occupided_towns = ["_side"] call _get_side_occupided_towns;

		private _resource_multiplyer = 1 + (0.1 * count _side_occupided_towns);

		["_side", "CTI_FUNDS", _funds] call _give_resource;
		["_side", "CTI_AMMO", _ammo] call _give_resource;
		["_side", "CTI_FUEL", _fuel] call _give_resource;
		["_side", "CTI_MANPOWER", _manpower] call _give_resource;

		sleep 60;
	};
};

_gamemode_unlimited_occupation = {};

_gamemode_external_ammo_occupation = {};

_gamemode_limited_occupation = {};


switch(_game_type) do {
	case "unlimited":{
		[] call _gamemode_occupation;
	};
	case "occupation":{
		[] call _gamemode_unlimited_occupation;
	};
	case "external_ammo_occupation":{
		[] call _gamemode_external_ammo_occupation;
	};
	case "limited_occupation":{
		[] call _gamemode_limited_occupation;
	};
};



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

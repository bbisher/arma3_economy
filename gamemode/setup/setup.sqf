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

params["_group", "_object_classname", "_spawn_location", "_crewed"];
private _created_object = 0;
if(_object_classname isKindOf "Man") then {
    _created_object = _group createUnit [_object_classname, _spawn_location];
	_created_object setposATL _spawn_location;
} else {
    _created_object = _object_classname createVehicle _spawn_location;
    if(_crewed) then {
        createVehicleCrew _created_object;
    };
};

_created_object;

params["_side", "_group", "_marker"];
private _leader_vehicle = vehicle leader _group;
if(_side == "WEST") then{
	private _marker_type = switch (true) do {
		case (_leader_vehicle isKindOf "Plane"): {"b_plane"};
		case (_leader_vehicle isKindOf "Helicopter"): {"b_air"};
		case (_leader_vehicle isKindOf "Tank"): {"b_armor"};
		case (_leader_vehicle isKindOf "Car"): {"b_recon"};
		case (_leader_vehicle isKindOf "Truck"): {"b_motor_inf"};
		case (_leader_vehicle isKindOf "Tracked_APC"): {"b_mech_inf"};
		default {"b_inf"};
	};
}else if(_side == "EAST") then{
	private _marker_type = switch (true) do {
		case (_leader_vehicle isKindOf "Plane"): {"o_plane"};
		case (_leader_vehicle isKindOf "Helicopter"): {"o_air"};
		case (_leader_vehicle isKindOf "Tank"): {"o_armor"};
		case (_leader_vehicle isKindOf "Car"): {"o_recon"};
		case (_leader_vehicle isKindOf "Truck"): {"o_motor_inf"};
		case (_leader_vehicle isKindOf "Tracked_APC"): {"o_mech_inf"};
		default {"o_inf"};
	};
};
_marker_type;

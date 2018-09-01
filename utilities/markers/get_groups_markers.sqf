params ["_groups"];
private _groups_markers=[];
{
	private _leader = leader _x;
	private _position = getpos _leader;
	private _marker = createMarkerLocal [format["%1", _x], _position];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "b_inf";
	_marker setMarkerTextLocal roleDescription _leader;
	_groups_markers pushBack [_x, _marker];
} forEach _groups;
_groups_markers;

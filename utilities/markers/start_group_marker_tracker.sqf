private ["_player", "_update_speed"];

_player = _this select 0;
_update_speed = _this select 1;

_player_side_groups = [_player] call markers_get_player_side_groups;
_player_side = side _player;
_player_side_group_markers = [_player_side_groups] call markers_get_groups_markers;
private _marker_type = "";
while {true} do {
	{
		_group = _x select 0;
		_marker = _x select 1;
		_marker_type = [_player_side, _group, _marker] call markers_update_group_marker;
		_marker setMarkerTypeLocal _marker_type;
		_marker setMarkerPosLocal getpos leader _group;
	} forEach _player_side_group_markers;
	sleep _update_speed;
};

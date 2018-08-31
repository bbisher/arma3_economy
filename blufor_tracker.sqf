private ["_player"];

_player = _this select 0;

_player_side_groups = [_player] call _get_player_side_groups;
_player_side_group_markers = [_player_side_groups] call _get_group_markers;
while {true} do {
	{
		_group = _x select 0;
		_marker = _x select 1;
		_marker_type = [_group, _marker] call _update_group_marker;
		_marker setMarkerTypeLocal _marker_type;
		_marker setMarkerPosLocal getpos leader _group;
	} forEach _player_side_group_markers;
	sleep 5;
};

if(true)exitwith{};

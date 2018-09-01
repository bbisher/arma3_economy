params ["_player"];
_player = _this select 0;
private _player_side = side _player;
private _player_side_groups = [];
{
	if (side _x == _player_side) then {
		_player_side_groups pushBack _x;
	};
} forEach allGroups;

_player_side_groups;

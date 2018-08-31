params["_cost", "_resource"];
private _return = False;
_cost = _this select 0;
_resource = _this select 1;

if(_resource >= _cost) then {
	_return = True;
} else {
	_return = False;
};
_return;

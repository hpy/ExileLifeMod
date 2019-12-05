/**
                    * ExilelifeClient_gui_inventory_event_onMouseDown
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_groundContainer","_rightClick","_result","_classname","_selectedValue","_playersNearby"];
disableSerialization;
_display = findDisplay 602;
_groundContainer = _this select 0;
_rightClick = if((_this select 1) isEqualTo 1)then{true}else{false};
_result = true;
try
{
    if !(_rightClick)then
    {
        throw "";
    };
	if (isNull ExileClientCurrentInventoryContainer) then
	{
		throw "It's my imaginary container friend!";
	};
    _classname = "";
    {
        _selectedValue = lbValue [_x, lbCursel(_x)];
        _classname = lbData [_x, _selectedValue];
        if(_classname != "") exitWith {};
    }forEach [632,640,633,638,BACKPACK_CONTAINER];
    if (_classname == "") then
    {
        throw "Umm... what is that thing????";
    };
    if ([player,_classname] call ExileClient_util_playerCargo_canAdd) then
    {
        throw "";
    };
	_playersNearby = [player, 5] call ExileClient_util_world_getAlivePlayerInfantryInRange;
	{
		if !(_x isEqualTo player) then
		{
			throw format["You feel uncomfortable bending over with %1 so close by...",[_x,"FIRST"] call ExileLifeClient_util_player_name];
		};
	}
	forEach _playersNearby;
    if !([ExileClientCurrentInventoryContainer,_classname] call ExileClient_util_containerCargo_remove) then
    {
            throw "Error removing Item";
    };
    if !([player,_classname] call ExileClient_util_playerCargo_add) then
    {
        [ExileClientCurrentInventoryContainer,_classname] call ExileClient_util_containerCargo_add;
    };
}
catch
{
    if !(_exception isEqualTo "") then {
        systemchat format["%1",_exception];
    };
    _result = false;
};
_result

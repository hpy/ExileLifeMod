_position = worldSize/2;
_center = [_position,_position,0];

_lockers = nearestObjects [_center, ["Exile_Locker"], worldSize];

{
	_x addAction ["<t color='#FF0000'>Rewards Vendor</t>", {[] call ExileLifeClient_gui_rewardsDialog_show;},"",-4,true ,true ,"","true",3];
} forEach _lockers;
/**
                    * ExilelifeClient_action_barriers_activatePoles
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_SwitchPos","_AnimState","_NearObj","_Barriers","_Found"];
_SwitchPos = getPos (_this select 0);
_AnimState = (_this select 1);
_NearObj = _SwitchPos nearObjects 15;
try
{
	if (isNull player)then
	{
		throw "No Player";
	};
	if !(alive player)then
	{
		throw "Dead Player";
	};
	_Barriers = []; 
	_Found = false;
	{
		if ((typeOf _x isEqualto "ExileLife_Guard_Bollards") || (typeOf _x isEqualto "ExileLife_Guard_Bollards_Short")) then 
		{
			_Found = true;
			_Barriers pushBack _x;
		};
	} forEach _NearObj;
	if (!_Found) then 
	{
		throw "No Barriers found within 15m"
	};
	{
		_x animate ["Popup_Bollards", _AnimState];
	} forEach _NearObj;
}
catch 
{
	["ErrorTitleAndText", ["Switch Error!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
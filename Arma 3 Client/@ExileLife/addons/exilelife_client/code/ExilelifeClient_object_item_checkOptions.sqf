/**
                    * ExilelifeClient_object_item_checkOptions
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_config","_feedbackString","_chance","_dice","_skillRequired","_skillName","_skillLevelReq","_skillLevel","_tools","_equippedMagazines","_toolItemClassName","_equippedToolQuantity","_stopBleeding","_animations","_animationIndex","_configSounds","_numberOfConfigSounds","_successFunction","_successArguments","_successType","_code","_successNotification"];
_config = _this;
_feedbackString = "";
try{
	_chance = getNumber (_config >> "chance");
	_dice = floor (random 100);
	if (_dice > _chance) then{
		throw "Please try again.";
	};
	_skillRequired = getArray(_config >> "skillrequired");
	if !(_skillRequired isEqualTo []) then 
	{
		{
			_skillName = _x select 0;
			_skillLevelReq = _x select 1;
			_skillLevel = [_skillName] call ExileLifeClient_util_player_skill;
			if(_skillLevelReq > _skillLevel)then{
				throw "You don't have the skills needed.";
			};
		}forEach _skillRequired;
	};
	_tools = getArray(_config >> "tools");
	_equippedMagazines = magazines player;
	{
		_toolItemClassName = _x;
		_equippedToolQuantity = { _x == _toolItemClassName } count _equippedMagazines;
		if (_equippedToolQuantity == 0 ) then
		{
			throw "You don't have the tools needed.";
		};
	}
	forEach _tools;
	_stopBleeding = getNumber (_config >> "stopBleeding");
	if (_stopBleeding isEqualTo 1) then
	{
		if (getBleedingRemaining player > 0) then 
		{
			player setBleedingRemaining 0; 
			player setVariable ['ExileLifeClientBleeding',false,true];
			ExileLifeClientPlayerIsBleeding = false;
		};
	};
	_animations = getArray (_config >> "animations");
	if !(_animations isEqualTo []) then
	{
		if ((vehicle player) isEqualTo player) then 
		{
			_animationIndex = call ExileClient_util_animation_getMatrixIndex;
			player playMove (_animations select _animationIndex);
		};
	};
	_configSounds = getArray (_config >> "sounds");
	_numberOfConfigSounds = count _configSounds;
	if( _numberOfConfigSounds > 0 ) then
	{
		playSound (_configSounds select (floor (random _numberOfConfigSounds)));
	};
	_successFunction = getText (_config >> "successFunction");
	_successArguments = getArray(_config >> "successFunctionArguments");
	_successType = getText (_config >> "successFunctionType");
	_code = missionNamespace getVariable [format["%1",_successFunction],""];
	if !(_code isEqualTo "") then
	{
		if (_successType isEqualTo "spawn") then 
		{
			_successArguments spawn _code;
		}
		else 
		{
			_successArguments call _code;
		};
	};
	_successNotification = getText (_config >> "successNotification");	
	if !(_successNotification isEqualTo "") then 
	{
		["SuccessTitleOnly", [_successNotification]] call ExileClient_gui_toaster_addTemplateToast;
	};
}catch{
	_feedbackString = _exception;
};
_feedbackString

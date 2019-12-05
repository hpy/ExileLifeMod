/**
                    * ExilelifeClient_object_player_event_network_forceConsumeRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_itemClassname","_consumingConfig","_configEffects","_effectAttributeId","_effectValue","_effectDuration","_minValue","_maxValue","_effect","_addPlusCharacter","_bloodAlcohol","_stopBleeding"];
_itemClassname = _this select 0;
if (isClass(configFile >> "CfgMagazines" >> _itemClassname >> "Interactions" >> "Consuming")) then{
	_consumingConfig = configFile >> "CfgMagazines" >> _itemClassname >> "Interactions" >> "Consuming";
	_configEffects = getArray (_consumingConfig >> "effects");
	{
		_effectAttributeId = _x select 0;
		_effectValue = _x select 1;
		_effectDuration = _x select 2;
		if (_effectValue isEqualType []) then 
		{
			_minValue = _effectValue select 0;
			_maxValue = _effectValue select 1;
			_effectValue = round([_minValue, _maxValue] call ExileLifeClient_util_number_randomValue);
		};
		if (_effectDuration isEqualType []) then 
		{
			_minValue = _effectDuration select 0;
			_maxValue = _effectDuration select 1;
			_effectDuration = round([_minValue, _maxValue] call ExileLifeClient_util_number_randomValue);
		};
		_effect = 
		[
			_effectAttributeId,
			_effectValue, 
			_effectDuration, 
			time, 
			_effectValue 
		];
		_addPlusCharacter = if (_effectValue > 0) then { "+" } else { "" };
		if (_effectAttributeId isEqualTo 4) then
		{
			_bloodAlcohol = (ExileClientPlayerAttributes select 4);
			_bloodAlcohol = (_bloodAlcohol + _effectValue) max 0;
			ExileClientPlayerAttributes set [4, _bloodAlcohol];
			if (ExileClientDeliriumThread isEqualTo -1) then
			{
				call ExileClient_object_player_thread_delirium;
				ExileClientDeliriumThread = [20, ExileClient_object_player_thread_delirium, [], true] call ExileClient_system_thread_addtask;
			};
		}
		else 
		{
			ExileClientPlayerEffects pushBack _effect;
		};	
	} foreach _configEffects;
	_stopBleeding = getNumber (_consumingConfig >> "stopBleeding");
	if (_stopBleeding isEqualTo 1) then
	{
		player setBleedingRemaining 0;
	};
};

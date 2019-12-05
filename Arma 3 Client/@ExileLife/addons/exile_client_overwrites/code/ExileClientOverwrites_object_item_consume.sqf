/**
                    * ExileClientOverwrites_object_item_consume
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_itemClassName","_config","_feedbackString","_configEffects","_effectAttributeId","_effectValue","_effectDuration","_effectUnit","_effect","_addPlusCharacter","_bloodAlcohol","_bloodAlcoholComment","_returnItemClass"];
_itemClassName = _this select 0;
if !(_itemClassName in (magazines player)) exitWith {false};
if( isClass(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Consuming") ) then
{
	_config = configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Consuming";
	_feedbackString = "";
	_feedbackString = _config call ExileLifeClient_object_item_checkOptions;
	if(_feedbackString isEqualTo "")then{
		_configEffects = getArray (_config >> "effects");
		{
			_effectAttributeId = _x select 0;
			_effectValue = _x select 1;
			_effectDuration = _x select 2;
			_effectUnit = if (_effectAttributeId isEqualTo 4) then {"‰"} else {"%"};
			_effect = 
			[
				_effectAttributeId,
				_effectValue, 
				_effectDuration, 
				time, 
				_effectValue 
			];
			_addPlusCharacter = if (_effectValue > 0) then { "+" } else { "" };
			if( _effectDuration == 0 ) then 
			{
				_feedbackString = _feedbackString + format["%1: %2%3%4<br/>", (ExileClientPlayerEffectNames select _effectAttributeId), _addPlusCharacter, _effectValue, _effectUnit];
			}
			else 
			{
				_feedbackString = _feedbackString + format["%1: %2%3%4/%5s<br/>", (ExileClientPlayerEffectNames select _effectAttributeId), _addPlusCharacter, _effectValue, _effectUnit, _effectDuration];
			};
			if (_effectAttributeId isEqualTo 4) then
			{
				_bloodAlcohol = (ExileClientPlayerAttributes select 4);
				_bloodAlcohol = (_bloodAlcohol + _effectValue) max 0;
				ExileClientPlayerAttributes set [4, _bloodAlcohol];
				if (_bloodAlcohol > 0) then 
				{
					_bloodAlcoholComment = "You feel tipsy.";
					if (_bloodAlcohol >= 3) then
					{
						_bloodAlcoholComment = "You are drunk as a skunk.";
					}
					else 
					{
						if (_bloodAlcohol >= 2) then
						{
							_bloodAlcoholComment = "You are boozed-up.";
						}
						else 
						{
							if (_bloodAlcohol >= 1) then
							{
								_bloodAlcoholComment = "You are drunk.";
							};
						};
					};
					systemChat format["Your blood alcohol level is now %1%2. %3", _bloodAlcohol, "‰", _bloodAlcoholComment];
				};
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
		} 
		foreach _configEffects;
		if (getNumber(_config >> "doNotRemoveItem") != 1)then{
			player removeItem _itemClassName;
		};		
		_returnItemClass = getText (_config >> "returnedItem");
		if( _returnItemClass != "" ) then
		{
			[player, _returnItemClass] call ExileLifeClient_util_playerCargo_addOrDrop;
		};
	}
	else 
	{
		["ErrorTitleAndText", ["Failed!", format["%1",_feedbackString]]] call ExileClient_gui_toaster_addTemplateToast;
	};
};
true

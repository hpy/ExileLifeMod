/**
                    * ExilelifeClient_object_player_injury_blood_network_injectBloodResponse
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

                    private["_effectsArray","_effectAttributeId","_effectValue","_effectDuration","_minValue","_maxValue","_effect","_addPlusCharacter"];
_effectsArray = _this select 0;
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
	ExileClientPlayerEffects pushBack _effect;
} 
foreach _effectsArray;
["SuccessTitleOnly", ["You've been injected with some blood"]] call ExileClient_gui_toaster_addTemplateToast;
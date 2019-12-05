/**
                    * ExilelifeClient_util_health_damageAllHitpoints
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

                    private["_object","_hitAmount","_damageAllPoints","_instigator","_hitpoints","_hitpointName","_index","_currentHitAmount","_newHitAmount"];
_object = _this select 0;
_hitAmount = _this select 1;
_damageAllPoints = _this param [2,false]; 
_instigator = _this param [3,objNull]; 
_hitpoints = getAllHitPointsDamage _object;
{
	_hitpointName = _x;
	_index = _forEachIndex;
	_currentHitAmount = (_hitpoints select 2) select _index;
	if (((_currentHitAmount > 0) && (_currentHitAmount < 1)) || (_damageAllPoints) && (_currentHitAmount < 1)) then 
	{
		_newHitAmount = _currentHitAmount + _hitAmount;
		if (_newHitAmount > 0.95) then
		{
			_newHitAmount = 0.95;
		};
		if (_newHitAmount < 0) then
		{
			_newHitAmount = 0;
		};
		_object setHitIndex [_index, _newHitAmount];
	};
} forEach (_hitpoints select 1);
true

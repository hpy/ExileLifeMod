/**
                    * ExilelifeClient_util_health_getAverageHealth
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

                    private["_object","_averageDamage","_totalHitAmount","_numberofHitPoints","_hitpoints","_currentHitAmount"];
_object = _this;
_averageDamage = 0;
_totalHitAmount = 0;
_numberofHitPoints = 0;
_hitpoints = getAllHitPointsDamage _object;
{
	_currentHitAmount = _x;
	_totalHitAmount = _totalHitAmount + _currentHitAmount;
	_numberofHitPoints = _numberofHitPoints + 1;
} forEach (_hitpoints select 2); 
_averageDamage = _totalHitAmount / _numberofHitPoints;
_averageDamage
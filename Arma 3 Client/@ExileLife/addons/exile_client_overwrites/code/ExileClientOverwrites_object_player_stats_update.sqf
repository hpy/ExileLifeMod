/**
                    * ExileClientOverwrites_object_player_stats_update
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

                    private["_timeElapsed","_damage","_secondsRemaining","_unit","_startingHealth","_hungerFactor","_thirstFactor","_bloodAlcohol","_effectAttribute","_effectValue","_effectDuration","_effectStartTime","_effectValueRemaining","_endEffect","_effectToApply","_newHealth","_updatedHealthState","_hunger","_thirst"];
if(player getVariable ['ExileLifeClientIncapacitated', false])exitWith{};
if (isNil "ExileLastStatUpdate") then
{
	ExileLastStatUpdate = diag_tickTime;
};
_timeElapsed = diag_tickTime - ExileLastStatUpdate;
if (diag_tickTime - ExileClientLastTemperatureUpdateAt >= 5) then
{
	(diag_tickTime - ExileClientLastTemperatureUpdateAt) call ExileClient_object_player_stats_updateTemperature;
	ExileClientLastTemperatureUpdateAt = diag_tickTime;
};
ExileLifeClientPlayerDamage = player call ExileLifeClient_util_health_getAverageHealth;
if (ExileLifeClientPlayerIsBleeding) then
{
	if (diag_tickTime - ExileLifeClientLastBleedUpdateAt >= 5) then
	{
		_damage = ExileLifeClientPlayerDamage + ExileLifeClientBleedOutRate;
		if (_damage >= 0.95) then
		{
			[player,objNull,objNull] call ExileLifeClient_object_player_death_onIncapacitated;
		}else{
			[player,ExileLifeClientBleedOutRate] call ExileLifeClient_util_health_damageAllHitpoints;
		};
		if (_damage >= 0.75) then
		{
			[_damage * 10] call BIS_fnc_bloodEffect;
		};
		_secondsRemaining = ExileLifeClientBleedingCountDownEnd - time;
		if (_secondsRemaining <= 0) then
		{
			call ExileLifeClient_object_player_injury_blood_toggleBleeding;
		};
		ExileLifeClientLastBleedUpdateAt = diag_tickTime;
	};
};
if (ExileLifePlayerHearingLossActive) then 
{
	if (diag_tickTime - ExileLifePlayerLastLostHearing >= ExileLifeHearingLossTimeout) then
	{
		if (ExileClientEarplugsInserted) then 
		{
			8 fadeSound 0.1;
		}
		else
		{
			8 fadeSound 1;
		};
		ExileLifePlayerHearingLossActive = false;
	}
	else
	{
		if !(ExileClientEarplugsInserted) then 
		{
			if (diag_tickTime - ExileLifePlayerLastLostHearingPlayed >= 8) then
			{
				0 fadeSound 0;
				playSound ["combat_deafness", true]; 
				ExileLifePlayerLastLostHearingPlayed = diag_tickTime;
			};
		};
	};
};
if (local player && ExileLifeClientPlayerIsUnconscious) then
{
	if (diag_tickTime - ExileLifeClientLastUnconsciousUpdateAt >= 5) then
	{
		_secondsRemaining = ExileLifeClientUnconsciousCountDownEnd - time;
		if (_secondsRemaining > 10) then
		{
			if (ExileLifeClientUnconsciousFade) then
			{
				if (diag_tickTime - ExileLifeClientUnconsciousFadeUpdateAt >= 10) then
				{
					cutText ["", "BLACK IN", 5];
					ExileLifeClientUnconsciousFade = false;
					ExileLifeClientUnconsciousFadeUpdateAt = diag_tickTime;
					vehicle player switchCamera "Internal";
				};
			}
			else
			{
				ExileLifeClientUnconsciousFade = true;
				cutText ["", "BLACK OUT", 2];
				ExileLifeClientUnconsciousFadeUpdateAt = diag_tickTime;
			};
		};
		if (_secondsRemaining <= 0) then
		{
			if (ExileLifeClientUnconsciousFade) then
			{
				cutText ["", "BLACK IN", 3];
			};
			ExileLifeClientUnconsciousFade = false;
			ExileLifeClientPlayerIsUnconscious = false;
			ExileLifeClientUnconsciousCountDownEnd = -1;
			ExileLifeClientUnconsciousFadeUpdateAt = -1;
			player setVariable ["ExileLifeClientUnconscious",false,true];
			_unit setUnconscious false;
			_unit playAction "Stop";
            if (ExileClientIsHandcuffed) then
            {
           		call ExileLifeClient_object_handcuffs_network_forceDownRequest;
       		};
		};
		ExileLifeClientLastUnconsciousUpdateAt = diag_tickTime;
	};
	if (player getVariable ["ExileLifeClientUnconsciousOverride",false]) then
	{
		ExileLifeClientPlayerIsUnconscious = false;
	};
}
else
{
	if !(player getVariable ['ExileLifeClientIncapacitated', false])then{
		if ((!(player getVariable ["ExileLifeClientUnconscious",false]) && ((animationState player)=="unconsciousrevivedefault") && !ExileLifeClientPlayerIsPartlyUnconscious)||(player getVariable ["ExileLifeClientUnconsciousOverride",false])) then
		{
			player setVariable ["ExileLifeClientUnconscious",true,true];
			ExileLifeClientPlayerIsPartlyUnconscious = true;
			player setUnconscious true;
			if (player getVariable ["ExileLifeClientUnconsciousOverride",false]) then
			{
				ExileLifeClientPlayerIsPartlyUnconsciousCountDownEnd = time + 2;
				player setVariable ["ExileLifeClientUnconsciousOverride",false,true];
			}
			else
			{
				ExileLifeClientPlayerIsPartlyUnconsciousCountDownEnd = time + 60;
				systemchat "Somethings wrong...I can't feel my legs...";
			};
			if (ExileLifeClientUnconsciousFade) then
			{
				cutText ["", "BLACK IN", 3];
				ExileLifeClientUnconsciousFade = false;
			};
		};
	};
	if (ExileLifeClientPlayerIsPartlyUnconscious || (player getVariable ["ExileLifeClientUnconsciousOverride",false])) then
	{
		if (!(player getVariable ["ExileLifeClientUnconscious",false])||(((ExileLifeClientPlayerIsPartlyUnconsciousCountDownEnd)<= time) && ((ExileLifeClientPlayerIsPartlyUnconsciousCountDownEnd)!= -1))) then
		{
			if (ExileLifeClientUnconsciousFade) then
			{
				cutText ["", "BLACK IN", 3];
			};
			ExileLifeClientUnconsciousFade = false;
			ExileLifeClientPlayerIsUnconscious = false;
			ExileLifeClientPlayerIsPartlyUnconscious = false;
			ExileLifeClientUnconsciousCountDownEnd = -1;
			ExileLifeClientUnconsciousFadeUpdateAt = -1;
			vehicle player switchCamera "Internal";
			player setUnconscious false;
			player playAction "Stop";
			player switchmove "unconsciousoutprone";
			player setVariable ["ExileLifeClientUnconscious",false,true];
            if (ExileClientIsHandcuffed) then
            {
           		call ExileLifeClient_object_handcuffs_network_forceDownRequest;
       		};
		};
	};
};
ExileClientPlayerLoad = loadAbs player;
ExileClientPlayerOxygen = getOxygenRemaining player * 100;
ExileClientPlayerAttributes set [0, (1 - ExileLifeClientPlayerDamage) * 100];
_startingHealth = ExileLifeClientPlayerDamage;
ExileClientPlayerAttributes set [1, (1 - getFatigue player) * 100];
ExileClientPlayerIsAbleToBreathe = isAbleToBreathe player;
ExileClientPlayerIsInfantry = (vehicle player) isEqualTo player;
ExileClientPlayerVelocity = player call BIS_fnc_absSpeed;
ExileClientPlayerIsBleeding = isBleeding player;
ExileClientPlayerIsBurning = isBurning player;
ExileClientPlayerIsOverburdened = ExileClientPlayerLoad > 900; 
ExileClientPlayerIsDrowning = ExileClientPlayerOxygen < 50;
ExileClientPlayerIsInjured = (ExileClientPlayerAttributes select 0) < 50;
ExileClientPlayerIsHungry = (ExileClientPlayerAttributes select 2) < 25;
ExileClientPlayerIsThirsty = (ExileClientPlayerAttributes select 3) < 25;
ExileClientPlayerIsExhausted = (ExileClientPlayerAttributes select 1) < 40;
ExileClientPlayerIsHungry call ExileClient_gui_hud_toggleHungerIcon;
ExileClientPlayerIsThirsty call ExileClient_gui_hud_toggleThirstIcon;
if (ExileClientIsAutoRunning) then
{
	call ExileClient_system_autoRun_update;
};
if (ExileClientPlayerIsInCombat) then
{
	if( diag_tickTime - ExileClientPlayerLastCombatAt >= 30 ) then
	{
		ExileClientPlayerIsInCombat = false;
		false call ExileClient_gui_hud_toggleCombatIcon;
		call ExileClient_system_rating_balance;
	};
};
_hungerFactor = 1;
_thirstFactor = 1;
if (ExileClientPlayerIsInfantry) then 
{
	ExileClientPlayerVelocity = ExileClientPlayerVelocity min 24;
	if (ExileClientPlayerVelocity > 0) then 
	{
		_hungerFactor = 1 + ExileClientPlayerVelocity / 64 * _timeElapsed; 
		_thirstFactor = 1 + ExileClientPlayerVelocity / 48 * _timeElapsed; 
	};
}
else
{
	if (ExileClientIsInBush) then
	{
		call ExileClient_object_bush_detach;
	};
	if (ExileClientPlayerIsBambi) then
	{
		if !((typeOf (vehicle player)) isEqualTo "Steerable_Parachute_F") then
		{
			call ExileClient_object_player_bambiStateEnd;
		};
	};
};
if (getText(missionConfigFile >> "Header" >> "gameMode") isEqualTo "Escape") then
{
	ExileClientPlayerAttributes set [2, 100];
	ExileClientPlayerAttributes set [3, 100];
}
else
{
	ExileClientPlayerAttributes set [2, ((((ExileClientPlayerAttributes select 2) - (100 / ExileClientHungerDecay * _hungerFactor * _timeElapsed)) min 100) max 0)];
	ExileClientPlayerAttributes set [3, ((((ExileClientPlayerAttributes select 3) - (100 / ExileClientThirstDecay * _thirstFactor * _timeElapsed)) min 100) max 0)];
};
if ((ExileClientPlayerAttributes select 2) isEqualTo 0 || (ExileClientPlayerAttributes select 3) isEqualTo 0 || ExileClientPlayerIsBleeding) then
{
	ExileClientPlayerAttributes set [0, ((((ExileClientPlayerAttributes select 0) - ExileClientHealthDecay * _timeElapsed) min 100) max 0)];
};
_bloodAlcohol = (ExileClientPlayerAttributes select 4);
if (_bloodAlcohol > 0) then
{
	ExileClientPlayerAttributes set [1, linearConversion [0, 3, _bloodAlcohol, 100, 0, true]];
};
{
	_effectAttribute = _x select 0;
	_effectValue = _x select 1;
	_effectDuration = _x select 2;
	_effectStartTime = _x select 3;
	_effectValueRemaining = _x select 4;
	_endEffect = time - _effectStartTime >= _effectDuration; 
	if( _effectValue > 0 ) then
	{
		if (_effectDuration == 0) then 
		{
			_effectToApply = _effectValue;
		}
		else
		{
			_effectToApply = (_effectValue / _effectDuration * _timeElapsed) min _effectValueRemaining;
		};
		_x set [4, _effectValueRemaining - _effectToApply];
		ExileClientPlayerAttributes set [_effectAttribute, ((((ExileClientPlayerAttributes select _effectAttribute) + _effectToApply) min 100) max 0)];
	}
	else
	{
		if (_effectDuration == 0) then 
		{
			_effectToApply = abs _effectValue;
		}
		else
		{
			_effectToApply = ((abs _effectValue) / _effectDuration * _timeElapsed) max _effectValueRemaining;
		};
		_x set [4, _effectValueRemaining + _effectToApply];
		ExileClientPlayerAttributes set [_effectAttribute, (((ExileClientPlayerAttributes select _effectAttribute) - (abs _effectToApply) min 100) max 0)];
	};
	if( (ExileClientPlayerAttributes select _effectAttribute) == 0 || (ExileClientPlayerAttributes select _effectAttribute) == 100 ) then
	{
		_endEffect = true;
	};
	if( _endEffect ) then
	{
		ExileClientPlayerEffects deleteAt _forEachIndex;
	};
} foreach ExileClientPlayerEffects;
_newHealth = (1 - (ExileClientPlayerAttributes select 0) / 100);
if (_startingHealth < _newHealth) then
{
	_updatedHealthState = _newHealth - _startingHealth;
}
else
{
	_updatedHealthState = (_startingHealth - _newHealth) * -1;
};
if !(_updatedHealthState isEqualTo 0) then
{
	if (_updatedHealthState >= 0.95) then
	{
		[player,0.95] call ExileLifeClient_util_health_damageAllHitpoints;
		diag_log "SETTING PLAYER INTO REVIVE STATE in bleedout etc!";
		[player,objNull,objNull] call ExileLifeClient_object_player_death_onIncapacitated;
	}else{
		[player,_updatedHealthState] call ExileLifeClient_util_health_damageAllHitpoints;
	};
};
_hunger = ExileClientPlayerAttributes select 2;
_thirst = ExileClientPlayerAttributes select 3;
if (diag_tickTime - ExileClientPlayerLastHpRegenerationAt >= 60) then
{
	if (_hunger >= ExileClientHungerRegen) then
	{
		if (_thirst >= ExileClientThirstRegen) then
		{
			[player,(ExileClientRecoveryAmmount * -1)] call ExileLifeClient_util_health_damageAllHitpoints;
			ExileClientPlayerLastHpRegenerationAt = diag_tickTime;
		};
	};
};
if ((goggles player) isEqualTo "ExileLife_Mask_GasMask") then
{
	if !(ExileClientGasMaskVisible) then
	{
		true call ExileClient_gui_gasMask_toggle;
	};
	if (alive player) then
	{
		if (diag_tickTime >= ExileGasMaskNextSoundAt) then
		{
			playSound format ["Exile_Sound_GasMaskBreathing0%1", 1 + (floor (random 2))];
			ExileGasMaskNextSoundAt = diag_tickTime + (2.2 + (random 1));
		};
	};
}
else
{
	if (ExileClientGasMaskVisible) then
	{
		false call ExileClient_gui_gasMask_toggle;
	};
};
ExileLastStatUpdate = diag_tickTime;
true

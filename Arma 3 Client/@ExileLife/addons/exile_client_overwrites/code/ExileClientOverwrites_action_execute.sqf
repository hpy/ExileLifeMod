/**
                    * ExileClientOverwrites_action_execute
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

                    private["_dialog","_display","_actionName","_parameters","_progress","_actionConfig","_duration","_durationFunction","_failChance","_failChanceFunction","_animation","_sound","_animationarray","_animationType","_conditionFunction","_abortInCombatMode","_repeatAnimation","_animationLength","_repeatingCheckFunction","_skillType","_skillLevel","_startTime","_sleepDuration","_failAt","_errorMessage","_playerSkills","_bonusSkill","_bonusModifier","_playerskilllevel","_playerSkillLevel","_failChanceVar","_durationVar","_keyDownHandle","_mouseButtonDownHandle","_label","_progressBarBackground","_progressBarMaxSize","_progressBar","_animationIndex","_repeatingCheck","_config","_weapon","_function","_progressBarColor"];
disableSerialization;
if (ExileClientActionDelayShown) exitWith {};
_dialog = uiNameSpace getVariable ["RscExileItemDetailsDialog", displayNull];
if !(isNull _dialog) then
{
	_dialog closeDisplay 0;
};
_display = (findDisplay 602);
if !(isNull _display) then
{
	_display closeDisplay 0;
};
ExileClientActionDelayShown = true;
ExileClientActionDelayAbort = false;
ExileLifeAnimationTimeDelay = -1;
ExileLifeActionRepeatOverride = false;
_actionName = _this select 0;
_parameters = _this select 1;
_progress = 0;
_actionConfig = configFile >> "CfgExileDelayedActions" >> _actionName;
_duration = getNumber (_actionConfig >> "duration");
_durationFunction = getText (_actionConfig >> "durationFunction");
_failChance = getNumber (_actionConfig >> "failChance");
_failChanceFunction = getText (_actionConfig >> "failChanceFunction");
_animation = getText (_actionConfig >> "animation");
_sound = getText(_actionConfig >> "animationSound");
_animationarray = getArray (_actionConfig >> "animationarray");
_animationType = getText (_actionConfig >> "animationType");
_conditionFunction = getText (_actionConfig >> "conditionFunction");
_abortInCombatMode = (getText (_actionConfig >> "abortInCombatMode")) isEqualTo 1;
_repeatAnimation = getNumber (_actionConfig >> "repeatAnimation");
_animationLength = getNumber (_actionConfig >> "animationLength");
_repeatingCheckFunction = getText (_actionConfig >> "repeatingCheckFunction");
_skillType = getText(_actionConfig >> "skilltype");
_skillLevel = getNumber (_actionConfig >> "skillLevel");
_startTime = diag_tickTime;
_sleepDuration = _duration / 100;
_failAt = diag_tickTime + 99999;
ExileLifeAnimationTimeDelay = time + _animationLength;
_errorMessage = "";
if !(_conditionFunction isEqualTo "") then 
{
	_errorMessage = _parameters call (missionNameSpace getVariable [_conditionFunction,{}]);
};
if !(_errorMessage isEqualTo "") exitWith
{
	ExileClientActionDelayShown = false;
	["ErrorTitleAndText", ["Whoops!", _errorMessage]] call ExileClient_gui_toaster_addTemplateToast;
};
if !(_durationFunction isEqualTo "") then
{
    _duration = _parameters call (missionNameSpace getVariable [_durationFunction,{}]);
};
_playerSkills = player getVariable [format["ExileLifeSkill:%1",_skillType],[]];
if !(_playerSkills isEqualTo []) then
{
	if (_skillLevel > 0) then
	{
		_bonusSkill = getNumber(missionConfigFile >> "CfgPlayer" >> "CfgExileLifeClasses" >> ExileLifeClientClass >> "Skillbonus" >> _skillType);
		_bonusModifier = 0;
		if (_bonusSkill > 0) then
		{
			_bonusModifier = _bonusSkill / 100;
		};
		_playerskilllevel = _playerSkills select 0;
		if (_playerSkillLevel < _skillLevel) exitWith
		{
			ExileClientActionDelayShown = false;
			["ErrorTitleAndText", ["Whoops!", "You have no idea how to do this!"]] call ExileClient_gui_toaster_addTemplateToast;
		};
		_failChanceVar = format["failChance_%1",_playerSkillLevel];
		_failChance = getNumber (_actionConfig >> _failChanceVar);
		_failChance = _failChance - _bonusModifier;
		if (_failChance < 0) then
		{
			_failChance = 0;
		};
		_durationVar = format["duration_%1",_playerSkillLevel];
		_duration = (getNumber (_actionConfig >> _durationVar))  - _bonusModifier;
		diag_log format["THIS IS A SKILL BASED ACTION: _failChanceVar %1 _failChance: %2 _durationVar: %3 _duration: %4",_failChanceVar,_failChance,_durationVar,_duration];
		if (_duration < 0) then
		{
			_duration = 0;
		}
		else
		{
			_sleepDuration = _duration / 100;
		};
	};
};
if !(_failChanceFunction isEqualTo "") then
{
    _failChance = _parameters call (missionNameSpace getVariable [_failChanceFunction,{}]);
};
if ((floor (random 100)) < _failChance) then 
{
	_failAt = _startTime + _duration * (0.5 + (random 0.5));
};
if !(ExileClientActionDelayShown) exitWith {};
("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileActionProgress", "PLAIN", 1, false];
_keyDownHandle = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call ExileClient_action_event_onKeyDown"];
_mouseButtonDownHandle = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call ExileClient_action_event_onMouseButtonDown"];
_display = uiNamespace getVariable "RscExileActionProgress";
_label = _display displayCtrl 4002;
_label ctrlSetText "0%";
_progressBarBackground = _display displayCtrl 4001;
_progressBarMaxSize = ctrlPosition _progressBarBackground;
_progressBar = _display displayCtrl 4000;
_progressBar ctrlSetPosition [_progressBarMaxSize select 0, _progressBarMaxSize select 1, 0, _progressBarMaxSize select 3];
_progressBar ctrlSetBackgroundColor [0, 0.78, 0.93, 1];
_progressBar ctrlCommit 0;
_progressBar ctrlSetPosition _progressBarMaxSize; 
_progressBar ctrlCommit _duration;
if !(_animationarray isEqualTo []) then
{
	if ((vehicle player) isEqualTo player) then
	{
		_animationIndex = call ExileClient_util_animation_getMatrixIndex;
		_animation = (_animationarray select _animationIndex);
		_animationType = "playMoveNow";
	};
};
if !(_animation isEqualTo "") then
{
	switch (_animationType) do
	{
		case "switchMove" : 	{  ["switchMoveRequest", [netId player, _animation]] call ExileClient_system_network_send;};
		case "playMoveNow" : 	{  player playMoveNow _animation; };
		case "playActionNow" : 	{ player playActionNow _animation; playSound3D [_sound, player, false, getPosASL player, 1, 1, 0]};
		default {};
	};
};
try
{
	while {_progress < 1} do
	{
		if (diag_tickTime >= _failAt) then
		{
			throw 1;
		};
		if (ExileClientActionDelayAbort) then
		{
			throw 2;
		};
		if (ExileClientPlayerIsInCombat) then
		{
			if (_abortInCombatMode) then
			{
				throw 2;
			};
		};
		if !(alive player) then
		{
			throw 2;
		};
		if !(_repeatingCheckFunction isEqualTo "") then
		{
			_repeatingCheck = _parameters call (missionNameSpace getVariable [_repeatingCheckFunction,{}]);
			if !(_repeatingCheck) then
			{
				throw 2;
			};
		};
			if !(_repeatAnimation == 0) then
			{
				if (ExileLifeAnimationTimeDelay < time) then
				{
					ExileLifeActionRepeatOverride = true;
					ExileLifeAnimationTimeDelay = time + _animationLength;
					_config = (configFile >> "CfgWeapons" >> _weapon);
					if(isClass _config) then
					{
						playSound3D [_sound, player, false, getPosASL player, 1, 1, 0];
					};
					switch (_animationType) do
					{
						case "switchMove" : 	{  ["switchMoveRequest", [netId player, _animation]] call ExileClient_system_network_send;};
						case "playMoveNow" : 	{  player playMoveNow _animation; };
						case "playActionNow" : 	{ 	player playActionNow _animation; };
						default {};
					};
					_repeatAnimation = _repeatAnimation - 1;
				};
			};
		uiSleep _sleepDuration;
		_progress = ((diag_tickTime - _startTime) / _duration) min 1;
		_label ctrlSetText format["%1%2", round (_progress * 100), "%"];
	};
	_errorMessage = "";
	if !(_conditionFunction isEqualTo "") then
	{
		_errorMessage = _parameters call (missionNameSpace getVariable [_conditionFunction,{}]);
	};
	if !(_errorMessage isEqualTo "") exitWith
	{
		ExileClientActionDelayShown = false;
		["ErrorTitleAndText", ["Whoops!", _errorMessage]] call ExileClient_gui_toaster_addTemplateToast;
		throw 2;
	};
	throw 0;
}
catch
{
	_function = "";
	_progressBarColor = [];
	switch (_exception) do
	{
		case 0:
		{
			_function = getText (_actionConfig >> "completedFunction");
			_progressBarColor = [0.7, 0.93, 0, 1];
		};
		case 2:
		{
			_function = getText (_actionConfig >> "abortedFunction");
			_progressBarColor = [0.82, 0.82, 0.82, 1];
		};
		case 1:
		{
			_function = getText (_actionConfig >> "failedFunction");
			_progressBarColor = [0.91, 0, 0, 1];
		};
	};
	_progressBar ctrlSetBackgroundColor _progressBarColor;
	if !(_function isEqualTo "") then
	{
		_parameters call (missionNameSpace getVariable [_function,{}]);
	};
	if !(_animation isEqualTo "") then
	{
		player switchMove "";
		["switchMoveRequest", [netId player, ""]] call ExileClient_system_network_send;
	};
	_progressBar ctrlSetPosition _progressBarMaxSize;
	_progressBar ctrlCommit 0;
};
("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutFadeOut 2;
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _keyDownHandle];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _mouseButtonDownHandle];
ExileClientActionDelayShown = false;
ExileClientActionDelayAbort = false;
ExileLifeAnimationTimeDelay = -1;
ExileLifeActionRepeatOverride = false;

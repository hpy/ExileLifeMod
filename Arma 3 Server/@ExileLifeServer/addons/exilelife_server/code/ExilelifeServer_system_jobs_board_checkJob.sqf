/**
                    * ExilelifeServer_system_jobs_board_checkJob
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

                    private["_sessionID","_package","_jobClassname","_result","_playerObject","_playerJobs","_playerRank","_playerGang","_requiredGangs","_gangs","_playerClass","_requiredClass","_classes","_requiredSkills","_skillName","_skillAmount","_strArray","_i","_skillStr","_skill","_requiredMembers","_requiredPlayers","_members","_filePath","_code","_currentMemberCount","_requiredMemberCount","_pid","_pSessionID","_pObj","_jobTitle"];
_sessionID = _this select 0;
_package = _this select 1;
_jobClassname = _package select 0;
_result = true;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player is Null";
	};
	if (_playerObject getVariable ["ExileLifeJobMultiJob",""]!= "") then
	{
		throw "You are currently awaiting another job to start!";
	};
	if !(isClass (configFile >> "CfgJobs" >> _jobClassname)) then
	{
		throw format["Job %1 does not exist in config!",_jobClassname];
	};
	_playerJobs = _playerObject getVariable ["ExileLifeJobs:Current",[]];
	if !(count _playerJobs == 0) then
	{
		if ((_playerJobs select 0) isEqualTo _jobClassname) then
		{
			throw format["%1, you already have the %2 job!",name _playerObject,_jobClassname];
		};
	};
	if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredRank")) then
	{
		_playerRank= _playerObject getVariable ["ExileLifeClientRank",0];
		if (getNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredRank") > _playerRank) then
		{
			throw "You do not have the required Minimum Rank for this Job!";
		};
	};
	if (isArray (configFile >> "CfgJobs" >> _jobClassname >> "RequiredGangs")) then
	{
		_playerGang= _playerObject getVariable ['ExileLifeClientGang',""];
		_requiredGangs = getArray (configFile >> "CfgJobs" >> _jobClassname >> "RequiredGangs");
		if (({_x == _playerGang} count _requiredGangs)==0) then
		{
			_gangs = _requiredGangs joinString ", or ";
			throw format["You need to be a member of the %1 to do this job!",_gangs];
		};
	};
	if (isArray (configFile >> "CfgJobs" >> _jobClassname >> "RequiredClasses")) then
	{
		_playerClass= _playerObject getVariable ['ExileLifeClientClass',""];
		_requiredClass = getArray (configFile >> "CfgJobs" >> _jobClassname >> "RequiredClasses");
		if (({_x == _playerClass} count _requiredClass)==0) then
		{
			_classes = _requiredClass joinString ", or ";
			throw format["You need to be a %1 to do this job!",_classes];
		};
	};
	if (isArray (configFile >> "CfgJobs" >> _jobClassname >> "RequiredSkills")) then
	{
		_requiredSkills = getArray (configFile >> "CfgJobs" >> _jobClassname >> "RequiredSkills");
		{
			_skillName = _x select 0;
			_skillAmount = _x select 1;
			_strArray = _skillName splitString "";
			_strArray set[0,(toUpper (_strArray select 0))];
			for "_i" from 1 to ((count _strArray) - 1) do {_strArray set[_i,(toLower (_strArray select _i))]};
			_skillStr = _strArray joinString "";
			_skill = _playerObject getVariable [format["ExileLifeSkill:%1",_skillStr], [0,0]];
			if ((_skill select 0) < _skillAmount) then{
				throw format["You need %1 level %2 to do this job!",_skillStr,_skillAmount];
			};
		} forEach _requiredSkills;
	};
	_requiredGangs = getArray(configFile >> "CfgJobs" >> _jobClassname >> "RequiredGangs");
	if((count _requiredGangs) == 0) then {
		_requiredGangs = ["Mafia","Cartel","Yakuza","Sydnicate"];
	};
	_requiredMembers = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers");
	_requiredPlayers = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "RequiredPlayers");
	_members = 0;
	{
		_members = _members + (_x call ExileLifeClient_util_gang_countGang);
	}forEach _requiredGangs;
	if(_requiredMembers > _members) then {
		call ExileLifeClient_util_gang_countOnline;
		throw "I dont think i will do this job with so few fellow gang members around....";
	};
	if(_requiredPlayers > (count allPlayers)) then {
		call ExileLifeClient_util_gang_countOnline;
		throw "I dont think i will do this job with so few people around....";
	};
		_filePath = getText (configFile >> "CfgJobs" >> _jobClassname >> "path");
		if !(_filePath isEqualTo "") then
		{
			_code = missionNamespace getVariable [format["ExileLifeServer_system_jobs_scenes_%1_preCondition",_filePath],""];
			if !(_code isEqualTo "") then
			{
				if !(call _code) then
				{
					throw "";
				};
			};
		};
	if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers")) then {
		_members = [];
		if (typeName (missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname]) == "ARRAY") then
		{
			_members = missionNamespace getVariable (format["ExileLifeJobMembers:%1",_jobClassname]);
		};
		_members pushBackUnique (_playerObject getVariable ["ExileLifePID",-1]);
		missionNamespace setVariable [format["ExileLifeJobMembers:%1",_jobClassname],_members];
		_playerObject setVariable ["ExileLifeJobMultiJob",_jobClassname,true];
		_currentMemberCount = count _members;
		_requiredMemberCount = getNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers");
		if (_requiredMemberCount > _currentMemberCount) then{
			[_sessionID,"toastRequest",["InfoTitleAndText",["Success","You have been added to the job sheet. When enough members sign up you will be informed!"]]] call ExileServer_system_network_send_to;
			{
				_pid = _x;
				_pSessionID = _pid call ExileLifeServer_system_session_getIDfromDBID;
				_pObj = _pSessionID call ExileServer_system_session_getPlayerObject;
				if ((isNull _pObj) || !(alive _pObj)) then{
					if!(isNull _pObj) then {
						_pObj setVariable ["ExileLifeJobMultiJob",nil,true];
					};
					_currentMemberCount deleteAt _forEachIndex;
					_currentMemberCount = _currentMemberCount - 1;
				}else{
					_jobTitle = getText(configFile >> "CfgJobs" >> _jobClassname >> "shortName");
					[_pSessionID,"toastRequest",["InfoTitleAndText",["Job Update",format["Job: --%1-- has %2/%3 enrolled!",_jobTitle,_currentMemberCount,_requiredMemberCount]]]] call ExileServer_system_network_send_to;
				};
			} forEach _members;
			throw "";
		};
	};
}
catch
{
    _result = false;
	if !(_exception isEqualTo "") then {
		[_sessionID,"toastRequest",["ErrorTitleAndText",["Aborted",format["%1",_exception]]]] call ExileServer_system_network_send_to;
	};
};
_result

/**
                    * ExileServer_system_network_event_onPlayerConnected
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

                    private["_owner","_isKnownAccount","_PID1","_bloodType","_PID2"];
_uid = _this select 0;
_name = _this select 1;
_owner = _this select 2;
if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	format["Player %1 (UID %2) connected!", _name, _uid] call ExileServer_util_log;
	_isKnownAccount = format["isKnownAccount:%1", _uid] call ExileServer_system_database_query_selectSingleField;
	if (_isKnownAccount) then
	{
		format["startAccountSession:%1:%2:%3", _uid, _name,"character1"] call ExileServer_system_database_query_fireAndForget;
	}
	else
	{
		_PID1 = format["getAccountPID:%1:%2", _uid, "character1"] call ExileServer_system_database_query_selectSingleField;
		if (isNil "_PID1") then
		{
			_PID1 = format["createAccount:%1:%2:%3", _uid, _name, "character1"] call ExileServer_system_database_query_insertSingle;
		};
		if (isNil "ExileLifePlayerBloodTypes" || ExileLifePlayerBloodTypes isEqualTo [])then{
			call ExileLifeServer_object_player_injury_blood_initializeBloodTypes;
		};
		_bloodType = selectRandomWeighted ExileLifePlayerBloodTypes;
		format["createPlayerExileLife:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12",
			_PID1, 
			_uid, 
			_name, 
			"", 
			"character1",
			[],
			[],
			[],
			"Rogue",
			[],
			[],
			_bloodType] call ExileServer_system_database_query_insertSingle;
		format["createPrisonerRecord:%1",_PID1] call ExileServer_system_database_query_insertSingle;
		_PID2 = format["getAccountPID:%1:%2", _uid, "character2"] call ExileServer_system_database_query_selectSingleField;
		if (isNil "_PID2") then
		{
			_PID2 = format["createAccount:%1:%2:%3", _uid, _name, "character2"] call ExileServer_system_database_query_insertSingle;
		};
		_bloodType = selectRandomWeighted ExileLifePlayerBloodTypes;
		format["createPlayerExileLife:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12",
			_PID2, 
			_uid, 
			_name, 
			"", 
			"character2",
			[],
			[],
			[],
			"Rogue",
			[],
			[],
			_bloodType] call ExileServer_system_database_query_insertSingle;
		format["createPrisonerRecord:%1",_PID2] call ExileServer_system_database_query_insertSingle;
		format["createPlayerPerks:%1:%2", _uid, _name] call ExileServer_system_database_query_insertSingle;
	};
};
true

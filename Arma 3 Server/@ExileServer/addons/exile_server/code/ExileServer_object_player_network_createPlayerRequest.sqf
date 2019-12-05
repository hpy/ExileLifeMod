/**
                    * ExileServer_object_player_network_createPlayerRequest
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

                    private["_sessionID","_parameters","_spawnLocationMarkerName","_guardcheck","_characterclass","_tutorialProgress","_requestingPlayer","_playerUID","_bambiPlayer","_accountselected","_ExileLifeData","_accountData"];
_sessionID = _this select 0;
_parameters = _this select 1;
_spawnLocationMarkerName = _parameters select 0;
_guardcheck = _parameters select 1;
_characterclass = _parameters select 2;
_tutorialProgress = _parameters select 3;
_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _requestingPlayer) then
	{
		throw format ["Session %1 requested a bambi character, but doesn't have a player object. Hacker or Monday?", _sessionID];
	};
	_playerUID = getPlayerUID _requestingPlayer;
	if(_playerUID isEqualTo "")then
	{
		throw format ["Player: '%1' has no player UID. Arma/Steam sucks!.",name _requestingPlayer];
	};
	if (_guardcheck) then
	{
		_bambiPlayer = (createGroup blufor) createUnit ["ExileLife_Unit_Guard", [0,0,0], [], 0, "CAN_COLLIDE"];
		_bambiPlayer setVariable ["ExileLifeClient:Guard",true,true];
		ExileLifeOnlineGuards pushback _sessionID;
	}
	else
	{
		_bambiPlayer = (createGroup independent) createUnit ["Exile_Unit_Player", [0,0,0], [], 0, "CAN_COLLIDE"];
		_bambiPlayer setVariable ["ExileLifeClient:Guard",false,true];
	};
	_accountselected = _requestingPlayer getVariable ["ExileLifeClientSpawnChoice", ""]; 
	_bambiPlayer setVariable ["ExileLifeClientSpawnChoice", _accountselected];
	_ExileLifeData = format["loadPlayerExileLife:%1:%2", _playerUID, _accountselected] call ExileServer_system_database_query_selectSingle;
	_ExileLifeData set [4, _characterclass];
	format["updateplayerclass:%1:%2", _characterclass, (_ExileLifeData select 18)] call ExileServer_system_database_query_insertSingle;
	if ((_guardcheck) && (_characterclass isEqualTo "Guard") && !((_ExileLifeData select 4) isEqualTo "Guard")) then
	{
		_ExileLifeData set [4, "Guard"];
		format["joinGang:%1:%2", "Guard", (_ExileLifeData select 18)] call ExileServer_system_database_query_insertSingle;
	};
	_accountData = format["getAccountStats:%1:%2", _playerUID, _ExileLifeData select 18] call ExileServer_system_database_query_selectSingle;
	removeHeadgear _bambiPlayer;
	[_sessionID, _requestingPlayer, _spawnLocationMarkerName, _bambiPlayer, _accountData, _ExileLifeData,_tutorialProgress] call ExileServer_object_player_createBambi;
}
catch
{
	_exception call ExileServer_util_log;
};

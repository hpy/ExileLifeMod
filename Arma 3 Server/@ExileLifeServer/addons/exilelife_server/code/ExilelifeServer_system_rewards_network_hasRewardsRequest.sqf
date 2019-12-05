/**
                    * ExilelifeServer_system_rewards_network_hasRewardsRequest
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

                    private["_sessionID","_playerObject","_rewardsData","_hasRewardsPlayer","_responseCode"];
_sessionID = _this select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player object is null!";
	};
	_uid = getPlayerUID _playerObject;
	if (isNil "_uid") then
	{
		throw "getPlayerUID returned nil!";
	};
	if (_uid isEqualTo "") then
	{
		throw "getPlayerUID returned an empty string!";
	};
	_rewardsData = [];
	_hasRewardsPlayer = format["hasRewardsPlayer:%1", _uid] call ExileServer_system_database_query_selectSingleField;
	if(_hasRewardsPlayer) then {
		_rewardsData = format["loadRewards:%1", _uid] call ExileServer_system_database_query_selectSingle;
		_rewardsData = (_rewardsData select 0);
		_playerObject setVariable ["ExileLifeClientPlayerRewards", _rewardsData];
	} else {
		format["createRewards:%1:%2", _uid, []] call ExileServer_system_database_query_insertSingle;
		_playerObject setVariable ["ExileLifeClientPlayerRewards", _rewardsData];
	};
	[_sessionID, "hasRewardsResponse", [0,_rewardsData]] call ExileServer_system_network_send_to;
}
catch
{
	_responseCode = _exception;
	[_sessionID, "hasRewardsResponse", [_responseCode, []]] call ExileServer_system_network_send_to;
};
true

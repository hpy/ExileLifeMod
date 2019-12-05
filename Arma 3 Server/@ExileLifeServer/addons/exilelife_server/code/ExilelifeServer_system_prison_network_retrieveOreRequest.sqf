/**
                    * ExilelifeServer_system_prison_network_retrieveOreRequest
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

                    private["_sessionID","_oreQuantity","_player","_guardVault","_vaultLocation","_vaultContents","_msg"];
_sessionID = _this select 0;
_oreQuantity = 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Invalid player.";
	};
	if !(alive _player) then
	{
		throw "Dead player.";
	};
	if !(_player getVariable ["ExileLifeClient:Guard",false]) then
	{
		throw "You are not a guard!";
	};
	_guardVault = missionNamespace getVariable ["ExileLifeGangVault:Guard",[]];
	{
		_vaultLocation = _x select 0;
		if (_vaultLocation == "Prison") exitWith
		{
			_vaultContents = _x select 1;
			{
				if ((_x select 0) == ("exilelife_item_exiumore")) exitWith
				{
					_oreQuantity = _x select 1;
				};
			}forEach _vaultContents;
		};
	}forEach _guardVault;
	_msg = format ["The vault contains %1 Exium Ore!",_oreQuantity];
	[_sessionID, "baguetteRequest", [["Labour Mine",_msg]]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileLifeServer_util_log;
};

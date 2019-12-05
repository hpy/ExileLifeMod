/**
                    * ExilelifeServer_system_process_offloadtoClient
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

                    private["_skip","_leader","_groupOwner","_localclient"];
if ((count allPlayers) < 1) exitWith {};
_skip = false;
if !(isNull ExileLifeLocalClient) then
{
	if ((alive ExileLifeLocalClient) && (isPlayer ExileLifeLocalClient)) then {_skip = true;};
};
if !(_skip) then
{
	{
		try
		{
			if !((count (units _x))>0) then
			{
				throw false;
			};
			_leader = leader _x;
			_group = _x;
			_groupOwner = groupOwner _group;
			_localclient = false;
			if ((!isNull _leader) && {(alive _leader) && {isPlayer _leader}}) then
			{
				{
					if (_groupOwner isEqualTo (owner _x)) exitWith
					{
						ExileLifeLocalClientStartTime = diag_tickTime;
						ExileLifeLocalClient = _x;
						throw true;
					};
				} forEach allPlayers;
			};				
		}
		catch
		{
			if (_exception) exitWith 
			{ 
				format ["LocalClient Functions Offloaded to: %1",ExileLifeLocalClient] call ExileServer_util_log;
			};
		};
	} forEach allGroups;
};
/**
                    * ExilelifeServer_system_virtualGarage_network_processVGRequest
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

                    private["_sessionID","_package","_option","_playerObject","_vehicleNetID","_vehicleObject","_vehicleID"];
_sessionID = _this select 0;
_package = _this select 1;
_option = _package select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player object is null";
	};
	switch (toUpper(_option)) do
	{
		case "ADD":
		{
			_vehicleNetID = _package select 1;
			_vehicleObject = objectFromNetid _vehicleNetID;
			if (isNull _vehicleObject) then
			{
				throw "Vehicle object is null";
			};
			if (!alive _vehicleObject) then
			{
				throw format["Vehicle being added by %1 has been destroyed",name _playerObject];
			};
			if (_vehicleObject getVariable ["ExileLifeOldManVehicle",false]) then
			{
				[_sessionID,"beatup",[0.2]] call ExileServer_system_network_send_to;
				[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Asshole!", "You stupid or something? That's owned by The Old Man! He sends his regards!"]]] call ExileServer_system_network_send_to;
				throw format["%1 : Trying to sell The Old Mans Vehicles is a low dog act!",name _playerObject];
			};
			if (_vehicleObject getVariable ["ExileLifeVGMutex", false]) then
			{
				throw "";
			};
			_vehicleObject allowDamage false;
			_vehicleObject setVariable ["ExileLifeVGMutex", true];
			[_sessionID,_playerObject,_vehicleNetID] call ExileLifeServer_system_virtualGarage_add;
		};
		case "RETRIEVE":
		{
			_vehicleID = parseNumber(_package select 1);
			[_sessionID,_playerObject,_vehicleID] call ExileLifeServer_system_virtualGarage_retrieve;
		};
	};
}
catch
{
	_exception call ExileLifeServer_util_log;
};

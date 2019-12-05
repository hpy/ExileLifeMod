/**
                    * ExileServer_object_container_network_packRequest
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

                    private["_sessionID","_parameters","_object","_pincode","_objectPinCode","_accessDenied","_accessDenialExpiresAt","_numberOfFails"];
_sessionID = _this select 0;
_parameters = _this select 1;
_object = objectFromNetId (_parameters select 0);
_pincode = _parameters select 1;
if (getNumber(configFile >> "CfgVehicles" >> typeOf _object >> "exileIsLockable") isEqualTo 1) then
{
	_objectPinCode = _object getVariable ["ExileAccessCode","000000"];
	_accessDenied = false;
	if (_object getVariable ["ExileAccessDenied", false]) then
	{
		_accessDenialExpiresAt = _object getVariable ["ExileAccessDeniedExpiresAt", 0];
		if (time > _accessDenialExpiresAt) then
		{
			_object setVariable ["ExileAccessDenied", false];
			_object setVariable ["ExileAccessDeniedExpiresAt", 0];
		}
		else
		{
			_accessDenied = true;
		};
	};
	if (_accessDenied) then
	{
		[_sessionID,"toastRequest",["ErrorTitleOnly",["Access denied!"]]] call ExileServer_system_network_send_to;
	}
	else
	{
		if (_objectPinCode isEqualTo _pincode) then
		{
			_object call ExileServer_object_container_packContainer;
			[_sessionID,"toastRequest",["SuccessTitleOnly", ["Container Packed!"]]] call ExileServer_system_network_send_to;
		}
		else
		{
			if (_object call ExileClient_util_world_isInTraderZone) then
			{
				[_sessionID,"toastRequest",["Wrong PIN code!"]] call ExileServer_system_network_send_to;
			}
			else
			{
				_numberOfFails = _object getVariable ["ExileNumberOfFailedLocks", 0];
				_numberOfFails = _numberOfFails + 1;
				_object setVariable ["ExileNumberOfFailedLocks", _numberOfFails];
				switch (_numberOfFails) do
				{
					case 1:
					{
						[_sessionID,"toastRequest",["ErrorTitleOnly",["Wrong PIN code! Two tries remaining."]]] call ExileServer_system_network_send_to;
					};
					case 2:
					{
						[_sessionID,"toastRequest",["ErrorTitleOnly",["Wrong PIN code! One try remaining."]]] call ExileServer_system_network_send_to;
					};
					default
					{
						[_sessionID,"toastRequest",["ErrorTitleOnly",["Wrong PIN code! Access denied for five minutes."]]] call ExileServer_system_network_send_to;
						_object setVariable ["ExileAccessDenied", true];
						_object setVariable ["ExileAccessDeniedExpiresAt", time + (5 * 60)];
					};
				};
			};
		};
	};
}
else
{
	_object call ExileServer_object_container_packContainer;
	[_sessionID,"toastRequest",["SuccessTitleOnly",["Container Packed!"]]] call ExileServer_system_network_send_to;
};
true

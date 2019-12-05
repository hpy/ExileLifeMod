/**
                    * ExileClientOverwrites_system_network_dispatchIncomingMessage
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

                    private["_payload","_messageName","_messageParameters","_config","_allowedParameters","_moduleName","_addonName","_functionName","_functionCode","_message"];
_payload = _this;
try 
{
	if (isNil "_payload") then 
	{
		throw "Message payload is not defined!";
	};
	if (typeName _payload != "ARRAY") then 
	{
		throw "Message payload is not an array!";
	};
	if (count _payload != 2) then 
	{
		throw format ["Wrong envelope field count! Payload: %1", _payload]; 
	};
	_messageName = _payload select 0;
	_messageParameters = _payload select 1;
	if (isClass (missionConfigFile >> "CfgNetworkMessages" >> _messageName)) then 
	{
		_config = missionConfigFile >> "CfgNetworkMessages" >> _messageName;
	}
	else 
	{
		if (isClass (configFile >> "CfgNetworkMessages" >> _messageName)) then 
		{
			_config = configFile >> "CfgNetworkMessages" >> _messageName;
		}
		else 
		{
			throw format ["Forbidden message name! Payload: %1", _payload]; 
		};
	};
	_allowedParameters = getArray (_config >> "parameters");
	if (count _messageParameters != count _allowedParameters) then 
	{
		throw format ["Parameter count mismatch! Payload: %1", _payload]; 
	};
	{
		if (_x != typeName (_messageParameters select _forEachIndex)) then 
		{
			throw format ["Parameter type mismatch! Index %1, Required %2, Found %3, Payload: %4", _forEachIndex, _x, (typeName (_messageParameters select _forEachIndex)), _payload];
		};
	}
	forEach _allowedParameters;
	_moduleName = getText(_config >> "module");
	_addonName = toLower(getText (_config >> "addon"));
	if (_addonName isEqualTo "") then 
	{
		throw format["Missing addon name! Payload: %1", _payload];
	};
	if !(_addonName in ["exilelife", "exile"]) then 
	{
		throw format ["Forbidden addon name! AddonName: %1, Payload: %2", _addonName, _payload];
	};
	switch (_addonName) do 
	{
		case "exile":
		{
			_functionName = format["ExileClient_%1_network_%2", _moduleName, _messageName];
		};
		case "exilelife":
		{
			_functionName = format ["ExileLifeClient_%1_network_%2", _moduleName, _messageName];
		};
	};
	format["MessageName: %1 | MessageParameters: %2  |  AllowedParameters: %3",_messageName,_messageParameters,_allowedParameters] call ExileLifeClient_util_log;
	_functionCode = missionNamespace getVariable [_functionName,""];
	if (_functionCode isEqualTo "") then 
	{
		throw format ["Invalid function call! Called: %1", _functionName];
	};
	_messageParameters call _functionCode;
}
catch
{
	_message = "NetworkManager - " + _exception;
	_message call ExileClient_util_log;
};
PublicMessage = nil;
true
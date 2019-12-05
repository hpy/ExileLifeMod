/**
                    * ExilelifeServer_system_environment_network_interactionSel
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

                    private["_sessionID","_parameters","_interactionname","_zone","_model","_missing","_currentlyrunning","_missingitems","_firstuse","_player","_interactionrequires","_action","_requireditems","_object","_interactionactivated","_interactionerror","_interactiontimer","_interactionthreadID","_objectThreadID","_interactionThreadID","_multiuse","_myFunction","_threadID","_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_interactionname = _parameters select 0;
_zone = _parameters select 1;
_model = _parameters select 2;
_missing = false;
_currentlyrunning = false;
_missingitems = [];
_firstuse = true;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "You dont exist!";
	};
	if !(alive _player) then
	{
		throw "So your dead?";
	};
	_interactionrequires = getArray(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> _model >> "interactionrequires" >> _interactionname);
	if (isNil{_interactionrequires}) then
	{
		throw "There is no action to execute!";
	};
	{
		_action = false;
		if (_x isEqualTo "magazines") then
		{
			_requireditems = getArray(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> _model >> "interactionrequires" >> "magazines");
			_missing = false;
			{
				if !([_player,_x] call ExileLifeServer_util_player_checkItemCarried) then
				{
					_action = false;
					_missing = true;
					_missingitems pushBack _x;
				};
			}forEach _requireditems;
		if !(_missing) then
		{
			_action = true;
		};
		}
		else
		{
			_object = format ["%1_%2",_zone,_x];
			_interactionactivated = missionNamespace getVariable [_object, false];
			if (_interactionactivated) then
			{
				_action = true;
			};
		};
		if !(_action) then
		{
			if (_missing) then
			{
				_interactionerror = format ["You are missing: %1",_missingitems];
			}
			else
			{
				_interactionerror = getText(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> _x >> "interactionerror");
			};
			throw format ["%1",_interactionerror];
		};
	} forEach _interactionrequires;
	_object = format ["%1_%2",_zone,_interactionname];
		_interactiontimer = getNumber(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> _interactionname >> "interactiontimer");
		if (_interactiontimer > 0) then
		{
			_interactionthreadID = missionNamespace getVariable [_object, false];
			_objectThreadID = format ["%1_%2_ThreadID",_zone,_interactionname];
			_interactionThreadID = missionNamespace getVariable [_objectThreadID, 0];
			if !(_interactionThreadID isEqualTo 0) then
			{
				_multiuse = getNumber(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> _interactionname >> "interactionmultiuse");
				if !(_multiuse > 0) then
				{
					_currentlyrunning = true;
					throw "Its already turned on!";
				}
				else
				{
					_firstuse = false;
				};
			};
			if (_firstuse) then
			{
				_myFunction =
				{
					missionNamespace setVariable [_this select 0, false];
					missionNamespace setVariable [_this select 1, 0];
				};
				_threadID = [_interactiontimer, _myFunction, [_object,_objectThreadID], false,"Interaction"] call ExileServer_system_thread_addTask;
				missionNamespace setVariable [_objectThreadID, _threadID];
			};
		};
	missionNamespace setVariable [_object, true];
	[_sessionID, "interactionSelResponse", ["OK",_interactionname,_zone,_currentlyrunning]] call ExileServer_system_network_send_to;
}
catch
{
	_responseCode = _exception;
	[_sessionID, "interactionSelResponse", [_responseCode,"","",false]] call ExileServer_system_network_send_to;
};

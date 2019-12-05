/**
                    * ExilelifeServer_system_environment_network_interactionDisable
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

                    private["_sessionID","_parameters","_interactionname","_zone","_interactiontimer","_objectThreadID","_interactionthreadID","_object"];
_sessionID = _this select 0;
_parameters = _this select 1;
_interactionname = _parameters select 0;
_zone = _parameters select 1;
		_interactiontimer = getNumber(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> _interactionname >> "interactiontimer");
		if (_interactiontimer > 0) then 
		{
			_objectThreadID = format ["%1_%2_ThreadID",_zone,_interactionname];
			_interactionthreadID = missionNamespace getVariable [_objectThreadID, 0];	
			if !(_interactionthreadID isEqualTo 0) then
			{
				[_interactionthreadID] call ExileServer_system_thread_removeTask;
			};
			missionNamespace setVariable [_objectThreadID, 0];	
		};
	_object = format ["%1_%2",_zone,_interactionname];
	missionNamespace setVariable [_object, false];	

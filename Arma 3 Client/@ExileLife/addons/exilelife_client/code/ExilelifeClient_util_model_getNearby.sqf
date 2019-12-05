/**
                    * ExilelifeClient_util_model_getNearby
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

                    private["_object","_distance","_modelNames","_nearestobjects","_foundObject","_nearobject","_objectClassName"];
_object = _this select 0;
_distance = _this select 1;
_modelNames = _this select 2;
_nearestobjects = nearestObjects [_object, [], _distance];
_foundObject = objNull;
{
	_nearobject = _x;
	_objectClassName = str(_nearobject);
	{
		if ((_objectClassName find _x) != -1) exitWith
		{ 
			_foundObject = _nearobject;
		};
	}
	forEach _modelNames;
}
forEach _nearestobjects;
_foundObject

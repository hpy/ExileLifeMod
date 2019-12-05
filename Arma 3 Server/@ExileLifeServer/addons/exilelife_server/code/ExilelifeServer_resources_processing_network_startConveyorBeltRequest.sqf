/**
                    * ExilelifeServer_resources_processing_network_startConveyorBeltRequest
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

                    private["_sessionId","_parameters","_emptycontainernetId","_fillcontainernetId","_emptycontainer","_fillcontainer","_threadID","_threadID2"];
_sessionId = _this select 0;
_parameters = _this select 1;
_emptycontainernetId = _parameters select 0;
_fillcontainernetId = _parameters select 1;
try
{
	_emptycontainer = objectFromNetId _emptycontainernetId;
	if (isNull _emptycontainer) then
	{
		throw "This starting container doesnt exist";
	};
	_fillcontainer = objectFromNetId _fillcontainernetId;
	if (isNull _fillcontainer) then
	{
		throw "The finishing container doesnt exist";
	};
_threadID = [10, {_this call ExileLifeServer_resources_processing_refineore}, [_emptycontainernetId,_fillcontainernetId], true,"Conveyor Check"] call ExileServer_system_thread_addtask;
_threadID2 = [120, {_this call ExileServer_system_thread_removeTask}, [_threadID], false,"Conveyor Check 2"] call ExileServer_system_thread_addtask;
}
catch
{
	_exception call ExileServer_util_log;
};

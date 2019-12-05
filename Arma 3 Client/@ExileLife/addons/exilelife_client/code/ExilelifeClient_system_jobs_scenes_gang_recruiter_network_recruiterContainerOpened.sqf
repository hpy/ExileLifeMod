/**
                    * ExilelifeClient_system_jobs_scenes_gang_recruiter_network_recruiterContainerOpened
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_crateID","_crate","_inventoryEH","_unit"];
_crateID = _this select 0;
_crate = objectFromNetId _crateID;
_inventoryEH = _crate addEventHandler ["ContainerOpened", 
{
	_crate = _this select 0;
	_unit = _this select 1;
	["progressJobRequest",[]] call ExileClient_system_network_send;	
	_inventoryEH = _crate getVariable ["ExileLifeContainerOpenedEH",-1];
	_crate removeEventHandler ["ContainerOpened",_inventoryEH];		
}]; 
_crate setVariable ["ExileLifeContainerOpenedEH",_inventoryEH,true];
/**
                    * ExilelifeServer_system_jobs_scenes_general_gangRecruitment_onProgression_step1
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

                    private["_sessionID","_jobClassname","_nextStep","_gang","_result","_msg","_sideQuest","_type","_playerObject","_playerClass","_i","_position","_crate","_pincode","_weGood","_customGear","_numberofAI","_skill","_behaviour","_waypoints","_distanceToWander","_unit","_killer"];
_sessionID = _this select 0;
_jobClassname = _this select 1;
_nextStep = _this select 2;
_gang = _this select 3;
_result = "";
_msg = "";
_sideQuest = true;
_type = "";
try
{ 
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;	
	_playerClass = _playerObject getVariable ['ExileLifeClientClass', ""];
	if (isNil "_playerClass") then 
	{
		throw "Somehow you got amnesia and are good for nothing but cannon fodder";
	};
	switch (toLower _playerClass) do 
	{ 
		case "thief" : 		
		{ 
			_type = "lockpick";
			_msg = "There's a booby-trapped drug cache nearby... inside the vehicles inventory there's a laptop with a floppy disk. Use them to crack the pincode and bring me the drugs!";
			for "_i" from 0 to 100 do 
			{
				_position = [(position _playerObject), 40, 50, 5, 0 , 1 , 0] call BIS_fnc_findSafePos;
				if !(isOnRoad [_position select 0, _position select 1, 0]) exitWith	{};							
			};								
			_crate = createVehicle ["ExileLife_Stash_Bushes",_position,[], 0, "CAN_COLLIDE"];
			_crate setPosATL [_position select 0,_position select 1,0]; 
			_crate setVectorUp surfaceNormal _position; 
			_crate setVariable ["ExileLifeJobOwner",_sessionID];
			_pincode = floor(random [0000,4999,9999]); 
			_crate setVariable ["ExileAccessCode", str(_pincode)];
			_crate setVariable ["ExileLastLockToggleAt", time];
			_crate setVariable ["ExileAccessDenied", false];
			_crate setVariable ["ExileAccessDeniedExpiresAt", 0];	
			_crate setVariable ["ExileIsLocked",-1,true];
			for "_i" from 1 to 10 do 
			{
				_weGood = [_crate,"ExileLife_Item_Meth_Blue"] call ExileLifeClient_util_containerCargo_addOrDrop;
			};
			[_sessionID,"recruiterContainerOpened",[netID _crate]] call ExileServer_system_network_send_to;
		};
		case "smuggler" : 	
		{ 
			_type = "box";
			_msg = "The car you are in was on its way to an old abandoned weed stash nearby. Collect it and bring it to me!";
			for "_i" from 0 to 100 do 
			{
				_position = [(position _playerObject), 25, 50, 5, 0 , 1 , 0] call BIS_fnc_findSafePos;
				if !(isOnRoad [_position select 0, _position select 1, 0]) exitWith	{};							
			};								
			_crate = createVehicle ["ExileLife_Stash_Bushes",_position,[], 0, "CAN_COLLIDE"];
			_crate setPosATL [_position select 0,_position select 1,0]; 
			_crate setVectorUp surfaceNormal _position; 
			_crate setVariable ["ExileLifeJobOwner",_sessionID];
			for "_i" from 1 to 10 do 
			{
				_weGood = [_crate,"ExileLife_Item_Cannabis_Packet"] call ExileLifeClient_util_containerCargo_addOrDrop;
			};
			[_sessionID,"recruiterContainerOpened",[netID _crate]] call ExileServer_system_network_send_to;
		};
		case "murderer" : 	
		{ 
			_msg = "There's a snitch running around Athira. The boss wants him dead. See that its done!";
			_type = "kill";
			_customGear = 
			[
				[
					"H_Booniehat_dirty",
					"H_Booniehat_dgtl",
					"H_Cap_red",
					"H_Cap_blu",
					"H_Bandanna_khk",
					"H_Bandanna_sgg",
					"H_Hat_grey"
				],
				[
					"U_C_Poloshirt_blue",
					"U_C_Poloshirt_burgundy",
					"U_C_Poloshirt_stripped",
					"U_C_Poloshirt_tricolour",
					"U_C_Poloshirt_salmon",
					"U_C_Poloshirt_redwhite",
					"U_C_Commoner1_1",
					"U_C_Commoner1_2",
					"U_C_Commoner1_3",
					"U_NikosBody",
					"U_OrestesBody",
					"U_B_CombatUniform_mcam_worn",
					"U_B_SpecopsUniform_sgg",
					"U_I_CombatUniform_tshirt",
					"U_MillerBody",
					"U_KerryBody",
					"U_C_HunterBody_grn",
					"U_C_WorkerCoveralls",
					"U_C_Poor_shorts_1",
					"U_C_Poor_2",
					"U_C_Poor_1",
					"U_C_ShirtSurfer_shorts"
				],
				[],
				[],
				[],
				[]
			];
			_position = [14074.4,18733.4,0.00141335];
			_numberofAI = 1;
			_skill = "easy";
			_behaviour = "CARELESS"; 
			_waypoints = true;
			_distanceToWander = 30; 
			_group = [_position,_numberofAI,_skill,_customGear,_behaviour,_waypoints,_distanceToWander] call ExileLifeServer_util_ai_spawnGroup;
			_unit = (units _group) select 0;
			_unit setVariable ["ExileLifeJobOwner",_sessionID];
			_unit addEventHandler ["killed", 
			{
				_unit = _this select 0;
				_killer = _this select 1;
				[(_unit getVariable ["ExileLifeJobOwner",""])] call ExilelifeServer_system_jobs_process_network_progressJobRequest;
			}]; 
		};
		case "thug" :		
		{ 
			_type = "destroy";
			_msg = "There's a booby-trapped weapon cache nearby... destroy it with the explosives in the car!";
			for "_i" from 0 to 100 do 
			{
				_position = [(position _playerObject), 25, 50, 5, 0 , 1 , 0] call BIS_fnc_findSafePos;
				if !(isOnRoad [_position select 0, _position select 1, 0]) exitWith	{};							
			};								
			_crate = createVehicle ["ExileLife_Stash_Bushes",_position,[], 0, "CAN_COLLIDE"];
			_crate setPosATL [_position select 0,_position select 1,0]; 
			_crate setVectorUp surfaceNormal _position; 
			_crate setVariable ["ExileLifeJobOwner",_sessionID];
			_crate setVariable ["ExileIsLocked",-1,true];
			_crate addEventHandler ["killed", 
			{
				_crate = _this select 0;
				_killer = _this select 1;
				[(_crate getVariable ["ExileLifeJobOwner",""])] call ExilelifeServer_system_jobs_process_network_progressJobRequest;
			}]; 
		};
		default {  throw "You somehow got amnesia and forgot everything about anything"; }; 
	};
	if (_sideQuest) then 
	{
		[_sessionID,"addSideQuest",[_jobClassname,_nextStep,_position,_msg,1,_type]] call ExileServer_system_network_send_to;
	};
}
catch
{
	_result = _exception;
};
_result
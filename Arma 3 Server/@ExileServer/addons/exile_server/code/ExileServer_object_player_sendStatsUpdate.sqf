/**
                    * ExileServer_object_player_sendStatsUpdate
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

                    [
	_this, 
	"updateStatsRequest", 
	[
		str (_this getVariable ["ExileScore", 0]),            
		_this getVariable ["ExileKills", 0],                  
		_this getVariable ["ExileDeaths", 0],                 
  	_this getVariable ['ExileLifeClientClass', ""],       
  	_this getVariable ["ExileLifeClientRank", 0],         
  	_this getVariable ['ExileLifeClientGang', ""],        
  	_this getVariable ["ExileLifeSkill:Lockpick", 0],     
  	_this getVariable ["ExileLifeSkill:Strength", 0],     
  	_this getVariable ["ExileLifeSkill:Speed", 0],        
    _this getVariable ["ExileLifeSkill:Heal", 0],         
    _this getVariable ["ExileLifeSkill:Repair", 0],       
    _this getVariable ["ExileLifeGangTax", 0],            
    _this getVariable ["ExileLifeGangWage", 0]           
	]
] 
call ExileServer_system_network_send_to;

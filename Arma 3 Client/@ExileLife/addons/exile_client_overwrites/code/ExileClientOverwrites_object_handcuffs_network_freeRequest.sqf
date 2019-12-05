/**
                    * ExileClientOverwrites_object_handcuffs_network_freeRequest
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

                    ExileClientIsHandcuffed = false;
ExileClientHostageTaker = objNull;
if !(player getVariable ['ExileLifeClientIncapacitated', false]) then
{
    if (player getVariable ["ExileLifeisEscorted", false]) then
    {
    	player playMove "Acts_AidlPsitMstpSsurWnonDnon_out";
    };
    if (player getVariable ["ExileLifeIsForcedDown", false]) then
    {
    	player playMove "Acts_AidlPsitMstpSsurWnonDnon_out";
    };
    if (player getVariable ["ExileLifeisEscortingChk", false]) then
    {
    	player action ["getOut", vehicle player];
    };
};
if !(ExileClientBreakFreeActionHandle isEqualTo -1) then
{
	player removeAction ExileClientBreakFreeActionHandle;
	ExileClientBreakFreeActionHandle = -1;
};

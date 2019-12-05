/**
                    * ExilelifeClient_object_handcuffs_network_forceUpResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_standinghandcuffs"];
[] spawn 
{  
	_standinghandcuffs = true;
	while {_standinghandcuffs} do 
	{
		player playmove "AMOVPERCMSTPSNONWNONDNON_EASE";
		if !(player getvariable "ExileLifeIsForcedUp") then 
		{
			_standinghandcuffs = false;
		};
			uisleep 0.001;
	};
	player switchmove "AMOVPERCMSTPSNONWNONDNON_EASEOUT";
};
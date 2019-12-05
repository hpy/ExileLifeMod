/**
                    * ExileClientOverwrites_gui_hud_thread_update
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

                    call ExileClient_gui_interactionMenu_update;
if( ExileClientPlayerAttributes select 0 != ExileClientPlayerAttributesASecondAgo select 0) then
{
	if (alive player) then
	{
		if !(ExileClientPlayerIsInSecurityCamera) then 
		{
			ExileClientPostProcessingColorCorrections ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0.39, 0.32, 0.25, 1 - ExileLifeClientPlayerDamage], [0.5,0.5,0.5,0], [0,0,0,0,0,0,4]]; 
			ExileClientPostProcessingColorCorrections ppEffectCommit 1;
			if (ExileClientPlayerIsBleeding) then
			{
				[ (100 - (ExileClientPlayerAttributes select 0)) * 10 ] call BIS_fnc_bloodEffect;
			};
		};
	};
	ExileClientPlayerAttributesASecondAgo = 
	[
		ExileClientPlayerAttributes select 0,
		ExileClientPlayerAttributes select 1,
		ExileClientPlayerAttributes select 2,
		ExileClientPlayerAttributes select 3,
		ExileClientPlayerAttributes select 4,
		ExileClientPlayerAttributes select 5,
		ExileClientPlayerAttributes select 6
	];
};
true
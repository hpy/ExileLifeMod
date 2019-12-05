/**
                    * ExilelifeClient_object_chemlab_use_ingredient
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_mixtureState","_Tempstring"];
ExileLifeChemLabPosition = "ingredient";
	ExileLifeClientSelectedBeaker = ExileClientInteractionObject getVariable ['item_beaker_mixing',[]];
	ExileLifeClientSelectedBeakerState = ExileLifeClientSelectedBeaker select 3;
	_mixtureState = ExileLifeClientSelectedBeaker select 2;
	if (_mixtureState > 1) then 
	{
		_Tempstring = "mixing";
	}
	else
	{
		_Tempstring = (ExileLifeClientSelectedBeakerState splitString "_") select 3;
	};
	ExileLifeClientSelectedTempBeaker = format ["item_beaker_ingredient_%1",_Tempstring];
	ExileClientInteractionObject animate [ExileLifeClientSelectedTempBeaker, 0]; 
	ExileClientInteractionObject animate [ExileLifeClientSelectedBeakerState, 1]; 
[] spawn ExileLifeClient_gui_chemlab_ingredient_cam_create;
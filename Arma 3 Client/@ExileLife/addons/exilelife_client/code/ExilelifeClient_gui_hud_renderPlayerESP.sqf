/**
                    * ExilelifeClient_gui_hud_renderPlayerESP
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_espRenderRange","_distance","_alpha","_clr","_crew","_pos"];
_espRenderRange = _this;
if (!isNull cameraOn) then
{
	{
		if (!isNull _x) then
		{
			if (isPlayer _x) then
			{
				if !(isObjectHidden _x) then
				{
						_distance = cameraOn distance _x;
						_alpha = (1-(_distance/_espRenderRange));
						_clr = [1,1,1,_alpha];
						_crew = crew (vehicle _x);
						_name = '';
						{
							if(_forEachIndex == 0) then
							{
								_name = _name + (_x getVariable ["ExileLifePrisonerID",""]);
							}
							else
							{
								if(alive _x) then
								{
									_name = _name + (_x getVariable ["ExileLifePrisonerID",""]);
								};
							};
						}
						forEach _crew;
						_pos = _x modelToWorldVisual (_x selectionPosition "head");
						_pos set[2, (_pos select 2) + 1];
						drawIcon3D['',_clr,_pos,0,0,0,_name,1,0.04];
				};
			};
		};
	}
	forEach ((cameraOn nearEntities[['Exile_Unit_Player', 'ExileLife_Unit_Guard', 'LandVehicle', 'Ship', 'Air'], _espRenderRange]) - [cameraOn, vehicle cameraOn]);
};
true

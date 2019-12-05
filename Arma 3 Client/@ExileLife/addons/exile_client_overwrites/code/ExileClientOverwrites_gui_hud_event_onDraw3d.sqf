/**
                    * ExileClientOverwrites_gui_hud_event_onDraw3d
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

                    private["_icon"];
if (ExileHudIsVisible) then
{
	call ExileClient_gui_hud_renderPartyESP;
	call ExileClient_gui_hud_renderStatsPanel;
	call ExileClient_gui_hud_renderWeaponPanel;
	call ExileClient_gui_hud_renderGroupPanel;
	call ExileClient_gui_hud_renderVehiclePanel;
	call ExileClient_gui_hud_renderGrenadePanel;
	call ExileClient_gui_hud_renderBulletCam;
	call ExileClient_gui_toaster_thread;
	call ExileClient_gui_hud_renderWaypoints;
	5 call ExileLifeClient_gui_hud_renderPlayerESP;
	if (ExileClientIsInConstructionMode) then
	{
		if (ExileClientConstructionMode == 3) then
		{
			_icon = if (ExileClientConstructionIsInSelectSnapObjectMode) then { "\exile_assets\texture\ui\snap_blue_ca.paa" } else { "\exile_assets\texture\ui\snap_yellow_ca.paa" };
			{
				drawIcon3D [_icon, [1, 1, 1, 1], ASLtoAGL ((ATLToASL _x)), 1, 1, 0];
			}
			forEach ExileClientConstructionPossibleSnapPositions;
		};
	};
	if (ExileLifeActionMenu) then
	{
		if !(ExileClientIsHandcuffed) then
		{
			if !(ExileClientInteractionObject isKindOf "AllVehicles") then
			{
			}
			else
			{
				if !(((locked ExileClientInteractionObject) isEqualTo 2)) then
				{
					call ExileLifeClient_gui_hud_VehicleActionMenu;
				};
			};
		};
	};
	if (ExileLifeCannotBuild) then
	{
		ExileClientConstructionObject call ExileLifeClient_gui_hud_drawConstructionBox;
	};
};
true

/**
                    * ExileServer_system_escape_shrinkFinalArea
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

                    private["_position","_playAreaRadius","_endingAreaRadius","_roundLength","_shrinkTimes","_distanceToShrink","_i"];
"Shrinking final area..." call ExileServer_util_log;
_position = getMarkerPos "ExilePlayArea";
_playAreaRadius = (getMarkerSize "ExilePlayArea") select 0;
_endingAreaRadius = 50;
_roundLength = getNumber (configFile >> "CfgSettings" >> "Escape" >> "minutesPerRound");
_shrinkTimes = (_roundLength / 2);
_distanceToShrink = (_playAreaRadius - _endingAreaRadius) / _shrinkTimes;
["baguetteRequest", ["The area will continue to shrink!"]] call ExileServer_system_network_send_broadcast;
for "_i" from 0 to (_shrinkTimes - 1) do
{
	_playAreaRadius = _playAreaRadius - _distanceToShrink;
	[_position, _playAreaRadius, "green"] call ExileServer_system_escape_3dzone_create;
	uiSleep 60;
	"green" call ExileServer_system_escape_3dzone_destroy;
	"red" call ExileServer_system_escape_3dzone_destroy;
	[_position, _playAreaRadius, "red"] call ExileServer_system_escape_3dzone_create;
	"ExileFuturePlayArea" setMarkerAlpha 0;
	"ExilePlayArea" setMarkerSize [_playAreaRadius, _playAreaRadius];
	{
		if (((getMarkerPos _x) distance2D _position) > _playAreaRadius) then 
		{
			deleteMarker _x;
		};
	}
	forEach allMapMarkers;
};
true
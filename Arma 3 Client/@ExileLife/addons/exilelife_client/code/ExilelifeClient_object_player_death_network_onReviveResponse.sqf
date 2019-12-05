/**
                    * ExilelifeClient_object_player_death_network_onReviveResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_targetNetID","_victim","_tempObject","_oldPlayerObject","_layer"];
_targetNetID = _this select 0;
try
{
    _victim = objectFromNetId _targetNetID;
    if (isNull _victim) then
    {
        throw "victim doesnt exist!";
    };
    if !(alive _victim) then
    {
        throw "victim is already dead!";
    };
    if !(_victim getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw "victim is not incapacitated!";
    };
    if (local _victim) then
    {
        player setUnconscious false;
        player playMoveNow "unconsciousoutprone";
        {inGameUISetEventHandler [_x, ""]} forEach ["PrevAction", "NextAction"];
        player setCaptive false;
        {
            player enableCollisionWith _x;
        } forEach allPlayers;
        player allowDamage true;
        [] call bis_fnc_reviveDamageReset;
        [] spawn
        {
            cutText ["", "BLACK OUT", 4];
            _tempObject = "Logic" createVehiclelocal [0,0,0];
            hideObject _tempObject;
            player reveal [_tempObject, 4];
            _oldPlayerObject = player;
            selectPlayer _tempObject;
            _oldPlayerObject call ExileClient_object_player_initialize;
            uisleep 1;
            _layer = "BIS_fnc_respawnCounter" call bis_fnc_rscLayer;
            _layer cutText ["", "plain"];
            if !(ExileClientBleedOutThread isEqualTo -1) then
            {
                [ExileClientBleedOutThread] call ExileClient_system_thread_removeTask;
                ExileClientBleedOutThread = -1;
            };
            cutText ["", "BLACK IN", 2];
            deleteVehicle _tempObject;
            player playActionNow "PlayerProne";
        };
        ExileLifeReviveScreenIsVisible = false;
        closeDialog 1;
        ExileClientLastDiedPlayerObject = objNull;
        setGroupIconsVisible [true, true];
        true call ExileClient_gui_hud_toggle;
        if !(ExileClientLastDeathMarker isEqualTo "") then
        {
        	deleteMarkerLocal ExileClientLastDeathMarker;
        };
        if ((getPosATL (vehicle player)) call ExileClient_util_world_isInTraderZone) then
    	{
    		[] call ExileClient_object_player_event_onEnterSafezone;
    	};
    }
    else 
    {
        player enableCollisionWith _victim;
    };
    _victim setVariable ['ExileLifeClientIncapacitated', false];
    _victim setVariable ['ExileLifeClientReviveState', 0];
    _victim setVariable ['ExileLifeClientReviveMedic', objNull];
}
catch
{
    _exception call ExileLifeClient_util_log;
};
true;

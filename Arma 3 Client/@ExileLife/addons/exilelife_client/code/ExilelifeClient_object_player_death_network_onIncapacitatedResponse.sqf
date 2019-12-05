/**
                    * ExilelifeClient_object_player_death_network_onIncapacitatedResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_targetNetID","_victim","_respawnDelay"];
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
    if (_victim getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw "victim is already incapacitated!";
    };
    if (local _victim) then
    {
        if(lifestate player == "INCAPACITATED")exitWith{};
        player allowDamage false;
        player setDamage 0.95;
        player setCaptive true;
        if !((vehicle player) isEqualTo player) then
        {
            unassignVehicle player;
            player action ["GetOut", vehicle player];
            player action ["Eject", vehicle player];
        };
        player setUnconscious true;
        {
            inGameUISetEventHandler [_x, "true"];
        } forEach ["PrevAction", "NextAction"];
        [objNull,objNull] call ExileClient_object_player_event_onKilled;
        _respawnDelay = getNumber(configFile >> "CfgRespawnTemplates" >> "ExileLife" >> "reviveRespawnDelay");
        if(_respawnDelay<1)then{
            _respawnDelay = 1200; 
        };
        [player,player,objNull,_respawnDelay] call ExileClient_object_player_event_onPlayerKilled;
        player setVariable ['ExileLifeClientIncapacitated',true];
        [] spawn{
            cutText ["", "BLACK OUT", 2];
            uisleep 3;
            player setunconscious false;
            player playActionNow "Die";
            player setunconscious true;
            cutText ["", "BLACK IN", 4];
            uisleep 3;
            call ExileLifeClient_gui_revive_show;
            {
                player disableCollisionWith _x;
            } forEach allPlayers;
        };
    }
    else 
    {
        player disableCollisionWith _victim;
    };
    _victim setVariable ['ExileLifeClientIncapacitated', true];
    _victim setVariable ['ExileLifeClientReviveState', 1];
    _victim setVariable ['ExileLifeClientReviveMedic', objNull];
}
catch
{
    _exception call ExileLifeClient_util_log;
};
true

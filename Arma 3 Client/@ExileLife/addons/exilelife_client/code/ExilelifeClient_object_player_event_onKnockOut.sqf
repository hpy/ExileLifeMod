/**
                    * ExilelifeClient_object_player_event_onKnockOut
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_knockOutTimer"];
_knockOutTimer = _this select 0;
try
{
    if (isNull player) then
    {
        throw false;
    };
    if !(alive player) then
    {
        throw false;
    };
    if (player getVariable ['ExileLifeClientUnconscious',false]) then
    {
        if ((floor random 10) < 3) then
        {
            player setDamage 1;
            throw false;
        };
    };
    throw true;
}
catch
{
    if (_exception) then
    {
        ExileLifeClientUnconsciousCountDownEnd = time + _knockOutTimer;
        if !(ExileLifeClientPlayerIsUnconscious) then
        {
            ExileLifeClientPlayerIsUnconscious = true;
            player setVariable ['ExileLifeClientUnconscious',true,true];
            [] spawn {
                player setunconscious true;
                uisleep 3;
                player setunconscious false;
                ["switchMoveRequest", [netId player, "Acts_Unconscious_loop"]] call ExileClient_system_network_send;
                uisleep 2;
                player setunconscious true;
            };
        };
    };
};

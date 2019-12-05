/**
                    * ExilelifeServer_system_prison_prisonerRejoin
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

                    private["_sessionID","_player","_currentJobArray","_storedParams","_prisonerNeedsToMine","_prisonerHasMined","_mineAmountRequired","_timeLeft","_timeToComplete","_msg","_prisonerID","_prisoner"];
_sessionID = _this select 0;
_player = _this select 1;
try
{ 
    if (isNull _player) then
    {
        throw "Prisoner Rejoined: Invalid player.";
    };
    _player setVariable ["ExileLifePrisoner",true,true];
    _currentJobArray = _player getVariable ["ExileLifeJobs:Current",[]];
    _storedParams =  _currentJobArray select 4;
    _prisonerNeedsToMine = _storedParams select 1;
    _prisonerHasMined = _storedParams select 2;
    _mineAmountRequired = _prisonerNeedsToMine - _prisonerHasMined;
    _player setVariable ["ExileLifePrisonerMineAmount",[_prisonerNeedsToMine,_prisonerHasMined]];
    _timeLeft = _currentJobArray select 2;
    _timeToComplete = _player getVariable ["ExileLifeJobTime",[0,0]];
    _msg = format ["You have been sentenced to the labour camp for %1hrs, %2min! If you mine %3 Ore, you will be released early!",_timeToComplete select 1,_timeToComplete select 2,_mineAmountRequired];
    [_sessionID, "baguetteRequest", [["Labour Camp",_msg]]] call ExileServer_system_network_send_to;
    _prisonerID = _prisoner getVariable ["ExileLifePrisonerID",""];
    ExileLifePrisonArray pushBackUnique _prisonerID;
}
catch
{
   _exception call ExileLifeServer_util_debugLog;
};

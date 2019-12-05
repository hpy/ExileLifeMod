/**
                    * ExilelifeClient_action_smother_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_victim","_result","_medic"];
_victim = _this;
_result = "";
try
{
	if (isNull player) then
	{
		throw "You dont exist?";
	};
	if !(alive player) then
	{
		throw "You are dead!";
	};
	if !(player getVariable ['ExileLifeClientUberMedic',false]) then
	{
		throw "You are not a medic!";
	};
	if (isNull _victim) then
	{
		throw "Where is the victim?";
	};
    if !(alive _victim) then
	{
		throw "The victim is dead already!";
	};
	if ((_victim distance player) > 5) then
	{
		throw "You are too far from the victim!";
	};
    if (!(_victim getVariable ['ExileLifeClientIncapacitated', false])) then
    {
            throw "The victim is not in a revive state?";
    };
	_medic = _victim getVariable ['ExileLifeClientReviveMedic', objNull];
	if !(isNull _medic)then{
		if(_medic != player)then{
			throw "Trying to smother someone twice are we?";
		};
	}else{
		if (_victim getVariable ['ExileLifeClientReviveState', 0] != 1) then
		{
				throw "The victim is currently being revived by someone else!";
		};
	};
	_victim setVariable ['ExileLifeClientReviveMedic',player,true];
	_victim setVariable ['ExileLifeClientReviveState', 4,true];
}
catch
{
	_result = _exception;
};
_result

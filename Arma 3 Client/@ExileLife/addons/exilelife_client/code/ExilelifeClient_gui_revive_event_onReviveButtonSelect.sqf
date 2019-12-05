/**
                    * ExilelifeClient_gui_revive_event_onReviveButtonSelect
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_reviveType","_result","_display","_secondsRemaining"];
_reviveType = _this;
_result = true;
try
{
    if !(ExileLifeReviveScreenIsVisible)then{
        throw false;
    };
    if(isNull player)then{
        throw false;
    };
    if !(alive player)then{
        throw false;
    };
    if !(player getVariable ['ExileLifeClientIncapacitated',false])then{
        throw false;
    };
    if (ExileClientIsWaitingForServerTradeResponse) then
	{
		throw false;
	};
    ExileClientIsWaitingForServerTradeResponse = true;
    _display = uiNameSpace getVariable ["RscExileLifeRevive", displayNull];
    (_display displayCtrl 1600) ctrlEnable false;
    (_display displayCtrl 1600) ctrlShow false;
    (_display displayCtrl 1700) ctrlEnable false;
    (_display displayCtrl 1700) ctrlShow false;
    if(ExileClientBleedOutCountDownEnd > 10)then{
        _secondsRemaining = ExileClientBleedOutCountDownEnd - time;
        ["reviveJobOffer",[_reviveType,_secondsRemaining]] call ExileClient_system_network_send;
    };
}
catch
{
    _result = _exception;
};
ExileClientIsWaitingForServerTradeResponse = false;
_result

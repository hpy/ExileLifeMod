/**
                    * ExileClientOverwrites_system_trading_network_wasteDumpResponse
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

                    private["_responseCode","_revenue","_newPlayerRespectString","_newPlayerRespect","_respect"];
_responseCode = _this select 0;
_revenue = _this select 1;
_newPlayerRespectString = _this select 2;
ExileClientIsWaitingForServerTradeResponse = false;
if (_responseCode isEqualTo 0) then
{
	_newPlayerRespect = parseNumber _newPlayerRespectString;
	_respect = _newPlayerRespect - ExileClientPlayerScore;
	ExileClientPlayerScore = _newPlayerRespect;
	if (_respect isEqualTo 0) then
	{
		["SuccessTitleAndText", ["Dumped all the things!", format ["+%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/><br/>+%2 respect", _revenue, _respect]]] call ExileClient_gui_toaster_addTemplateToast;
	}
	else 
	{
		["SuccessTitleAndText", ["Dumped all the things!", format ["+%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/><br/>+%2 respect", _revenue, _respect]]] call ExileClient_gui_toaster_addTemplateToast;
	};
}
else 
{
	systemChat format["Failed to throw things away: %1", _responseCode];
};
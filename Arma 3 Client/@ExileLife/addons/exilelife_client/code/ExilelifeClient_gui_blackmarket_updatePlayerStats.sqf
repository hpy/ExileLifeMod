/**
                    * ExilelifeClient_gui_blackmarket_updatePlayerStats
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_playerStats","_playerMoney"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeBlackMarket",displayNull];
_playerStats = _display displayCtrl 18107;
_playerMoney = player getVariable ["ExileMoney",0];
_playerStats ctrlSetStructuredText (parseText format["<t size='1' font='puristaMedium' align='right'>%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>", _playerMoney]);
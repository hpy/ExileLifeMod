/**
                    * ExilelifeClient_gui_xm8_button_killDeathRatio_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_appTile"];
_appTile = _this;
if(isNull _appTile)exitWith{};
_appTile ctrlSetTooltip format ["%1 Kills / %2 Deaths", ExileClientPlayerKills, ExileClientPlayerDeaths];
_appTile ctrlSetText (format ["%1/%2", ExileClientPlayerKills, ExileClientPlayerDeaths]);

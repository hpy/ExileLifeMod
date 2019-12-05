/**
                    * ExilelifeClient_gui_itemDetails_event_onGunRepairDoubleClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_listBoxControl","_listBoxControlIndex","_repairStrArray"];
disableSerialization;
_listBoxControl = _this select 0;
_listBoxControlIndex = _this select 1;
_repairStrArray = parseSimpleArray(_listBoxControl lbData _listBoxControlIndex);
_repairStrArray call ExileLifeClient_gui_repair_show;
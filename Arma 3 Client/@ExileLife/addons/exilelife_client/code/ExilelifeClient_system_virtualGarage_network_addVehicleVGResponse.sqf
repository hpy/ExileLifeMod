/**
                    * ExilelifeClient_system_virtualGarage_network_addVehicleVGResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_confirmationCode"];
_confirmationCode = _this select 0;
ExileLifeVirtualGarage = _this select 1;
["SuccessTitleAndText", ["Vehicle Stored!",format["Your confirmation code is %1",_confirmationCode]]] call ExileClient_gui_toaster_addTemplateToast;
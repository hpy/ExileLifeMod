/**
                    * ExilelifeClient_gui_gang_recruiter_event_onCallGangButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_gang","_membershipCost","_gangMinRespectLevel"];
_gang = _this;
closeDialog 0;
_membershipCost = missionNamespace getVariable [(format ["ExileLifeGangMembershipCost:%1",_gang]),0];
_gangMinRespectLevel = missionNamespace getVariable [format["ExileLifeGangRespect:%1",_gang],1];
[format["%1 Membership",_gang],format["%1 Poptabs | %2 Respect",_membershipCost,_gangMinRespectLevel]] spawn ExileLifeClient_gui_baguette_show;

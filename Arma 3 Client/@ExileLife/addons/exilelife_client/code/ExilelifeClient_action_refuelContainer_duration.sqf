/**
                    * ExilelifeClient_action_refuelContainer_duration
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_tempItem","_containerClassname","_duration"];
_tempItem = _this select 0;
_containerClassname = _this select 1;
_duration = 99999999; 
switch (_containerClassname) do 
{ 
	case 'Exile_Item_FuelCanisterEmpty' : {  _duration = 10; }; 
	case 'Exile_Item_FuelBarrelEmpty' : {  _duration = 20; }; 
	default { }; 
};
_duration
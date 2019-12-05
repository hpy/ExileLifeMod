/**
                    * ExilelifeClient_gui_xm8_slideFunctions
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_toSlideName","_display","_toSlideOpenFunction","_fromSlideCloseFunction"];
_toSlideName = _this;
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_toSlideOpenFunction = missionNamespace getVariable [format ["ExileLifeClient_gui_xm8_slide_%1_onOpen", _toSlideName], ""];
if !(_toSlideOpenFunction isEqualTo "") then
{
    call _toSlideOpenFunction;
}
else
{
    _toSlideOpenFunction = missionNamespace getVariable [format ["ExileClient_gui_xm8_slide_%1_onOpen", _toSlideName], ""];
    if !(_toSlideOpenFunction isEqualTo "") then
    {
        call _toSlideOpenFunction;
    };
};
_fromSlideCloseFunction = missionNamespace getVariable [format ["ExileLifeClient_gui_xm8_slide_%1_onClose", ExileClientXM8CurrentSlide], ""];
if !(_fromSlideCloseFunction isEqualTo "") then
{
    call _fromSlideCloseFunction;
}
else
{
    _fromSlideCloseFunction = missionNamespace getVariable [format ["ExileClient_gui_xm8_slide_%1_onClose", ExileClientXM8CurrentSlide], ""];
    if !(_fromSlideCloseFunction isEqualTo "") then
    {
        call _fromSlideCloseFunction;
    };
};
true

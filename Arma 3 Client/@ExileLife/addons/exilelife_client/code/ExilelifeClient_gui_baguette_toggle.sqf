/**
                    * ExilelifeClient_gui_baguette_toggle
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_show"];
_show = _this;
if (_show) then
{
	if !(ExileClientBaguetteAreaVisible) then
	{
		ExileClientBaguetteAreaVisible = true;
	};
}
else
{
	if (ExileClientBaguetteAreaVisible) then
	{
		ExileClientBaguetteAreaVisible = false;
	};
};

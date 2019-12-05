/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryUpdate_event_setCrimeStats
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_btnPressID","_listbox","_text"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_btnPressID = _this;
ExileLifeSelectedItem = nil;
{
    (_display displayCtrl _x) ctrlShow false;
}
forEach [5317,
    5318,
    5319,
    5333,
    5316,
    5321,
    5320,
    5322,
    5326,
    5325,
    5323,
    5324
];
_listbox = _display displayCtrl 4166;
_listbox ctrlSetText "";
_text = "";
switch (_btnPressID) do {
    case (5329): {
        {
            (_display displayCtrl _x) ctrlShow true;
        }
        forEach [5322,
        5326,
        5325,
        5323,
        5324
        ];
    };
    case (5314): {
        {
            (_display displayCtrl _x) ctrlShow true;
        }
        forEach [5317,
        5318,
        5319,
        5333,
        5316,
        5321,
        5320
        ];
    };
    case (5331): {
    };
    default {};
};

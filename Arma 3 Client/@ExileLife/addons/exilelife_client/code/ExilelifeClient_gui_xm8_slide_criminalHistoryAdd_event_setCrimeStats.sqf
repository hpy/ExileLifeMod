/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryAdd_event_setCrimeStats
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
forEach [5220,
    5221,
    5222,
    5223,
    5224,
    5226,
    5225,
    5227,
    5228,
    5229,
    5230,
    5231
];
_listbox = _display displayCtrl 4166;
_listbox ctrlSetText "";
_text = "";
switch (_btnPressID) do {
    case (5212): {
        {
            (_display displayCtrl _x) ctrlShow true;
        }
        forEach [5227,
        5228,
        5229,
        5230,
        5231
        ];
    };
    case (5213): {
        {
            (_display displayCtrl _x) ctrlShow true;
        }
        forEach [5220,
        5221,
        5222,
        5223,
        5224,
        5226,
        5225
        ];
    };
    case (5214): {
    };
    default {};
};

/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistory_onOpen
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_prisonerID","_prisonerName","_pid"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
{
    (_display displayCtrl _x) ctrlEnable true;
    (_display displayCtrl _x) ctrlShow true;
}
forEach [4151,
4177,
4152,
4178,
4153,
4179,
4170
];
{
    (_display displayCtrl _x) ctrlsetText "";
    (_display displayCtrl _x) ctrlEnable true;
    (_display displayCtrl _x) ctrlShow true;
}forEach [4157,
4156,
4170,
4159,
4166,
4182,
4180,
4164,
4165];
{
    (_display displayCtrl _x) ctrlShow false;
}forEach [4160,
5220,
5221,
5222,
5223,
5224,
5225,
5226,
4161,
4162,
4163,
4168,
4167,
4169,
4181,
4180,
4182,
4166];
{
    (_display displayCtrl _x) ctrlShow false;
    (_display displayCtrl _x) ctrlSetTextColor [0.82, 0.82, 0.82, 0.6];
}forEach [4154,
4155,
4171,
4172,
4174,
4175,
4176];
{
    (_display displayCtrl _x) ctrlShow false;
    (_display displayCtrl _x) ctrlEnable false;
}forEach [4183,
4184,
4185];
_prisonerID = _display displayCtrl 4152;
_prisonerName = _display displayCtrl 4153;
if (ctrlText _prisonerID isEqualTo "")then{
    _prisonerID ctrlSetText "EX";
};
if(isNil "ExileLifeCriminalRecord")then{
    ExileLifeCriminalRecord = [];
};
if(isNil "ExileLifeCriminalRecordID")then{
    ExileLifeCriminalRecordID = [];
};
if(isNil "ExileLifeCriminalRecordsList")then{
    ExileLifeCriminalRecordsList = [];
};
if !(ExileLifeCriminalRecordID isEqualTo [])then{
    _prisonerID ctrlSetText (ExileLifeCriminalRecordID select 0);
    _prisonerName ctrlSetText (ExileLifeCriminalRecordID select 1);
    (ExileLifeCriminalRecordID select 0) call ExileLifeClient_system_PrisonRecords_getPrisonerRecords;
    ExileLifeCriminalRecordID = [_pid,_name];
}else{
    if(isPlayer ExileClientInteractionObject)then{
        if(ExileClientInteractionObject getVariable ['ExileLifeClientGang',"Guard"] != "Guard")then{
            _pid = ExileClientInteractionObject getVariable ["ExileLifePrisonerID",""];
            _name =  [ExileClientInteractionObject,"FIRST"] call ExileLifeClient_util_player_name;
            if !(_pid isEqualTo "")then{
                _prisonerID ctrlSetText _pid;
                _prisonerName ctrlSetText _name;
            };
        };
    }else{
        if (!(isNil 'ExileLifeCriminalRecordsAdd') && ExileLifeCriminalRecordsAdd)then{
            call ExileLifeClient_gui_xm8_slide_criminalHistory_event_onUpdate;
        };
    };
};
true

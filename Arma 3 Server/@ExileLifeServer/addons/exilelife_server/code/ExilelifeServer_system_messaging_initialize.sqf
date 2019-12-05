/**
                    * ExilelifeServer_system_messaging_initialize
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_messageThreads"];
_messageThreads = "getMessages" call ExileServer_system_database_query_selectFull;
if !(_messageThreads isEqualTo []) then
{
	{
		missionNameSpace setVariable
		[
			format["ExileLifeMessage:%1",(_x select 0)],
			[
				count(_x select 3),
				(_x select 4),
				(_x select 1),
				(_x select 2),
				(_x select 3)
			]
		];
	}
	forEach _messageThreads;
};

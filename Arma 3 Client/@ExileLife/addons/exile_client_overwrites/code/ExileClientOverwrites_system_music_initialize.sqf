/**
                    * ExileClientOverwrites_system_music_initialize
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

                    ExileClientCurrentMusic = "";
ExileClientCurrentMusicMode = "Intro";
ExileClientLastMusicmode = "";
[] spawn
{
	waitUntil {ExileClientPlayerIsSpawned}; 
	15 fadeMusic 0.01;
	setMusicEventHandler ["MusicStart","ExileClientCurrentMusic = _this select 0"];
	setMusicEventHandler ["MusicStop","ExileClientCurrentMusicMode call ExileClient_system_music_musicChange"];
	playMusic "ExileTrack04";
	15 fadeMusic 0.3;
	[1 ,ExileClient_system_music_mainMusicLoop, [], true,"Music"] call ExileClient_system_thread_addtask;
	true
};
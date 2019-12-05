# ExileLifeMod
___
This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
___

#### ExileLife Mod: An ArmA 3 Exile modification
20 years have passed since the start of the EXILE. A handful of the original inmates are still alive and, using their knowledge of the island, these inmates have seized control of key towns across the island - forming four gangs: the Cartel, the Mafia, the Syndicate, and the Yakuza.

NATO leaders had long since forgotten the prisoners, but with the renewed violence it once again drew their attention. Their war with CSAT was rapidly draining all available resources and they saw an opportunity and seized it. Quickly and quietly, they moved a private security force to the island. These guards' mission: to control the island and start exporting the island's rich resources using the inmates as labour.

You are a fresh inmate, processed by the courts and shipped straight to EXILE. You have a choice: live a life of solitude under the radar, or pledge your life to a gang. Running away from the protection of the gangs may seem the more lucrative option. But be warned, the guards can only patrol so much of the island, and putting one step in the wrong territory could end your life.

The life of a gang member, on the other hand, requires strength, perseverance, and loyalty. Your gang is your family, shelter, job, and above all else, your protection. Prove your worth to your gang and you will find your place in its hierarchy. However, even in families, power comes at a cost and you may find that the only way to raise yourself above the rest is to remove them by force. Just remember that loyalty is rewarded, but a poorly-planned betrayal will lead to a punishment worse than death.

Welcome to ExileLife

___

This Mod is 90% completed, however I no longer have the time to finish the remaining core features. 
Note that it is provded AS IS, and will require extensive Arma 3 and Exile Knowledge to run a Server.

To see a complete list of features and WIP see the Trello Board: https://trello.com/b/O5wm8Vbp/exile-life-development

If anyone finishes these features, please issue a pull request as it would be great to have the mod completed for all to enjoy!

___

#### Key Features Still To Implement:

1. Gang Boss Management - https://trello.com/c/v7G3q136
2. Gang Vault - https://trello.com/c/3ir6se4n
3. Map Design (ie Traders for each gang city)
4. Small additions to a variety of features...


#### Required Mods:

- ExileMod v1.0.4a
- TaskForceRadio & TeamSpeak Plugin (custom version modified for ExileLife and licenced seperately as per APL-SA)

#### Setup/Install

1. The Easiest way to install, is to first install and configure a working vanilla ExileMod Server
2. Modify/replace Server Config Files as Provided with ExileLife
3. Update Database to ExileLife Version using provided SQL file
4. Replace Exile Default Mission File with ExileLife Mission File
5. Explore


#### A few things to Note:

- Voice is routed through TaskForceRadio, and so talking ingame will not go through arma! This can be configured in exilelife menu custom configs.

- Multiple Characters can be enabled in database for users. You can have two regular characters, or 1 regular and 1 guard character. See DB -> player_perks -> hasTwoClasses / hasGuardAccess. These characters are unique and share nothing in common.

- Items such as fishing rods, shovels, pickaxes etc can have multiple uses. To access secondary action, hold Secondary Action Key SHIFT when clicking to use item.

- Vehicles have a dynamic menu attached to them. To use, hold down special action key (Left Windows Key - configurable in exilelife menu custom configs) when looking at vehicle. If you have a hostage that you are forcing to walk with you, then you can force them into vehicle using this system. 

- Pick Fruit -> uses special action key or scroll menu

- Melee System -> hit players with melee weapons (shovels hoes etc)

- Weapons can be damaged, and will jam.

- Players can message each other using XM8 Messaging App. Currently you can message any player, however it is intended that this system will be changed to use a friend system. The friend system would work such that upon meeting another player, you can give them your PrisonerID Number and they can enter it to save you as a contact.

- Hostage System uses zipties, but allows you to move prisoner around. Note that global variables can lag, and you may need to look at something else and look back at the player for it to update variables to get scroll menu options on your hostage.

- Skills can be improved by performing actions such as lockpicking etc. Improving your skill rank, will allow you to perform the action faster, and will also allow you to do group jobs that require specific skills etc.

- Farming takes time, plants need to be watered and fertilised and they will slowly begin to grow. You can plant seeds from inventory by looking at farming plot. Farming plot is made by using the hoe and secondary action.

- Digging with shovel uses secondary action key.

- Items can be emptied, in some cases, this will execute a secondary action (ie emptying dog food while in water will attract fish for fishing)

- Prisoners can be sent to jail by guards only (see kavala docks office building for jail cell to force hostages into (you can lock them inside))

- Housing can only be claimed using a sleeping bag in a protection zone of a gang you are a member of, or inside Athira under guard protection. This is similar to Exiles territory system, except you can only place items INSIDE the house you have claimed.

- Members of gangs receive a paycheck from the gang vault. Since the gang boss system is not implemented this will run empty and paychecks will stop.

- Murderers can become paramedics by signing up to medic inside gang house in Athira. When a player dies, they can call a guard medic, or a gang medic - each has a pro/con, in that a guard medic costs poptabs, and a gang medic costs respect. This system acts like a gig economy system, in that the first medic to accept a job will be given the job. If a player chooses to commit suicide before medic arrives, they will start a new life, and lose a percentage of skills they have acquired. The attending medic will also still be paid from the users poptabs. If medic does not arrive in time, the user gets respawned at Athira for free.

- Jail is hard labour. Prisoner can either mine the required ore, or wait for the time to expire.

- Guards can view prisoner information and offences via xm8 app.

- Guards earn money through bribery, and jobs. If enough guards online, they can sign up to job board at gang base and do an ore run from mine to kavala docks. Gangs will be informed of this happening (higher ranks hear first), and they can and are encouraged to attack this convoy. The ore can be stolen from the vehicles using Exile Action System by both guards and prisoners.

- There are lots of jobs for prisoners to choose from. These can be accessed via the job board. New jobs can be added via configs and custom files.

- Gangs can be joined from inside Athira by visiting gang house

- Virtual Garage in Athira

Lots more features implemented (too many to list here). 
See Trello board for what is implemented, and look at the code to see how they work.

// Keybinds!

// Settings
[
	"Task Force Radio",
	"OpenSWRadioMenu",
	"Open SW Radio Menu","Opens the Short Wave radio menu for programming your currently equiped radio<br /><t size='0.7'>Default Key: Control + P</t>",
	{},
	{call TFAR_fnc_swRadioMenu},
	[TF_dialog_sw_scancode, TF_dialog_sw_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"OpenLRRadioMenu",
	"Open LR Radio Menu","Open LR Radio Menu<br /><t size='0.7'>Default Key: Alt + P</t>",
	{},
	{call TFAR_fnc_lrRadioMenu},
	[TF_dialog_lr_scancode, TF_dialog_lr_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"DDRadioSettings",
	"DD Radio Settings",
	"DD Radio Settings<br /><t size='0.7'>Default Key: Shift + P</t>",
	{call TFAR_fnc_onDDDialogOpen},
	{},
	[TF_dialog_dd_scancode, TF_dialog_dd_modifiers]
]
call ExileLifeClient_system_keybinding_add;

// Buttons
[
	"Task Force Radio",
	"SWTransmit",
	"SW Transmit",
	"SW Transmit<br /><t size='0.7'>Default Key: CapsLock</t>",
	{call TFAR_fnc_onSwTangentPressed},
	{call TFAR_fnc_onSwTangentReleased},
	[TF_tangent_sw_scancode, TF_tangent_sw_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWTransmitAlt",
	"SW Transmit Alt",
	"SW Transmit Alt<br /><t size='0.7'>Default Key: N/A</t>",
	{call TFAR_fnc_onSwTangentPressed},
	{call TFAR_fnc_onSwTangentReleased},
	[TF_tangent_sw_2_scancode, TF_tangent_sw_2_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWTransmitAdditional",
	"SW Transmit Additional",
	"SW Transmit Additional<br /><t size='0.7'>Default Key: T</t>",
	{call TFAR_fnc_onAdditionalSwTangentPressed},
	{call TFAR_fnc_onAdditionalSwTangentReleased},
	[TF_tangent_additional_sw_scancode, TF_tangent_additional_sw_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRTransmit",
	"LR Transmit",
	"LR Transmit<br /><t size='0.7'>Default Key: Control + CapsLock</t>",
	{call TFAR_fnc_onLRTangentPressed},
	{call TFAR_fnc_onLRTangentReleased},
	[TF_tangent_lr_scancode, TF_tangent_lr_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRTransmitAlt",
	"LR Transmit Alt",
	"LR Transmit Alt<br /><t size='0.7'>Default Key: N/A</t>",
	{call TFAR_fnc_onLRTangentPressed},
	{call TFAR_fnc_onLRTangentReleased},
	[TF_tangent_lr_2_scancode, TF_tangent_lr_2_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRTransmitAdditional",
	"LR Transmit Additional",
	"LR Transmit Additional<br /><t size='0.7'>Default Key: Y</t>",
	{call TFAR_fnc_onAdditionalLRTangentPressed},
	{call TFAR_fnc_onAdditionalLRTangentReleased},
	[TF_tangent_additional_lr_scancode, TF_tangent_additional_lr_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"DDTransmit",
	"DD Transmit",
	"DD Transmit<br /><t size='0.7'>Default Key: Control + ` (Grave)</t>",
	{call TFAR_fnc_onDDTangentPressed},
	{call TFAR_fnc_onDDTangentReleased},
	[TF_tangent_dd_scancode, TF_tangent_dd_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"DDTransmitAlt",
	"DD Transmit Alt",
	"DD Transmit Alt<br /><t size='0.7'>Default Key: N/A</t>",
	{call TFAR_fnc_onDDTangentPressed},
	{call TFAR_fnc_onDDTangentReleased},
	[TF_tangent_dd_2_scancode, TF_tangent_dd_2_modifiers]
]
call ExileLifeClient_system_keybinding_add;


// Short Wave channels
[
	"Task Force Radio",
	"SWChannel1",
	"SW Channel 1",
	"SW Channel 1<br /><t size='0.7'>Default Key: NumPad 1</t>",
	{[0] call TFAR_fnc_processSWChannelKeys},
	{},
	[TF_sw_channel_1_scancode, TF_sw_channel_1_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWChannel2",
	"SW Channel 2",
	"SW Channel 2<br /><t size='0.7'>Default Key: NumPad 2</t>",
	{[1] call TFAR_fnc_processSWChannelKeys},
	{},
	[TF_sw_channel_2_scancode, TF_sw_channel_2_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWChannel3",
	"SW Channel 3",
	"SW Channel 3<br /><t size='0.7'>Default Key: NumPad 3</t>",
	{[2] call TFAR_fnc_processSWChannelKeys},
	{},
	[TF_sw_channel_3_scancode, TF_sw_channel_3_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWChannel3",
	"SW Channel 4",
	"SW Channel 4<br /><t size='0.7'>Default Key: NumPad 4</t>",
	{[3] call TFAR_fnc_processSWChannelKeys},
	{},
	[TF_sw_channel_4_scancode, TF_sw_channel_4_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWChannel5",
	"SW Channel 5",
	"SW Channel 5<br /><t size='0.7'>Default Key: NumPad 5</t>",
	{[4] call TFAR_fnc_processSWChannelKeys},
	{},
	[TF_sw_channel_5_scancode, TF_sw_channel_5_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWChannel6",
	"SW Channel 6",
	"SW Channel 6<br /><t size='0.7'>Default Key: NumPad 6</t>",
	{[5] call TFAR_fnc_processSWChannelKeys},
	{},
	[TF_sw_channel_6_scancode, TF_sw_channel_6_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWChannel7",
	"SW Channel 7",
	"SW Channel 7<br /><t size='0.7'>Default Key: NumPad 7</t>",
	{[6] call TFAR_fnc_processSWChannelKeys},
	{},
	[TF_sw_channel_7_scancode, TF_sw_channel_7_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWChannel8",
	"SW Channel 8",
	"SW Channel 8<br /><t size='0.7'>Default Key: NumPad 8</t>",
	{[7] call TFAR_fnc_processSWChannelKeys},
	{},
	[TF_sw_channel_8_scancode, TF_sw_channel_8_modifiers]
]
call ExileLifeClient_system_keybinding_add;


// Long Range Channels
[
	"Task Force Radio",
	"LRChannel1",
	"LR Channel 1",
	"LR Channel 1<br /><t size='0.7'>Default Key: NumPad 1</t>",
	{[0] call TFAR_fnc_processLRChannelKeys},
	{},
	[TF_lr_channel_1_scancode, TF_lr_channel_1_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRChannel2",
	"LR Channel 2",
	"LR Channel 2<br /><t size='0.7'>Default Key: NumPad 2</t>",
	{[1] call TFAR_fnc_processLRChannelKeys},
	{},
	[TF_lr_channel_2_scancode, TF_lr_channel_2_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRChannel3",
	"LR Channel 3",
	"LR Channel 3<br /><t size='0.7'>Default Key: NumPad 3</t>",
	{[2] call TFAR_fnc_processLRChannelKeys},
	{},
	[TF_lr_channel_3_scancode, TF_lr_channel_3_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRChannel4",
	"LR Channel 4",
	"LR Channel 4<br /><t size='0.7'>Default Key: NumPad 4</t>",
	{[3] call TFAR_fnc_processLRChannelKeys},
	{},
	[TF_lr_channel_4_scancode, TF_lr_channel_4_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRChannel5",
	"LR Channel 5",
	"LR Channel 5<br /><t size='0.7'>Default Key: NumPad 5</t>",
	{[4] call TFAR_fnc_processLRChannelKeys},
	{},
	[TF_lr_channel_5_scancode, TF_lr_channel_5_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRChannel6",
	"LR Channel 6",
	"LR Channel 6<br /><t size='0.7'>Default Key: NumPad 6</t>",
	{[5] call TFAR_fnc_processLRChannelKeys},
	{},
	[TF_lr_channel_6_scancode, TF_lr_channel_6_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRChannel7",
	"LR Channel 7",
	"LR Channel 7<br /><t size='0.7'>Default Key: NumPad 7</t>",
	{[6] call TFAR_fnc_processLRChannelKeys},
	{},
	[TF_lr_channel_7_scancode, TF_lr_channel_7_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRChannel8",
	"LR Channel 8",
	"LR Channel 8<br /><t size='0.7'>Default Key: NumPad 8</t>",
	{[7] call TFAR_fnc_processLRChannelKeys},
	{},
	[TF_lr_channel_8_scancode, TF_lr_channel_8_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRChannel9",
	"LR Channel 9",
	"LR Channel 9<br /><t size='0.7'>Default Key: NumPad 9</t>",
	{[8] call TFAR_fnc_processLRChannelKeys},
	{},
	[TF_lr_channel_9_scancode, TF_lr_channel_9_modifiers]
]
call ExileLifeClient_system_keybinding_add;



[
	"Task Force Radio",
	"ChangeSpeakingVolume",
	"Change Speaking Volume",
	"Change Speaking Volume<br /><t size='0.7'>Default Key: Control + Tab</t>",
	{call TFAR_fnc_onSpeakVolumeChange},
	{},
	[TF_speak_volume_scancode, TF_speak_volume_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"CycleNextSWRadios",
	"Cycle >> SW Radios","Cycle >> SW Radios<br /><t size='0.7'>Default Key: Control + [</t>",
	{},
	{["next"] call TFAR_fnc_processSWCycleKeys},
	[TF_sw_cycle_next_scancode, TF_sw_cycle_next_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"CyclePrevSWRadios",
	"Cycle << SW Radios","Cycle << SW Radios<br /><t size='0.7'>Default Key: Control + ]</t>",
	{},
	{["prev"] call TFAR_fnc_processSWCycleKeys},
	[TF_sw_cycle_prev_scancode, TF_sw_cycle_prev_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"CycleNextLRRadios",
	"Cycle >> LR Radios","Cycle >> LR Radios<br /><t size='0.7'>Default Key: Control + Alt + [</t>",
	{},
	{["next"] call TFAR_fnc_processLRCycleKeys},
	[TF_lr_cycle_next_scancode, TF_lr_cycle_next_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"CyclePrevLRRadios",
	"Cycle << LR Radios","Cycle << LR Radios<br /><t size='0.7'>Default Key: Control + Alt + ]</t>",
	{},
	{["prev"] call TFAR_fnc_processLRCycleKeys},
	[TF_lr_cycle_prev_scancode, TF_lr_cycle_prev_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWStereoBoth",
	"SW Stereo: Both","SW Stereo: Both<br /><t size='0.7'>Default Key: Control + Up</t>",
	{[0] call TFAR_fnc_processSWStereoKeys},
	{},
	[TF_sw_stereo_both_scancode, TF_sw_stereo_both_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWStereoLeft",
	"SW Stereo: Left",
	"SW Stereo: Left<br /><t size='0.7'>Default Key: Control + Left</t>",
	{[1] call TFAR_fnc_processSWStereoKeys},
	{},
	[TF_sw_stereo_left_scancode, TF_sw_stereo_left_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"SWStereoRight",
	"SW Stereo: Right",
	"SW Stereo: Right<br /><t size='0.7'>Default Key: Control + Right</t>",
	{[2] call TFAR_fnc_processSWStereoKeys},
	{},
	[TF_sw_stereo_right_scancode,TF_sw_stereo_right_modifiers]
]
call ExileLifeClient_system_keybinding_add;


[
	"Task Force Radio",
	"LRStereoBoth",
	"LR Stereo: Both",
	"LR Stereo: Both<br /><t size='0.7'>Default Key: Alt + Up</t>",
	{[0] call TFAR_fnc_processLRStereoKeys},
	{},
	[TF_lr_stereo_both_scancode, TF_lr_stereo_both_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRStereoLeft",
	"LR Stereo: Left",
	"LR Stereo: Left<br /><t size='0.7'>Default Key: Alt + Left</t>",
	{[1] call TFAR_fnc_processLRStereoKeys},
	{},
	[TF_lr_stereo_left_scancode, TF_lr_stereo_left_modifiers]
]
call ExileLifeClient_system_keybinding_add;

[
	"Task Force Radio",
	"LRStereoRight",
	"LR Stereo: Right",
	"LR Stereo: Right<br /><t size='0.7'>Default Key: Alt + Right</t>",
	{[2] call TFAR_fnc_processLRStereoKeys},
	{},
	[TF_lr_stereo_right_scancode,TF_lr_stereo_right_modifiers]
]
call ExileLifeClient_system_keybinding_add;
class Scrollbar;
class RscButtonMenu;
class RscEdit;
class RscPictureKeepAspect;
class RscPictureButton;
class RscButton;
class RscListbox;
class RscHtml;
class RscXSliderH;
class RscCombo;
class RscControlsGroupNoHScrollbars;
class RscText;
class RscStructuredText;
class RscExileXM8PictureButton: RscPictureButton
{
	type = 11;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {1,1,1,0.7};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	soundEnter[] = {"",0.1,1};
	soundPush[] = {"",0.1,1};
	soundClick[] = {"",0.1,1};
	soundEscape[] = {"",0.1,1};
};
class RscExileXM8PictureKeepAspect: RscPictureKeepAspect
{
	type = 0;
	style = "0x30 + 0x800";
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	text = "";
};
class RscExileXM8Html: RscHtml
{
	type = 9;
	style = 0;
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorBold[] = {1,1,1,1};
	colorLink[] = {1,1,1,0.75};
	colorLinkActive[] = {1,1,1,1};
	colorPicture[] = {1,1,1,1};
	colorPictureLink[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureBorder[] = {0,0,0,0};
	nextPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa";
	prevPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_left_ca.paa";
	filename = "";
	class H1
	{
		fontBold = "RobotoCondensedBold";
		font = "RobotoCondensed";
		align = "left";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
	};
	class H2
	{
		fontBold = "RobotoCondensedBold";
		font = "RobotoCondensed";
		align = "right";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class H3
	{
		fontBold = "RobotoCondensedBold";
		font = "RobotoCondensed";
		align = "left";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class H4
	{
		fontBold = "RobotoCondensedBold";
		font = "RobotoCondensed";
		align = "left";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class H5
	{
		fontBold = "RobotoCondensedBold";
		font = "RobotoCondensed";
		align = "left";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class H6
	{
		fontBold = "RobotoCondensedBold";
		font = "RobotoCondensed";
		align = "left";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class P
	{
		fontBold = "RobotoCondensedBold";
		font = "RobotoCondensed";
		align = "left";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
};

class RscExileXM8XSliderH: RscXSliderH
{
	type = 43;
	style = 0x400 + 0x10;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorBackground[] = {0,0,0,1};
	color[] = {1,1,1,0.6};
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};
class RscExileXM8Combo: RscCombo
{
	type = 4;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,1};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	style = "0x10 + 0x200";
	colorDisabled[] = {0,0,0,1};
	colorSelect[] = {0,0,0,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	class ComboScrollBar
	{
		color[] = {1,1,1,1};
	};
	wholeHeight = 0.45;
	maxHistoryDelay = 1;
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
};
class RscExileXM8ControlsGroupNoHScrollbars: RscControlsGroupNoHScrollbars
{
	type = 15;
	style = 16;
	colorText[] = {1,1,1,1};
	font = "RobotoCondensed";
	SizeEx = "(((((safezoneW / safezoneH) min 1) / 1.2) / 25) * 1)";
	text = "";
	class HScrollbar{};
	class VScrollbar{};
};
class RscExileXM8Text: RscText
{
	type = 0;
	style = 0;
	colorBackground[] ={0,0,0,0};
	font = "RobotoCondensed";
	colorText[] = {1,1,1,1};
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
};
class RscExileXM8StructuredText: RscStructuredText
{
	SizeEx = "(((((safezoneW / safezoneH) min 1) / 1.2) / 25) * 1)";
	type = 13;
	style = 0;
	colorText[] ={1,1,1,1};
	text = "";
	size = "(((((safezoneW / safezoneH) min 1) / 1.2) / 25) * 1)";
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "left";
		shadow = 1;
	};
};
class RscExileXM8Slide
{
	deletable = 0;
	fade = 0;
	shadow = 0;
	style = 16;
	type = 15;
	x = 0 * (0.025);
	y = 0 * (0.04);
	w = 34 * (0.025);
	h = 19 * (0.04);
	show = false;
	class Controls
	{
	};
	class HScrollbar: Scrollbar
	{
		show = false;
	};
	class VScrollbar: Scrollbar
	{
		show = false;
	};
};
class RscExileXM8Frame: RscExileXM8Text
{
	text = "";
	colorBackground[] = {255, 255, 255, 0.1};
};
class RscExileXM8AppButton: RscButtonMenu
{
	type = 16;
	style = "0x02";
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	shadow = 0;
	shortcuts[] = {};
	textureNoShortcut = "\A3\Ui_f\data\GUI\RscCommon\RscButtonMenuSteam\steam_ca.paa";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {255, 255, 255, 0.05};
	colorBackground2[] = {255, 255, 255, 0.05};
	colorBackgroundFocused[] = {255, 255, 255, 0.1};
	colorDisabled[] = {1,1,1,0.25};
	colorDisabledSecondary[] = {1,1,1,0.25};
	colorFocused[] = {225/255, 65/255, 65/255, 1};
	colorFocusedSecondary[] = {225/255, 65/255, 65/255, 1};
	colorText[] = {1,1,1,1};
	color[] = {1,1,1,1};
	color2[] = {225/255, 65/255, 65/255, 1};
	font = "PuristaMedium";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "Text";
	colorSecondary[] = {1,1,1,1};
	color2Secondary[] = {0,0,0,1};
	fontSecondary = "PuristaLight";
	sizeExSecondary = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	textSecondary = "";
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
	class Attributes
	{
		align = "center";
	};
	class AttributesImage
	{
		align = "center";
		color = "#E5E5E5";
		font = "PuristaMedium";
	};
	class ShortcutPos
	{
		left = 0;
		top = 0;
		h = 1;
		w = 1;
	};
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
};
class RscExileXM8AppButton1x1: RscExileXM8AppButton
{
	x = 0;
	y = 0;
	w = 6 * (0.025);
	h = 5 * (0.04);
	textureNoShortcut = "";
	text = "";
	class ShortcutPos
	{
		left = (6 * (0.025)) * 0.25;
		top = (5 * (0.04)) * 0.15;
		w = (6 * (0.025)) * 0.5;
		h = (5 * (0.04)) * 0.5;
	};
	class TextPos
	{
		bottom = 0;
		left = 0;
		right = 0;
		top = (5 * (0.04)) * 0.65;
	};
};

class RscExileXM8AppButtonHalf: RscExileXM8AppButton
{
	w = 6 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	textureNoShortcut = "";
	text = "";

	class ShortcutPos
	{
		left = (6 * GUI_GRID_W) * 0.25;
		top = (2.5 * GUI_GRID_H) * 0.15;
		w = (6 * GUI_GRID_W) * 0.5;
		h = (2.5 * GUI_GRID_H) * 0.5;
	};

	class TextPos
	{
		bottom = 0;
		left = 0;
		right = 0;
		top = (2 * GUI_GRID_H) * 0.65;
	};
};

class RscExileXM8AppButton2x1: RscExileXM8AppButton1x1
{
	w = 12.5 * (0.025);
	class ShortcutPos
	{
		left = (12.5 * (0.025)) * 0.5 - (6 * (0.025)) * 0.25;
		top = (5 * (0.04)) * 0.15;
		w = (6 * (0.025)) * 0.5;
		h = (5 * (0.04)) * 0.5;
	};
};
class RscExileXM8Edit: RscEdit
{
	colorBackground[] = {255, 255, 255, 0.1};
	colorDisabled[] = {255, 255, 255, 0.1};
	colorSelection[] = {0/255, 178/255, 205/255, 1};
	colorText[] = {252/255, 253/255, 255/255, 1};
	shadow = 2;
	style = "0x00 + 0x50";
	type = 2;
	onSetFocus = "_this call ExileClient_gui_xm8_event_onInputBoxFocus";
	onKillFocus = "_this call ExileClient_gui_xm8_event_onInputBoxKillFocus";
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	autoComplete = "";
};
class RscExileXM8Button: RscExileXM8AppButton1x1
{
	height = 2 * (0.04);
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	class Attributes
	{
		align = "center";
	};
	class AttributesImage
	{
		align = "center";
		color = "#E5E5E5";
		font = "PuristaMedium";
	};
	class TextPos
	{
		bottom = 0;
		left = 0;
		right = 0;
		top = (1 * (0.04)) * 0.5;
	};
};
class RscExileXM8ButtonMenu: RscExileXM8Button
{
	height = 1 * (0.04);
	class TextPos
	{
		bottom = 0;
		left = 0;
		right = 0;
		top = 0;
	};
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
};
class RscExileXM8BackButton: RscExileXM8AppButton1x1
{
	textureNoShortcut = "\exile_assets\texture\ui\xm8_back_ca.paa";
	w = 3 * (0.025);
	h = 2.5 * (0.04);
	class ShortcutPos
	{
		left = 0;
		top = 0;
		w = 3 * (0.025);
		h = 2.5 * (0.04);
	};
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
};
class RscExileXM8ListBox: RscListbox
{
	type = 5;
	style = 16;
	colorBackground[] = {0,0,0,0.3};
	colorText[] = {1,1,1,1};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	rowHeight = 0;
	colorDisabled[] = {1,1,1,0.25};
	colorSelect[] = {0,0,0,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	class ListScrollBar
	{
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
	};
	maxHistoryDelay = 1;
};

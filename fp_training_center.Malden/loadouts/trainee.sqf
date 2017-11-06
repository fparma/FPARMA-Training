params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addWeapon "srifle_EBR_F";
// Binoc
_unit addWeapon "Binocular";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_Cap_tan_specops_US";
_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles_INDEP"];

// Uniform items
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_DefusalKit";
_unit addItemToUniform "ACE_epinephrine";
_unit addItemToUniform "ACE_EntrenchingTool";
_unit addItemToUniform "ACE_Flashlight_MX991";
{_unit addItemToUniform "ACE_morphine"} count [1,2,3];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
// Radios
_unit addItemToUniform "ACRE_PRC343";
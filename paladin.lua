ConRO.Paladin = {};
ConRO.Paladin.CheckTalents = function()
end
ConRO.Paladin.CheckPvPTalents = function()
end
local ConRO_Paladin, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 0;
	self.ModuleOnEnable = ConRO.Paladin.CheckTalents;
	self.ModuleOnEnable = ConRO.Paladin.CheckPvPTalents;
	if mode == 0 then
		self.Description = "Paladin [No Specialization Under 10]";
		self.NextSpell = ConRO.Paladin.Under10;
		self.ToggleHealer();
	end;
	if mode == 1 then
		self.Description = "Paladin [Holy - Healer]";
		if ConRO.db.profile._Spec_1_Enabled then
			self.NextSpell = ConRO.Paladin.Holy;
			self.ToggleDamage();
			self.BlockAoE();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Paladin.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);
		end
	end;
	if mode == 2 then
		self.Description = "Paladin [Protection - Tank]";
		if ConRO.db.profile._Spec_2_Enabled then
			self.NextSpell = ConRO.Paladin.Protection;
			self.ToggleDamage();
			self.BlockAoE();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Paladin.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);
		end
	end;
	if mode == 3 then
		self.Description = "Paladin [Retribution - Melee]";
		if ConRO.db.profile._Spec_3_Enabled then
			self.NextSpell = ConRO.Paladin.Retribution;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Paladin.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);
		end
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 0;
	if mode == 0 then
		self.NextDef = ConRO.Paladin.Under10Def;
	end;
	if mode == 1 then
		if ConRO.db.profile._Spec_1_Enabled then
			self.NextDef = ConRO.Paladin.HolyDef;
		else
			self.NextDef = ConRO.Paladin.Disabled;
		end
	end;
	if mode == 2 then
		if ConRO.db.profile._Spec_2_Enabled then
			self.NextDef = ConRO.Paladin.ProtectionDef;
		else
			self.NextDef = ConRO.Paladin.Disabled;
		end
	end;
	if mode == 3 then
		if ConRO.db.profile._Spec_3_Enabled then
			self.NextDef = ConRO.Paladin.RetributionDef;
		else
			self.NextDef = ConRO.Paladin.Disabled;
		end
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Paladin.Disabled(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	return nil;
end

--Info
local _Player_Level = UnitLevel("player");
local _Player_Percent_Health = ConRO:PercentHealth('player');
local _is_PvP = ConRO:IsPvP();
local _in_combat = UnitAffectingCombat('player');
local _party_size = GetNumGroupMembers();
local _is_PC = UnitPlayerControlled("target");
local _is_Enemy = ConRO:TarHostile();
local _Target_Health = UnitHealth('target');
local _Target_Percent_Health = ConRO:PercentHealth('target');

--Resources
local _Mana, _Mana_Max, _Mana_Percent = ConRO:PlayerPower('Mana');
local _HolyPower, _HolyPower_Max = ConRO:PlayerPower('HolyPower');

--Conditions
local _is_moving = ConRO:PlayerSpeed();
local _enemies_in_melee, _target_in_melee = ConRO:Targets("Melee");
local _enemies_in_10yrds, _target_in_10yrds = ConRO:Targets("10");
local _enemies_in_25yrds, _target_in_25yrds = ConRO:Targets("25");
local _enemies_in_40yrds, _target_in_40yrds = ConRO:Targets("40");
local _can_Execute = _Target_Percent_Health < 20;

--Racials
local _ArcaneTorrent, _ArcaneTorrent_RDY = _, _;

local HeroSpec, Racial = ids.HeroSpec, ids.Racial;

function ConRO:Stats()
	_Player_Level = UnitLevel("player");
	_Player_Percent_Health = ConRO:PercentHealth('player');
	_is_PvP = ConRO:IsPvP();
	_in_combat = UnitAffectingCombat('player');
	_party_size = GetNumGroupMembers();
	_is_PC = UnitPlayerControlled("target");
	_is_Enemy = ConRO:TarHostile();
	_Target_Health = UnitHealth('target');
	_Target_Percent_Health = ConRO:PercentHealth('target');

	_Mana, _Mana_Max, _Mana_Percent = ConRO:PlayerPower('Mana');
	_HolyPower, _HolyPower_Max = ConRO:PlayerPower('HolyPower');

	_is_moving = ConRO:PlayerSpeed();
	_enemies_in_melee, _target_in_melee = ConRO:Targets("Melee");
	_enemies_in_10yrds, _target_in_10yrds = ConRO:Targets("10");
	_enemies_in_25yrds, _target_in_25yrds = ConRO:Targets("25");
	_enemies_in_40yrds, _target_in_40yrds = ConRO:Targets("40");
	_can_Execute = _Target_Percent_Health < 20;

	_ArcaneTorrent, _ArcaneTorrent_RDY = ConRO:AbilityReady(Racial.ArcaneTorrent, timeShift);
end

function ConRO.Paladin.Under10(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells);
	ConRO:Stats();
--Abilities

--Warnings

--Rotations

	return nil;
end

function ConRO.Paladin.Under10Def(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();
--Abilities

--Warnings

--Rotations

	return nil;
end

function ConRO.Paladin.Holy(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells);
	ConRO:Stats();
	local Ability, Form, Buff, Debuff, PetAbility, PvPTalent = ids.Holy_Ability, ids.Holy_Form, ids.Holy_Buff, ids.Holy_Debuff, ids.Holy_PetAbility, ids.Holy_PvPTalent;

--Abilities
	local _AvengingWrath, _AvengingWrath_RDY = ConRO:AbilityReady(Ability.AvengingWrath, timeShift);
	local _BlessingofFreedom, _BlessingofFreedom_RDY = ConRO:AbilityReady(Ability.BlessingofFreedom, timeShift);
	local _BlindingLight, _BlindingLight_RDY = ConRO:AbilityReady(Ability.BlindingLight, timeShift);
	local _Consecration, _Consecration_RDY = ConRO:AbilityReady(Ability.Consecration, timeShift);
	local _CrusaderStrike, _CrusaderStrike_RDY = ConRO:AbilityReady(Ability.CrusaderStrike, timeShift);
		local _CrusaderStrike_CHARGES = ConRO:SpellCharges(Ability.CrusaderStrike.spellID);
	local _DivineSteed, _DivineSteed_RDY = ConRO:AbilityReady(Ability.DivineSteed, timeShift);
	local _HammerofJustice, _HammerofJustice_RDY = ConRO:AbilityReady(Ability.HammerofJustice, timeShift);
	local _HammerofWrath, _HammerofWrath_RDY = ConRO:AbilityReady(Ability.HammerofWrath, timeShift);
	local _Judgment, _Judgment_RDY = ConRO:AbilityReady(Ability.Judgment, timeShift);
	local _Rebuke, _Rebuke_RDY = ConRO:AbilityReady(Ability.Rebuke, timeShift);
	local _Repentance, _Repentance_RDY = ConRO:AbilityReady(Ability.Repentance, timeShift);
	local _ShieldoftheRighteous, _ShieldoftheRighteous_RDY = ConRO:AbilityReady(Ability.ShieldoftheRighteous, timeShift);
	local _TurnEvil, _TurnEvil_RDY = ConRO:AbilityReady(Ability.TurnEvil, timeShift);
	local _WordofGlory, _WordofGlory_RDY = ConRO:AbilityReady(Ability.WordofGlory, timeShift);
		local _DivinePurpose_BUFF = ConRO:Aura(Buff.DivinePurpose);
	local _AuraMastery, _AuraMastery_RDY = ConRO:AbilityReady(Ability.AuraMastery, timeShift);
	local _AvengingCrusader, _AvengingCrusader_RDY = ConRO:AbilityReady(Ability.AvengingCrusader, timeShift);
	local _BeaconofFaith, _BeaconofFaith_RDY = ConRO:AbilityReady(Ability.BeaconofFaith, timeShift);
	local _BeaconofLight, _BeaconofLight_RDY = ConRO:AbilityReady(Ability.BeaconofLight, timeShift);
	local _BlessingofAutumn, _BlessingofAutumn_RDY = ConRO:AbilityReady(Ability.BlessingofAutumn, timeShift);
	local _BlessingofSpring, _BlessingofSpring_RDY = ConRO:AbilityReady(Ability.BlessingofSpring, timeShift);
	local _BlessingofSummer, _BlessingofSummer_RDY = ConRO:AbilityReady(Ability.BlessingofSummer, timeShift);
	local _BlessingofWinter, _BlessingofWinter_RDY = ConRO:AbilityReady(Ability.BlessingofWinter, timeShift);
	local _DivineToll, _DivineToll_RDY = ConRO:AbilityReady(Ability.DivineToll, timeShift);
	local _HolyPrism, _HolyPrism_RDY = ConRO:AbilityReady(Ability.HolyPrism, timeShift);
	local _HolyShock, _HolyShock_RDY = ConRO:AbilityReady(Ability.HolyShock, timeShift);
	local _LightofDawn, _LightofDawn_RDY = ConRO:AbilityReady(Ability.LightofDawn, timeShift);

		if tChosen[Ability.SanctifiedWrath.talentID] then
			_AvengingWrath, _AvengingWrath_RDY = ConRO:AbilityReady(Ability.SanctifiedWrath, timeShift);
		elseif tChosen[Ability.AvengingWrathMight.talentID] then
			_AvengingWrath, _AvengingWrath_RDY = ConRO:AbilityReady(Ability.AvengingWrathMight, timeShift);
		end

		if _DivinePurpose_BUFF then
			_HolyPower = 5;
		end

	local _BlessingoftheSeasons_RDY = _BlessingofSummer_RDY;
	local _BlessingoftheSeasons = false;
		if ConRO:FindCurrentSpell(_BlessingofSpring) then
			_BlessingoftheSeasons = _BlessingofSpring;
		end
		if ConRO:FindCurrentSpell(_BlessingofSummer) then
			_BlessingoftheSeasons = _BlessingofSummer;
		end
		if ConRO:FindCurrentSpell(_BlessingofAutumn) then
			_BlessingoftheSeasons = _BlessingofAutumn;
		end
		if ConRO:FindCurrentSpell(_BlessingofWinter) then
			_BlessingoftheSeasons = _BlessingofWinter;
		end

--Warnings
	ConRO:Warnings("Select an Aura!", GetShapeshiftForm() == 0 and GetNumShapeshiftForms() >= 1);

--Indicators
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());

	ConRO:AbilityRaidBuffs(_BeaconofLight, _BeaconofLight_RDY and not ConRO:OneBuff(Form.BeaconofLight));
	ConRO:AbilityRaidBuffs(_BeaconofFaith, _BeaconofFaith_RDY and not ConRO:OneBuff(Form.BeaconofFaith));

	ConRO:AbilityBurst(_AvengingWrath, _AvengingWrath_RDY and ConRO:BurstMode(_AvengingWrath));

	ConRO:AbilityRaidBuffs(_LightofDawn, _LightofDawn_RDY and _HolyPower >= 3 and not _VanquishersHammer_BUFF);
	ConRO:AbilityRaidBuffs(_WordofGlory, _WordofGlory_RDY and _HolyPower >= 3);

	ConRO:AbilityBurst(_AuraMastery, _AuraMastery_RDY and _in_combat);

	ConRO:AbilityRaidBuffs(_BlessingoftheSeasons, _BlessingoftheSeasons_RDY);

--Rotations
	if _is_Enemy then
		if _HammerofWrath_RDY and _can_Execute then
			tinsert(ConRO.SuggestedSpells, _HammerofWrath);
		end

		if _DivineToll_RDY and _HolyPower <= 0 and ConRO:FullMode(_DivineToll) then
			tinsert(ConRO.SuggestedSpells, _DivineToll);
		end

		if _HolyPrism_RDY then
			tinsert(ConRO.SuggestedSpells, _HolyPrism);
		end

		if _HolyShock_RDY and _HolyPower <= 4 then
			tinsert(ConRO.SuggestedSpells, _HolyShock);
		end

		if _CrusaderStrike_RDY and _CrusaderStrike_CHARGES >= 2 and tChosen[Ability.CrusadersMight] then
			tinsert(ConRO.SuggestedSpells, _CrusaderStrike);
		end

		if _Judgment_RDY then
			tinsert(ConRO.SuggestedSpells, _Judgment);
		end

		if _CrusaderStrike_RDY and _CrusaderStrike_CHARGES >= 1 then
			tinsert(ConRO.SuggestedSpells, _CrusaderStrike);
		end

		if _Consecration_RDY then
			tinsert(ConRO.SuggestedSpells, _Consecration);
		end
	end
	return nil;
end

function ConRO.Paladin.HolyDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();
	local Ability, Form, Buff, Debuff, PetAbility, PvPTalent = ids.Holy_Ability, ids.Holy_Form, ids.Holy_Buff, ids.Holy_Debuff, ids.Holy_PetAbility, ids.Holy_PvPTalent;

--Abilities
	local _BlessingofProtection, _BlessingofProtection_RDY = ConRO:AbilityReady(ids.Holy_Ability.BlessingofProtection, timeShift);
	local _DivineProtection, _DivineProtection_RDY = ConRO:AbilityReady(ids.Holy_Ability.DivineProtection, timeShift);
	local _DivineShield, _DivineShield_RDY = ConRO:AbilityReady(ids.Holy_Ability.DivineShield, timeShift);
	local _LayonHands, _LayonHands_RDY = ConRO:AbilityReady(ids.Holy_Ability.LayonHands, timeShift);
		local _Forbearance_BUFF = ConRO:Aura(ids.Holy_Debuff.Forbearance, timeShift, 'HARMFUL');

--Rotations
		if _LayonHands_RDY and not _Forbearance_BUFF and _Player_Percent_Health <= 10 then
			tinsert(ConRO.SuggestedDefSpells, _LayonHands);
		end

		if _DivineProtection_RDY then
			tinsert(ConRO.SuggestedDefSpells, _DivineProtection);
		end

		if _DivineShield_RDY and not _Forbearance_BUFF then
			tinsert(ConRO.SuggestedDefSpells, _DivineShield);
		elseif _BlessingofProtection_RDY and not _Forbearance_BUFF then
			tinsert(ConRO.SuggestedDefSpells, _BlessingofProtection);
		end
	return nil;
end

function ConRO.Paladin.Protection(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells);
	ConRO:Stats();
	local Ability, Form, Buff, Debuff, PetAbility, PvPTalent = ids.Prot_Ability, ids.Prot_Form, ids.Prot_Buff, ids.Prot_Debuff, ids.Prot_PetAbility, ids.Prot_PvPTalent;

--Abilities
	local _AvengersShield, _AvengersShield_RDY = ConRO:AbilityReady(Ability.AvengersShield, timeShift);
		local _AvengersShield_enemies, _AvengersShield_RANGE = ConRO:Targets(Ability.AvengersShield);
		local _BulwarkofRighteousFury_BUFF, _BulwarkofRighteousFury_COUNT = ConRO:Aura(Buff.BulwarkofRighteousFury, timeShift);
	local _AvengingWrath, _AvengingWrath_RDY, _AvengingWrath_CD = ConRO:AbilityReady(Ability.AvengingWrath, timeShift);
		local _AvengingWrath_BUFF = ConRO:Aura(Buff.AvengingWrath, timeShift);
	local _BastionofLight, _BastionofLight_RDY = ConRO:AbilityReady(Ability.BastionofLight, timeShift);
	local _Consecration, _Consecration_RDY = ConRO:AbilityReady(Ability.Consecration, timeShift);
		local _Consecration_FORM = ConRO:Form(Form.Consecration);
	local _CrusaderStrike, _CrusaderStrike_RDY = ConRO:AbilityReady(Ability.CrusaderStrike, timeShift);
		local _CrusaderStrike_CHARGES = ConRO:SpellCharges(Ability.CrusaderStrike.spellID);
	local _DivineToll, _DivineToll_RDY = ConRO:AbilityReady(Ability.DivineToll, timeShift);
	local _EyeofTyr, _EyeofTyr_RDY = ConRO:AbilityReady(Ability.EyeofTyr, timeShift);
	local _HammerofLight, _HammerofLight_RDY = ConRO:AbilityReady(Ability.HammerofLight, timeShift);
		local _ShaketheHeavens_BUFF = ConRO:Aura(Buff.ShaketheHeavens, timeShift);
	local _HammerofWrath, _HammerofWrath_RDY = ConRO:AbilityReady(Ability.HammerofWrath, timeShift);
	local _HandofReckoning, _HandofReckoning_RDY = ConRO:AbilityReady(Ability.HandofReckoning, timeShift);
	local _HolyBulwark, _HolyBulwark_RDY = ConRO:AbilityReady(Ability.HolyBulwark, timeShift);
	local _Judgment, _Judgment_RDY = ConRO:AbilityReady(Ability.Judgment, timeShift);
		local _BlessingofDawn_BUFF = ConRO:Aura(Buff.BlessingofDawn, timeShift);
	local _MomentofGlory, _MomentofGlory_RDY = ConRO:AbilityReady(Ability.MomentofGlory, timeShift);
		local _MomentofGlory_BUFF = ConRO:Aura(Buff.MomentofGlory, timeShift);
	local _Rebuke, _Rebuke_RDY = ConRO:AbilityReady(Ability.Rebuke, timeShift);
	local _SacredWeapon, _SacredWeapon_RDY = ConRO:AbilityReady(Ability.SacredWeapon, timeShift);
	local _ShieldoftheRighteous, _ShieldoftheRighteous_RDY = ConRO:AbilityReady(Ability.ShieldoftheRighteous, timeShift);
		local _ShieldoftheRighteous_BUFF, _, _ShieldoftheRighteous_DUR = ConRO:Aura(Buff.ShieldoftheRighteous, timeShift);
		local _ShiningLight_BUFF = ConRO:Aura(Buff.ShiningLight, timeShift);
		local _DivinePurpose_BUFF = ConRO:Aura(Buff.DivinePurpose, timeShift);
		local _BastionofLight_BUFF, _, _BastionofLight_DUR = ConRO:Aura(Buff.BastionofLight, timeShift);
		local _Redoubt_BUFF, _, _Redoubt_DUR = ConRO:Aura(Buff.Redoubt, timeShift);
	local _WordofGlory, _WordofGlory_RDY = ConRO:AbilityReady(Ability.WordofGlory, timeShift);

	if _DivinePurpose_BUFF then
		_HolyPower = 5;
	end

	if tChosen[Ability.Sentinel.talentID] then
		_AvengingWrath, _AvengingWrath_RDY = ConRO:AbilityReady(Ability.Sentinel, timeShift);
	end

	if tChosen[Ability.BlessedHammer.talentID] then
		_CrusaderStrike, _CrusaderStrike_RDY = ConRO:AbilityReady(Ability.BlessedHammer, timeShift);
		_CrusaderStrike_CHARGES = ConRO:SpellCharges(Ability.BlessedHammer.spellID);
	end

	if tChosen[Ability.HammeroftheRighteous.talentID] then
		_CrusaderStrike, _CrusaderStrike_RDY = ConRO:AbilityReady(Ability.HammeroftheRighteous, timeShift);
		_CrusaderStrike_CHARGES = ConRO:SpellCharges(Ability.HammeroftheRighteous.spellID);
	end

--Warnings
	ConRO:Warnings("Select an Aura!", GetShapeshiftForm() == 0 and GetNumShapeshiftForms() >= 1);

--Indicators
	ConRO:AbilityInterrupt(_AvengersShield, _AvengersShield_RDY and ConRO:Interrupt());
	ConRO:AbilityInterrupt(_Rebuke, _Rebuke_RDY and not _AvengersShield_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());

	ConRO:AbilityTaunt(_HandofReckoning, _HandofReckoning_RDY);

	ConRO:AbilityBurst(_AvengingWrath, _AvengingWrath_RDY and ConRO:BurstMode(_AvengingWrath));
	ConRO:AbilityBurst(_BastionofLight, _BastionofLight_RDY and not _ShieldoftheRighteous_BUFF and ConRO:BurstMode(_BastionofLight));
	ConRO:AbilityBurst(_DivineToll, _DivineToll_RDY and _enemies_in_25yrds >= 3 and ConRO:BurstMode(_DivineToll));
	ConRO:AbilityBurst(_MomentofGlory, _MomentofGlory_RDY and ConRO:BurstMode(_MomentofGlory));
	ConRO:AbilityBurst(_SacredWeapon, _SacredWeapon_RDY and ConRO:HeroSpec(HeroSpec.Lightsmith) and not _AvengingWrath_BUFF and ConRO:BurstMode(_SacredWeapon));

--Rotations
	for i = 1, 2, 1 do
		if not _in_combat then
			if _AvengersShield_RDY and (_enemies_in_melee >= 3 or _AvengersShield_enemies >= 3) then
				tinsert(ConRO.SuggestedSpells, _AvengersShield);
				_AvengersShield_RDY = false;
			end

			if _Judgment_RDY and not _target_in_melee then
				tinsert(ConRO.SuggestedSpells, _Judgment);
				_Judgment_RDY = false;
			end
		end

		if _AvengingWrath_RDY and ConRO:FullMode(_AvengingWrath) then
			tinsert(ConRO.SuggestedSpells, _AvengingWrath);
			_AvengingWrath_RDY = false;
		end

		if _EyeofTyr_RDY and ConRO:HeroSpec(HeroSpec.Templar) then
			tinsert(ConRO.SuggestedSpells, _EyeofTyr);
			_EyeofTyr_RDY = false;
		end

		if _HammerofLight_RDY and ConRO:IsOverride(_EyeofTyr) == _HammerofLight and _BlessingofDawn_BUFF and ConRO:HeroSpec(HeroSpec.Templar) then
			tinsert(ConRO.SuggestedSpells, _HammerofLight);
			_HammerofLight_RDY = false;
		end

		if _SacredWeapon_RDY and ConRO:IsOverride(_HolyBulwark) == _SacredWeapon and ConRO:HeroSpec(HeroSpec.Lightsmith) and not _AvengingWrath_BUFF and ConRO:FullMode(_SacredWeapon) then
			tinsert(ConRO.SuggestedSpells, _SacredWeapon);
			_SacredWeapon_RDY = false;
		end

		if _MomentofGlory_RDY and ConRO:FullMode(_MomentofGlory) then
			tinsert(ConRO.SuggestedSpells, _MomentofGlory);
			_MomentofGlory_RDY = false;
		end

		if _BastionofLight_RDY and ConRO:FullMode(_BastionofLight) then
			tinsert(ConRO.SuggestedSpells, _BastionofLight);
			_BastionofLight_RDY = false;
		end

		if _Consecration_RDY and not _Consecration_FORM then
			tinsert(ConRO.SuggestedSpells, _Consecration);
			_Consecration_RDY = false;
		end

		if _ShieldoftheRighteous_RDY and (_HolyPower >= 3 or _DivinePurpose_BUFF) and not _ShieldoftheRighteous_BUFF then
			tinsert(ConRO.SuggestedSpells, _ShieldoftheRighteous);
			_HolyPower = _HolyPower - 3
		end

		if _AvengersShield_RDY and ((_BulwarkofRighteousFury_COUNT < 5) or _MomentofGlory_BUFF) then
			tinsert(ConRO.SuggestedSpells, _AvengersShield);
			_AvengersShield_RDY = false;
		end

		if _HammerofWrath_RDY then
			tinsert(ConRO.SuggestedSpells, _HammerofWrath);
			_HammerofWrath_RDY = false;
		end

		if _Judgment_RDY and ConRO.lastSpellId ~= _Judgment then
			tinsert(ConRO.SuggestedSpells, _Judgment);
			_Judgment_RDY = false;
		end

		if _DivineToll_RDY and _HolyPower <= 4 and ConRO:FullMode(_DivineToll) then
			tinsert(ConRO.SuggestedSpells, _DivineToll);
			_DivineToll_RDY = false;
		end

		if _AvengersShield_RDY then
			tinsert(ConRO.SuggestedSpells, _AvengersShield);
			_AvengersShield_RDY = false;
		end

		if _HolyBulwark_RDY and ConRO:IsOverride(_HolyBulwark) == _HolyBulwark and ConRO:HeroSpec(HeroSpec.Lightsmith) then
			tinsert(ConRO.SuggestedSpells, _HolyBulwark);
			_HolyBulwark_RDY = false;
		end

		if _CrusaderStrike_RDY and _CrusaderStrike_CHARGES >= 1 then
			tinsert(ConRO.SuggestedSpells, _CrusaderStrike);
			_CrusaderStrike_CHARGES = _CrusaderStrike_CHARGES - 1;
		end

		if _WordofGlory_RDY and _ShiningLight_BUFF and ((_Player_Percent_Health < 50) or _ShaketheHeavens_BUFF) then
			tinsert(ConRO.SuggestedSpells, _WordofGlory);
			_ShiningLight_BUFF = false;
		end

		if _Consecration_RDY then
			tinsert(ConRO.SuggestedSpells, _Consecration);
			_Consecration_RDY = false;
		end
	end
	return nil;
end

function ConRO.Paladin.ProtectionDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();
	local Ability, Form, Buff, Debuff, PetAbility, PvPTalent = ids.Prot_Ability, ids.Prot_Form, ids.Prot_Buff, ids.Prot_Debuff, ids.Prot_PetAbility, ids.Prot_PvPTalent;

--Abilities
	local _ArdentDefender, _ArdentDefender_RDY, _ArdentDefender_CD = ConRO:AbilityReady(Ability.ArdentDefender, timeShift);
		local _ArdentDefender_BUFF = ConRO:Aura(Buff.ArdentDefender, timeShift);
	local _BlessingofProtection, _BlessingofProtection_RDY = ConRO:AbilityReady(Ability.BlessingofProtection, timeShift);
	local _DivineShield, _DivineShield_RDY = ConRO:AbilityReady(Ability.DivineShield, timeShift);
	local _EyeofTyr, _EyeofTyr_RDY = ConRO:AbilityReady(Ability.EyeofTyr, timeShift);
	local _GuardianofAncientKings, _GuardianofAncientKings_RDY = ConRO:AbilityReady(Ability.GuardianofAncientKings, timeShift);
		local _GuardianofAncientKings_BUFF = ConRO:Aura(Buff.GuardianofAncientKings, timeShift);
	local _ShieldoftheRighteous, _ShieldoftheRighteous_RDY = ConRO:AbilityReady(Ability.ShieldoftheRighteous, timeShift);
		local _ShieldoftheRighteous_BUFF = ConRO:Aura(Buff.ShieldoftheRighteous, timeShift + 1);
		local _ShiningLight_BUFF, _, _ShiningLight_DUR = ConRO:Aura(Buff.ShiningLight, timeShift);
	local _LayonHands, _LayonHands_RDY = ConRO:AbilityReady(Ability.LayonHands, timeShift);
		local _Forbearance_BUFF = ConRO:Aura(Debuff.Forbearance, timeShift, 'HARMFUL');
	local _WordofGlory, _WordofGlory_RDY = ConRO:AbilityReady(Ability.WordofGlory, timeShift);

--Rotations
		if _LayonHands_RDY and not _Forbearance_BUFF and _Player_Percent_Health <= 10 then
			tinsert(ConRO.SuggestedDefSpells, _LayonHands);
		end

		if _WordofGlory_RDY and ((_HolyPower >= 3 or _ShiningLight_BUFF) and _Player_Percent_Health <= 80) then
			tinsert(ConRO.SuggestedDefSpells, _WordofGlory);
		end

		if _ShieldoftheRighteous_RDY and not _ShieldoftheRighteous_BUFF and _HolyPower >= 3 and not _ArdentDefender_BUFF and not _GuardianofAncientKings_BUFF then
			tinsert(ConRO.SuggestedDefSpells, _ShieldoftheRighteous);
		end

		if _EyeofTyr_RDY and _target_in_melee and not _ShieldoftheRighteous_BUFF then
			tinsert(ConRO.SuggestedDefSpells, _EyeofTyr);
		end

		if _ArdentDefender_RDY and not _ArdentDefender_BUFF and not _GuardianofAncientKings_BUFF and not _ShieldoftheRighteous_BUFF then
			tinsert(ConRO.SuggestedDefSpells, _ArdentDefender);
		end

		if _GuardianofAncientKings_RDY and not _GuardianofAncientKings_BUFF and not _ArdentDefender_BUFF then
			tinsert(ConRO.SuggestedDefSpells, _GuardianofAncientKings);
		end
	return nil;
end

function ConRO.Paladin.Retribution(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells);
	ConRO:Stats();
	local Ability, Form, Buff, Debuff, PetAbility, PvPTalent = ids.Ret_Ability, ids.Ret_Form, ids.Ret_Buff, ids.Ret_Debuff, ids.Ret_PetAbility, ids.Ret_PvPTalent;

--Abilities
	local _AvengingWrath, _AvengingWrath_RDY = ConRO:AbilityReady(Ability.AvengingWrath, timeShift);
		local _AvengingWrath_BUFF = ConRO:Aura(Buff.AvengingWrath, timeShift);
	local _BladeofJustice, _BladeofJustice_RDY = ConRO:AbilityReady(Ability.BladeofJustice, timeShift);
		local _Expurgation_DEBUFF = ConRO:TargetAura(Debuff.Expurgation, timeShift);
	local _CrusaderStrike, _CrusaderStrike_RDY = ConRO:AbilityReady(Ability.CrusaderStrike, timeShift);
		local _CrusaderStrike_CHARGES = ConRO:SpellCharges(_CrusaderStrike);
		local _EmpyreanPower_BUFF = ConRO:Aura(Buff.EmpyreanPower, timeShift);
		local _TemplarStrike, _TemplarStrike_RDY = ConRO:AbilityReady(Ability.TemplarStrike, timeShift);
		local _TemplarSlash, _TemplarSlash_RDY = ConRO:AbilityReady(Ability.TemplarSlash, timeShift);
	local _DivineHammer, _DivineHammer_RDY = ConRO:AbilityReady(Ability.DivineHammer, timeShift);
	local _DivineStorm, _DivineStorm_RDY = ConRO:AbilityReady(Ability.DivineStorm, timeShift);
		local _DivinePurpose_BUFF = ConRO:Aura(Buff.DivinePurpose, timeShift);
	local _DivineToll, _DivineToll_RDY = ConRO:AbilityReady(Ability.DivineToll, timeShift);
	local _ExecutionSentence, _ExecutionSentence_RDY = ConRO:AbilityReady(Ability.ExecutionSentence, timeShift);
	local _FinalReckoning, _FinalReckoning_RDY = ConRO:AbilityReady(Ability.FinalReckoning, timeShift);
	local _HammerofJustice, _HammerofJustice_RDY = ConRO:AbilityReady(Ability.HammerofJustice, timeShift);
	local _HammerofLight, _HammerofLight_RDY = ConRO:AbilityReady(Ability.HammerofLight, timeShift);
		local _EndlessWrath_BUFF = ConRO:Aura(Buff.EndlessWrath, timeShift);
	local _HammerofWrath, _HammerofWrath_RDY = ConRO:AbilityReady(Ability.HammerofWrath, timeShift);
		local _BlessingofAnshe_BUFF = ConRO:Aura(Buff.BlessingofAnshe, timeShift);
	local _Judgment, _Judgment_RDY = ConRO:AbilityReady(Ability.Judgment, timeShift);
		local _Judgment_DEBUFF = ConRO:TargetAura(Debuff.Judgment, timeShift);
		local _EmpyreanLegacy_BUFF = ConRO:Aura(Buff.EmpyreanLegacy, timeShift);
	local _JusticarsVengeance, _JusticarsVengeance_RDY = ConRO:AbilityReady(Ability.JusticarsVengeance, timeShift);
	local _Rebuke, _Rebuke_RDY = ConRO:AbilityReady(Ability.Rebuke, timeShift);
	local _TemplarsVerdict, _TemplarsVerdict_RDY = ConRO:AbilityReady(Ability.TemplarsVerdict, timeShift);
		local _FinalVerdict_BUFF = ConRO:Aura(Buff.FinalVerdict, timeShift);
		local _DivineArbiter_BUFF, _DivineArbiter_COUNT = ConRO:Aura(Buff.DivineArbiter, timeShift);
	local _WakeofAshes, _WakeofAshes_RDY = ConRO:AbilityReady(Ability.WakeofAshes, timeShift);
	local _WordofGlory, _WordofGlory_RDY = ConRO:AbilityReady(Ability.WordofGlory, timeShift);

--Conditions
	local _enemies_in_30yrds, _target_in_30yrds = ConRO:Targets(Ability.Judgment);

	if _DivinePurpose_BUFF then
		_HolyPower = 5;
	end

	if tChosen[Ability.FinalVerdict.talentID] then
		_TemplarsVerdict, _TemplarsVerdict_RDY = ConRO:AbilityReady(Ability.FinalVerdict, timeShift);
	end

	if ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()) then
		_TemplarsVerdict, _TemplarsVerdict_RDY = ConRO:AbilityReady(Ability.DivineStorm, timeShift);
	end

	if tChosen[Ability.Crusade.talentID] then
		_AvengingWrath, _AvengingWrath_RDY = ConRO:AbilityReady(Ability.Crusade, timeShift);
		_AvengingWrath_BUFF	= ConRO:Aura(Buff.Crusade, timeShift);
	end

--Warnings
	ConRO:Warnings("Select an Aura!", GetShapeshiftForm() == 0 and GetNumShapeshiftForms() >= 1);

--Indicators
	ConRO:AbilityInterrupt(_Rebuke, _Rebuke_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());

	ConRO:AbilityBurst(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and _HolyPower <= 4);
	ConRO:AbilityBurst(_AvengingWrath, _AvengingWrath_RDY and not _AvengingWrath_BUFF and _HolyPower >= 3 and ConRO:BurstMode(_AvengingWrath));
	ConRO:AbilityBurst(_FinalReckoning, _FinalReckoning_RDY and (not tChosen[Ability.DivineAuxiliary.talentID] or (tChosen[Ability.DivineAuxiliary.talentID] and _HolyPower <= 2)) and ConRO:BurstMode(_FinalReckoning));
	ConRO:AbilityBurst(_ExecutionSentence, _ExecutionSentence_RDY and (not tChosen[Ability.DivineAuxiliary.talentID] or (tChosen[Ability.DivineAuxiliary.talentID] and _HolyPower <= 2)) and ConRO:BurstMode(_ExecutionSentence));

--Rotations
	for i = 1, 2, 1 do
		if not _in_combat then
			if _BladeofJustice_RDY and _HolyPower <= 3 then
				tinsert(ConRO.SuggestedSpells, _BladeofJustice);
				_BladeofJustice_RDY = false;
				_HolyPower = _HolyPower + 2;
			end

			if _DivineToll_RDY and _HolyPower <= 3 and _target_in_30yrds and ConRO:FullMode(_DivineToll) then
				tinsert(ConRO.SuggestedSpells, _DivineToll);
				_DivineToll_RDY = false;
				_HolyPower = _HolyPower + _enemies_in_30yrds;
			end

			if _Judgment_RDY and _HolyPower <= 4 then
				tinsert(ConRO.SuggestedSpells, _Judgment);
				_Judgment_RDY = false;
				_HolyPower = _HolyPower + 1;
			end

			if _ExecutionSentence_RDY and _HolyPower >= 3 and ConRO:FullMode(_ExecutionSentence) then
				tinsert(ConRO.SuggestedSpells, _ExecutionSentence);
				_ExecutionSentence_RDY = false;
				_HolyPower = _HolyPower - 3;
			end
		end

		if _AvengingWrath_RDY and not _AvengingWrath_BUFF and _HolyPower >= 3 and not tChosen[Ability.RadiantGlory.talentID] and ConRO:FullMode(_AvengingWrath) then
			tinsert(ConRO.SuggestedSpells, _AvengingWrath);
			_AvengingWrath_RDY = false;
			_AvengingWrath_BUFF = true;
		end

		if _FinalReckoning_RDY and (not tChosen[Ability.DivineAuxiliary.talentID] or (tChosen[Ability.DivineAuxiliary.talentID] and _HolyPower <= 2)) and ConRO:FullMode(_FinalReckoning) then
			tinsert(ConRO.SuggestedSpells, _FinalReckoning);
			_FinalReckoning_RDY = false;
		end

		if _ExecutionSentence_RDY and (not tChosen[Ability.DivineAuxiliary.talentID] or (tChosen[Ability.DivineAuxiliary.talentID] and _HolyPower <= 2)) and ConRO:FullMode(_ExecutionSentence) then
			tinsert(ConRO.SuggestedSpells, _ExecutionSentence);
			_ExecutionSentence_RDY = false;
		end

		if _HammerofLight_RDY and ConRO:IsOverride(_WakeofAshes) == _HammerofLight and ConRO:HeroSpec(HeroSpec.Templar) then
			tinsert(ConRO.SuggestedSpells, _HammerofLight);
			_HammerofLight_RDY = false;
		end

		if _DivineStorm_RDY and _EmpyreanPower_BUFF then
			tinsert(ConRO.SuggestedSpells, _DivineStorm);
			_EmpyreanPower_BUFF = false;
		end

		if _TemplarsVerdict_RDY and _HolyPower >= 5 then
			tinsert(ConRO.SuggestedSpells, _TemplarsVerdict);
			_HolyPower = _HolyPower - 3;
		end

		if _WakeofAshes_RDY and _HolyPower <= 2 and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()) and ConRO:FullMode(_WakeofAshes) then
			tinsert(ConRO.SuggestedSpells, _WakeofAshes);
			_WakeofAshes_RDY = false;
			_HolyPower = _HolyPower + 3;
		end

		if _DivineToll_RDY and _target_in_30yrds and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()) and ConRO:FullMode(_DivineToll) then
			tinsert(ConRO.SuggestedSpells, _DivineToll);
			_DivineToll_RDY = false;
			_HolyPower = _HolyPower + _enemies_in_30yrds;
		end

		if _TemplarStrike_RDY and ConRO:IsOverride(_TemplarStrike) == _TemplarSlash then
			tinsert(ConRO.SuggestedSpells, _TemplarStrike);
			_TemplarStrike_RDY = false;
			_HolyPower = _HolyPower + 1;
		end

		if _BladeofJustice_RDY and tChosen[Ability.Expurgation.talentID] and not _Expurgation_DEBUFF then
			tinsert(ConRO.SuggestedSpells, _BladeofJustice);
			_BladeofJustice_RDY = false;
			_Expurgation_DEBUFF = true;
			_HolyPower = _HolyPower + 1;
		end

		if _WakeofAshes_RDY and _HolyPower <= 2 and ConRO:FullMode(_WakeofAshes) then
			tinsert(ConRO.SuggestedSpells, _WakeofAshes);
			_WakeofAshes_RDY = false;
			_HolyPower = _HolyPower + 3;
		end

		if _DivineToll_RDY and _target_in_30yrds and ConRO:FullMode(_DivineToll) then
			tinsert(ConRO.SuggestedSpells, _DivineToll);
			_DivineToll_RDY = false;
			_HolyPower = _HolyPower + _enemies_in_30yrds;
		end

		if _HammerofWrath_RDY and _BlessingofAnshe_BUFF then
			tinsert(ConRO.SuggestedSpells, _HammerofWrath);
			_HammerofWrath_RDY = false;
			_HolyPower = _HolyPower + 1;
		end

		if _HammerofWrath_RDY and tChosen[Ability.VengefulWrath.talentID] and (_AvengingWrath_BUFF or _FinalVerdict_BUFF or _EndlessWrath_BUFF) and _Target_Percent_Health < 35 then
			tinsert(ConRO.SuggestedSpells, _HammerofWrath);
			_HammerofWrath_RDY = false;
			_HolyPower = _HolyPower + 1;
		end

		if _TemplarStrike_RDY then
			tinsert(ConRO.SuggestedSpells, _TemplarStrike);
			_TemplarStrike_RDY = false;
			_HolyPower = _HolyPower + 1;
		end

		if _Judgment_RDY and _HolyPower <= 3 then
			tinsert(ConRO.SuggestedSpells, _Judgment);
			_Judgment_RDY = false;
			_HolyPower = _HolyPower + 2;
		end

		if _BladeofJustice_RDY then
			tinsert(ConRO.SuggestedSpells, _BladeofJustice);
			_BladeofJustice_RDY = false;
			_HolyPower = _HolyPower + 1;
		end

		if _HammerofWrath_RDY and (_can_Execute and _HolyPower <= 3) or ((_AvengingWrath_BUFF or _FinalVerdict_BUFF or _EndlessWrath_BUFF) and _HolyPower <= 4) then
			tinsert(ConRO.SuggestedSpells, _HammerofWrath);
			_HammerofWrath_RDY = false;
			_HolyPower = _HolyPower + 1;
		end

		if _CrusaderStrike_RDY and _CrusaderStrike_CHARGES >= 2 and not (tChosen[Ability.TemplarStrikes.talentID] or tChosen[Ability.CrusadingStrikes.talentID]) then
			tinsert(ConRO.SuggestedSpells, _CrusaderStrike);
			_CrusaderStrike_CHARGES = _CrusaderStrike_CHARGES -1;
			_HolyPower = _HolyPower + 1;
		end

		if _TemplarsVerdict_RDY and _HolyPower >= 3 then
			tinsert(ConRO.SuggestedSpells, _TemplarsVerdict);
			_HolyPower = _HolyPower - 3;
		end

		if _CrusaderStrike_RDY and not (tChosen[Ability.TemplarStrikes.talentID] or tChosen[Ability.CrusadingStrikes.talentID]) then
			tinsert(ConRO.SuggestedSpells, _CrusaderStrike);
			_CrusaderStrike_CHARGES = _CrusaderStrike_CHARGES -1;
			_HolyPower = _HolyPower + 1;
		end
	end
	return nil;
end

function ConRO.Paladin.RetributionDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();
	local Ability, Form, Buff, Debuff, PetAbility, PvPTalent = ids.Ret_Ability, ids.Ret_Form, ids.Ret_Buff, ids.Ret_Debuff, ids.Ret_PetAbility, ids.Ret_PvPTalent;

--Abilities
	local _BlessingofProtection, _BlessingofProtection_RDY = ConRO:AbilityReady(Ability.BlessingofProtection, timeShift);
	local _DivineShield, _DivineShield_RDY = ConRO:AbilityReady(Ability.DivineShield, timeShift);
	local _FlashofLight, _FlashofLight_RDY = ConRO:AbilityReady(Ability.FlashofLight, timeShift);
		local _, _SelflessHealer_COUNT = ConRO:Aura(Buff.SelflessHealer, timeShift);
	local _LayonHands, _LayonHands_RDY = ConRO:AbilityReady(Ability.LayonHands, timeShift);
		local _Forbearance_BUFF = ConRO:Aura(Debuff.Forbearance, timeShift, 'HARMFUL');
	local _ShieldofVengeance, _ShieldofVengeance_RDY = ConRO:AbilityReady(Ability.ShieldofVengeance, timeShift);
	local _WordofGlory, _WordofGlory_RDY = ConRO:AbilityReady(Ability.WordofGlory, timeShift);

--Rotations
		if _LayonHands_RDY and not _Forbearance_BUFF and _Player_Percent_Health <= 10 then
			tinsert(ConRO.SuggestedDefSpells, _LayonHands);
		end

		if _FlashofLight_RDY and _SelflessHealer_COUNT >= 4 and _Player_Percent_Health <= 80 then
			tinsert(ConRO.SuggestedDefSpells, _FlashofLight);
		end

		if _WordofGlory_RDY and _HolyPower >= 3 and _Player_Percent_Health <= 40 then
			tinsert(ConRO.SuggestedDefSpells, _WordofGlory);
		end

		if _ShieldofVengeance_RDY then
			tinsert(ConRO.SuggestedDefSpells, _ShieldofVengeance);
		end

		if _DivineShield_RDY and not _Forbearance_BUFF then
			tinsert(ConRO.SuggestedDefSpells, _DivineShield);
		end

		if _BlessingofProtection_RDY and not _Forbearance_BUFF then
			tinsert(ConRO.SuggestedDefSpells, _BlessingofProtection);
		end
	return nil;
end
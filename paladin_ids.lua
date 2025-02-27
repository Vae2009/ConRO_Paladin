local ConRO_Paladin, ids = ...;

--General
	ids.racial = {
		AncestralCall = {spellID = 274738},
		ArcanePulse = {spellID = 260364},
		ArcaneTorrent = {spellID = 50613},
		Berserking = {spellID = 26297},
		Cannibalize = {spellID = 20577},
		GiftoftheNaaru = {spellID = 59548},
		Shadowmeld = {spellID = 58984},
		Warstomp = {spellID = 20549},
	}
	ids.hero_spec = {
		Templar = 48,
		Lightsmith = 49,
		HeraldoftheSun = 50,
	}
	ids.glyph = {
		Queen = 212641,
	}

ids.holy = {
	ability = {
	--Paladin Baseline
		Absolution = {spellID = 212056},
		BeaconofLight = {spellID = 53563},
		Cleanse = {spellID = 4987},
		Consecration = {spellID = 26573},
		CrusaderStrike = {spellID = 35395},
		DivineProtection = {spellID = 498},
		DivineShield = {spellID = 642},
		FlashofLight = {spellID = 19750},
		HammerofJustice = {spellID = 853},
		HandofReckoning = {spellID = 62124},
		HolyLight = {spellID = 82326},
		Intercession = {spellID = 391054},
		Judgment = {spellID = 275773},
		Redemption = {spellID = 7328},
		SenseUndead = {spellID = 5502},
		ShieldoftheRighteous = {spellID = 415091},
		WordofGlory = {spellID = 85673},
	--Passive
		InfusionofLight = {spellID = 53576},
		MasteryLightbringer = {spellID = 183997},
	--Paladin Talents
		LayonHands = {spellID = 633, talentID = 102583},
		AurasoftheResolute = {spellID = 385633, talentID = 102587},
			ConcentrationAura = {spellID = 317920, talentID = 102587},
			CrusaderAura = {spellID = 32223, talentID = 102587},
			DevotionAura = {spellID = 465, talentID = 102587},
		HammerofWrath = {spellID = 24275, talentID = 102479},
		ImprovedCleanse = {spellID = 393024, talentID = 102477},
		EmpyrealWard = {spellID = 387791, talentID = 128255},
		FistofJustice = {spellID = 234299, talentID = 102589},
		Repentance = {spellID = 20066, talentID = 102585},
		BlindingLight = {spellID = 115750, talentID = 102584},
		TurnEvil = {spellID = 10326, talentID = 102623},
		AJustReward = {spellID = 469411, talentID = 128254},
		Afterimage = {spellID = 385414, talentID = 102601},
		DivineSteed = {spellID = 190784, talentID = 102625},
		LightsCountenance = {spellID = 469325, talentID = 128247},
		GreaterJudgment = {spellID = 231644, talentID = 114292},
		WrenchEvil = {spellID = 460720, talentID = 128250},
		StandAgainstEvil = {spellID = 469317, talentID = 128249},
		HolyReprieve = {spellID = 469445, talentID = 128256},
		Cavalier = {spellID = 230332, talentID = 102592},
		DivineSpurs = {spellID = 469409, talentID = 128253},
		SteedofLiberty = {spellID = 469304, talentID = 102624},
		BlessingofFreedom = {spellID = 1044, talentID = 128251},
		Rebuke = {spellID = 96231, talentID = 102591},
		Obduracy = {spellID = 385427, talentID = 102622},
		DivineToll = {spellID = 375576, talentID = 102465},
		EchoingBlessings = {spellID = 387801, talentID = 115872},
		unbound_freedom = {
			spellID = 305394,
			talentID = 131438,
		},
		SanctifiedPlates = {spellID = 402964, talentID = 115034},
		Punishment = {spellID = 403530, talentID = 115444},
		DivineReach = {spellID = 469476, talentID = 115447},
		BlessingofSacrifice = {spellID = 6940, talentID = 102602},
		DivineResonance = {spellID = 386738, talentID = 115466},
		QuickenedInvocations = {spellID = 379391, talentID = 115465},
		BlessingofProtection = {spellID = 1022, talentID = 102604},
		ConsecratedGround = {spellID = 204054, talentID = 102518},
		HolyAegis = {spellID = 385515, talentID = 102597},
		SacrificeoftheJust = {spellID = 384820, talentID = 102595},
		Recompense = {spellID = 384914, talentID = 102594},
		SacredStrength = {spellID = 469337, talentID = 115489},
		DivinePurpose = {spellID = 223817, talentID = 128246},
		ImprovedBlessingofProtection = {spellID = 384909, talentID = 102606},
		UnbreakableSpirit = {spellID = 114154, talentID = 102603},
		LightforgedBlessing = {spellID = 406468, talentID = 128242},
		LeadtheCharge = {spellID = 469780, talentID = 128263},
		WorthySacrifice = {spellID = 469279, talentID = 128261},
		RighteousProtection = {spellID = 469321, talentID = 128248},
		HolyRitual = {spellID = 199422, talentID = 128262},
		BlessedCalling = {spellID = 469770, talentID = 128264},
		InspiredGuard = {spellID = 469439, talentID = 128260},
		JudgmentofLight = {spellID = 183778, talentID = 102596},
		FaithsArmor = {spellID = 406101, talentID = 102464},
		Stoicism = {spellID = 469316, talentID = 128258},
		SealofMight = {spellID = 385450, talentID = 102612},
		SealoftheCrusader = {spellID = 416770, talentID = 116064},
		VengefulWrath = {spellID = 406835, talentID = 128241},
		EyeforanEye = {spellID = 469309, talentID = 102620},
		GoldenPath = {spellID = 377128, talentID = 128252},
		SelflessHealer = {spellID = 469434, talentID = 128309},
		OfDuskandDawn = {spellID = 409439, talentID = 115673},
		Lightbearer = {spellID = 469416, talentID = 128257},
		LightsRevocation = {spellID = 146956, talentID = 128259},
	--Holy Talents
		HolyShock = {spellID = 20473, talentID = 102534},
		Extrication = {spellID = 461278, talentID = 102550},
		LightofDawn = {spellID = 85222, talentID = 102545},
		LightsConviction = {spellID = 414073, talentID = 116376},
		AuraMastery = {spellID = 31821, talentID = 102548},
		BeaconoftheLightbringer = {spellID = 197446, talentID = 102549},
		TowerofRadiance = {spellID = 231642, talentID = 102571},
		TirionsDevotion = {spellID = 414720, talentID = 102556},
		UnendingLight = {spellID = 387998, talentID = 102558},
		Awestruck = {spellID = 417855, talentID = 102544},
		MomentofCompassion = {spellID = 387786, talentID = 102553},
		ResplendentLight = {spellID = 392902, talentID = 102552},
		HolyPrism = {spellID = 114165, talentID = 102561},
		BarrierofFaith = {spellID = 148039, talentID = 102560},
		UnwaveringSpirit = {spellID = 392911, talentID = 102547},
		ProtectionofTyr = {spellID = 200430, talentID = 102546},
		ImbuedInfusions = {spellID = 392961, talentID = 102536},
		LightoftheMartyr = {spellID = 447985, talentID = 102540},
		RighteousJudgment = {spellID = 414113, talentID = 115875},
		DivineFavor = {spellID = 460422, talentID = 102551},
		HandofDivinity = {spellID = 414273, talentID = 115876},
		SavedbytheLight = {spellID = 157047, talentID = 102557},
		LightsProtection = {spellID = 461243, talentID = 115874},
		OverflowingLight = {spellID = 461244, talentID = 102535},
		ShiningRighteousness = {spellID = 414443, talentID = 102541},
		Liberation = {spellID = 461287, talentID = 126571},
		CommandingLight = {spellID = 387781, talentID = 102564},
		GlisteningRadiance = {spellID = 461245, talentID = 102559},
		BreakingDawn = {spellID = 387879, talentID = 102567},
		DivineRevelations = {spellID = 387808, talentID = 102562},
		DivineGlimpse = {spellID = 387805, talentID = 102570},
		BestowLight = {spellID = 448040, talentID = 102539},
		BeaconofFaith = {spellID = 156910, talentID = 102533},
		BeaconofVirtue = {spellID = 200025, talentID = 102532},
		EmpyreanLegacy = {spellID = 387170, talentID = 102576},
		Veneration = {spellID = 392938, talentID = 102565},
		AvengingWrath = {spellID = 31884, talentID = 102569},
		AvengingCrusader = {spellID = 216331, talentID = 102568},
		PoweroftheSilverHand = {spellID = 200474, talentID = 102574},
		TyrsDeliverance = {spellID = 200652, talentID = 102573},
		TruthPrevails = {spellID = 461273, talentID = 102563},
		CrusadersMight = {spellID = 196926, talentID = 102580},
		SanctifiedWrath = {spellID = 53376, talentID = 102578},
		Awakening = {spellID = 414195, talentID = 116205},
		Reclamation = {spellID = 415364, talentID = 102537},
		RelentlessInquisitor = {spellID = 383388, talentID = 102575},
		RisingSunlight = {spellID = 461250, talentID = 102581},
		GloriousDawn = {spellID = 461246, talentID = 115873},
		MercifulAuras = {spellID = 183415, talentID = 102579},
		BlessingofAutumn = {spellID = 388010, talentID = 116183},
			BlessingofSpring = {spellID = 388013, talentID = 116183},
			BlessingofSummer = {spellID = 388007, talentID = 116183},
			BlessingofWinter = {spellID = 388011, talentID = 116183},
		InfloresenceoftheSunwell = {spellID = 392907, talentID = 102577},
		BoundlessSalvation = {spellID = 392951, talentID = 102572},
	--Hero Talents
	--Herald of the Sun
		Dawnlight = {spellID = 431377, talentID = 117696},
		MorningStar = {spellID = 431482, talentID = 117670},
		GleamingRays = {spellID = 431480, talentID = 117778},
		EternalFlame = {spellID = 156322, talentID = 117692},
		Luminosity = {spellID = 431402, talentID = 117677},
		Illumine = {spellID = 431423, talentID = 117695},
		WilloftheDawn = {spellID = 431406, talentID = 117777},
		BlessingofAnshe = {spellID = 445200, talentID = 117668},
		LingeringRadiance = {spellID = 431407, talentID = 117779},
		SunSear = {spellID = 431413, talentID = 117669},
		Aurora = {spellID = 439760, talentID = 117666},
		SolarGrace = {spellID = 431404, talentID = 117691},
		SecondSunrise = {spellID = 431474, talentID = 117683},
		SunsAvatar = {spellID = 431425, talentID = 117702},
	--Lightsmith
		HolyArmaments = {spellID = 432459, talentID = 117882},
			HolyBulwark = {spellID = 432459, talentID = 117882},
			SacredWeapon = {spellID = 432472, talentID = 117882},
		RiteofSanctification = {spellID = 433568, talentID = 117881},
		RiteofAdjuration = {spellID = 433583, talentID = 117880},
		Solidarity = {spellID = 432802, talentID = 117873},
		DivineGuidance = {spellID = 433106, talentID = 117884},
		BlessedAssurance = {spellID = 433015, talentID = 117883},
		LayingDownArms = {spellID = 432866, talentID = 117885},
		DivineInspiration = {spellID = 432964, talentID = 117877},
		Forewarning = {spellID = 432804, talentID = 117876},
		AuthoritativeRebuke = {spellID = 469886, talentID = 117879},
		TemperedinBattle = {spellID = 469701, talentID = 117878},
		SharedResolve = {spellID = 432821, talentID = 117886},
		Valiance = {spellID = 432919, talentID = 117874},
		HammerandAnvil = {spellID = 433718, talentID = 117887},
		BlessingoftheForge = {spellID = 433011, talentID = 117875},
	},
	pvptalent = {

	},
	buff = {
		AvengingWrath = 31884,
		BeaconofFaith = 156910,
		BeaconofLight = 53563,
		ConcentrationAura = 317920,
		Consecration = 188370,
		CrusaderAura = 32223,
		DevotionAura = 465,
		DivineFavor = 210294,
		DivinePurpose = 223819,
		InfusionofLight = 54149,
		RetributionAura = 183435,
		Veneration = 392939,
	},
	debuff = {
		Consecration = 204242,
		Forbearance = 25771,
		Judgment = 197277,
	}
}

ids.protection = {
	ability = {
	--Baseline
		Consecration = {spellID = 26573},
		CrusaderStrike = {spellID = 35395},
		DivineShield = {spellID = 642},
		FlashofLight = {spellID = 19750},
		HammerofJustice = {spellID = 853},
		HandofReckoning = {spellID = 62124},
		Intercession = {spellID = 391054},
		Judgment = {spellID = 275779},
		Redemption = {spellID = 7328},
		SenseUndead = {spellID = 5502},
		ShieldoftheRighteous = {spellID = 53600},
		WordofGlory = {spellID = 85673},
	--Passive
		AegisofLight = {spellID = 353367},
		MasteryDivineBulwark = {spellID = 76671},
		Riposte = {spellID = 161800},
	--Paladin Talents
		LayonHands = {spellID = 633, talentID = 102583},
		AurasoftheResolute = {spellID = 385633, talentID = 102587},
			ConcentrationAura = {spellID = 317920, talentID = 102587},
			CrusaderAura = {spellID = 32223, talentID = 102587},
			DevotionAura = {spellID = 465, talentID = 102587},
		HammerofWrath = {spellID = 24275, talentID = 102479},
		CleanseToxins = {spellID = 213644, talentID = 102476},
		EmpyrealWard = {spellID = 387791, talentID = 128255},
		FistofJustice = {spellID = 234299, talentID = 102589},
		Repentance = {spellID = 20066, talentID = 102585},
		BlindingLight = {spellID = 115750, talentID = 102584},
		TurnEvil = {spellID = 10326, talentID = 102623},
		AJustReward = {spellID = 469411, talentID = 128254},
		Afterimage = {spellID = 385414, talentID = 115480},
		DivineSteed = {spellID = 190784, talentID = 102625},
		LightsCountenance = {spellID = 469325, talentID = 128247},
		GreaterJudgment = {spellID = 231663, talentID = 102590},
		WrenchEvil = {spellID = 460720, talentID = 128250},
		StandAgainstEvil = {spellID = 469317, talentID = 128249},
		HolyReprieve = {spellID = 469445, talentID = 128256},
		Cavalier = {spellID = 230332, talentID = 102592},
		DivineSpurs = {spellID = 469409, talentID = 128253},
		SteedofLiberty = {spellID = 469304, talentID = 102624},
		BlessingofFreedom = {spellID = 1044, talentID = 128251},
		Rebuke = {spellID = 96231, talentID = 102591},
		Obduracy = {spellID = 385427, talentID = 102622},
		DivineToll = {spellID = 375576, talentID = 102465},
		UnboundFreedom = {spellID = 305394, talentID = 115479},
		SanctifiedPlates = {spellID = 402964, talentID = 115034},
		Punishment = {spellID = 403530, talentID = 115444},
		DivineReach = {spellID = 469476, talentID = 115447},
		BlessingofSacrifice = {spellID = 6940, talentID = 102602},
		DivineResonance = {spellID = 386738, talentID = 102443},
		QuickenedInvocations = {spellID = 379391, talentID = 115168},
		BlessingofProtection = {spellID = 1022, talentID = 102604},
		ConsecratedGround = {spellID = 204054, talentID = 102518},
		HolyAegis = {spellID = 385515, talentID = 102597},
		SacrificeoftheJust = {spellID = 384820, talentID = 102595},
		Recompense = {spellID = 384914, talentID = 102594},
		SacredStrength = {spellID = 469337, talentID = 115490},
		DivinePurpose = {spellID = 223817, talentID = 128244},
		ImprovedBlessingofProtection = {spellID = 384909, talentID = 102606},
		UnbreakableSpirit = {spellID = 114154, talentID = 102603},
		LightforgedBlessing = {spellID = 406468, talentID = 128240},
		LeadtheCharge = {spellID = 469780, talentID = 128263},
		WorthySacrifice = {spellID = 469279, talentID = 128261},
		RighteousProtection = {spellID = 469321, talentID = 128248},
		HolyRitual = {spellID = 199422, talentID = 128262},
		BlessedCalling = {spellID = 469770, talentID = 128264},
		InspiredGuard = {spellID = 469439, talentID = 128260},
		JudgmentofLight = {spellID = 183778, talentID = 102596},
		FaithsArmor = {spellID = 406101, talentID = 102464},
		Stoicism = {spellID = 469316, talentID = 128258},
		SealofMight = {spellID = 385450, talentID = 102612},
		SealoftheCrusader = {spellID = 416770, talentID = 116064},
		ZealotsParagon = {spellID = 391142, talentID = 102616},
		EyeforanEye = {spellID = 469309, talentID = 102620},
		GoldenPath = {spellID = 377128, talentID = 128252},
		SelflessHealer = {spellID = 469434, talentID = 128309},
		OfDuskandDawn = {spellID = 409441, talentID = 115672},
		Lightbearer = {spellID = 469416, talentID = 128257},
		LightsRevocation = {spellID = 146956, talentID = 128259},
	--Protection Talents
		AvengersShield = {spellID = 31935, talentID = 102471},
		HolyShield = {spellID = 152261, talentID = 102455},
		HammeroftheRighteous = {spellID = 53595, talentID = 102431},
		BlessedHammer = {spellID = 204019, talentID = 102430},
		InnerLight = {spellID = 386568, talentID = 102463},
		Redoubt = {spellID = 280373, talentID = 102462},
		GrandCrusader = {spellID = 85043, talentID = 102453},
		ShiningLight = {spellID = 321136, talentID = 102467},
		ImprovedHolyShield = {spellID = 393030, talentID = 102452},
		InspiringVanguard = {spellID = 393022, talentID = 102439},
		ArdentDefender = {spellID = 31850, talentID = 102445},
		BarricadeofFaith = {spellID = 385726, talentID = 102470},
		Sanctuary = {spellID = 379021, talentID = 102451},
		RefiningFire = {spellID = 469883, talentID = 102459},
		BulwarkofOrder = {spellID = 209389, talentID = 102468},
		ImprovedArdentDefender = {spellID = 393114, talentID = 111887},
		BlessingofSpellwarding = {spellID = 204018, talentID = 111886},
		LightoftheTitans = {spellID = 378405, talentID = 102472},
		TirionsDevotion = {spellID = 392928, talentID = 125873},
		ConsecrationinFlame = {spellID = 379022, talentID = 102432},
		TyrsEnforcer = {spellID = 378285, talentID = 102437},
		RelentlessInquisitor = {spellID = 383388, talentID = 102475},
		AvengingWrath = {spellID = 31884, talentID = 102448},
		Sentinel = {spellID = 389539, talentID = 102447},
		SealofCharity = {spellID = 384815, talentID = 102600},
		FaithintheLight = {spellID = 379043, talentID = 102450},
		SoaringShield = {spellID = 378457, talentID = 102434},
		SealofReprisal = {spellID = 377053, talentID = 102621},
		GuardianofAncientKings = {spellID = 86659, talentID = 102456},
		HandoftheProtector = {spellID = 315924, talentID = 102438},
		CrusadersJudgment = {spellID = 204023, talentID = 102436},
		FocusedEnmity = {spellID = 378845, talentID = 102435},
		GiftoftheGoldenValkyr = {spellID = 378279, talentID = 102449},
		SanctifiedWrath = {spellID = 53376, talentID = 128278},
		UthersCounsel = {spellID = 378425, talentID = 102469},
		StrengthinAdversity = {spellID = 393071, talentID = 102461},
		CrusadersResolve = {spellID = 380188, talentID = 102460},
		FerrenMarcussFervor = {spellID = 378762, talentID = 102446},
		EyeofTyr = {spellID = 387174, talentID = 102466},
		ResoluteDefender = {spellID = 385422, talentID = 102433},
		BastionofLight = {spellID = 378974, talentID = 102454},
		MomentofGlory = {spellID = 327193, talentID = 102474},
		BulwarkofRighteousFury = {spellID = 386653, talentID = 102457},
		InmostLight = {spellID = 405757, talentID = 115167},
		FinalStand = {spellID = 204077, talentID = 102473},
		RighteousProtector = {spellID = 204074, talentID = 102440},
	--Hero Talents
	--Lightsmith
		HolyArmaments = {spellID = 432459, talentID = 117882},
			HolyBulwark = {spellID = 432459, talentID = 117882},
			SacredWeapon = {spellID = 432472, talentID = 117882},
		RiteofSanctification = {spellID = 433568, talentID = 117881},
		RiteofAdjuration = {spellID = 433583, talentID = 117880},
		Solidarity = {spellID = 432802, talentID = 117873},
		DivineGuidance = {spellID = 433106, talentID = 117884},
		BlessedAssurance = {spellID = 433015, talentID = 117883},
		LayingDownArms = {spellID = 432866, talentID = 117885},
		DivineInspiration = {spellID = 432964, talentID = 117877},
		Forewarning = {spellID = 432804, talentID = 117876},
		AuthoritativeRebuke = {spellID = 469886, talentID = 117879},
		TemperedinBattle = {spellID = 469701, talentID = 117878},
		SharedResolve = {spellID = 432821, talentID = 117886},
		Valiance = {spellID = 432919, talentID = 117874},
		HammerandAnvil = {spellID = 433718, talentID = 117887},
		BlessingoftheForge = {spellID = 433011, talentID = 117875},
	--Templar
		LightsGuidance = {spellID = 427445, talentID = 117813},
			HammerofLight = {spellID = 427453, talentID = 117813},
		ZealousVindication = {spellID = 431463, talentID = 117816},
		ForWhomtheBellTolls = {spellID = 432929, talentID = 117859},
		ShaketheHeavens = {spellID = 431533, talentID = 117823},
		WrathfulDescent = {spellID = 431551, talentID = 117810},
		SacrosanctCrusade = {spellID = 431730, talentID = 117812},
		HigherCalling = {spellID = 431687, talentID = 117811},
		BondsofFellowship = {spellID = 432992, talentID = 117814},
		UnrelentingCharger = {spellID = 432990, talentID = 117858},
		EndlessWrath = {spellID = 432615, talentID = 117820},
		Sanctification = {spellID = 432977, talentID = 117819},
		Hammerfall = {spellID = 432463, talentID = 117818},
		UndisputedRuling = {spellID = 432626, talentID = 117822},
		LightsDeliverance = {spellID = 425518, talentID = 117815},
	},
	pvptalent = {

	},
	buff = {
		ArdentDefender = 31850,
		AvengersValor = 197561,
		AvengingWrath = 31884,
		BastionofLight = 378974,
		BlessingofDawn = 385127,
		BulwarkofRighteousFury = 386652,
		ConcentrationAura = 317920,
		Consecration = 188370,
		CrusaderAura = 32223,
		DevotionAura = 465,
		DivinePurpose = 223819,
		GuardianofAncientKings = 86659,
		MomentofGlory = 327193,
		Redoubt = 280375,
		RetributionAura = 183435,
		ShaketheHeavens = 431536,
		ShieldoftheRighteous = 132403,
		ShiningLight = 327510,
		ShiningLight_Stack = 182104,
	},
	debuff = {
		BlessedHammer = 204301,
		Forbearance = 25771,
		Judgment = 197277,
	}
}

ids.retribution = {
	ability = {
	--Baseline
		CrusaderStrike = {spellID = 35395},
		DivineShield = {spellID = 642},
		DivineProtection = {spellID = 403876},
		FlashofLight = {spellID = 19750},
		HammerofJustice = {spellID = 853},
		HandofReckoning = {spellID = 62124},
		Intercession = {spellID = 391054},
		Judgment = {spellID = 20271},
		Redemption = {spellID = 7328},
		SenseUndead = {spellID = 5502},
		ShieldoftheRighteous = {spellID = 53600},
		TemplarsVerdict = {spellID = 85256},
		WordofGlory = {spellID = 85673},
	--Passive
		ConsecratedBlade = {spellID = 462970},
		InstrumentsofRetribution = {spellID = 404752},
		MasteryHighlordsJudgment = {spellID = 267316},
	--Paladin Talents
		LayonHands = {spellID = 633, talentID = 102583},
		AurasoftheResolute = {spellID = 385633, talentID = 102587},
			ConcentrationAura = {spellID = 317920, talentID = 102587},
			CrusaderAura = {spellID = 32223, talentID = 102587},
			DevotionAura = {spellID = 465, talentID = 102587},
		HammerofWrath = {spellID = 24275, talentID = 102479},
		CleanseToxins = {spellID = 213644, talentID = 102476},
		EmpyrealWard = {spellID = 387791, talentID = 128255},
		FistofJustice = {spellID = 234299, talentID = 102589},
		Repentance = {spellID = 20066, talentID = 102585},
		BlindingLight = {spellID = 115750, talentID = 102584},
		TurnEvil = {spellID = 10326, talentID = 102623},
		AJustReward = {spellID = 469411, talentID = 128254},
		Afterimage = {spellID = 385414, talentID = 115482},
		HealingHands = {spellID = 326734, talentID = 115481},
		DivineSteed = {spellID = 190784, talentID = 102625},
		LightsCountenance = {spellID = 469325, talentID = 128247},
		GreaterJudgment = {spellID = 231663, talentID = 102590},
		WrenchEvil = {spellID = 460720, talentID = 128250},
		StandAgainstEvil = {spellID = 469317, talentID = 128249},
		HolyReprieve = {spellID = 469445, talentID = 128256},
		Cavalier = {spellID = 230332, talentID = 102592},
		DivineSpurs = {spellID = 469409, talentID = 128253},
		SteedofLiberty = {spellID = 469304, talentID = 102624},
		BlessingofFreedom = {spellID = 1044, talentID = 128251},
		Rebuke = {spellID = 96231, talentID = 102591},
		Obduracy = {spellID = 385427, talentID = 102622},
		DivineToll = {spellID = 375576, talentID = 102465},
		UnboundFreedom = {spellID = 305394, talentID = 115454},
		SanctifiedPlates = {spellID = 402964, talentID = 115034},
		Punishment = {spellID = 403530, talentID = 115444},
		DivineReach = {spellID = 469476, talentID = 115447},
		BlessingofSacrifice = {spellID = 6940, talentID = 102602},
		DivineResonance = {spellID = 384027, talentID = 115468},
		QuickenedInvocations = {spellID = 379391, talentID = 115467},
		BlessingofProtection = {spellID = 1022, talentID = 102604},
		ConsecratedGround = {spellID = 204054, talentID = 102518},
		HolyAegis = {spellID = 385515, talentID = 102597},
		SacrificeoftheJust = {spellID = 384820, talentID = 102595},
		Recompense = {spellID = 384914, talentID = 102594},
		SacredStrength = {spellID = 469337, talentID = 102608},
		DivinePurpose = {spellID = 408459, talentID = 128243},
		ImprovedBlessingofProtection = {spellID = 384909, talentID = 102606},
		UnbreakableSpirit = {spellID = 114154, talentID = 102603},
		LightforgedBlessing = {spellID = 403479, talentID = 115239},
		LeadtheCharge = {spellID = 469780, talentID = 128263},
		WorthySacrifice = {spellID = 469279, talentID = 128261},
		RighteousProtection = {spellID = 469321, talentID = 128248},
		HolyRitual = {spellID = 199422, talentID = 128262},
		BlessedCalling = {spellID = 469770, talentID = 128264},
		InspiredGuard = {spellID = 469439, talentID = 128260},
		JudgmentofLight = {spellID = 183778, talentID = 102596},
		FaithsArmor = {spellID = 406101, talentID = 102464},
		Stoicism = {spellID = 469316, talentID = 128258},
		SealofMight = {spellID = 385450, talentID = 102612},
		SealoftheCrusader = {spellID = 416770, talentID = 116064},
		VengefulWrath = {spellID = 406835, talentID = 128239},
		EyeforanEye = {spellID = 469309, talentID = 102620},
		GoldenPath = {spellID = 377128, talentID = 128252},
		SelflessHealer = {spellID = 469434, talentID = 128309},
		OfDuskandDawn = {spellID = 385125, talentID = 102615},
		Lightbearer = {spellID = 469416, talentID = 128257},
		LightsRevocation = {spellID = 146956, talentID = 128259},
	--Retribution Talents
		BladeofJustice = {spellID = 184575, talentID = 102498},
		DivineStorm = {spellID = 53385, talentID = 102499},
		SwiftJustice = {spellID = 383228, talentID = 102491},
		LightofJustice = {spellID = 404436, talentID = 114828},
		Expurgation = {spellID = 383344, talentID = 114830},
		JudgmentofJustice = {spellID = 403495, talentID = 115440},
		ImprovedBladeofJustice = {spellID = 403745, talentID = 115023},
		HolyBlade = {spellID = 383342, talentID = 115022},
		FinalVerdict = {spellID = 383328, talentID = 102504},
		JusticarsVengeance = {spellID = 215661, talentID = 114831},
		LightsCelerity = {spellID = 403698, talentID = 102503},
		GuidedPrayer = {spellID = 404357, talentID = 115020},
		RighteousCause = {spellID = 402912, talentID = 102494},
		ArtofWar = {spellID = 406064, talentID = 102493},
		Jurisdiction = {spellID = 402971, talentID = 102516},
		InquisitorsIre = {spellID = 403975, talentID = 115164},
		TempestoftheLightbringer = {spellID = 383396, talentID = 115452},
		AvengingWrath = {spellID = 31884, talentID = 102519},
		Crusade = {spellID = 231895, talentID = 125129},
		VanguardsMomentum = {spellID = 383314, talentID = 114826},
		Sanctify = {spellID = 382536, talentID = 115488},
		ZealotsFervor = {spellID = 403509, talentID = 115165},
		RushofLight = {spellID = 407067, talentID = 115475},
		ImprovedJudgment = {spellID = 405461, talentID = 102505},
		BoundlessJudgment = {spellID = 405278, talentID = 115021},
		CrusadingStrikes = {spellID = 404542, talentID = 115474},
		TemplarStrikes = {spellID = 406646, talentID = 115473},
			TemplarSlash = {spellID = 406647, talentID = 115473},
			TemplarStrike = {spellID = 407480, talentID = 115473},
		DivineWrath = {spellID = 406872, talentID = 115439},
		DivineHammer = {spellID = 198034, talentID = 115016},
		BladeofVengeance = {spellID = 403826, talentID = 102521},
		HolyFlames = {spellID = 406545, talentID = 115438},
		EmpyreanLegacy = {spellID = 387170, talentID = 115453},
		HeartoftheCrusader = {spellID = 406154, talentID = 115483},
		HighlordsWrath = {spellID = 404512, talentID = 102506},
		WakeofAshes = {spellID = 255937, talentID = 102497},
		BlessedChampion = {spellID = 403010, talentID = 102515},
		EmpyreanPower = {spellID = 326732, talentID = 115051},
		JudgeJuryandExecutioner = {spellID = 405607, talentID = 115477},
		Adjudiction = {spellID = 406157, talentID = 102511},
		AegisofProtection = {spellID = 403654, talentID = 102526},
		ShieldofVengeance = {spellID = 184662, talentID = 125130},
		Penitence = {spellID = 403026, talentID = 115024},
		BladesofLight = {spellID = 403664, talentID = 115443},
		FinalReckoning = {spellID = 343721, talentID = 102513},
		ExecutionSentence = {spellID = 343527, talentID = 115435},
		SeethingFlames = {spellID = 405355, talentID = 115043},
		BurningCrusade = {spellID = 405289, talentID = 102510},
		DivineArbiter = {spellID = 404306, talentID = 102514},
		ExecutionersWill = {spellID = 406940, talentID = 102524},
		DivineAuxiliary = {spellID = 406158, talentID = 102512},
		RadiantGlory = {spellID = 458359, talentID = 102525},
		BurntoAsh = {spellID = 446663, talentID = 114824},
		SearingLight = {spellID = 404540, talentID = 102530},
	--Hero Talents
	--Herald of the Sun
		Dawnlight = {spellID = 431377, talentID = 117696},
		MorningStar = {spellID = 431482, talentID = 117670},
		GleamingRays = {spellID = 431480, talentID = 117778},
		EternalFlame = {spellID = 156322, talentID = 117692},
		Luminosity = {spellID = 431402, talentID = 117677},
		Illumine = {spellID = 431423, talentID = 117695},
		WilloftheDawn = {spellID = 431406, talentID = 117777},
		BlessingofAnshe = {spellID = 445200, talentID = 117668},
		LingeringRadiance = {spellID = 431407, talentID = 117779},
		SunSear = {spellID = 431413, talentID = 117669},
		Aurora = {spellID = 439760, talentID = 117666},
		SolarGrace = {spellID = 431404, talentID = 117691},
		SecondSunrise = {spellID = 431474, talentID = 117683},
		SunsAvatar = {spellID = 431425, talentID = 117702},
	--Templar
		LightsGuidance = {spellID = 427445, talentID = 117813},
			HammerofLight = {spellID = 427453, talentID = 117813},
		ZealousVindication = {spellID = 431463, talentID = 117816},
		ForWhomtheBellTolls = {spellID = 432929, talentID = 117859},
		ShaketheHeavens = {spellID = 431533, talentID = 117823},
		WrathfulDescent = {spellID = 431551, talentID = 117810},
		SacrosanctCrusade = {spellID = 431730, talentID = 117812},
		HigherCalling = {spellID = 431687, talentID = 117811},
		BondsofFellowship = {spellID = 432992, talentID = 117814},
		UnrelentingCharger = {spellID = 432990, talentID = 117858},
		EndlessWrath = {spellID = 432615, talentID = 117820},
		Sanctification = {spellID = 432977, talentID = 117819},
		Hammerfall = {spellID = 432463, talentID = 117818},
		UndisputedRuling = {spellID = 432626, talentID = 117822},
		LightsDeliverance = {spellID = 425518, talentID = 117815},
	},
	pvptalent = {
		Luminescence = 199428,
		UnboundFreedom = 305394,
		VengeanceAura = 210323,
		BlessingofSanctuary = 210256,
		UltimateRetribution = 287947,
		Lawbringer = 246806,
		DivinePunisher = 204914,
		Jurisdiction = 204979,
		LawandOrder = 204934,
		CleansingLight = 236186,
	},
	buff = {
		AvengingWrath = 31884,
		BlessingofAnshe = 445206,
		ConcentrationAura = 317920,
		Consecration = 188370,
		Crusade = 231895,
		CrusaderAura = 32223,
		DevotionAura = 465,
		DivineArbiter = 406975,
		EmpyreanLegacy = 387178,
		EndlessWrath = 452244,
		FinalVerdict = 383329,
		RighteousVerdict = 267611,
		DivinePurpose = 223819,
		EmpyreanPower = 326733,
		RetributionAura = 183435,
	},
	debuff = {
		Consecration = 204242,
		Expurgation = 383346,
		Forbearance = 25771,
		Judgment = 197277,
	},
}
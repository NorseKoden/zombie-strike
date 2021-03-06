local HttpService = game:GetService("HttpService")

return function()
	local MockPlayer = {}

	MockPlayer.None = newproxy(true)

	MockPlayer.Version = 10
	MockPlayer.GameVersion = 1

	MockPlayer.CodesUsed = {}

	-- Only tracks campaigns that lock difficulty behind TimesPlayed
	MockPlayer.CampaignsPlayed = {}

	MockPlayer.Dailies = {
		Time = 0,
		Streak = 1,
	}

	MockPlayer.Quests = {
		Day = 0,
		Quests = {},
	}

	MockPlayer.UpgradedSomething = false

	MockPlayer.LastKnownDifficulties = { ["1"] = 1 }
	MockPlayer.BoughtThisRotation = {}

	-- Stats
	MockPlayer.DamageDealt = 0
	MockPlayer.DungeonsPlayed = 0
	MockPlayer.LootEarned = 0
	MockPlayer.RoomsCleared = 0
	MockPlayer.ZombiesKilled = 0
	MockPlayer.LegendariesObtained = 0

	MockPlayer.LegendaryBonus = false
	MockPlayer.DungeonsSinceLastLegendary = 1
	MockPlayer.Level = 1
	MockPlayer.XP = 0
	MockPlayer.Gold = 0
	MockPlayer.Brains = 0
	MockPlayer.PetCoins = 1000
	MockPlayer.Vouchers = 0
	MockPlayer.VoucherUsedEver = false

	MockPlayer.TimeBossDefeated = 0

	MockPlayer.Weapon = {
		Type = "Pistol",
		Level = 1,
		Rarity = 1,

		Bonus = 0,
		Favorited = false,
		Seed = 0,

		Perks = {},

		Model = 1,
		UUID = HttpService:GenerateGUID(false):gsub("-", ""),
	}

	MockPlayer.Armor = {
		Type = "Armor",
		Level = 1,
		Rarity = 1,

		Upgrades = 0,
		Favorited = false,

		Model = 1,
		UUID = HttpService:GenerateGUID(false):gsub("-", ""),
	}

	MockPlayer.Helmet = {
		Type = "Helmet",
		Level = 1,
		Rarity = 1,

		Upgrades = 0,
		Favorited = false,

		Model = 1,
		UUID = HttpService:GenerateGUID(false):gsub("-", ""),
	}

	MockPlayer.EquippedWeapon = 1
	MockPlayer.EquippedArmor = 2
	MockPlayer.EquippedHelmet = 3
	MockPlayer.EquippedPet = MockPlayer.None

	MockPlayer.EquippedHealthPack = 1
	MockPlayer.EquippedGrenade = 1

	MockPlayer.Inventory = {
		MockPlayer.Weapon,
		MockPlayer.Armor,
		MockPlayer.Helmet,
	}

	MockPlayer.Cosmetics = {
		Owned = {},
		Equipped = {},
		LastSeen = 0,
	}

	MockPlayer.Equipment = {
		HealthPack = { 1 },
		Grenade = { 1 },
	}

	MockPlayer.Sprays = {
		Owned = {},
		Equipped = nil,
	}

	MockPlayer.Fonts = {
		Owned = {},
		Equipped = nil,
	}

	MockPlayer.Titles = {
		Owned = {},
		Equipped = nil,
	}

	MockPlayer.ZombiePass = {
		Level = 1,
		XP = 0,
		Premium = false,
	}

	MockPlayer.CollectionLog = {}

	MockPlayer.Settings = {}
	MockPlayer.XPExpires = 0

	MockPlayer.EpicFails = {}

	return MockPlayer
end

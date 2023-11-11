-- Combat Settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp-enforced"
hotkeyAimbotEnabled = true
protectionLevel = 1
killsToRedSkull = 3
killsToBlackSkull = 6
pzLocked = 60000
removeChargesFromRunes = true
removeChargesFromPotions = true
removeWeaponAmmunition = true
removeWeaponCharges = true
timeToDecreaseFrags = 24 * 60 * 60
whiteSkullTime = 15 * 60
stairJumpExhaustion = 2000
experienceByKillingPlayers = true
expFromPlayersLevelRange = 9999

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
-- allowWalkthrough is only applicable to players
ip = "127.0.0.1"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 0
motd = "Welcome to The Forgotten Server v1.41!"
onePlayerOnlinePerAccount = true
allowClones = false
allowWalkthrough = true
serverName = "Forgotten"
statusTimeout = 5000
replaceKickOnLogin = true
maxPacketsPerSecond = 25

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default death penalty formula
-- for the old formula, set it to 10
-- for no skill/experience loss, set it to 0
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
-- valid values for houseRentPeriod are: "daily", "weekly", "monthly", "yearly"
-- use "never" or any other value to disable the rent system
housePriceEachSQM = 1000
houseRentPeriod = "daily"
houseOwnedByAccount = false
houseDoorShowPrice = true
onlyInvitedCanMoveHouseItems = true

-- Item Usage
timeBetweenActions = 200
timeBetweenExActions = 1000

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "forgotten"
mapAuthor = "Komic"

-- Market
marketOfferDuration = 7 * 24 * 60 * 60
premiumToCreateMarketOffer = true
checkExpiredMarketOffersEachMinutes = 60
maxMarketOffersAtATimePerPlayer = 10

-- MySQL
-- NOTE: Remember to avoid using mysqlUser "root" on a production server and always
-- include a strong password to protect your database and server from intrusion
mysqlHost = "127.0.0.1"
mysqlUser = "root"
mysqlPass = ""
mysqlDatabase = "forgottenserver"
mysqlPort = 3306
mysqlSock = ""

-- Misc
-- NOTE: classicAttackSpeed set to true makes players constantly attack at regular intervals
-- regardless of other actions such as item (potion) use
-- this setting may cause high CPU usage with many players and potentially affect performance
-- forceMonsterTypesOnLoad loads all monster types on startup to validate them
-- you can disable it to save some memory if you don't see any errors at startup
allowChangeOutfit = true
freePremium = false
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
emoteSpells = false
classicEquipmentSlots = false
classicAttackSpeed = false
showScriptsLogInConsole = false
showOnlineStatusInCharlist = false
yellMinimumLevel = 1
yellAlwaysAllowPremium = false
forceMonsterTypesOnLoad = true
cleanProtectionZones = true
luaItemDesc = false
showPlayerLogInConsole = true

-- VIP & Depot Limits
-- NOTE: you can set custom limits per group in data/XML/groups.xml
vipFreeLimit = 20
vipPremiumLimit = 100
depotFreeLimit = 2000
depotPremiumLimit = 10000

-- World Light
-- NOTE: if defaultWorldLight is set to true the world light algorithm will be handled in the sources
-- set it to false to avoid conflicts if you wish
-- to make use of the function setWorldLight(level, color)
defaultWorldLight = true

-- Server Save
-- NOTE: serverSaveNotifyDuration in minutes
serverSaveNotifyMessage = true
serverSaveNotifyDuration = 5
serverSaveCleanMap = true
serverSaveClose = false
serverSaveShutdown = false

-- Experience Stages
-- NOTE: to use a flat experience multiplier, set experienceStages to nil
-- or create a stage with minlevel 1 and no maxlevel
-- minlevel and multiplier are MANDATORY
-- maxlevel is OPTIONAL, but is considered infinite by default
experienceStages = {
	{ minlevel = 1, maxlevel = 9, multiplier = 100 },
	{ minlevel = 10, maxlevel = 19, multiplier = 90 },
	{ minlevel = 20, maxlevel = 29, multiplier = 80 },
	{ minlevel = 30, maxlevel = 39, multiplier = 70 },
	{ minlevel = 40, maxlevel = 49, multiplier = 60 },
	{ minlevel = 50, maxlevel = 59, multiplier = 50 },
	{ minlevel = 60, maxlevel = 69, multiplier = 40 },
	{ minlevel = 70, maxlevel = 79, multiplier = 30 },
	{ minlevel = 80, maxlevel = 89, multiplier = 20 },
	{ minlevel = 90, maxlevel = 99, multiplier = 10 },
	{ minlevel = 100, maxlevel = 199, multiplier = 9 },
	{ minlevel = 200, maxlevel = 299, multiplier = 8 },
	{ minlevel = 300, maxlevel = 399, multiplier = 7 },
	{ minlevel = 400, maxlevel = 499, multiplier = 6 },
	{ minlevel = 500, maxlevel = 599, multiplier = 5 },
	{ minlevel = 600, maxlevel = 699, multiplier = 4 },
	{ minlevel = 700, maxlevel = 799, multiplier = 3 },
	{ minlevel = 800, maxlevel = 899, multiplier = 2 },
	{ minlevel = 900, maxlevel = 999, multiplier = 1 },
	{ minlevel = 1000, multiplier = 0.5 }
}

-- Rates
-- NOTE: rateExp is not used if you have enabled stages above
-- hardcoreMultiplier only applies to the 'hardcore player' group (Exp only for now)
hardcoreMultiplier = 2
rateExp = 10
rateSkill = 10
rateLoot = 10
rateMagic = 10
rateSpawn = 1

-- Monster Despawn Config
-- despawnRange is the amount of floors a monster can be from its spawn position
-- despawnRadius is how many tiles away it can be from its spawn position
-- removeOnDespawn will remove the monster if true or teleport it back to its spawn position if false
-- walkToSpawnRadius is the allowed distance that the monster will stay away from spawn position when left with no targets, 0 to disable
deSpawnRange = 2
deSpawnRadius = 50
removeOnDespawn = true
walkToSpawnRadius = 15

-- Stamina
staminaSystem = true

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = true

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process priority, valid values are: "normal", "above-normal", "high"
-- "normal" is sufficient on development servers while "high" is recommended on production servers
defaultPriority = "high"
startupDatabaseOptimization = false

-- Status Server Information
ownerName = "zeeb1337"
ownerEmail = ""
url = "https://otland.net/"
location = "Sweden"
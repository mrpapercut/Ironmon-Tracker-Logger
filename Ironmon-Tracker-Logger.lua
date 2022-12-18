local json = require("json")

LoggerData = {
	currentSeed = 0,
	ballChosen = 0,
	totalNumberSteps = 0,
	totalBattles = 0,
	totalWildBattles = 0,
	badgesEarned = {
		-- {
		-- 	badgeName = "",
		-- 	pokemonLevel = 0
		-- }
	},
	currentMon = nil, -- Current lead mon
	starterMon = nil, -- Mon you started with
	evolutionMon = nil, -- Mon you evolved into
	pivotMon = nil, -- Mon you pivoted to
	trainerID = 0,
	rivalID = 0,
	enemyMon = nil,
	encounters = {},
	healingItems = {}
}

IronmonTrackerLogger = {}

function IronmonTrackerLogger.startLogger()
	collectgarbage()

	if PokemonData == nil then
		print("\nLogger should be loaded after Ironmon-Tracker")

		return false
	end

	IronmonTrackerLogger.Run()
end

function IronmonTrackerLogger.Run()
	-- n * 60 frames = n seconds
	local fastInterval = 0.25 * 60
	local slowInterval = 3 * 60
	local i = 0

	IronmonTrackerLogger.checkExistingData()

	while true do
		i = i + 1

		if IronmonTrackerLogger.gameReadyForTracking() then
			if (i % slowInterval) == 0 then
				print("---")
				IronmonTrackerLogger.updateSlowInterval()
				i = 0
			end

			if (i % fastInterval) == 0 then
				IronmonTrackerLogger.updateFastInterval()
			end
		end

		emu.frameadvance()
	end
end

function IronmonTrackerLogger.checkExistingData()
	if Main == nil then return end

	local file = io.open("./logs/seed" .. Main.currentSeed .. ".json", "r")

	if file ~= nil then
		local existingData = file:read()

		if existingData ~= nil then
			LoggerData = json.decode(existingData)
		end
		file:close()
	end
end

function IronmonTrackerLogger.gameReadyForTracking()
	-- No need to check if the game hasn't started
	if IronmonTrackerLogger.gameHasStarted() == false then
		return false
	end

	-- No need to log anything before a player has a pokemon
	if IronmonTrackerLogger.playerHasPokemon() == false then
		return false
	end

	return true
end

function IronmonTrackerLogger.gameHasStarted()
	return Tracker ~= nil and Tracker.Data.trainerID ~= nil
end

function IronmonTrackerLogger.playerHasPokemon()
	return Tracker ~= nil and Tracker.Data.ownTeam[1] ~= nil and Tracker.Data.ownTeam[1] ~= 0
end

function IronmonTrackerLogger.updateSlowInterval()
	LoggerData.currentSeed = Main.currentSeed
	LoggerData.totalBattles = Utils.getGameStat(Constants.GAME_STATS.TOTAL_BATTLES)
	LoggerData.totalWildBattles = Utils.getGameStat(Constants.GAME_STATS.WILD_BATTLES)
	LoggerData.totalNumberSteps = Program.Pedometer.totalSteps

	IronmonTrackerLogger.getHealingItems()

	IronmonTrackerLogger.getChosenBall()

	if LoggerData.starterMon == nil then
		IronmonTrackerLogger.getStarterMon()
	end

	-- Should only fill this in once, because the first fight is always against Rival
	if LoggerData.rivalID == 0 then
		IronmonTrackerLogger.getRivalID()
	end
end

function IronmonTrackerLogger.updateFastInterval()
	-- Update own mon
	IronmonTrackerLogger.checkStarterForUpdates()

	if Battle.inBattle ~= false then
		-- Check if we entered a new encounter
		IronmonTrackerLogger.checkNewEncounter()
		-- Update current encounter
		IronmonTrackerLogger.updateEncounter()
	end

	IronmonTrackerLogger.logTrackerData()
end

function IronmonTrackerLogger.logTrackerData()
	local file = io.open("./parselogger/logs/seed" .. Main.currentSeed .. ".json", "w")

	if file ~= nil then
		file:write(json.encode(LoggerData))
		file:close()
	end
end

function IronmonTrackerLogger.getEmptyMon()
	return {
		id = 0,
		name = nil,
		nickname = nil,
		bst = 0,
		level = 0,
		currentHP = 0,
		status = {},
		stats = {},
		abilities = {},
	}
end

function IronmonTrackerLogger.getChosenBall()
	-- TODO implement getting chosen ball
	-- either find a way to read that directly, or get starters and see which one is starterMon
	LoggerData.ballChosen = 0
end

function IronmonTrackerLogger.getStarterMon()
	local starterMon = Tracker.getPokemon(1, true)

	starterMon = IronmonTrackerLogger.mapIdsToStrings(starterMon)

	LoggerData.starterMon = starterMon
	LoggerData.currentMon = starterMon
	LoggerData.trainerID = LoggerData.starterMon.trainerID
end

-- Should update moves when learning new moves, when status changes, or when leveling up
function IronmonTrackerLogger.checkStarterForUpdates()
	if LoggerData.currentMon == nil then
		return
	end

	local updatedMon = Tracker.getPokemon(1, true)
	if updatedMon == nil then -- Something went horribly wrong here
		return
	end

	-- If we pivot (or evolve? does personality change when evolving?)
	if LoggerData.currentMon.personality ~= updatedMon.personality then
		-- Update the whole mon
		updatedMon = IronmonTrackerLogger.mapIdsToStrings(updatedMon)

		LoggerData.pivotMon = updatedMon
		LoggerData.currentMon = updatedMon

		return
	end

	-- Mon leveled up
	if LoggerData.currentMon.level ~= updatedMon.level then
		if LoggerData.currentMon.pokemonID ~= updatedMon.pokemonID then -- we've got an evolution
			LoggerData.evolutionMon = updatedMon
		end

		LoggerData.currentMon = updatedMon
		return
	end

	-- Mon changed HP
	if LoggerData.currentMon.curHP ~= updatedMon.curHP then
		LoggerData.currentMon.curHP = updatedMon.curHP
	end

	for key, val in pairs(updatedMon.moves) do
		if LoggerData.currentMon.moves[key].name ~= val.name then
			LoggerData.currentMon.moves[key] = val
		end
	end

	LoggerData.currentMon.statusName = IronmonTrackerLogger.getStatusName(LoggerData.currentMon.status)
	LoggerData.currentMon = IronmonTrackerLogger.mapMoveNames(LoggerData.currentMon)
end

function IronmonTrackerLogger.checkNewEncounter()
	if Battle.inBattle == true then
		local lastEncounterIndex = #LoggerData.encounters

		if lastEncounterIndex == 0 then
			IronmonTrackerLogger.addEncounter()
		else -- get last encounter
			local lastEncounter = LoggerData.encounters[lastEncounterIndex]
			if lastEncounter.ownMon ~= Battle.getViewedPokemon(true).personality
			or lastEncounter.enemyMon.personality ~= Battle.getViewedPokemon(false).personality then
				-- Last encounter is not this encounter, add new one
				-- IronmonTrackerLogger.battleCounter = IronmonTrackerLogger.battleCounter + 1
				IronmonTrackerLogger.addEncounter()
			end
		end
	end

	return false
end

function IronmonTrackerLogger.addEncounter()
	local newEncounter = {
		battleID = LoggerData.totalBattles, -- IronmonTrackerLogger.battleCounter,
		ownMon = Battle.getViewedPokemon(true).personality,
		enemyMon = Battle.getViewedPokemon(false),
		location = RouteData.Info[Battle.CurrentRoute.mapId].name,
		isWildEncounter = Battle.isWildEncounter,
		lastUsedMove = nil,
		lastUsedMoveDamage = 0,
		battleTurn = -1
	}

	table.insert(LoggerData.encounters, newEncounter)
end

function IronmonTrackerLogger.updateEncounter()
	if Battle.inBattle == false then return end

	local lastEncounterIndex = #LoggerData.encounters

	local enemyMon = IronmonTrackerLogger.getEnemyMon()
	if enemyMon ~= nil then
		if enemyMon.abilities ~= nil then -- Dead mons don't have abilities
			-- Update enemyMon for things like status, HP
			LoggerData.encounters[lastEncounterIndex].enemyMon = enemyMon
		end
	end

	local battleTurn = tostring(Battle.turnCount)
	local lastUsedMove = IronmonTrackerLogger.getLastMoveByAttacker()
	local lastUsedMoveDamage = Battle.damageReceived

	LoggerData.encounters[lastEncounterIndex].battleTurn = battleTurn
	if lastUsedMove ~= nil then
		LoggerData.encounters[lastEncounterIndex].lastUsedMove = lastUsedMove
	end

	if lastUsedMoveDamage ~= nil then
		LoggerData.encounters[lastEncounterIndex].lastUsedMoveDamage = lastUsedMoveDamage
	end
end

function IronmonTrackerLogger.getEnemyMon()
	local enemyMon = Battle.getViewedPokemon(false)
	if enemyMon == nil then
		return nil
	end

	enemyMon = IronmonTrackerLogger.mapIdsToStrings(enemyMon)

	return enemyMon
end

function IronmonTrackerLogger.mapIdsToStrings(mon)
	mon = IronmonTrackerLogger.mapMoveNames(mon)
	mon = IronmonTrackerLogger.mapAbilityNames(mon)
	mon.statusName = IronmonTrackerLogger.getStatusName(mon.status)

	return mon
end

function IronmonTrackerLogger.mapMoveNames(mon)
	if mon.moves ~= nil then
		for key, val in pairs(mon.moves) do
			mon.moves[key].name = MoveData.Moves[val.id].name
		end
	end

	return mon
end

function IronmonTrackerLogger.mapAbilityNames(mon)
	if mon.abilities ~= nil then
		for key, val in pairs(mon.abilities) do
			if mon.abilityNames == nil then mon.abilityNames = {} end
			mon.abilityNames[key] = AbilityData.Abilities[val].name
		end
	end

	return mon
end

function IronmonTrackerLogger.getStatusName(status)
	return MiscData.StatusCodeMap[status] or "NOR"
end

function IronmonTrackerLogger.getRivalID()
	local opposingPokemon = Tracker.getPokemon(1, false)
	if opposingPokemon == nil then
		return 0
	end

	LoggerData.rivalID = opposingPokemon.trainerID
end

function IronmonTrackerLogger.getLastMoveByAttacker()
	local lastEncounterIndex = #LoggerData.encounters

	if lastEncounterIndex == 0 then return end

	local storedLastMove = LoggerData.encounters[lastEncounterIndex].lastUsedMove

	if Battle.inBattle == false then
		return storedLastMove
	end

	-- No need to record if there's no last move
	local lastMoveByAttacker = Memory.readword(GameSettings.gBattleResults + 0x22 + ((Battle.attacker % 2) * 0x2))
	if lastMoveByAttacker == nil or lastMoveByAttacker == 0 then
		return storedLastMove
	end

	-- No need to check if there's no combatants
	local attackerSlot = Battle.Combatants[Battle.IndexMap[Battle.attacker]]
	if attackerSlot == nil then
		return storedLastMove
	end

	local transformData = Battle.BattleAbilities[Battle.attacker % 2][attackerSlot].transformData
	-- Only record opposing attacks
	if not transformData.isOwn or transformData.slot > Battle.partySize then
		return MoveData.Moves[lastMoveByAttacker].name
	else
		return storedLastMove
	end
end

function IronmonTrackerLogger.getHealingItems()
	local healingItems, stones = Program.getBagItems()

	local items = {}

	if healingItems ~= nil then
		for itemID, quantity in pairs(healingItems) do
			local healItemData = MiscData.HealingItems[itemID]
			if healItemData ~= nil and quantity > 0 then
				items[healItemData.name] = quantity
			end
		end
	end

	LoggerData.healingItems = items
end

--[[
function IronmonTrackerLogger.startLogger()
	-- Required garbage collection to release old Tracker files after an auto-update
	collectgarbage()

	print("Loading IronmonTrackerLogger")

	-- Only continue with starting up the Tracker if the 'Main' script was able to be loaded
	if IronmonTrackerLogger.tryLoad() then
		-- Then verify the remainder of the Tracker files were able to be setup and initialized
		if IronmonTrackerLogger.Initialize() then
			IronmonTrackerLogger.Run()
		end
	end
end

function IronmonTrackerLogger.tryLoad()
	local mainFilename = "ironmon_logger/Main.lua"

	local file = io.open(mainFilename, "r")

	if file == nil then
		print('Error starting up the Tracker: Unable to load all of the required Tracker files.')
		print('> The "Ironmon-Tracker.lua" script file should be in the same folder as the other Tracker files that came with the release download.')
		return false
	end
	io.close(file)

	-- Load the Main Tracker script which will setup all the other files
	dofile(mainFilename)

	return true
end
]]

IronmonTrackerLogger.startLogger()

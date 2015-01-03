-----------------------------------------------
--[[               SETTINGS               ]] --
-----------------------------------------------
	-- Container to check bets.
	local Check_Container = 'Fur Backpack'

	-- Container for crystal coins.
	local Crystals_Container = 'Orange Backpack'

	-- Container for platinum coins.
	local Platinums_Container = 'Red Backpack'

	-- Percentage of payout.
	-- Default: 80
	local Payout_Percentage = 80

	-- Enables a bonus percent of payout.
	-- Reminder: 1000 = 1k
	-- Default: false, 200000, 10
	-- Example of payout when player hits jackpot
	-- 		Without bonus
	--			199k | 199k + 80% | 358.2k
	--			200k | 200k + 80% | 360k
	-- 		With bonus
	--			199k | 199k + 80% | 358.2k
	--			200k | 200k + 90% | 380k
	local Use_Bonus = true
	local Bonus_Start = 200000
	local Bonus_Percent = 10

	-- Minimum and maximum amount of cash.
	-- Reminder: 1000 = 1k
	-- Default: 5000 and 300000
	local Minimum_Cash = 5000
	local Maximum_Cash = 300000

	-- Accept abbreviated values.
	-- Possible choices: h or l
	-- Default: true
	local Accept_Abbreviations = true

	-- Accept numeric values.
	-- Possible choices: 123 or 456
	-- Default: true
	local Accept_Numeric = true

	-- Ping compensation for slow connections.
	-- Default: 100
	local Ping_Compensation = 100

	-- Switch broadcast mode. Displays a broadcasted message.
	-- Default: true
	local Broadcast_Messages = true
	
	-- Switch yell broadcasted message
	-- Default: false
	local Yell_Broadcast = false
	
	-- Broadcast even with players around or when gambling
	-- Default: false
	local Always_Broadcast = true
	
	-- Item name to use when player wins bet.
	-- If you do not want any item to be used, type 'none'.
	-- Default: Lyre
	local Winning_Item = 'Party Trumpet'

	-- Item name to use when player loses bet.
	-- If you do not want any item to be used, type 'none'.
	-- Default: Trough Kit
	local Losing_Item = 'Christmas Card'

	-- Item name to use as decoration under dice.
	-- If you do not want any item to be decorative, type 'none'.
	-- Default: 'eternal flames'
	local Decoration_Item = 'eternal flames'
	
	-- Switch use party hat in casino.
	-- Default: true
	local Use_Party_Hat = true

	-- Display HUD with statistics.
	-- Default: true
	local Show_HUD = true
	
	-- Switch the use of dustbin for the anti-trash system.
	-- Change to false to put trash under your character.
	-- Default: false
	local Dustbin_Antitrash = false
	
	-- Switch Debug messages.
	-- Enable this setting to print messages in debug mode
	-- Default: false
	local Debug_Messages = false

-----------------------------------------------
--[[ DO NOT EDIT ANYTHING BELOW THIS LINE ]] --
-----------------------------------------------
if (Show_HUD) then
	HEADS_UP_DISPLAY =
	{
		SCRIPT_NAME = Self.Name():upper()..'\'S CASINO',
		SCRIPT_VERSION = 'v1.6.0',
		SCRIPT_HEADER = HUD.New(10, 20, '', 30, 144, 255),
		STATS_HEADER = HUD.New(10, 40, 'STATISTICS', 255, 165, 0),
		AMOUNT_CASH =
		{
			DISPLAY_CRYSTAL =
			{
				TEXT = HUD.New(10, 60, 'Crystal Coins', 255, 255, 255),
				AMOUNT = HUD.New(140, 60, '0k', 255, 255, 255)
			},
			DISPLAY_PLATINUM =
			{
				TEXT = HUD.New(10, 76, 'Platinum Coins', 255, 255, 255),
				AMOUNT = HUD.New(140, 76, '0k', 255, 255, 255)
			}
		},
		BETS =
		{
			WON =
			{
				TEXT = HUD.New(10, 92, 'Bets Won', 255, 255, 255),
				AMOUNT = HUD.New(140, 92, '0 (0k)', 255, 255, 255),
				AMOUNT_RAW = 0,
				AMOUNT_CASH = 0
			},
			LOST =
			{
				TEXT = HUD.New(10, 108, 'Bets Lost', 255, 255, 255),
				AMOUNT = HUD.New(140, 108, '0 (0k)', 255, 255, 255),
				AMOUNT_RAW = 0,
				AMOUNT_CASH = 0
			},
			OUTCOME =
			{
				TEXT = HUD.New(10, 128, 'OUTCOME', 255, 255, 255),
				AMOUNT = HUD.New(140, 128, '0 (0k)', 255, 255, 255),
				AMOUNT_RAW = 0,
				AMOUNT_CASH = 0
			}
		},
		SETTINGS_HEADER = HUD.New(10, 148, 'SETTINGS', 255, 165, 0),
		PING_COMPENSATION =
		{
			TEXT = HUD.New(10, 168, 'Ping Compensation', 255, 255, 255),
			VALUE = HUD.New(140, 168, tostring(Ping_Compensation), 255, 255, 255)
		},
		PAYOUT =
		{
			TEXT = HUD.New(10, 184, 'Payout percentage', 255, 255, 255),
			VALUE = HUD.New(140, 184, Payout_Percentage..'%', 255, 255, 255)
		},
		MIN_MAX_BET =
		{
			TEXT = HUD.New(10, 200, 'Accepted cash', 255, 255, 255),
			VALUE = HUD.New(140, 200, (Minimum_Cash/1000)..'k - '..(Maximum_Cash/1000)..'k', 255, 255, 255)
		},
		ABBREVIATIONS =
		{
			TEXT = HUD.New(10, 216, 'Abbreviations', 255, 255, 255),
			VALUE = HUD.New(140, 216, tostring(Accept_Abbreviations), 255, 255, 255)
		},
		NUMERIC_BETS =
		{
			TEXT = HUD.New(10, 232, 'Numeric bets', 255, 255, 255),
			VALUE = HUD.New(140, 232, tostring(Accept_Numeric), 255, 255, 255)
		},
		BROADCAST_MESSAGES =
		{
			TEXT = HUD.New(10, 248, 'Broadcast messages', 255, 255, 255),
			VALUE = HUD.New(140, 248, tostring(Broadcast_Messages), 255, 255, 255)
		},
		YELL_BROADCAST =
		{
			TEXT = HUD.New(10, 264, 'Yell broadcast', 255, 255, 255),
			VALUE = HUD.New(140, 264, tostring(Yell_Broadcast), 255, 255, 255)
		},
		ALWAYS_BROADCAST =
		{
			TEXT = HUD.New(10, 280, 'Always broadcast', 255, 255, 255),
			VALUE = HUD.New(140, 280, tostring(Always_Broadcast), 255, 255, 255)
		},
		DUSTBIN_ANTITRASH =
		{
			TEXT = HUD.New(10, 296, 'Dustbin anti-trash', 255, 255, 255),
			VALUE = HUD.New(140, 296, tostring(Dustbin_Antitrash), 255, 255, 255)
		},
		DEBUG_MESSAGES =
		{
			TEXT = HUD.New(10, 312, 'Debug messages', 255, 255, 255),
			VALUE = HUD.New(140, 312, tostring(Debug_Messages), 255, 255, 255)
		},
		WINNING_ITEM =
		{
			TEXT = HUD.New(10, 328, 'Winning item', 255, 255, 255),
			VALUE = HUD.New(140, 328, Winning_Item, 255, 255, 255)
		},
		LOSING_ITEM =
		{
			TEXT = HUD.New(10, 344, 'Losing item', 255, 255, 255),
			VALUE = HUD.New(140, 344, Losing_Item, 255, 255, 255)
		}
	}
	HEADS_UP_DISPLAY.SCRIPT_HEADER:SetText(HEADS_UP_DISPLAY.SCRIPT_NAME..' '..HEADS_UP_DISPLAY.SCRIPT_VERSION)
	if (Accept_Abbreviations) then
		HEADS_UP_DISPLAY.ABBREVIATIONS.VALUE:SetTextColor(107, 142, 35)
	else
		HEADS_UP_DISPLAY.ABBREVIATIONS.VALUE:SetTextColor(178, 34, 34)
	end
	if (Accept_Numeric) then
		HEADS_UP_DISPLAY.NUMERIC_BETS.VALUE:SetTextColor(107, 142, 35)
	else
		HEADS_UP_DISPLAY.NUMERIC_BETS.VALUE:SetTextColor(178, 34, 34)
	end
	if (Broadcast_Messages) then
		HEADS_UP_DISPLAY.BROADCAST_MESSAGES.VALUE:SetTextColor(107, 142, 35)
	else
		HEADS_UP_DISPLAY.BROADCAST_MESSAGES.VALUE:SetTextColor(178, 34, 34)
	end
	if (Yell_Broadcast) then
		HEADS_UP_DISPLAY.YELL_BROADCAST.VALUE:SetTextColor(107, 142, 35)
	else
		HEADS_UP_DISPLAY.YELL_BROADCAST.VALUE:SetTextColor(178, 34, 34)
	end
	if (Always_Broadcast) then
		HEADS_UP_DISPLAY.ALWAYS_BROADCAST.VALUE:SetTextColor(107, 142, 35)
	else
		HEADS_UP_DISPLAY.ALWAYS_BROADCAST.VALUE:SetTextColor(178, 34, 34)
	end
	if (Dustbin_Antitrash) then
		HEADS_UP_DISPLAY.DUSTBIN_ANTITRASH.VALUE:SetTextColor(107, 142, 35)
	else
		HEADS_UP_DISPLAY.DUSTBIN_ANTITRASH.VALUE:SetTextColor(178, 34, 34)
	end
	if (Debug_Messages) then
		HEADS_UP_DISPLAY.DEBUG_MESSAGES.VALUE:SetTextColor(107, 142, 35)
	else
		HEADS_UP_DISPLAY.DEBUG_MESSAGES.VALUE:SetTextColor(178, 34, 34)
	end
end
local Containers =
{
	Counter = nil,
	Locker = nil,
	Depot = nil,
	Check = nil,
	Crystal = nil,
	Platinum = nil,
}
local Coordinates = {
	Locker = { x = 0, y = 0, z = 0 },
	Player = { x = 0, y = 0, z = 0 },
	Counter = { x = 0, y = 0, z = 0 },
	Dustbin = { x = 0, y = 0, z = 0 }
}
local Winning_Item_ID = Item.GetID(Winning_Item)
local Losing_Item_ID = Item.GetID(Losing_Item)
local Decoration_Item_ID = Item.GetID(Decoration_Item)
local Player_Option = -1
local Player_Balance = 0
local Last_Broadcast = os.time()
local Last_Message = os.time()
local Last_Party_Hat = os.time()
local Last_Bet = os.time()
local Casino_Loaded = false

function CountItemsOfIDs(container, IDs)
	if (container == nil) then
		return 0
	end
	local tempTotal = 0
	for iterator, itemID in ipairs(IDs) do
		tempTotal = tempTotal + container:CountItemsOfID(itemID)
	end
	return tempTotal
end

function CheckDiceAndDecoration()
	if (Decoration_Item_ID > 0) then
		if (Containers.Locker:CountItemsOfID(Decoration_Item_ID) < 1) then
			if (Containers.Depot:CountItemsOfID(Decoration_Item_ID) >= 1) then
				for itemDepotChest = Containers.Depot:ItemCount() - 1, 0, -1 do
					local tempItemDepotChest = Containers.Depot:GetItemData(itemDepotChest)
					if (Decoration_Item_ID == tempItemDepotChest.id) then
						local placed = 0
						while placed == 0 do
							placed = Containers.Depot:MoveItemToGround(itemDepotChest, Coordinates.Locker.x, Coordinates.Locker.y, Coordinates.Locker.z, 1)
							wait(1000 + Ping_Compensation)
						end
						break
					end
				end
			end
		end
	end
	local DiceInLocker = CountItemsOfIDs(Containers.Locker, { 5792, 5793, 5794, 5795, 5796, 5797 })
	if (DiceInLocker < 1) then
		local AmountOfDice = CountItemsOfIDs(Containers.Depot, { 5792, 5793, 5794, 5795, 5796, 5797 })
		if (AmountOfDice >= 1) then
			for itemDepotChest = Containers.Depot:ItemCount() - 1, 0, -1 do
				local tempItemDepotChest = Containers.Depot:GetItemData(itemDepotChest)
				if table.contains({ 5792, 5793, 5794, 5795, 5796, 5797 }, tempItemDepotChest.id) then
					local placed = 0
					while placed == 0 do
						placed = Containers.Depot:MoveItemToGround(itemDepotChest, Coordinates.Locker.x, Coordinates.Locker.y, Coordinates.Locker.z, 1)
						wait(1000 + Ping_Compensation)
					end
					break
				end
			end
		end
	end
end

function PickUpDiceAndDecoration()
	if (Containers.Locker ~= nil and Containers.Depot ~= nil) then
		local DiceInLocker = CountItemsOfIDs(Containers.Locker, { 5792, 5793, 5794, 5795, 5796, 5797 })
		if (DiceInLocker >= 1) then
			for itemLocker = Containers.Locker:ItemCount() - 1, 0, -1 do
				local tempItemLocker = Containers.Locker:GetItemData(itemLocker)
				if table.contains({ 5792, 5793, 5794, 5795, 5796, 5797 }, tempItemLocker.id) then
					local pickedup = 0
					while pickedup == 0 do
						pickedup = Containers.Locker:MoveItemToContainer(itemLocker, Containers.Depot:Index(), 0)
						wait(1000 + Ping_Compensation)
					end
					break
				end
			end
		end
		if (Decoration_Item_ID > 0) then
			if (Containers.Locker:CountItemsOfID(Decoration_Item_ID) >= 1) then
				for itemLocker = Containers.Locker:ItemCount() - 1, 0, -1 do
					local tempItemLocker = Containers.Locker:GetItemData(itemLocker)
					if (Decoration_Item_ID == tempItemLocker.id) then
						local pickedup = 0
						while pickedup == 0 do
							pickedup = Containers.Locker:MoveItemToContainer(itemLocker, Containers.Depot:Index(), 0)
							wait(1000 + Ping_Compensation)
						end
						break
					end
				end
			end
		end
	end
end

function UpdateSystemCoordinates()
	local posx = Self.Position().x
	local posy = Self.Position().y
	local posz = Self.Position().z
	Coordinates.Locker.z = posz
	for x = -1, 1 do
		for y = -1, 1 do
			if (table.contains({ 3497, 3498, 3499, 3500 }, Map.GetTopUseItem(posx + x, posy + y, Self.Position().z).id)) then
				Coordinates.Locker.x = posx + x
				Coordinates.Locker.y =  posy + y
			end
		end
	end
	Coordinates.Counter.z = posz
	for x = -1, 1 do
		for y = -1, 1 do
			if (table.contains({17389, 2318, 2320, 2321, 2343, 2345 }, Map.GetTopUseItem(posx + x, posy + y, Self.Position().z).id)) then
				Coordinates.Counter.x = posx + x
				Coordinates.Counter.y =  posy + y
			end
		end
	end
	Coordinates.Dustbin.Z = posz
	for x = -7, 7 do
		for y = -5, 5 do
			if (table.contains({ 2526 }, Map.GetTopUseItem(posx + x, posy + y, Self.Position().z).id)) then
				Coordinates.Dustbin.X = posx + x
				Coordinates.Dustbin.Y =  posy + y
			end
		end
	end
	Coordinates.Player.z = posz
	if (Coordinates.Counter.x == posx - 1) then
		if (Coordinates.Counter.y == posy - 1) then
			if (Coordinates.Locker.x == posx - 1 and Coordinates.Locker.y == posy) then
				Coordinates.Player.x = posx
				Coordinates.Player.y = posy - 2
			elseif (Coordinates.Locker.x == posx and Coordinates.Locker.y == posy - 1) then
				Coordinates.Player.x = posx - 2
				Coordinates.Player.y = posy
			end
		elseif (Coordinates.Counter.y == posy + 1) then
			if (Coordinates.Locker.x == posx - 1 and Coordinates.Locker.y == posy) then
				Coordinates.Player.x = posx
				Coordinates.Player.y = posy + 2
			elseif (Coordinates.Locker.x == posx and Coordinates.Locker.y == posy + 1) then
				Coordinates.Player.x = posx - 2
				Coordinates.Player.y = posy
			end
		end
	elseif (Coordinates.Counter.x == posx + 1) then
		if (Coordinates.Counter.y == posy - 1) then
			if (Coordinates.Locker.x == posx + 1 and Coordinates.Locker.y == posy) then
				Coordinates.Player.x = posx
				Coordinates.Player.y = posy - 2
			elseif (Coordinates.Locker.x == posx and Coordinates.Locker.y == posy - 1) then
				Coordinates.Player.x = posx + 2
				Coordinates.Player.y = posy
			end
		elseif (Coordinates.Counter.y == posy + 1) then
			if (Coordinates.Locker.x == posx + 1 and Coordinates.Locker.y == posy) then
				Coordinates.Player.x = posx
				Coordinates.Player.y = posy + 2
			elseif (Coordinates.Locker.x == posx and Coordinates.Locker.y == posy + 1) then
				Coordinates.Player.x = posx + 2
				Coordinates.Player.y = posy
			end
		end
	end
end

function Open_Containers()
	for i = 0, 15 do
		closeContainer(i)
	end
	while #Container.GetAll() ~= 6 do
		UpdateSystemCoordinates()
		for i = 0, 15 do
			closeContainer(i)
		end
		Client.HideEquipment()
		if Self.BrowseField(Coordinates.Counter.x, Coordinates.Counter.y, Coordinates.Counter.z) == 1 then
			wait(500 + Ping_Compensation, 800 + Ping_Compensation)
			Containers.Counter = Container(0)
		end
		Client.HideEquipment()
		if Self.BrowseField(Coordinates.Locker.x, Coordinates.Locker.y, Coordinates.Locker.z) == 1 then
			wait(500 + Ping_Compensation, 800 + Ping_Compensation)
			Containers.Locker = Container(1)
		end
		Client.HideEquipment()
		if (table.contains({3497, 3498, 3499, 3500}, Containers.Locker:GetItemData(0).id)) then
			Containers.Locker:OpenChildren({Containers.Locker:GetItemData(0).id, true})
			wait(500 + Ping_Compensation, 800 + Ping_Compensation)
			Container(2):UseItem(0, true)
		end
		wait(500 + Ping_Compensation, 800 + Ping_Compensation)
		Containers.Depot = Container(2)
		Client.HideEquipment()
		Containers.Depot:OpenChildren({Check_Container, false})
		wait(500 + Ping_Compensation, 800 + Ping_Compensation)
		Containers.Check = Container(3)
		Client.HideEquipment()
		Containers.Depot:OpenChildren({Crystals_Container, false})
		wait(500 + Ping_Compensation, 800 + Ping_Compensation)
		Containers.Crystal = Container(4)
		Client.HideEquipment()
		Containers.Depot:OpenChildren({Platinums_Container, false})
		wait(500 + Ping_Compensation, 800 + Ping_Compensation)
		Containers.Platinum = Container(5)
		Client.HideEquipment()

	end
end

Module.New('Casino_Turn', function(Mod)
	if (Casino_Loaded) then
		local Player_Detected = false
		for name, creature in Creature.iPlayers(2) do
			if (creature:Position().x == Coordinates.Player.x and creature:Position().y == Coordinates.Player.y and creature:Position().z == Coordinates.Player.z) then
				Player_Detected = true
				if (creature:Position().x < Self.Position().x) then
					if (Self.LookDirection() ~= WEST) then
						Self.Turn(WEST)
					end
				elseif (creature:Position().x > Self.Position().x) then
					if (Self.LookDirection() ~= EAST) then
						Self.Turn(EAST)
					end
				else
					if (creature:Position().y < Self.Position().y) then
						if (Self.LookDirection() ~= NORTH) then
							Self.Turn(NORTH)
						end
					elseif (creature:Position().y > Self.Position().y) then
						if (Self.LookDirection() ~= SOUTH) then
							Self.Turn(SOUTH)
						end
					else
						print('Casino: Error. Self character is the potential gambler.')
					end
				end
			end
		end
		if not (Player_Detected) then
			
			if (Self.LookDirection() ~= NORTH) then
				Self.Turn(NORTH)
			end
		end
	end
	Mod:Delay(1400)
end)

Module.New('Casino_Trash', function(Mod)
	if (Casino_Loaded) then
		for itemCounter = Containers.Counter:ItemCount() - 1, 0, -1  do
			local tempItemCounter = Containers.Counter:GetItemData(itemCounter)
			if not table.contains({ 3035, 3043 }, tempItemCounter.id) then
				if (Coordinates.Dustbin.x ~= 0 and Coordinates.Dustbin.y ~= 0) and Dustbin_Antitrash then
					if (Debug_Messages) then
						print('Casino: Anti-trash. '..tempItemCounter.count..' '..Item.GetName(tempItemCounter.id)..' - Counter >> Dustbin')
					end
					Containers.Counter:MoveItemToGround(itemCounter, Coordinates.Dustbin.x, Coordinates.Dustbin.y, Coordinates.Dustbin.z, tempItemCounter.count)
				else
					if (Debug_Messages) then
						print('Casino: Anti-trash. '..tempItemCounter.count..' '..Item.GetName(tempItemCounter.id)..' - Locker >> Ground')
					end
					Containers.Counter:MoveItemToGround(itemCounter, Self.Position().x, Self.Position().y, Self.Position().z, tempItemCounter.count)
				end
			end
		end
		
		for itemLocker = Containers.Locker:ItemCount() - 1, 0, -1  do
			local tempItemLocker = Containers.Locker:GetItemData(itemLocker)
			if not table.contains({3497, 3498, 3499, 3500}, tempItemLocker.id) then
				if not table.contains({3035, 3043}, tempItemLocker.id) then
					if (Decoration_Item_ID ~= 0 and Decoration_Item_ID ~= tempItemLocker.id) or Decoration_Item_ID == 0 then
						if not table.contains({5792, 5793, 5794, 5795, 5796, 5797}, tempItemLocker.id) or
							(table.contains({5792, 5793, 5794, 5795, 5796, 5797}, tempItemLocker.id) and
							(CountItemsOfIDs(Containers.Locker, {5792, 5793, 5794, 5795, 5796, 5797}) > 1)) then
							if (Coordinates.Dustbin.x ~= 0 and Coordinates.Dustbin.y ~= 0) and Dustbin_Antitrash then
								if (Debug_Messages) then
									print('Casino: Anti-trash. '..tempItemLocker.count..' '..Item.GetName(tempItemLocker.id)..' - Counter >> Dustbin')
								end
								Containers.Counter:MoveItemToGround(itemCounter, Coordinates.Dustbin.x, Coordinates.Dustbin.y, Coordinates.Dustbin.z, tempItemLocker.count)
							else
								if (Debug_Messages) then
									print('Casino: Anti-trash. '..tempItemLocker.count..' '..Item.GetName(tempItemLocker.id)..' - Locker >> Ground')
								end
								Containers.Locker:MoveItemToGround(itemLocker, Self.Position().x, Self.Position().y, Self.Position().z, tempItemLocker.count)
								break
							end
						end
					end
				else
					Containers.Locker:MoveItemToGround(itemLocker,Coordinates.Counter.x,Coordinates.Counter.y,Coordinates.Counter.z,tempItemLocker.count)
				end
			end
		end
	end
	Mod:Delay(600)
end)

Module.New('Casino_Hat', function(Mod)
	if (Casino_Loaded) then
		if (Use_Party_Hat) then
			if ((os.time()-Last_Party_Hat)>2) then
				if (Self.Head().id == Item.GetID('party hat')) then
					Self.UseItemFromEquipment('head')
					Last_Party_Hat = os.time()
				end
			end
		end
		HEADS_UP_DISPLAY.AMOUNT_CASH.DISPLAY_CRYSTAL.AMOUNT:SetText(tostring(Containers.Crystal:CountItemsOfID(3043)*10)..'k')
		HEADS_UP_DISPLAY.AMOUNT_CASH.DISPLAY_PLATINUM.AMOUNT:SetText(tostring(Containers.Platinum:CountItemsOfID(3035)*1/10)..'k')
	end
	Mod:Delay(1000)
end)

Module.New('Casino_Broadcast', function(Mod)
	if (Casino_Loaded) then
		if (Broadcast_Messages) then
			if ((os.time()-Last_Broadcast)>30) then
				if ((os.time()-Last_Message)>2) then
					local PlayersAround = false
					if not (Always_Broadcast) then
						for name, creature in Creature.iPlayers(2) do
							if (name ~= nil) then
								PlayersAround = true
								break
							end
						end
					end
					if not PlayersAround then
						local broadcast = string.upper(Self.Name())..'\'S CASINO:  HIGH/LOW'
						if (Accept_Abbreviations) then
							broadcast = broadcast..', know your limit '
						end
						if (Accept_Numeric) then
							broadcast = broadcast..', my stages for bets are'
						end
						broadcast = broadcast..' - MIN '..(Minimum_Cash/1000)..'K / MAX '..(Maximum_Cash/1000)..'K - Only Accept Money. Have fun :D Payout 90%  '
						if (Yell_Broadcast) then
							Self.Yell(broadcast)
						else
							Self.Say(broadcast)
						end
						Last_Broadcast = os.time()
						Last_Message = os.time()
					end
				end
			end
		end
	end
	Mod:Delay(10000)
end)

function UseItem(id, container)
	local used = 0
	while used == 0 do
		for useItem = container:ItemCount()-1,0,-1 do
			local tempItem = container:GetItemData(useItem)
			if (tempItem.id == id) then
				used = container:UseItem(useItem, true)
				break
			end
		end
	end
end

function Roll(data)
	if (Casino_Loaded) then
		local Rolled_Number = data
		if (Debug_Messages) then
			print('Casino: You rolled a '..Rolled_Number)
		end
		if (Player_Option ~= -1) then
			local Result = -1
			if (Rolled_Number >= 1 and Rolled_Number <= 3) then
				Result = 0
			elseif (Rolled_Number >= 4 and Rolled_Number <= 6) then
				Result = 1
			end
			if(Result == Player_Option) then
				if (Winning_Item_ID ~= 0) then
					UseItem(Winning_Item_ID, Containers.Depot)
				end
				local jackpot = Player_Balance + (Payout_Percentage * Player_Balance / 100)
				if (Use_Bonus) then
					if (Player_Balance >= Bonus_Start) then
						jackpot = jackpot + (Bonus_Percent * Player_Balance / 100)
					end
				end
				local crystal_coins = 0
				local platinum_coins = 0
				while jackpot >= 10000 do
					crystal_coins = crystal_coins + 1
					jackpot = jackpot - 10000
				end
				while jackpot >= 100 do
					platinum_coins = platinum_coins + 1
					jackpot = jackpot - 100
				end
				if (Debug_Messages) then
					print('Casino: Payout. '..crystal_coins..' crystal coins | '..platinum_coins..' platinum coins')
				end
				
				if (platinum_coins > 0) then
					local plat_placed = 0
					while plat_placed == 0 do
						for platinumInContainer = Containers.Platinum:ItemCount()-1,0,-1 do
							local tempItem = Containers.Platinum:GetItemData(platinumInContainer)
							if (tempItem.id == 3035) then
								plat_placed = Containers.Platinum:MoveItemToGround(platinumInContainer,Coordinates.Counter.x,Coordinates.Counter.y,Coordinates.Counter.z,platinum_coins)
								break
							end
						end
					end
				end
				if (crystal_coins > 0) then
					local crystal_placed = 0
					while crystal_placed == 0 do
						for crystalInContainer = Containers.Crystal:ItemCount()-1,0,-1 do
							local tempItem = Containers.Crystal:GetItemData(crystalInContainer)
							if (tempItem.id == 3043) then
								crystal_placed = Containers.Crystal:MoveItemToGround(crystalInContainer,Coordinates.Counter.x,Coordinates.Counter.y,Coordinates.Counter.z,crystal_coins)
								break
							end
						end
					end
				end
				if (Show_HUD) then
					HEADS_UP_DISPLAY.BETS.LOST.AMOUNT_RAW = HEADS_UP_DISPLAY.BETS.LOST.AMOUNT_RAW + 1
					HEADS_UP_DISPLAY.BETS.LOST.AMOUNT_CASH = HEADS_UP_DISPLAY.BETS.LOST.AMOUNT_CASH + (crystal_coins * 10000) + (platinum_coins * 100) - Player_Balance
					HEADS_UP_DISPLAY.BETS.LOST.AMOUNT:SetText(tostring(HEADS_UP_DISPLAY.BETS.LOST.AMOUNT_RAW)..' ('..tostring(HEADS_UP_DISPLAY.BETS.LOST.AMOUNT_CASH/1000)..'k)')
					HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_RAW = HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_RAW + 1
					HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_CASH = HEADS_UP_DISPLAY.BETS.WON.AMOUNT_CASH - HEADS_UP_DISPLAY.BETS.LOST.AMOUNT_CASH
					if (HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_CASH > 0) then
						HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT:SetTextColor(107, 142, 35)
					elseif (HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_CASH == 0) then
						HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT:SetTextColor(255, 255, 255)
					else
						HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT:SetTextColor(178, 34, 34)
					end
					HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT:SetText(tostring(HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_RAW)..' ('..tostring((HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_CASH/1000))..'k)')
				end
			else
				if (Losing_Item_ID ~= 0) then
					UseItem(Losing_Item_ID, Containers.Depot)
				end
				if (Show_HUD) then
					HEADS_UP_DISPLAY.BETS.WON.AMOUNT_RAW = HEADS_UP_DISPLAY.BETS.WON.AMOUNT_RAW + 1
					HEADS_UP_DISPLAY.BETS.WON.AMOUNT_CASH = HEADS_UP_DISPLAY.BETS.WON.AMOUNT_CASH + Player_Balance
					HEADS_UP_DISPLAY.BETS.WON.AMOUNT:SetText(tostring(HEADS_UP_DISPLAY.BETS.WON.AMOUNT_RAW)..' ('..tostring(HEADS_UP_DISPLAY.BETS.WON.AMOUNT_CASH/1000)..'k)')
					HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_RAW = HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_RAW + 1
					HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_CASH = HEADS_UP_DISPLAY.BETS.WON.AMOUNT_CASH - HEADS_UP_DISPLAY.BETS.LOST.AMOUNT_CASH
					if (HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_CASH > 0) then
						HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT:SetTextColor(107, 142, 35)
					elseif (HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_CASH == 0) then
						HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT:SetTextColor(255, 255, 255)
					else
						HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT:SetTextColor(178, 34, 34)
					end
					HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT:SetText(tostring(HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_RAW)..' ('..tostring((HEADS_UP_DISPLAY.BETS.OUTCOME.AMOUNT_CASH/1000))..'k)')
				end
			end
			Player_Option = -1
			Last_Bet = os.time()
		end
	end
end

function Casino_Game(data)
	if (Casino_Loaded) then
		local speaker = data.creature
		local text = data.message
		local Player = Creature(speaker)
		if (Player:Position().x == Coordinates.Player.x and Player:Position().y == Coordinates.Player.y and Player:Position().z == Coordinates.Player.z) then
			text:trim():lower()
			if (Accept_Abbreviations) then
				if(text == 'l') then
					Player_Option = 0
				elseif (text == 'h') then
					Player_Option = 1
				end
			end
			if (Accept_Numeric) then
				if(text == '123') then
					Player_Option = 0
				elseif (text == '456') then
					Player_Option = 1
				end
			end
			if(text == 'low' or text == 'high') then
				if(text == 'low') then
					Player_Option = 0
				elseif (text == 'high') then
					Player_Option = 1
				end
			end
			if(Player_Option ~= -1) then
				local platinumInCounter = Containers.Counter:CountItemsOfID(3035)
				local crystalInCounter = Containers.Counter:CountItemsOfID(3043)
				local totalCashInCounter = platinumInCounter * 100 + crystalInCounter * 10000
				local casino_activated = false
				if (totalCashInCounter >= Minimum_Cash and totalCashInCounter <= Maximum_Cash) then
					while (platinumInCounter > 0) or (crystalInCounter > 0) do
						for cashInCounter = Containers.Counter:ItemCount()-1,0,-1 do
							local tempCash = Containers.Counter:GetItemData(cashInCounter)
							if (tempCash.id == 3035 or tempCash.id == 3043) then
								Containers.Counter:MoveItemToContainer(cashInCounter,Containers.Check:Index(),0,tempCash.count)
							end
						end
						platinumInCounter = Containers.Counter:CountItemsOfID(3035)
						crystalInCounter = Containers.Counter:CountItemsOfID(3043)
						casino_activated = true
					end
				end
				if (casino_activated) then
					Player_Balance = (Containers.Check:CountItemsOfID(3035) * 100 + Containers.Check:CountItemsOfID(3043) * 10000)
					local platinumInCheck = Containers.Check:CountItemsOfID(3035)
					local crystalInCheck = Containers.Check:CountItemsOfID(3043)
					while (platinumInCheck > 0) or (crystalInCheck > 0) do
						for cashInCheck = Containers.Check:ItemCount()-1,0,-1 do
							local tempCash = Containers.Check:GetItemData(cashInCheck)
							if (tempCash.id == 3035) then
								Containers.Check:MoveItemToContainer(cashInCheck,Containers.Platinum:Index(),0,tempCash.count)
							end
						end
						for cashInCheck = Containers.Check:ItemCount()-1,0,-1 do
							local tempCash = Containers.Check:GetItemData(cashInCheck)
							if (tempCash.id == 3043) then
								Containers.Check:MoveItemToContainer(cashInCheck,Containers.Crystal:Index(),0,tempCash.count)
							end
						end
						platinumInCheck = Containers.Check:CountItemsOfID(3035)
						crystalInCheck = Containers.Check:CountItemsOfID(3043)
					end
					if (Player_Balance > 0) then
						if (Debug_Messages) then
							print('Casino: Ready to roll. Balance is '..Player_Balance..' ('..(Player_Balance/1000)..'k)')
						end
						local used = 0
						while used == 0 do
							for diceInLocker = Containers.Locker:ItemCount()-1, 0, -1 do
								local tempDice = Containers.Locker:GetItemData(diceInLocker)
								if table.contains({5792, 5793, 5794, 5795, 5796, 5797}, tempDice.id) then
									used = Containers.Locker:UseItem(diceInLocker, true)
									break
								end
							end
						end
					end
				end
			end
		end
	end
end

function onSpeak(channel, message)
	channel:SendYellowMessage('You', message)
	message:trim():lower()
	
	local setting_cmd, setting_value = message:match('^/([a-z]+) (.+)$')
	if (setting_cmd) then
		if (setting_cmd == 'payout') then
			if (setting_value) then
				if tonumber(setting_value) ~= nil then
					setting_value = setting_value + 0
					if (setting_value >= 1 and setting_value <= 100) then
						Payout_Percentage = setting_value
						channel:SendOrangeMessage('Casino', 'Payout has been set to '..Payout_Percentage..'%')
					else
						Payout_Percentage = 80
						channel:SendOrangeMessage('Casino', 'Invalid value. Payout has been reset to '..Payout_Percentage..'%')
					end
				else
					Payout_Percentage = 80
					channel:SendOrangeMessage('Casino', 'Invalid value. Payout has been reset to '..Payout_Percentage..'%')
				end
				HEADS_UP_DISPLAY.PAYOUT.VALUE:SetText(tostring(Payout_Percentage)..'%')
			end
		elseif (setting_cmd == 'min') then
			if (setting_value) then
				if tonumber(setting_value) ~= nil then
					setting_value = setting_value + 0
					if (setting_value >= 100 and setting_value <= 500000) then
						Minimum_Cash = setting_value
						channel:SendOrangeMessage('Casino', 'Minimum cash accepted has been set to '..Minimum_Cash..' ('..(Minimum_Cash/1000)..'k)')
					else
						Minimum_Cash = 5000
						channel:SendOrangeMessage('Casino', 'Invalid value. Minimum cash accepted has been reset to '..Minimum_Cash..' ('..(Minimum_Cash/1000)..'k)')
					end
				else
					Minimum_Cash = 5000
					channel:SendOrangeMessage('Casino', 'Invalid value. Minimum cash accepted has been reset to '..Minimum_Cash..' ('..(Minimum_Cash/1000)..'k)')
				end
				HEADS_UP_DISPLAY.MIN_MAX_BET.VALUE:SetText((Minimum_Cash/1000)..'k - '..(Maximum_Cash/1000)..'k')
			end
		elseif (setting_cmd == 'max') then
			if (setting_value) then
				if tonumber(setting_value) ~= nil then
					setting_value = setting_value + 0
					if (setting_value >= 100 and setting_value <= 500000) then
						Maximum_Cash = setting_value
						channel:SendOrangeMessage('Casino', 'Maximum cash accepted has been set to '..Maximum_Cash..' ('..(Maximum_Cash/1000)..'k)')
					else
						Maximum_Cash = 300000
						channel:SendOrangeMessage('Casino', 'Invalid value. Maximum cash accepted has been reset to '..Maximum_Cash..' ('..(Maximum_Cash/1000)..'k)')
					end
				else
					Maximum_Cash = 300000
					channel:SendOrangeMessage('Casino', 'Invalid value. Maximum cash accepted has been reset to '..Maximum_Cash..' ('..(Maximum_Cash/1000)..'k)')
				end
				HEADS_UP_DISPLAY.MIN_MAX_BET.VALUE:SetText((Minimum_Cash/1000)..'k - '..(Maximum_Cash/1000)..'k')
			end
		elseif (setting_cmd == 'abbreviated') then
			if (setting_value) then
				if (setting_value == 'true' or setting_value == 'false') then
					if (setting_value == 'true') then
						Accept_Abbreviations = true
						channel:SendOrangeMessage('Casino', 'You will accept abbreviated bets (h/l)')
					else
						Accept_Abbreviations = false
						channel:SendOrangeMessage('Casino', 'You won\'t accept abbreviated bets (h/l)')
					end
				else
					Accept_Abbreviations = true
					channel:SendOrangeMessage('Casino', 'Invalid value. You will accept abbreviated bets by default')
				end
				HEADS_UP_DISPLAY.ABBREVIATIONS.VALUE:SetText(tostring(Accept_Abbreviations))
				if (Accept_Abbreviations) then
					HEADS_UP_DISPLAY.ABBREVIATIONS.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.ABBREVIATIONS.VALUE:SetTextColor(178, 34, 34)
				end
			end
		elseif (setting_cmd == 'numeric') then
			if (setting_value) then
				if (setting_value == 'true' or setting_value == 'false') then
					if (setting_value == 'true') then
						Accept_Numeric = true
						channel:SendOrangeMessage('Casino', 'You will accept numeric bets (123/456)')
					else
						Accept_Numeric = false
						channel:SendOrangeMessage('Casino', 'You won\'t accept numeric bets (123/456)')
					end
				else
					Accept_Numeric = true
					channel:SendOrangeMessage('Casino', 'Invalid value. You will accept numeric bets by default')
				end
				HEADS_UP_DISPLAY.NUMERIC_BETS.VALUE:SetText(tostring(Accept_Numeric))
				if (Accept_Numeric) then
					HEADS_UP_DISPLAY.NUMERIC_BETS.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.NUMERIC_BETS.VALUE:SetTextColor(178, 34, 34)
				end
			end
		elseif (setting_cmd == 'ping') then
			if (setting_value) then
				if tonumber(setting_value) ~= nil then
					setting_value = setting_value + 0
					if (setting_value >= 0 and setting_value <= 1000) then
						Ping_Compensation = setting_value
						channel:SendOrangeMessage('Casino', 'Ping compensation has been set to '..Ping_Compensation)
					else
						Ping_Compensation = 100
						channel:SendOrangeMessage('Casino', 'Invalid value. Ping compensation has been reset to '..Ping_Compensation)
					end
				else
					Ping_Compensation = 100
					channel:SendOrangeMessage('Casino', 'Invalid value. Ping compensation has been reset to '..Ping_Compensation)
				end
				HEADS_UP_DISPLAY.PING_COMPENSATION.VALUE:SetText(tostring(Ping_Compensation))
			end
		elseif (setting_cmd == 'broadcast') then
			if (setting_value) then
				if (setting_value == 'true' or setting_value == 'false') then
					if (setting_value == 'true') then
						Broadcast_Messages = true
						channel:SendOrangeMessage('Casino', 'You will broadcast messages')
					else
						Broadcast_Messages = false
						channel:SendOrangeMessage('Casino', 'You won\'t broadcast messages')
					end
				else
					Broadcast_Messages = true
					channel:SendOrangeMessage('Casino', 'Invalid value. You will broadcast messages by default')
				end
				HEADS_UP_DISPLAY.BROADCAST_MESSAGES.VALUE:SetText(tostring(Broadcast_Messages))
				if (Broadcast_Messages) then
					HEADS_UP_DISPLAY.BROADCAST_MESSAGES.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.BROADCAST_MESSAGES.VALUE:SetTextColor(178, 34, 34)
				end
			end
		elseif (setting_cmd == 'yell') then
			if (setting_value) then
				if (setting_value == 'true' or setting_value == 'false') then
					if (setting_value == 'true') then
						Yell_Broadcast = true
						channel:SendOrangeMessage('Casino', 'You will yell broadcast messages')
					else
						Yell_Broadcast = false
						channel:SendOrangeMessage('Casino', 'You won\'t yell broadcast messages')
					end
				else
					Yell_Broadcast = false
					channel:SendOrangeMessage('Casino', 'Invalid value. You won\'t yell broadcast messages by default')
				end
				HEADS_UP_DISPLAY.YELL_BROADCAST.VALUE:SetText(tostring(Yell_Broadcast))
				if (Yell_Broadcast) then
					HEADS_UP_DISPLAY.YELL_BROADCAST.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.YELL_BROADCAST.VALUE:SetTextColor(178, 34, 34)
				end
			end
		elseif (setting_cmd == 'alwaysbc') then
			if (setting_value) then
				if (setting_value == 'true' or setting_value == 'false') then
					if (setting_value == 'true') then
						Always_Broadcast = true
						channel:SendOrangeMessage('Casino', 'You will always broadcast messages')
					else
						Always_Broadcast = false
						channel:SendOrangeMessage('Casino', 'You will only broadcast messages under certain conditions')
					end
				else
					Always_Broadcast = false
					channel:SendOrangeMessage('Casino', 'Invalid value. You will only broadcast messages under certain conditions by default')
				end
				HEADS_UP_DISPLAY.ALWAYS_BROADCAST.VALUE:SetText(tostring(Always_Broadcast))
				if (Always_Broadcast) then
					HEADS_UP_DISPLAY.ALWAYS_BROADCAST.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.ALWAYS_BROADCAST.VALUE:SetTextColor(178, 34, 34)
				end
			end
		elseif (setting_cmd == 'dustbin') then
			if (setting_value) then
				if (setting_value == 'true' or setting_value == 'false') then
					if (setting_value == 'true') then
						Dustbin_Antitrash = true
						channel:SendOrangeMessage('Casino', 'You will throw trash into dustbin')
					else
						Dustbin_Antitrash = false
						channel:SendOrangeMessage('Casino', 'You will throw trash under your character')
					end
				else
					Dustbin_Antitrash = false
					channel:SendOrangeMessage('Casino', 'Invalid value. You will throw trash under your character by default')
				end
				HEADS_UP_DISPLAY.DUSTBIN_ANTITRASH.VALUE:SetText(tostring(Dustbin_Antitrash))
				if (Dustbin_Antitrash) then
					HEADS_UP_DISPLAY.DUSTBIN_ANTITRASH.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.DUSTBIN_ANTITRASH.VALUE:SetTextColor(178, 34, 34)
				end
			end
		elseif (setting_cmd == 'debug') then
			if (setting_value) then
				if (setting_value == 'true' or setting_value == 'false') then
					if (setting_value == 'true') then
						Debug_Messages = true
						channel:SendOrangeMessage('Casino', 'You will see debug messages')
					else
						Debug_Messages = false
						channel:SendOrangeMessage('Casino', 'You won\'t see debug messages')
					end
				else
					Debug_Messages = false
					channel:SendOrangeMessage('Casino', 'Invalid value. You won\'t see debug messages by default')
				end
				HEADS_UP_DISPLAY.DEBUG_MESSAGES.VALUE:SetText(tostring(Debug_Messages))
				if (Debug_Messages) then
					HEADS_UP_DISPLAY.DEBUG_MESSAGES.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.DEBUG_MESSAGES.VALUE:SetTextColor(178, 34, 34)
				end
			end
		elseif (setting_cmd == 'win') then
			if (setting_value) then
				if (setting_value == 'none' or setting_value == 'false') then
					Winning_Item = 'none'
					channel:SendOrangeMessage('Casino', 'You won\'t use any item when player wins')
				else
					if (Item.GetID(setting_value) ~= 0) then
						Winning_Item = setting_value
						Winning_Item_ID = Item.GetID(Winning_Item)
						channel:SendOrangeMessage('Casino', 'You will use a '..Winning_Item..' when player wins')
					else
						Winning_Item = 'none'
						channel:SendOrangeMessage('Casino', 'Invalid value. You won\'t use any item by default when player wins')	
					end
				end
				HEADS_UP_DISPLAY.WINNING_ITEM.VALUE:SetText(Winning_Item)
			end
		elseif (setting_cmd == 'lose') then
			if (setting_value) then
				if (setting_value == 'none' or setting_value == 'false') then
					Losing_Item = 'none'
					channel:SendOrangeMessage('Casino', 'You won\'t use any item when player loses')
				else
					if (Item.GetID(setting_value) ~= 0) then
						Losing_Item = setting_value
						Losing_Item_ID = Item.GetID(Losing_Item)
						channel:SendOrangeMessage('Casino', 'You will use a '..Losing_Item..' when player loses')
					else
						Losing_Item = 'none'
						channel:SendOrangeMessage('Casino', 'Invalid value. You won\'t use any item by default when player loses')	
					end
				end
				HEADS_UP_DISPLAY.LOSING_ITEM.VALUE:SetText(Losing_Item)
			end
		else
			channel:SendOrangeMessage('Casino', 'Unknown command. Type /help for a list of available commands.')
		end
	else
		local execute_cmd = message:match('^/([a-z]+)$')
		if (execute_cmd) then
			if (execute_cmd == 'new') then
				Casino_Loaded = false
				PickUpDiceAndDecoration()
				ReachGlowingSwitch()
			elseif (execute_cmd == 'open') then
				Open_Containers()
				channel:SendOrangeMessage('Casino', 'All containers have been opened successfully.')
			elseif (execute_cmd == 'start') then
				Casino_Loaded = false
				PickUpDiceAndDecoration()
				if (ReachGlowingSwitch()) then
					Open_Containers()
					Casino_Loaded = true
					channel:SendOrangeMessage('Casino', 'The script has been started.')
				end
			elseif (execute_cmd == 'close') then
				Casino_Loaded = false
				PickUpDiceAndDecoration()
				for i = 0, 15 do
					closeContainer(i)
				end
				channel:SendOrangeMessage('Casino', 'All containers have been closed.')
			elseif (execute_cmd == 'stop') then
				Casino_Loaded = false
				PickUpDiceAndDecoration()
				for i = 0, 15 do
					closeContainer(i)
				end
				channel:SendOrangeMessage('Casino', 'The script has been stopped.')
			elseif (execute_cmd == 'reset') then
				Payout_Percentage = 80
				Losing_Item = 'none'
				Winning_Item = 'none'
				Debug_Messages = false
				Dustbin_Antitrash = false
				Yell_Broadcast = false
				Always_Broadcast = false
				Broadcast_Messages = true
				Ping_Compensation = 100
				Accept_Numeric = true
				Accept_Abbreviations = true
				Maximum_Cash = 300000
				Minimum_Cash = 5000
				Payout_Percentage = 80
				HEADS_UP_DISPLAY.LOSING_ITEM.VALUE:SetText(Losing_Item)
				HEADS_UP_DISPLAY.WINNING_ITEM.VALUE:SetText(Winning_Item)
				HEADS_UP_DISPLAY.DEBUG_MESSAGES.VALUE:SetText(tostring(Debug_Messages))
				HEADS_UP_DISPLAY.ABBREVIATIONS.VALUE:SetText(tostring(Accept_Abbreviations))
				HEADS_UP_DISPLAY.DUSTBIN_ANTITRASH.VALUE:SetText(tostring(Dustbin_Antitrash))
				HEADS_UP_DISPLAY.BROADCAST_MESSAGES.VALUE:SetText(tostring(Broadcast_Messages))
				HEADS_UP_DISPLAY.YELL_BROADCAST.VALUE:SetText(tostring(Yell_Broadcast))
				HEADS_UP_DISPLAY.PING_COMPENSATION.VALUE:SetText(tostring(Ping_Compensation))
				HEADS_UP_DISPLAY.NUMERIC_BETS.VALUE:SetText(tostring(Accept_Numeric))
				HEADS_UP_DISPLAY.MIN_MAX_BET.VALUE:SetText((Minimum_Cash/1000)..'k - '..(Maximum_Cash/1000)..'k')
				HEADS_UP_DISPLAY.MIN_MAX_BET.VALUE:SetText((Minimum_Cash/1000)..'k - '..(Maximum_Cash/1000)..'k')
				HEADS_UP_DISPLAY.PAYOUT.VALUE:SetText(tostring(Payout_Percentage)..'%')
				if (Debug_Messages) then
					HEADS_UP_DISPLAY.DEBUG_MESSAGES.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.DEBUG_MESSAGES.VALUE:SetTextColor(178, 34, 34)
				end
				if (Dustbin_Antitrash) then
					HEADS_UP_DISPLAY.DUSTBIN_ANTITRASH.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.DUSTBIN_ANTITRASH.VALUE:SetTextColor(178, 34, 34)
				end
				if (Yell_Broadcast) then
					HEADS_UP_DISPLAY.YELL_BROADCAST.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.YELL_BROADCAST.VALUE:SetTextColor(178, 34, 34)
				end
				if (Broadcast_Messages) then
					HEADS_UP_DISPLAY.BROADCAST_MESSAGES.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.BROADCAST_MESSAGES.VALUE:SetTextColor(178, 34, 34)
				end
				if (Always_Broadcast) then
					HEADS_UP_DISPLAY.ALWAYS_BROADCAST.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.ALWAYS_BROADCAST.VALUE:SetTextColor(178, 34, 34)
				end
				if (Accept_Numeric) then
					HEADS_UP_DISPLAY.NUMERIC_BETS.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.NUMERIC_BETS.VALUE:SetTextColor(178, 34, 34)
				end
				if (Accept_Abbreviations) then
					HEADS_UP_DISPLAY.ABBREVIATIONS.VALUE:SetTextColor(107, 142, 35)
				else
					HEADS_UP_DISPLAY.ABBREVIATIONS.VALUE:SetTextColor(178, 34, 34)
				end
				channel:SendOrangeMessage('Casino', 'All settings have been reset.')
			elseif (execute_cmd == 'help') then
				channel:SendOrangeMessage('', 'Available commands:')
				channel:SendOrangeMessage('', '/help                                             Show this information.')
				channel:SendOrangeMessage('', '/reset                                           Reset all values.')
				channel:SendOrangeMessage('', '/new                                              Go to a new depot.')
				channel:SendOrangeMessage('', '/start                                           Start the script.')
				channel:SendOrangeMessage('', '/stop                                             Stop the script.')
				channel:SendOrangeMessage('', '/open                                            Open all containers.')
				channel:SendOrangeMessage('', '/close                                            Close all containers.')
				channel:SendOrangeMessage('', '/broadcast [bool]                      Switch broadcast mode.')
				channel:SendOrangeMessage('', '/yell [bool]                                  Switch yell broadcasted message.')
				channel:SendOrangeMessage('', '/alwaysbc [bool]                       Switch always broadcast messages.')
				channel:SendOrangeMessage('', '/win [string]                               Item name to use when player wins bet.')
				channel:SendOrangeMessage('', '/lose [string]                              Item name to use when player loses bet.')
				channel:SendOrangeMessage('', '/dustbin [bool]                           Switch use of dustbin in anti-trash system.')
				channel:SendOrangeMessage('', '/abbreviated [bool]                 Accept abbreviated values: h/l')
				channel:SendOrangeMessage('', '/numeric [bool]                          Accept numeric values: 123/456')
				channel:SendOrangeMessage('', '/payout [number]                     Percentage of payout.')
				channel:SendOrangeMessage('', '/max [number]                           Maximum amount of cash.')
				channel:SendOrangeMessage('', '/min [number]                             Minimum amount of cash.')
				channel:SendOrangeMessage('', '/ping [number]                           Ping compensation for connections issues.')
				channel:SendOrangeMessage('', '/debug [bool]                             Switch display debug messages.')
			else
				channel:SendOrangeMessage('Casino', 'Unknown command. Type /help for a list of available commands.')
			end
		else
			channel:SendOrangeMessage('Casino', 'Unknown command. Type /help for a list of available commands.')
		end
	end
end

function onClose(channel)
	print('Casino: Script channel has been closed.')
end

local CasinoChannel = Channel.Open('Casino', onSpeak, onClose)
CasinoChannel:SendOrangeMessage('Casino', 'Welcome to the script channel! Type /help for a list of available commands.')

function ReachGlowingSwitch()
	local GlowingSwitches = {}
	local AvailablePairsOfSwitches = {}
	local posz = Self.Position().z
	local switchID =  10145
	for posx = 7, -7, -1 do
		for posy = 5, -5, -1 do
			if (switchID == Map.GetTopUseItem(Self.Position().x + posx, Self.Position().y + posy, posz).id) then
				for posx_pair = -2, 2, 2 do
					for posy_pair = -2, 2, 2 do
						if not (Self.Position().x + posx == Self.Position().x + posx + posx_pair and Self.Position().y + posy == Self.Position().y + posy + posy_pair) then
							if (switchID == Map.GetTopUseItem(Self.Position().x + posx + posx_pair, Self.Position().y + posy + posy_pair, posz).id) then
								local insertSwitch = false
								if(#GlowingSwitches <= 0) then
									insertSwitch = true
								else
									local opx, opy = Self.Position().x + posx, Self.Position().y + posy
									local px, py = Self.Position().x + posx + posx_pair, Self.Position().y + posy + posy_pair
									for iterator, PairsOfSwitches in ipairs(GlowingSwitches) do
										if (PairsOfSwitches.Operator.x == px and PairsOfSwitches.Operator.y == py) and
											(PairsOfSwitches.Player.x == opx and PairsOfSwitches.Player.y == opy) then
											insertSwitch = false
											break
										else
											insertSwitch = true
										end
									end
								end
								if (insertSwitch) then
									table.insert(GlowingSwitches, { Operator = { x = Self.Position().x + posx, y = Self.Position().y + posy },
																	Player = { x = Self.Position().x + posx + posx_pair, y = Self.Position().y + posy + posy_pair } } )
								end
							end
						end
					end
				end
			end
		end
	end
	CasinoChannel:SendOrangeMessage('Casino', 'Found '..#GlowingSwitches..' pairs of switches.')
	if (#GlowingSwitches > 0) then
		local GlowingSwitchReached = false
		while not GlowingSwitchReached do
			for iterator, PairsOfSwitches in ipairs(GlowingSwitches) do
				Self.UseItemFromGround(PairsOfSwitches.Operator.x, PairsOfSwitches.Operator.y, posz)
				local prevPosition = Self.Position()
				wait(1000 + Ping_Compensation, 2000 + Ping_Compensation)
				if Self.DistanceFromPosition(prevPosition.x, prevPosition.y, posz) >= 1 then
					while Self.DistanceFromPosition(PairsOfSwitches.Operator.x, PairsOfSwitches.Operator.y, posz) > 1 do
						Self.UseItemFromGround(PairsOfSwitches.Operator.x, PairsOfSwitches.Operator.y, posz)
						wait(100 + Ping_Compensation, 200 + Ping_Compensation)
					end
					if(PairsOfSwitches.Operator.x < Self.Position().x) then
						Self.Step(WEST)
						GlowingSwitchReached = true
						break
					elseif(PairsOfSwitches.Operator.x > Self.Position().x) then
						Self.Step(EAST)
						GlowingSwitchReached = true
						break
					elseif(PairsOfSwitches.Operator.y < Self.Position().y) then
						Self.Step(NORTH)
						GlowingSwitchReached = true
						break
					elseif(PairsOfSwitches.Operator.y > Self.Position().y) then
						Self.Step(SOUTH)
						GlowingSwitchReached = true
						break
					else
						GlowingSwitchReached = true
						break
					end
				end
			end
		end
		CasinoChannel:SendOrangeMessage('Casino', 'Depot found.')
		wait(1000 + Ping_Compensation, 2000 + Ping_Compensation)
		return true
	end
	return false
end

Module.New('Casino_Restack', function(Mod)
	if (Casino_Loaded) then
		Containers.Crystal = Container(4)
		Containers.Platinum = Container(5)
		if(Containers.Platinum:ItemCount() >= 2) then
			for itemPlatinumCoin = Containers.Platinum:ItemCount() - 1, 0, -1 do
				if not (itemPlatinumCoin == 0) then
					local item_temp = Containers.Platinum:GetItemData(itemPlatinumCoin)
					local item_prev_temp = Containers.Platinum:GetItemData(itemPlatinumCoin-1)
					if (item_temp.count < 100) then
						plat_moved = Containers.Platinum:MoveItemToContainer(itemPlatinumCoin, Containers.Platinum:Index(), 0)
						if (Debug_Messages) then
							CasinoChannel:SendOrangeMessage('Casino', 'Restack System. Moving '..item_temp.count..' platinum coins to beginning of the stack.')
						end
						break
					end
				end
			end
		end
		if(Containers.Crystal:ItemCount() >= 2) then
			for itemCrystalCoin = Containers.Crystal:ItemCount() - 1, 0, -1 do
				if not (itemCrystalCoin == 0) then
					local item_temp = Containers.Crystal:GetItemData(itemCrystalCoin)
					local item_prev_temp = Containers.Crystal:GetItemData(itemCrystalCoin-1)
					if (item_temp.count < 100) then
						crystal_moved = Containers.Crystal:MoveItemToContainer(itemCrystalCoin, Containers.Crystal:Index(), 0)
						if (Debug_Messages) then
							CasinoChannel:SendOrangeMessage('Casino', 'Restack System. Moving '..item_temp.count..' crystal coins to beginning of the stack.')
						end
						break
					end
				end
			end
		end
	end
	Mod:Delay(600)
end)


Signal.OnReceive('MainSignal', function(signal, data)
	if (Casino_Loaded) then
		if(type(data) == 'number')then
			Roll(data)
		elseif(type(data) == 'table') then
			Casino_Game(data)
		else
			if (Debug_Messages) then
				print('Casino: Unknown signal received: '..signal)
			end
		end
	end
end)
dofile('Casino v0.2.3-Proxy.lua')

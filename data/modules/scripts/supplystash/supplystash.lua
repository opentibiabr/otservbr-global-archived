SupplyStash = {}

SupplyStash.Credits = {
	Developer = "DudZ, Ticardo (Rick)",
	Version = "1.0",
	lastUpdate = "01/04/2020 - 12:00",
	todo = {"The whole system"}
}

SupplyStash.Items = {
	{id=3723, count = 1000}, 
	{id=16167, count = 1234},  
	{id=7364, count = 4321}
} --Test items

SupplyStash.Size = 2000

SupplyStash.S_Packets= { OpenWindow = 0x29 }

SupplyStash.C_Packets = { Withdraw = 0x28 }


function onRecvbyte(player, msg, byte)
    if (byte == SupplyStash.C_Packets.Withdraw) then
		SupplyStash.parseWithdraw(plyer, msg)
    end
end

SupplyStash.sendOpenWindow = function(player)
	print("SupplyStash.sendOpenWindow")
	local msg = NetworkMessage()
	msg:addByte(SupplyStash.S_Packets.OpenWindow);
	
	msg:addU16(#SupplyStash.Items);
	for i, item in pairs(SupplyStash.Items) do
		msg:addU16(item.id)
		msg:addU32(item.count)
	end
	
	msg:addU16(SupplyStash.Size);
	
	msg:sendToPlayer(player)
	return true
end

SupplyStash.parseWithdraw = function(player, msg)
	print("SupplyStash.parseWithdraw")
	local action = msg:getByte()
	if action <= 2 then --How to trigger this lower actions?
		local from = msg:getPosition() -- ??
		local unk1 = msg:getU16() -- ??
		local unk2 = msg:getU8(); -- ??
		if action == 0 then
			local unk3 = msg:getU8(); -- ??
		end
	elseif action == 3 then -- Withdraw from stash window
		local itemID = msg:getU16()
		local amount = msg:getU32()
	end
end


SupplyStash.TestarBytes = function(player, msg)
	print("Bytes Test Start")
	for i= 1, 16 do
		print(i.." "..msg:getByte())
	end
	print("Bytes Test End")
end


DailyRewardSystem = {
    Developer = "gpedro",
    Version = "1.0",
    lastUpdate = "24/02/2020 - 00:00"
  }
  
--   local ServerPackets = {
--     DailyRewardHistory = 0xE6, -- Done
--   }
  
--   local ClientPackets = {
--     OpenRewardWall = 0xE5,
--   }

function onRecvbyte(player, msg, byte)
    if byte ~= 0xe5 then
        return
    end

    local menu = msg:getByte() 
    local msg = NetworkMessage()
    msg:addByte(0xe5)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)
    msg:addByte(0)

end
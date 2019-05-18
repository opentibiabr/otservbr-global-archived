function onLogout(cid)
db.query("UPDATE `players` SET `cast` = 0 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
    return true
end
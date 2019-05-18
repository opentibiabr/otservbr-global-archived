-- 

function onThink(interval, lastExecution)
	local messages = {
	"[SUPORTE]: Utilizando nosso sistema de ticket via website o usuário tem contato direto com o Administrador.",
	"[REGRAS]: Evite ser punido, não viole nossas regras.",
	"[CONTRIBUA]: Ao relatar erros, você contribui com o crescimento do servidor, pode ser relatado via TICKET no website.",
	"[SEGURANÇA]: Os Administradores jamais irão pedir informações sobre suas senhas e contas.",
	"[SEGURANÇA]: Proteja sua senha. Use-a apenas em nosso website oficial Eduvio."
}

    Game.broadcastMessage(messages[math.random(#messages)], TALKTYPE_PRIVATE_FROM) 
    return true
end
<h1 align="center">OTServBR - Global</h1>

<caption>Leia esta documentação nos seguintes idiomas:</caption>
<table>
	<tbody>
		<tr>
			<td> <a href="https://github.com/opentibiabr/OTServBR-Global/blob/master/README-PT.md">Português</a></td>
			<td> <a href="https://github.com/opentibiabr/OTServBR-Global/blob/master/README.md">Inglês</a></td>
			<td> <a href="https://github.com/opentibiabr/OTServBR-Global/blob/master/README-ES.md">Espanhol</a></td>
		</tr>
	</tbody>
</table>

<h2>Referências:</h2>

-> [Fórum OTBR](https://forums.otserv.com.br)

<h2>Ferramentas e Clientes</h2>

-> Baixar o SDK (Software Development Kit) para OTServBR - Global [Baixe Aqui!](https://gitlab.com/open-tibia-br/otservbr-clients/)

<h2>Introdução:</h2>

Nossa ideia é resgatar a antiga comunidade do Open Tibia (gratuitamente, na medida do possível). Acabar com a venda de sources e datapacks que estão nas mãos de algumas pessoas que se chamam de desenvolvedores ...
Pessoas que estão fazendo milhares de reais ou dólares por mês em cima de um projeto (OpenTibia) que foi desenvolvido a partir do 0 de graça,por desenvolvedores que eram de fato a favor da comunidade. Vamos iniciar o que esperamos que seja a revolução da atual comunidade (vergonhosa) Open Tibia (infelizmente eu acredito que é só na comunidade brasileira, esta situação)... Pedimos desculpas a todos que trabalharam no OpenTibia durante anos para ver o situação chegar a este ponto crítico. Faremos o nosso melhor para reverter essa situação (ou pelo menos suavizá-la), mesmo que muitas dessas pessoas mal-intencionadas ponham as mãos no conteúdo mesmo que não mereçam (aqueles que merecem não devem pagar pelo erro de alguns)

PS: Pedimos desculpas a toda a comunidade Open Tibia por repositórios com bug e pessoas <strike>OTXBR</strike> maliciosas que transformaram o OTServer em um mercado.

<h2>Observações importantes:</h2>

Temos os novos sistemas em linguagem .lua adicionados na source... Porém, apenas o QuestLog por lua está com todas quests registradas, nem são todas, e é necessário revisão. 
As actions por lua, monsters, talkactions e weapons estão funcionais, testado e sem bug (aparentemente), porém os scripts lua precisam ser criados. A nossa proposta é de que como está difícil as pessoas contribuirem nos projetos e precisamos de ajuda, iremos adicionar o sistema de antirollback na source se houverem contribuições no projeto, e não estamos falando de um ou outro commit, mas de fazer um trabalho sério... De inicio iremos liberar apenas o sistema de crashlog, ainda não está 100% funcional, mas assim que estiver será colocado na source.

Os novos sistemas em .lua se encontram na pasta data/scripts/
Funcionando também o /reload global, /reload libs e /reload scripts

<h2>Introdução</h2>

<h2>Recursos do Mapa</h2>
<table>
	<tbody>
		<tr>
		  <td>Secret Library</td>           
          <td>Mota Extension</td>
          <td>Novas Asuras</td>
          <td>Falcon Bastion</td>
          <td>Warzones 4, 5, 6</td>
          <td>Cults of Tibia</td>  
		</tr>
	</tbody>
</table>
<table>
	<tbody>
		<tr>
		  <td>First Dragon</td>           
          <td>Darashia Elite Dungeon</td>
          <td>Cursed Spreads (Full Grimvale)</td>
          <td>Novos Deathlings</td>  	
		</tr>
	</tbody>
</table>

<h2>Recursos Extras</h2>
<table>
	<tbody>
		<tr>
          <td>Novos Depot</td>           
          <td>Novos Spawn</td>
          <td>Novos Cast System</td>
          <td>Novos Npc System via Bank Balance</td>
          <td>Novos Critical Boost System</td>
          <td>Novas Potions</td>  
		</tr>
	</tbody>
</table>
<table>
	<tbody>
		<tr>
          <td>Reward System</td>
          <td>Prey System</td>
          <td>Imbuements System</td>
          <td>Daily Reward System</td>
          <td>Exercise Weapons</td>
		</tr>
	</tbody>
</table>

<h2>Novos Recursos Source/Lua</h2>
<table>
    <tbody>
        <tr>
          <td>Novas Actions por .lua</td>   		  
          <td>Novos Monsters por .lua</td>
		  <td>Novo onDropLoot Lua</td> 
		  <td>Novo onRemoveCount Source</td> 
          <td>Novas Talkactions .lua</td>
		  <td>Nova QuestLog por .lua</td>
          <td>Novas Weapons por .lua</td>         
        </tr>
    </tbody>
</table>

<h2>Recursos de Segurança (Source)</h2>
<table>
    <tbody>
        <tr>
          <td>Exhausted onLooks</td>
          <td>Exhausted Speaks (playerYell and playerSpeakTo</td>
          <td>Exhausted playerMarketOffers</td>
        </tr>
    </tbody>
</table>

<h2>Recursos de Segurança (Datapack)</h2>
<table>
    <tbody>
        <tr>
          <td>Exhausted em todas as actions</td>
          <td>(Em progresso) Exhausted nas conversas com npc's</td>
        </tr>
    </tbody>
</table>

<h2><b>Tutoriais Úteis</b></h2>
<b>Edição do Mapa:</b>
<table>
    <tbody>
        <tr>
		  <td><a href="https://forums.otserv.com.br/index.php?/forums/topic/168190-remeres-map-editor-35-abrindo-mapa-11x/">RME 3.5 Abrindo Mapa 11.x</a></td>
        </tr>
    </tbody>
</table>
<b>Edição do Client:</b>

<table>
    <tbody>
        <tr>
			<td><a href="https://forums.otserv.com.br/index.php?/forums/topic/167592-cliente-tibia-11-com-notepad/)">Cliente Tibia 11 com Notepad++</a></td>
			<td><a href="https://forums.otserv.com.br/index.php?/forums/topic/167611-cliente-tibia-11-com-hexeditorxvi32/)">Cliente Tibia 11 com HexEditorXVI32</a></td>
			<td><a href="https://forums.otserv.com.br/index.php?/forums/topic/167550-compila%C3%A7%C3%A3o-tibia-10-custom-client-desative-a-msg-de-atualiza%C3%A7%C3%A3o-mc-seu-ip/)">Tibia 10 Custom Client</a></td>
        </tr>
    </tbody>
</table>
<b>Servidor Online (MySQL) + Uniform Server:</b>
<table>
    <tbody>
        <tr>
			<td><a href="https://forums.otserv.com.br/index.php?/forums/topic/167681-mysqlotservbr-global-uniform-server%C2%A0-myaac/">OTServBR-Global + MyAAC</a></td>
			<td><a href="https://forums.otserv.com.br/index.php?/forums/topic/167722-mysqlotservbr-global-uniform-server-gesioraac/">OTServBR-Global + GesiorAAC</a></td>
			<td><a href="https://forums.otserv.com.br/index.php?/forums/topic/167738-mysqlotservbr-global-uniform-server%C2%A0-znoteaac-15/">OTServBR-Global + ZnoteAAC 1.5</a></td>
        </tr>
    </tbody>
</table>

<!-- <h2>Etapas de compilação</h2>
Nosso sistema pode ser compilado em vários sistemas operacionais. Atualmente, fornecemos um wiki com instruções de construção para os seguintes sistemas:

<table>
<tbody>
<tr>
<td> <a href="https://gitlab.com/open-tibia-br/otservbr-global">Debian GNU</a></td>
<td> <a href="https://gitlab.com/open-tibia-br/otservbr-global">Ubuntu</a></td>
<td> <a href="https://gitlab.com/open-tibia-br/otservbr-global">Windows</a></td>
<td> <a href="https://gitlab.com/open-tibia-br/otservbr-global">FreeBSD</a></td>
</tr>
</tbody>
</table> -->

<h2>Sites</h2>

<!-- -> OTServBR [Gesior](https://gitlab.com/open-tibia-br/otservbr-website). -->

-> Marco Oliveira [GesiorAAC](https://github.com/marcomoa/Gesior-AAC/archive/master.zip)

-> Slawkens (slawkens) [MyAAC](https://github.com/slawkens/myaac/archive/master.zip) + [MyAAC login.php for Tibia 11](https://github.com/slawkens/myaac-tibia11-login/releases/download/v1.3/myaac-tibia11-login-v1.3.zip).

-> Znote (Znote) [ZnoteAAC](https://github.com/Znote/ZnoteAAC/archive/master.zip).

<h2>Entre em contato</h2>

[Whatsapp Invite](https://chat.whatsapp.com/FWca9zJxOnXHlcxyjfwXaQ)

[Discord Channel](https://discord.gg/3NxYnyV)

<h2>Colaboradores</h2>
Contribuições de qualquer tipo são bem vindas! Você quer ajudar mas não entende muito de c++, mapping, ou scripting? [Baixe](https://github.com/opentibiabr/OTServBR-Global/archive/master.zip) nossa base, teste e reporte os bugs [aqui](https://github.com/opentibiabr/OTServBR-Global/issues)

Clique em "new issue", digite o "Tittle" do seu issue, depois a "Description", se possível adicione vídeo, gif ou foto demonstrando e um pequeno texto detalhando, se envolver o mapa deixe a posição também, iremos analisar e resolver o mais rápido que pudermos.

Você pode ver todos os colaboradores [aqui](https://github.com/opentibiabr/OTServBR-Global/graphs/contributors)

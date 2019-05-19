<h1 align="center">OTServBR - Global</h1>

<caption>Lea esta documentación en los siguientes idiomas:</caption>
<table>
    <tbody>
        <tr>
			<td><a href="https://github.com/opentibiabr/OTServBR-Global/blob/master/README-ES.md">Español</a></td>
			<td><a href="https://github.com/opentibiabr/OTServBR-Global/blob/master/README-PT.md">Portugués</a></td>
			<td><a href="https://github.com/opentibiabr/OTServBR-Global/blob/master/README.md">Inglés</a></td>
        </tr>
    </tbody>
</table>

<h2>Referencias:</h2>

-> [Foro OTBR](https://forums.otserv.com.br)

<h2>Herramientas y Clientes</h2>

-> Descargar SDK (Software Development Kit) para OTBR Server Global [Descargar aquí!](https://gitlab.com/open-tibia-br/otservbr-clients/)

<h2>Introducción:</h2>

Nuestra idea es rescatar a la antigua comunidad de Open Tibia (sin cargo alguno).
Poner fin a la venta de fuentes y paquetes de datos que están en manos de algunas personas que se hacen llamar desarrolladores ...
Personas que están ganando miles de reales o dólares al mes en la parte superior de un proyecto (OpenTibia) que se desarrolló de forma gratuita desde 0, por desarrolladores que de hecho estaban a favor de la comunidad.
Iniciaremos lo que esperamos sea la revolución de la actual (vergonzosa) comunidad de Open Tibia (desafortunadamente, creo que es solo en la comunidad brasileña, esta situación) ... Pedimos disculpas a todos los que trabajaron en OpenTibia durante años para ver el La situación llega en este punto crítico. Haremos todo lo posible para revertir esta situación (o al menos suavizarla), a pesar de que muchas de estas personas maliciosas obtendrán el contenido de sus manos aunque no lo merezcan (aquellos que lo merecen no deberían pagar por el error de los somes). )

Observación: Pedimos disculpas a toda la comunidad de Open Tibia por los repositorios con errores y las personas <strike>OTXBR</strike> malintencionadas que han convertido a OTServer en un mercado.

<h2>Observaciones Importantes:</h2>

Tenemos los nuevos sistemas en lenguaje .lua agregados en la fuente. Sin embargo, sólo el QuestLog por luna está con todas las misiones registradas, ni son todas y es necesario revisar.
Las acciones por luna, monstruos, talkactions y armas son funcionales, probadas y sin errores (aparentemente), pero los scripts de luna necesitan ser creados. Nuestra propuesta es que como es difícil que las personas contribuyan en los proyectos y necesitamos ayuda, agregaremos el sistema de antirollback en la fuente si hay contribuciones en el proyecto, y no estamos hablando de uno u otro commit, sino de hacer un trabajo serio. De inicio vamos a liberar sólo el sistema de crashlog, aún no está 100% funcional, pero tan pronto como se va a colocar en la fuente.

Los nuevos sistemas en .lua se encuentran en la carpeta data/scripts/
Funcionando también el /reload global, /reload libs y /reload scripts

<h2>Características de los Mapas:</h2>
<table>
    <tbody>
        <tr>
          <td>Secret Library</td>    
          <td>Mota Extension</td>
          <td>Nuevos asuras</td>
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
          <td>Nuevos Asuras</td>
          <td>Cursed Spreads (Full Grimvale)</td>
          <td>Nuevos Deathlings</td>  
        </tr>
    </tbody>
</table>

<h2>Funciones Adicionales</h2>
<table>
    <tbody>
        <tr>
          <td>Nuevo Depot</td>           
          <td>Nuevo Spawn</td>
          <td>Nuevo Cast System</td>
          <td>Nuevo Npc System via Bank Balance</td>
          <td>Nuevo Critical Boost System</td>
          <td>Nuevo Potions</td> 
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

<h2>Nuevo Recursos Source/Lua</h2>
<table>
    <tbody>
        <tr>
          <td>Nuevo Actions Lua</td>  
		  <td>Nuevo onDropLoot Lua</td> 
		  <td>Nuevo onRemoveCount Source</td> 
          <td>Nuevo Monsters Lua</td>
          <td>Nuevo Talkactions Lua</td>
		  <td>Nuevo QuestLog Lua</td>
          <td>Nuevo Weapons Lua</td>         
        </tr>
    </tbody>
</table>

<h2>Característica de Seguridad (Source)</h2>
<table>
    <tbody>
        <tr>
          <td>Exhausted onLooks</td>
          <td>Habla agotada (playerYell y playerSpeakTo</td>
          <td>Exhausted playerMarketOffers</td>
        </tr>
    </tbody>
</table>

<h2>Característica de Seguridad (Datapack)</h2>
<table>
    <tbody>
        <tr>
          <td>Exhaust en todas las acciones </td>
          <td>(En progreso) Exhaust en las conversaciones de npc </td>
        </tr>
    </tbody>
</table>

<h2><b>Tutoriales Útiles</b></h2>
<b>Edición del Mapa:</b>
<table>
    <tbody>
        <tr>
          <td>[RRME 3.5 Abriendo Mapa 11.x](https://forums.otserv.com.br/index.php?/forums/topic/168190-remeres-map-editor-35-abrindo-mapa-11x/)</td>
        </tr>
    </tbody>
</table>
<b>Edición del Cliente:</b>
<table>
    <tbody>
        <tr>
			<td>[Cliente Tibia 11 con Notepad++](https://forums.otserv.com.br/index.php?/forums/topic/167592-cliente-tibia-11-com-notepad/)</td>
			<td>[Cliente Tibia 11 con HexEditorXVI32](https://forums.otserv.com.br/index.php?/forums/topic/167611-cliente-tibia-11-com-hexeditorxvi32/)</td>
			<td>[Tibia 10 Cliente Personalizado](https://forums.otserv.com.br/index.php?/forums/topic/167550-compila%C3%A7%C3%A3o-tibia-10-custom-client-desative-a-msg-de-atualiza%C3%A7%C3%A3o-mc-seu-ip/)</td>
        </tr>
    </tbody>
</table>
<b>Servidor en Línea (MySQL) + Uniform Server:</b>
<table>
    <tbody>
        <tr>
			<td>[OTServBR-Global + MyAAC](https://forums.otserv.com.br/index.php?/forums/topic/167681-mysqlotservbr-global-uniform-server%C2%A0-myaac/)</td>
			<td>[OTServBR-Global + GesiorAAC](https://forums.otserv.com.br/index.php?/forums/topic/167722-mysqlotservbr-global-uniform-server-gesioraac/)</td>
			<td>[OTServBR-Global + ZnoteAAC 1.5](https://forums.otserv.com.br/index.php?/forums/topic/167738-mysqlotservbr-global-uniform-server%C2%A0-znoteaac-15/)</td>
        </tr>
    </tbody>
</table>

<!--<h2>Pasos de compilación</h2>
Nuestro sistema puede compilarse en una variedad de sistemas operativos. Actualmente proporcionamos una wiki con instrucciones de compilación para los siguientes sistemas:

<table>
    <tbody>
        <tr>
          <td> <a href="https://gitlab.com/open-tibia-br/otservbr-global"> Debian GNU </a> </td>
          <td> <a href="https://gitlab.com/open-tibia-br/otservbr-global"> Ubuntu </a> </td>
          <td> <a href="https://gitlab.com/open-tibia-br/otservbr-global"> Windows </a> </td>
          <td> <a href="https://gitlab.com/open-tibia-br/otservbr-global"> FreeBSD </a> </td>
        </tr>
    </tbody>
</table> -->

<h2>Websites</h2>

<!-- -> OTServBR [Gesior](https://gitlab.com/open-tibia-br/otservbr-website). -->

-> Marco Oliveira [GesiorAAC](https://github.com/marcomoa/Gesior-AAC/archive/master.zip)

-> Slawkens (slawkens) [MyAAC](https://github.com/slawkens/myaac/archive/master.zip) + [MyAAC login.php for Tibia 11](https://github.com/slawkens/myaac-tibia11-login/releases/download/v1.3/myaac-tibia11-login-v1.3.zip).

-> Znote (Znote) [ZnoteAAC](https://github.com/Znote/ZnoteAAC/archive/master.zip).

<h2>Contacto</h2>

[Invitación a Whatsapp](https://chat.whatsapp.com/FWca9zJxOnXHlcxyjfwXaQ)

[Discord Channel](https://discord.gg/3NxYnyV)

<h2>Colaboradores</h2>
Las contribuciones de cualquier tipo son bienvenidas! Usted quiere ayudar pero no entiende mucho de c ++, mapping, o scripting? [Descarga](https://github.com/opentibiabr/OTServBR-Global/archive/master.zip) nuestra base, prueba y reporte los bugs [aquí](https://github.com/opentibiabr/OTServBR-Global/issues)

Haga clic en "new issue", escriba el "Tittle" de su tema, luego la "descripción", si es posible añada vídeo, gif o foto demostrando y un pequeño texto detallando, si involucra el mapa deje la posición también, vamos a analizar y resolver lo más rápido que podamos.

Puede ver todos los colaboradores [aquí](https://github.com/opentibiabr/OTServBR-Global/graphs/contributors)
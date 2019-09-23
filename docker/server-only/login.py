from flask import Flask
from flask import jsonify
from flask import request
import mysql.connector as mariadb
import time

app = Flask(__name__)

def do_login(data):

        playdata = {
            'worlds': [
                {
                    'id': 0,
                    'name': 'Test Server',
                    'externaladdressprotected': '127.0.0.1',
                    'externalportprotected': 7171,
                    'externaladdressunprotected': '127.0.0.1',
                    'externalportunprotected': 7171,
                    'previewstate': 0,
                    'location': 'BRA',
                    'anticheatprotection': False,
                    'pvptype': 'pvp',
                    'istournamentworld': False,
                    'restrictedstore': False,
                    'currenttournamentphase': 2
                },
                {
                    'id': 1,
                    'name': 'Test Server 2',
                    'externaladdressprotected': '127.0.0.1',
                    'externalportprotected': 7171,
                    'externaladdressunprotected': '127.0.0.1',
                    'externalportunprotected': 7171,
                    'previewstate': 0,
                    'location': 'BRA',
                    'anticheatprotection': False,
                    'pvptype': 'pvp',
                    'istournamentworld': False,
                    'restrictedstore': False,
                    'currenttournamentphase': 2
                }
            ],
            "characters": [
                {
                    'worldid': 0,
                    'name': 'GOD1',
                    'ismale': True,
                    'tutorial': False,
                    'level': 1,
                    'vocation': 'Cavaleiro',
                    'outfitid': 128,
                    'headcolor': 78,
                    'torsocolor': 106,
                    'legscolor': 116,
                    'detailcolor': 95,
                    'addonsflags': 0,
                    'ishidden': False,
                    'istournamentparticipant': False,
                    'remainingdailytournamentplaytime': 0
                },
                {
                    'worldid': 1,
                    'name': 'GOD2',
                    'ismale': True,
                    'tutorial': False,
                    'level': 1,
                    'vocation': 'Cavaleiro',
                    'outfitid': 128,
                    'headcolor': 78,
                    'torsocolor': 106,
                    'legscolor': 116,
                    'detailcolor': 95,
                    'addonsflags': 0,
                    'ishidden': False,
                    'istournamentparticipant': False,
                    'remainingdailytournamentplaytime': 0
                }
            ]
        }
        

        # playdata = [worlds, characters]

        session = {
            'sessionkey': 'GOD\n1',
            'lastlogintime': 1,
            'ispremium': 1,
            'premiumuntil': 1,
            'status': 'active',
            'returnernotification': False,
            'showrewardnews': True,
            'isreturner': True,
            'fpstracking': False,
            'optiontracking': False,
            'tournamentticketpurchasestate': 0,
            'emailcoderequest': False
        };

        answer = {'session': session, 'playdata': playdata}

        return jsonify(answer)

  
@app.route('/login.php',  methods=['GET', 'POST'])
def action():

    data = request.get_json()
    print(data)

    if(data['type'] == 'cacheinfo'):
        return jsonify({
                'playersonline': 5,
                'twitchstreams': 0,
                'twitchviewer': 0,
                'gamingyoutubestreams': 0,
                'gamingyoutubeviewer': 0
        })
    if(data['type'] == 'news'):
        return jsonify({})

    if(data['type'] == 'eventschedule'):
        return jsonify({
            'lastupdatetimestamp': time.time(),
            'eventlist': [
                {
                    'startdate': time.time(),
                    'enddate': time.time() + 36600 * 20,
                    'colorlight': '#64162b',
                    'colordark': '#7a1b34',
                    'name': 'First Event',
                    'description': 'OTServBR-Global sdfasdfasdf',
                    'isseasonal': False
                },
                {
                    'startdate': time.time(),
                    'enddate': time.time() + 36600 * 20,
                    'colorlight': '#8B6D05',
                    'colordark': '#735D10',
                    'name': 'Second Event',
                    'description': 'OTServBR-Global asdf asdf asd fas df asdf',
                    'isseasonal': False
                }
            ]
        })

    if(data['type'] == 'boostedcreature'):
        return jsonify({
                'boostedcreature': True,
                'raceid': 39
        })    

    if(data['type'] == 'login'):
        return do_login(data)


# connection = mariadb.connect(host='127.0.0.1',
#                              database='testdb',
#                              user='dbuser',
#                              password='dbpassword')

app.run(debug=True, host='0.0.0.0', port=80)

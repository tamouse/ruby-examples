require 'json'
require 'yaml'

data = DATA.read
puts data
puts JSON.parse(data).to_yaml

__END__
{'m_cacheHandles':
['s2ma\\x00\\x00EUm\\xe4\\x15\\x03\\xba\\xcc\\xd0VV6\\x0bo\\x02}\\xb8\\x81i\\xfa\\x19\\x89\\xbbcW\\xb1\\xb2\\x15\\xa2Ty9\\xf5\\xfb',
's2ma\\x00\\x00EUB\\x1c\\x8a\\xa0\\xf3a\\x9be-#\\xa2s]\\xfe\\xe8\\x12\\xabdB(#^zy~\\xde\\xcf\\xe8\\xb6}\\xa3\\x0e',
's2ma\\x00\\x00EUf\\t82\\x12\\x84S\\xef\\xff\\xbbx|\\x80\\xb7\\xd3\\xee\\xc1\\xad\\x81\\xbd\\xe5\\\\\\x83\\xc90\\xde\\xa7\\x9cNPZ\\x04',
's2ma\\x00\\x00EU8\\x1bk\\xb9\\xa3EZ\\xf5\\xfe\\xaf\\t\\x0b\\xa5\\x1a\\x1cA\\xa0\\x8ap\\x80\\xb8rb\\xba\\x01\\xc6\\x0cYI\\xe5Vv',
's2ma\\x00\\x00EU\\x7fAA\\x1a\\xa5\\x97\\xf4\\xb4d@\\xd4*V3H\\xbfS\\x82-*h\\x11/\\x01\\x04\\xf9\\xb8\\x91\\xf6\\xf0Z\\xe1',
\"s2ma\\x00\\x00EUe1\\xee\\xbf\\xcd\\xef\\xa7:\\xc0\\xec7\\x0f\\xdb\\xee\\xb1R\\xed\\xd1\\n\\xaf\\xe9#dTS\\xba'e\\xd9# O\"]}

'm_campaignIndex': 0,
'm_defaultDifficulty': 3,
'm_description': '',
'm_difficulty': '',
'm_gameSpeed': 4,
'm_imageFilePath': '',
'm_isBlizzardMap': True,
'm_mapFileName': '',
'm_miniSave': False,
'm_modPaths': None,
'm_playerList': [{'m_color': {'m_a': 255,
'm_b': 30,
'm_g': 20,
'm_r': 180},
'm_control': 2,
'm_handicap': 100,
'm_name': 'IIIIIIIIIIII',
'm_observe': 0,
'm_race': 'Protoss',
'm_result': 1,
'm_teamId': 0,
'm_toon': {'m_id': 4047015,
'm_programId': '\\x00\\x00S2',
'm_realm': 1,
'm_region': 2},
'm_workingSetSlotId': 0},
{'m_color': {'m_a': 255,
'm_b': 255,
'm_g': 66,
'm_r': 0},
'm_control': 2,
'm_handicap': 100,
'm_name': '[8K]<sp/>Rapter',
'm_observe': 0,
'm_race': 'Terran',
'm_result': 2,
'm_teamId': 1,
'm_toon': {'m_id': 492026,
'm_programId': '\\x00\\x00S2',
'm_realm': 1,
'm_region': 2},
'm_workingSetSlotId': 1}],
'm_restartAsTransitionMap': False,
'm_thumbnail': {'m_file': 'Minimap.tga'},
'm_timeLocalOffset': -288000000000,
'm_timeUTC': 130345456685521472,
'm_title': 'Yeonsu LE'}

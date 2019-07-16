### Script to monitor head_block_time of nodeos 
import json
import pytz
import datetime as dt
import time
import maya
from urllib.request import urlopen
from dateutil import parser
import requests


def telegram_bot_sendtext(bot_message):

    bot_token = 'xxx' ###Update your token
    bot_chatID = 'xxx' ### update your ID
    send_text = 'https://api.telegram.org/bot' + bot_token + '/sendMessage?chat_id=' + bot_chatID + '&parse_mode=Markdown&text=' + bot_message

    response = requests.get(send_text)

    return response.json()

dtime = dt.datetime.now(pytz.utc)
currentdate = dtime.strftime('%Y-%m-%d')
print("current Date:",currentdate)
current_time =  dt.datetime.now(pytz.utc).hour*60 +dt.datetime.now(pytz.utc).minute
print("Current Time: ",current_time)

data = urlopen('https://dsp.airdropsdac.com/v1/chain/get_info')
j_data = json.load(data)
j_data_str = json.dumps(j_data['head_block_time']).strip('"')

dt1 = maya.parse(j_data_str).datetime()
dsp = dt1.date()
dspdate = dsp.strftime('%Y-%m-%d')
print("DSP Date: ",dspdate)
dspdate_time = parser.parse(j_data_str)
dsp_hour = dspdate_time.hour
dsp_min = dspdate_time.minute
dsp_time = dspdate_time.hour*60 + dspdate_time.minute
print("DSP Time: ",dsp_time)

if currentdate != dspdate:
    print("Date Mismatch Pls look into it ASAP")
    exit
else:
    print("Date Matches Checking Time now")
    if current_time != dsp_time:
        print("Time Mismatch in DSP. Not in Sync, Please check ASAP")
        telegram_bot_sendtext("Time Mismatch in DSP-Nodeos. Not in Sync, Please check ASAP")
    else:
        print("All Fine")
        telegram_bot_sendtext("All fine")

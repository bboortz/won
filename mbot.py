#!/usr/bin/env python3

import os
from mastodon import Mastodon

ACCESS_TOKEN = os.environ['BOT_MASTODON_ACCESS_TOKEN'] # access token for mastodon bot


#   Set up Mastodon
m = Mastodon(
    access_token = ACCESS_TOKEN,
    api_base_url = 'https://botsin.space/'
)

m.status_post("Right now are vaccination appointments in Braunschweig available! Be fast on https://www.impfportal-niedersachsen.de #covid #covid19 #vaccine #braunschweig")

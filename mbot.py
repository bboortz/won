#!/usr/bin/env python3

import os
import sys
from mastodon import Mastodon

ACCESS_TOKEN = os.environ['BOT_MASTODON_ACCESS_TOKEN'] # access token for mastodon bot
WEBSITE = sys.argv[1]
TAG = sys.argv[2]


#   Set up Mastodon
m = Mastodon(
    access_token = ACCESS_TOKEN,
    api_base_url = 'https://botsin.space/'
)

m.status_post("Right now are vaccination appointments at " + WEBSITE + " available! Be fast! #covid #covid19 #vaccine #" + TAG)

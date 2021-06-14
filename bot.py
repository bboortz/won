#!/usr/bin/env python

import os
import logging
import telegram
from telegram.error import NetworkError, Unauthorized
from time import sleep


update_id = None
API_KEY = os.environ['BOT_API_KEY'] # API KEY for telegram bot
USER_ID = os.environ['BOT_USER_ID'] # UserId that will be informed


def main():
    """Run the bot."""
    global update_id
    # Telegram Bot Authorization Token
    bot = telegram.Bot(API_KEY)

    # get the first pending update_id, this is so we can skip over it in case
    # we get an "Unauthorized" exception.

    logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

    try:
        notify(bot)
    except NetworkError:
        sleep(1)
    except Unauthorized:
        # The user has removed or blocked the bot.
        update_id += 1

def notify(bot):
    """Echo the message the user sent."""
    bot.send_message(USER_ID, "Notification!!!")


if __name__ == '__main__':
    main()


#!/usr/bin/env python

import os
import logging
import telegram
from telegram.error import NetworkError, Unauthorized
from time import sleep


API_KEY = os.environ['BOT_TELEGRAM_API_KEY'] # API KEY for telegram bot
USER_IDS = os.environ['BOT_TELEGRAM_USER_IDS'].split(',') # UserIds which will be informed


def main():
    """Run the bot."""
    # Telegram Bot Authorization Token
    bot = telegram.Bot(API_KEY)

    logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')

    try:
        notify(bot)
    except NetworkError:
        sleep(1)
    except Unauthorized:
        # The user has removed or blocked the bot.
        update_id += 1

def notify(bot):
    """notify the user."""
    for uid in USER_IDS:
        bot.send_message(uid, "Get your vaccine!")


if __name__ == '__main__':
    main()


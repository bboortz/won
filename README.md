# won
won is a Website mONitor that monitors a website and notifies users via social media tools like mastadon or telegram.
Currently it is in POC state and can only monitor one website and has a simple notification via mastadon and telegram.

# install dependencies

```
python3 -m venv .venv
source .venv/bin/activate
pip install -U pip
pip install -R requirements.txt
```

# usage
```
export BOT_TELEGRAM_API_KEY="API-KEY"
export BOT_TELEGRAM_USER_IDS="id1,id2,id3"
export BOT_MASTADON_ACCESS_TOKEN="ACCESS-TOKEN"
./won.sh
```

## telegram-orb [![CircleCI](https://circleci.com/gh/woltsu/telegram-orb.svg?style=svg)](https://circleci.com/gh/woltsu/telegram-orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/woltsu/telegram)](https://circleci.com/orbs/registry/orb/woltsu/telegram)

Easily integrate custom [Telegram](https://telegram.org/ "Telegram") notifications into your [CircleCI](https://circleci.com/ "CircleCI") projects.

Learn more about [Orbs](https://circleci.com/docs/2.0/using-orbs/ "Using Orbs").

## Usage
Example config:

```yaml
version: 2.1

orbs:
  telegram: woltsu/telegram@x.y.z

jobs:
  build:
    docker:
      - image: <docker image>
    steps:
      - telegram/<command>
```

## Commands

### Notify
Notify a Telegram channel with a custom message at any point in a job with this custom step.

Example:

```yaml
version: 2.1

orbs:
  telegram: woltsu/telegram@x.y.z

jobs:
  build:
    docker:
      - image: <docker image>
    steps:
      - telegram/notify:
          message: "Notification from CircleCI!"
```

## Jobs

### Notify
Notify a Telegram channel.

Example:

```yaml
version: 2.1

orbs:
  telegram: woltsu/telegram@x.y.z

jobs:
  - telegram/notify:
      message: "Notification from CircleCI!"
```

## Help

### How to create a Telegram bot
https://core.telegram.org/bots


### How To Get A Chat Id
https://stackoverflow.com/questions/32423837/telegram-bot-how-to-get-a-group-chat-id

### How to setup CircleCI environment
In the settings page for your project on CircleCI, click `Environment Variables`. There you need to add 2 variables: `TELEGRAM_BOT_TOKEN` and `TELEGRAM_CHAT_ID`.


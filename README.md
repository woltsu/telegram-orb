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

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `message` | `string` |  Message from CircleCI. | Enter a custom message. |
| `telegram-bot-token` | `env_var_name` | TELEGRAM_BOT_TOKEN | Name of environment variable storing your Telegram bot token |
| `telegram-chat-id` | `env_var_name` | TELEGRAM_CHAT_ID | Name of environment variable storing your Telegram chat id |
| `parse_mode` | `string` | none | Use `Markdown` or `HTML`, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message. |
| `disable_notification` | `boolean` | none | Sends the message silently. Users will receive a notification with no sound. |

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

### GetMe

A simple method for testing your bot's auth token. Returns basic information about the bot in form of a User object.

| Parameter            | Type           | Default            | Description                                                  |
| -------------------- | -------------- | ------------------ | ------------------------------------------------------------ |
| `telegram-bot-token` | `env_var_name` | TELEGRAM_BOT_TOKEN | Name of environment variable storing your Telegram bot token |

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
      - telegram/getme
```


### SendSticker

Send a sticker to Telegram

| Parameter            | Type           | Default            | Description                                                  |
| -------------------- | -------------- | ------------------ | ------------------------------------------------------------ |
| `telegram-bot-token` | `env_var_name` | TELEGRAM_BOT_TOKEN | Name of environment variable storing your Telegram bot token |
| `telegram-chat-id`   | `env_var_name` | TELEGRAM_CHAT_ID   | Name of environment variable storing your Telegram chat id   |
| `telegram-sticker-url`   | `string`       | ""                 | file_id or url to .webp                                      |

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
      - telegram/sendSticker
        telegram-sticker: "https://raw.githubusercontent.com/TelegramBots/book/master/src/docs/sticker-fred.webp"
```

### SendGIF
A command which sends an animated image to the specified Telegram chat.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `telegram-bot-token` | `env_var_name` | TELEGRAM_BOT_TOKEN | Name of environment variable storing your Telegram bot token
| `telegram-chat-id` | `env_var_name` | TELEGRAM_CHAT_ID | Name of environment variable storing your Telegram chat id
| `gif-url` | `string` | | Enter the image's URL

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
      - telegram/sendgif:
          - gif-url: "https://www.example.com/img.gif"
```

### SendPhoto
A command which sends an image to the specified Telegram chat.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `telegram-bot-token` | `env_var_name` | TELEGRAM_BOT_TOKEN | Name of environment variable storing your Telegram bot token
| `telegram-chat-id` | `env_var_name` | TELEGRAM_CHAT_ID | Name of environment variable storing your Telegram chat id
| `image-url` | `string` | | Enter the image's URL

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
      - telegram/sendphoto:
          - image-url: "https://www.example.com/img.jpg"
```

## Jobs

### Notify

Notify a Telegram channel.


| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `message` | `string` |  Job Message from CircleCI! | Enter a custom message. |
| `telegram-bot-token` | `env_var_name` | TELEGRAM_BOT_TOKEN | Name of environment variable storing your Telegram bot token |
| `telegram-chat-id` | `env_var_name` | TELEGRAM_CHAT_ID | Name of environment variable storing your Telegram chat id |
| `parse_mode` | `string` | none | Use `Markdown` or `HTML`, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message. |
| `disable_notification` | `boolean` | none | Sends the message silently. Users will receive a notification with no sound. |


Example:

```yaml
version: 2.1

orbs:
  telegram: woltsu/telegram@x.y.z

jobs:
  - telegram/notify:
      message: "Notification from CircleCI!"
```

### SendSticker

Send a sticker to Telegram

| Parameter            | Type           | Default            | Description                                                  |
| -------------------- | -------------- | ------------------ | ------------------------------------------------------------ |
| `telegram-bot-token` | `env_var_name` | TELEGRAM_BOT_TOKEN | Name of environment variable storing your Telegram bot token |
| `telegram-chat-id`   | `env_var_name` | TELEGRAM_CHAT_ID   | Name of environment variable storing your Telegram chat id   |
| `telegram-sticker-ur`   | `string`       | ""                 | file_id or url to .webp                                      |

Example:

```yaml
version: 2.1

orbs:
  telegram: woltsu/telegram@x.y.z

jobs:
  - telegram/sendSticker:
      telegram-sticker: "https://raw.githubusercontent.com/TelegramBots/book/master/src/docs/sticker-fred.webp"
```

## Help

### How to create a Telegram bot

https://core.telegram.org/bots

### How To Get A Chat Id

https://stackoverflow.com/questions/32423837/telegram-bot-how-to-get-a-group-chat-id

### How to setup CircleCI environment

In the settings page for your project on CircleCI, click `Environment Variables`. There you need to add 2 variables: `TELEGRAM_BOT_TOKEN` and `TELEGRAM_CHAT_ID`.

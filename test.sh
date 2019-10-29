a=""

if [ -z $a ]; then
  echo "Please input your TELEGRAM_BOT_TOKEN value in the CircleCI settings for this project or provide another environmental variable name as a parameter for 'getchat' command"
elif [ -z $b ]; then
  echo "Please input your TELEGRAM_CHAT_ID value in the CircleCI settings for this project or provide another environmental variable name as a parameter for 'getchat' command"
else
  echo "lul!"
fi

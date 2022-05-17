#!/bin/bash

source /etc/profile
cd $(dirname $0)

APP_HOME=$(pwd)
LOG_PATH=$APP_HOME/logs
ENV_PATH=$APP_HOME/venv

if [ ! -d "$LOG_PATH" ]; then
    mkdir "$LOG_PATH"
fi

if [ ! -d "$ENV_PATH" ]; then
  echo "创建python虚拟环境 ..."
  python3 -m venv $ENV_PATH
fi

# 安装依赖
echo "pip安装 ..."
$ENV_PATH/bin/pip --default-timeout=1000 --retries=5 install --trusted-host=pypi.douban.com.cn -r $APP_HOME/requirements.txt

export PYTHONPATH="${PYTHONPATH}:$APP_HOME/pyjobs"

echo "OK."
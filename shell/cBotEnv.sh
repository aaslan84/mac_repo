#!/bin/bash

WSPACE="/Users/aslan/Desktop/workspace"
CBOT_PATH="$WSPACE/python/cryptoBot"

alias o="open ."
alias ceg="gedit /Users/aslan/Desktop/workspace/shell/cBotEnv.sh"
alias cob="source /Users/aslan/Desktop/workspace/shell/cBotEnv.sh"
alias g="gedit"
alias gst="git status $@"
alias gd="git diff -- color $@;"

cbot(){ cd $CBOT_PATH; }

chelp()
{
	echo "################# cryptoBot tools - HELP #################"
	echo "	-cbot:			set path to project workspace"
}

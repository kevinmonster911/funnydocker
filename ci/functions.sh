#!/usr/bin/env bash

function isSupportDockerMachine(){
  machineName=$1
  testResult=$(docker-machine >/dev/null && echo $?)
  if [[ testResult -eq '0' ]];
  then
    return 0;
  else
    return 1;
  fi
}

function isActive(){
  machineName=$1
  machCount=$[ $(docker-machine active | grep -c $machineName) ]
  echo $machCount
  if [ $machCount -gt 0 ]; then
    return 0
  else
    return 1;
  fi
}

function activeMachine(){
  machineName=$1
  echo $machineName
  docker-machine active
  if [  $(isSupportDockerMachine $machineName) -a $(isActive $machineName) ]; then
     echo -e "##### starting the machine you want [$machineName]...\n"
     docker-machine start $machineName
  fi
  echo "docker-machine env $machineName"
  eval $(docker-machine env $machineName)
  docker-machine active
}
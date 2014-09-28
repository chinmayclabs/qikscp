#!/bin/bash

#Usage:
#sh qikscp.sh identityFile.pem user@hostname /sourcefolderpathonremotemachine /destinationfolderpathonhostmachine

identityFile=$1;
userAtHostname=$2;
sourceFolderPathOnRemoteMachine=$3;
destFolderPathOnHostMachine=$4;

#ssh login, tar to temp archive, exit
ssh -i $identityFile $userAtHostname 'sudo tar -zcf /tmp/tmp.tar.gz '$sourceFolderPathOnRemoteMachine'; exit';

#copy archive from remote machine to the host machine
scp -i $identityFile $userAtHostname:/tmp/tmp.tar.gz $destFolderPathOnHostMachine;

#un tar archive in the host machine
tar -zxf $destFolderPathOnHostMachine/tmp.tar.gz;

#delete the temp archives in host and remote machines.
sudo rm $destFolderPathOnHostMachine/tmp.tar.gz;
ssh -i $identityFile $userAtHostname 'sudo rm /tmp/tmp.tar.gz; exit';

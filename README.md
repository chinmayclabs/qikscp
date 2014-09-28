qikscp
======

Fast download of a folder instead of using SCP

Usage:
sh qikscp.sh identityFile.pem user@hostname /sourcefolderpathonremotemachine /destinationfolderpathonhostmachine

1. ssh login, tar to temp archive, exit

2. copy archive from remote machine to the host machine

3. un tar archive in the host machine

4. delete the temp archives in host and remote machines.


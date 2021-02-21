# Coldcard docker container

Make sure you have docker installed.

Then just `./build.sh` and `./run.sh`, then you'll enter the container, then `./docker_init.sh`

If this error happens:

```
X Error of failed request:  BadValue (integer parameter out of range for operation)
  Major opcode of failed request:  130 (MIT-SHM)
  Minor opcode of failed request:  3 (X_ShmPutImage)
  Value in failed request:  0x13c
  Serial number of failed request:  201
  Current serial number in output stream:  202
```

run `./docker_init.sh` until it works.

If it opens with tje screen showing garbage, run again until it works
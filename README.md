# Standalone MavConn Library from MAVROS
This repo combines both the mavlink-GBP repo and the mavros repo along with a nice script written by [MoBaT](https://github.com/MoBaT) to pull the libMavConn out of the mavros package and build it independently. This repo relies on submodules to each of the aformentioned repos such that future upgrades/updates can be reapplied to the standalone version by simply checking out the new branch in the submodule and running the build script.

## Requirements
- cmake version > 3.11  

## Ouput
The script will generate a install folder in this repo which includes the debug and release folders. Inside each of the debug and release folders there is a bin and include folder. Bin includes the mavconn shared objects and the include folder includes the mavconn headers AND the paired mavlink messages generated from the GBP repo.

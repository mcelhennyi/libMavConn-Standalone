# Standalone MavConn Library from MAVROS
This repo combines both the mavlink-GBP repo and the mavros repo along with a nice script written by [MoBaT](https://github.com/MoBaT) to pull the libMavConn out of the mavros package and build it independently. This repo relies on submodules to each of the aformentioned repos such that future upgrades/updates can be reapplied to the standalone version by simply checking out the new branch in the submodule and running the build script.

## Requirements
- cmake version > 3.11  

## Ouput
The script will generate a install folder in this repo which includes the debug and release folders. Inside each of the debug and release folders there is a lib, include, and share folder. Lib includes the mavconn shared objects and the include folder includes the mavconn headers AND the paired mavlink messages generated from the GBP repo.


## Use
Simply run the `build.sh` script to get the shared object and headers (mavlink and mavconn).

### Note  
If you want to use a newer version of mavconn you will need to pull into the current version the new branch, and fix any merge errors. For a new mavlink message set, you simply need to checkout the new version and run the script again.

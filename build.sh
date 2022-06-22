# Set python version to use to 3
export ROS_PYTHON_VERSION=3

# Requirements to get libmavconn to build
sudo apt-get install python3-empy
sudo apt install libasio-dev

# Store the directory of the script at it's run location
DIR_PATH=$(echo $(dirname $(readlink -e $0)))
DIR_PATH_INSTALL_DEBUG=$DIR_PATH/install/debug
DIR_PATH_INSTALL_RELEASE=$DIR_PATH/install/release

# Clear install folder in preperation for new build
rm -rf install
mkdir -p $DIR_PATH_INSTALL_DEBUG
mkdir -p $DIR_PATH_INSTALL_RELEASE

# Generate Mavlink Messages
cd $DIR_PATH/mavlink-gbp-release
pip3 install -r pymavlink/requirements.txt

rm -rf build_debug
mkdir build_debug && cd build_debug && \
      cmake -D CMAKE_BUILD_TYPE=Debug \
      -D CMAKE_INSTALL_PREFIX=./install .. \
	 && make -j${NPROC} && make install
cd ../
rm -rf build_release
mkdir build_release && cd build_release && \
      cmake -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=./install .. \
	 && make -j${NPROC} && make install
cd ../

# Move Generated Mavlink Messages to install location
cp -r build_debug/install/* $DIR_PATH_INSTALL_DEBUG
cp -r build_release/install/* $DIR_PATH_INSTALL_RELEASE
# Cleanup local build files
rm -rf build_debug
rm -rf build_release

# Build libmavconn
cd $DIR_PATH/mavros/libmavconn/

rm -rf build_debug
mkdir build_debug && cd build_debug && \
      cmake -D CMAKE_BUILD_TYPE=Debug \
      -D CMAKE_INSTALL_PREFIX=./install .. \
      -D MAVLINK_INSTALL_PATH=$DIR_PATH_INSTALL_DEBUG/ \
	 && make -j${NPROC} && make install
cd ../
rm -rf build_release
mkdir build_release && cd build_release && \
      cmake -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=./install .. \
      -D MAVLINK_INSTALL_PATH=$DIR_PATH_INSTALL_RELEASE \
	 && make -j${NPROC} && make install
cd ../

#Move built libmavconn to install location
cp -r build_debug/install/* $DIR_PATH_INSTALL_DEBUG
cp -r build_release/install/* $DIR_PATH_INSTALL_RELEASE
# Cleanup local build files
rm -rf build_debug
rm -rf build_release


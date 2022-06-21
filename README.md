sudo apt-get install python3-empy
export ROS_PYTHON_VERSION=3
cd libMavConn-Standalone/mavlink-gbp-release
git checkout release/galactic/mavlink/2022.3.3-1
pip3 install -r pymavlink/requirements.txt
mkdir build
cd build 
cmake -DCMAKE_BUILD_TYPE=Release ..
make DESTDIR=. -j4

cd libMavConn-Standalone/mavros/libmavconn/include
ln -s ../../../mavlink-gbp-release/build/usr/local/include/mavlink .

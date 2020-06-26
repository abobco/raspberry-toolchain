# raspberry pi CMake toolchain

This is an example CMake project for cross compiling C/C++ code to arm hard float processors such as those in raspberry pis.

## Setup

Windows
-----------------------
1. Download and install [clang](https://releases.llvm.org/download.html) to your system path. You can either download a prebuilt binary from that link, or download it from the LLVM git & build it from source

2. Download & install a [raspberry pi toolchain](https://gnutoolchains.com/raspberry/). At the time of writing, the **raspberry-gcc8.3.0-r2.exe** link is probably what you want

3. Install the [ninja build system](https://github.com/ninja-build/ninja/releases) to your system path

4. Install [CMake](https://cmake.org/download/) to your system path

5. Clone this repo, open powershell in the root of your clone and run this: 

``````````````````````````````````````````````````
mkdir build
cd build
cmake -GNinja -D TOOLCHAIN_PATH="path/to/your/SysGCC" ..
cmake --build .
```````````````````````````````````````````````````
NOTE: you must change **"path/to/your/SysGCC"** in the 3rd line to point to wherever you installed your raspberry pi toolchain. 

If everything worked correctly, you should now have a binary called `example` in the `build` folder that you can copy & run on your raspberry pi. Hooray!
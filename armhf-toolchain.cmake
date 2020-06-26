# arm-hardfloat toolchain file using clang with a prebuilt raspberry-pi sysroot/linker

# ------------------------ non portable part ------------------------------------

# give path to your toolchain 
set(TOOLCHAIN_PATH "D:/SysGCC" CACHE PATH "Path to your raspberry toolchain")
set(GCC_ARM_TOOLCHAIN "${TOOLCHAIN_PATH}/raspberry/arm-linux-gnueabihf")
set(GCC_ARM_LINKER_EXE "${TOOLCHAIN_PATH}/raspberry/bin/arm-linux-gnueabihf-ld.exe")
SET(TARGET_TRIPLE arm-linux-gnueabihf)

# -------------------------------------------------------------------------------

set(CMAKE_CROSSCOMPILING TRUE)
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_PROCESSOR arm)

# get the toolchain sysroot
LIST(APPEND CMAKE_PROGRAM_PATH ${GCC_ARM_TOOLCHAIN})
SET(CMAKE_SYSROOT ${GCC_ARM_TOOLCHAIN}/sysroot)

# set compilers
SET(CMAKE_C_COMPILER clang)
SET(CMAKE_C_COMPILER_TARGET ${TARGET_TRIPLE})
SET(CMAKE_CXX_COMPILER clang++)
SET(CMAKE_CXX_COMPILER_TARGET ${TARGET_TRIPLE})
set(CMAKE_ASM_COMPILER clang)
set(CMAKE_ASM_COMPILER_TARGET ${TARGET_TRIPLE})
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# linker flags
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fuse-ld=${GCC_ARM_LINKER_EXE}")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fuse-ld=${GCC_ARM_LINKER_EXE}")

# cross compiler flags
set(CMAKE_C_FLAGS " ${CMAKE_C_FLAGS} --target=${TARGET_TRIPLE} --sysroot=${CMAKE_SYSROOT}")

# Search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# For libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
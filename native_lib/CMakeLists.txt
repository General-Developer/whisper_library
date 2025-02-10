cmake_minimum_required(VERSION 3.16)

project(
  general_developer_whisper_shared_library
)

set(WHISPER_LIBRARY_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib/whisper.cpp")

if(ANDROID)
  set(GGML_OPENMP OFF)
endif()

set(GGML_CCACHE OFF)

if(UNIX)
  set(CMAKE_BUILD_RPATH "$ORIGIN")
endif()

add_subdirectory(${WHISPER_LIBRARY_DIRECTORY} "whisper.cpp")

# /* <!-- START LICENSE -->


# This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
# Social Media:

#    - Youtube: https://youtube.com/@Global_Corporation 
#    - Github: https://github.com/globalcorporation
#    - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

# All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

# If you wan't edit you must add credit me (don't change)

# If this Software / Program / Source Code has you

# Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

# Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

# Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
# Karena jika ada negosiasi harga kemungkinan

# 1. Software Ada yang di kurangin
# 2. Informasi tidak lengkap
# 3. Bantuan Tidak Bisa remote / full time (Ada jeda)

# Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

# jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
# Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


# <!-- END LICENSE --> */

cmake_minimum_required(VERSION 3.16)

project(
  general_developer_whisper_shared_library
)

set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s")

set(WHISPER_LIBRARY_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib/whisper.cpp")

if(ANDROID)
  set(GGML_OPENMP OFF)
endif()

set(GGML_CCACHE OFF)

if(UNIX)
  set(CMAKE_BUILD_RPATH "$ORIGIN")
endif()


if(ANDROID)
  set(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../package/whisper_library_flutter/android/jniLibs/${ANDROID_ABI})
elseif(UNIX)
  set(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../package/whisper_library_flutter/linux)
endif()

add_subdirectory(${WHISPER_LIBRARY_DIRECTORY} "whisper.cpp")

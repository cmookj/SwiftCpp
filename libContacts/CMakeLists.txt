cmake_minimum_required(VERSION 3.27)
project (libContacts VERSION 0.0.1
                     DESCRIPTION "My first cmake project for Framework"
                     LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)

add_library (libContacts STATIC "")
target_include_directories(libContacts PRIVATE ./include)

target_sources (libContacts PRIVATE 
  contacts.cpp
  interface.cpp
)

set_target_properties (libContacts PROPERTIES FRAMEWORK TRUE)
target_link_libraries (libContacts )

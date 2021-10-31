cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

project(redis-6.2.1-clion VERSION 3.0)

message(STATUS "Host is: ${CMAKE_HOST_SYSTEM}.  Build target is: ${CMAKE_SYSTEM}")
get_filename_component(REDIS_ROOT "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)
message(STATUS "Project root directory is: ${REDIS_ROOT}")

if (NOT CMAKE_BUILD_TYPE)
    message(STATUS "No build type defined; defaulting to 'Debug'")
    set(CMAKE_BUILD_TYPE "Debug" CACHE STRING
            "The type of build. Possible values are: Debug, Release, RelWithDebInfo and MinSizeRel.")
endif ()

add_subdirectory(deps)

set(SRC_SERVER
        src/acl.c
        src/adlist.c
        src/siphash.c
        src/ae.c
        src/anet.c
        src/dict.c
        src/server.c
        src/sds.c
        src/childinfo.c
        src/cli_common.c
        src/monotonic.c
        src/connection.c
        src/setcpuaffinity.c
        src/mt19937-64.c
        src/module.c
        src/quicklist.c
        src/latency.c
        src/lazyfree.c
        src/listpack.c
        src/localtime.c
        src/lolwut.c
        src/lolwut5.c
        src/lolwut6.c
        src/defrag.c
        src/evict.c
        src/expire.c
        src/geo.c
        src/geohash.c
        src/geohash_helper.c
        src/zmalloc.c
        src/lzf_c.c
        src/lzf_d.c
        src/pqsort.c
        src/zipmap.c
        src/sha1.c
        src/sha256.c
        src/rax.c
        src/ziplist.c
        src/release.c
        src/networking.c
        src/util.c
        src/object.c
        src/db.c
        src/replication.c
        src/rdb.c
        src/t_string.c
        src/t_list.c
        src/t_set.c
        src/t_zset.c
        src/t_hash.c
        src/config.c
        src/aof.c
        src/pubsub.c
        src/multi.c
        src/debug.c
        src/sort.c
        src/intset.c
        src/syncio.c
        src/cluster.c
        src/crc16.c
        src/endianconv.c
        src/slowlog.c
        src/scripting.c
        src/bio.c
        src/rio.c
        src/rand.c
        src/memtest.c
        src/crc64.c
        src/bitops.c
        src/sentinel.c
        src/notify.c
        src/setproctitle.c
        src/blocked.c
        src/hyperloglog.c
        src/timeout.c
        src/tracking.c
        src/t_stream.c
        src/tls.c
        src/redis-check-rdb.c
        src/redis-check-aof.c
        src/sparkline.c
        src/gopher.c
        src/crcspeed.c
        )

set(SRC_CLI
        src/anet.c
        src/sds.c
        src/adlist.c
        src/redis-cli.c
        src/zmalloc.c
        src/release.c
        src/anet.c
        src/ae.c
        src/crc16.c
        src/crc64.c
        src/cli_common.c
        src/crcspeed.c
        src/dict.c
        src/mt19937-64.c
        src/monotonic.c
        src/siphash.c
        )

add_executable(redis-server ${SRC_SERVER})
add_executable(redis-cli ${SRC_CLI})

set_property(TARGET redis-server PROPERTY C_STANDARD 99)
set_property(TARGET redis-server PROPERTY CXX_STANDARD 11)
set_property(TARGET redis-server PROPERTY CXX_STANDARD_REQUIRED ON)

set_property(TARGET redis-cli PROPERTY C_STANDARD 99)
set_property(TARGET redis-cli PROPERTY CXX_STANDARD 11)
set_property(TARGET redis-cli PROPERTY CXX_STANDARD_REQUIRED ON)

target_include_directories(redis-server
        PRIVATE ${REDIS_ROOT}/deps/hiredis
        PRIVATE ${REDIS_ROOT}/deps/linenoise
        # PRIVATE ${REDIS_ROOT}/deps/jemalloc
        PRIVATE ${REDIS_ROOT}/deps/lua/src
        )

target_include_directories(redis-cli
        PRIVATE ${REDIS_ROOT}/deps/hiredis
        PRIVATE ${REDIS_ROOT}/deps/linenoise
        # PRIVATE ${REDIS_ROOT}/deps/jemalloc
        PRIVATE ${REDIS_ROOT}/deps/lua/src
        )

target_link_libraries(redis-server
        PRIVATE pthread
        PRIVATE m
        PRIVATE lua
        PRIVATE linenoise
        PRIVATE hiredis
        ${CMAKE_DL_LIBS}
        )

target_link_libraries(redis-cli
        PRIVATE pthread
        PRIVATE m
        PRIVATE linenoise
        PRIVATE hiredis
        )

link_directories(deps/hiredis/ deps/linenoise/ diredeps/lua/src)
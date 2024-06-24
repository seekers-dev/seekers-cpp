COMPILER = g++
CXXFLAGS = -Wall -Idoctest/doctest

# Source directories
SRC_DIRS = src/common src/client src/server

# Build directories
BUILD_DIRS = build/common build/client build/server build/tests

# Find all .cpp files in the source directories
SRC_FILES_COMMON := $(wildcard src/common/*.cpp)
SRC_FILES_CLIENT := $(wildcard src/client/*.cpp)
SRC_FILES_SERVER := $(wildcard src/server/*.cpp)
SRC_FILES_TESTS := $(wildcard tests/*.cpp)

# Convert the .cpp file paths to .o file paths in the build directories
OBJ_FILES_COMMON := $(patsubst src/common/%.cpp, build/common/%.o, $(SRC_FILES_COMMON))
OBJ_FILES_CLIENT := $(patsubst src/client/%.cpp, build/client/%.o, $(SRC_FILES_CLIENT))
OBJ_FILES_SERVER := $(patsubst src/server/%.cpp, build/server/%.o, $(SRC_FILES_SERVER))
OBJ_FILES_TESTS := $(patsubst tests/%.cpp, build/tests/%.o, $(SRC_FILES_TESTS))

# All object files
OBJ_FILES := $(OBJ_FILES_COMMON) $(OBJ_FILES_CLIENT) $(OBJ_FILES_SERVER) $(OBJ_FILES_TESTS)

# Targets to compile all .cpp files in each directory
common: $(OBJ_FILES_COMMON)
client: $(OBJ_FILES_CLIENT)
server: $(OBJ_FILES_SERVER)
tests: $(OBJ_FILES_TESTS) common client server
	@mkdir -p out
	$(COMPILER) $(CXXFLAGS) $(OBJ_FILES_COMMON) $(OBJ_FILES_CLIENT) $(OBJ_FILES_SERVER) $(OBJ_FILES_TESTS) -o out/tests

# Rule to build .o files from .cpp files in src/common
build/common/%.o: src/common/%.cpp
	@mkdir -p build/common
	$(COMPILER) $(CXXFLAGS) -c $< -o $@

# Rule to build .o files from .cpp files in src/client
build/client/%.o: src/client/%.cpp
	@mkdir -p build/client
	$(COMPILER) $(CXXFLAGS) -c $< -o $@

# Rule to build .o files from .cpp files in src/server
build/server/%.o: src/server/%.cpp
	@mkdir -p build/server
	$(COMPILER) $(CXXFLAGS) -c $< -o $@

# Rule to build .o files from .cpp files in tests
build/tests/%.o: tests/%.cpp
	@mkdir -p build/tests
	$(COMPILER) $(CXXFLAGS) -c $< -o $@

# Clean target to remove all built files
clean:
	rm -rf build
	rm -rf out

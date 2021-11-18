.PHONY: all build run clean test generate docs bin_setup

STEAM_SDK ?= ${CURDIR}/sdk
STEAM_INCLUDE := ${STEAM_SDK}/public

ifeq (${OS},Windows_NT)
	PLATFORM := win64
  XCTESTOS := Windows
	STEAM_DYLIB := steam_api64.dll
else
	ifeq ($(shell uname -s),Darwin)
		PLATFORM := osx
    XCTESTOS := MacOS
		STEAM_DYLIB := libsteam_api.dylib
	else
		PLATFORM := linux64
    XCTESTOS := Linux
		STEAM_DYLIB := libsteam_api.so
	endif
endif

STEAM_LIB := ${STEAM_SDK}/redistributable_bin/${PLATFORM}

STEAM_SWIFT_FLAGS := \
	-Xswiftc -I${STEAM_INCLUDE} \
 	-Xlinker -L${STEAM_LIB} \
	-Xlinker -lc++

all: build run

build: generate
	swift build ${STEAM_SWIFT_FLAGS}

BINPATH := $(shell swift build --show-bin-path)
TESTBINPATH := ${BINPATH}/swift-steamworksPackageTests.xctest/Contents/${XCTESTOS}

bin_setup:
	mkdir -p ${TESTBINPATH}
	ln -sf ${STEAM_LIB}/${STEAM_DYLIB} ${BINPATH}/
	ln -sf ${STEAM_LIB}/${STEAM_DYLIB} ${TESTBINPATH}/
	echo 480 > ${BINPATH}/steam_appid.txt

test: bin_setup
	swift test ${STEAM_SWIFT_FLAGS}

run: bin_setup
	swift run Client ${STEAM_SWIFT_FLAGS}

docs: generate
	bebop

generate:
	swift run Generate

clean:
	swift package clean

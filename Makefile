.PHONY: all build run clean test generate

STEAM_SDK ?= ${CURDIR}/sdk
STEAM_INCLUDE := ${STEAM_SDK}/public

ifeq (${OS},Windows_NT)
	PLATFORM := win64
	STEAM_DYLIB := steam_api64.dll
else
	ifeq ($(shell uname -s),Darwin)
		PLATFORM := osx
		STEAM_DYLIB := libsteam_api.dylib
	else
		PLATFORM := linux64
		STEAM_DYLIB := libsteam_api.so
	endif
endif

STEAM_LIB := ${STEAM_SDK}/redistributable_bin/${PLATFORM}

STEAM_SWIFT_FLAGS := \
	-Xswiftc -I${STEAM_INCLUDE} \
 	-Xlinker -L${STEAM_LIB} \

all: build run

build:
	swift build ${STEAM_SWIFT_FLAGS}

test:
	swift test ${STEAM_SWIFT_FLAGS}

BINPATH := $(shell swift build --show-bin-path)

run:
	mkdir -p ${BINPATH}
	ln -sf ${STEAM_LIB}/${STEAM_DYLIB} ${BINPATH}/
	echo 480 > ${BINPATH}/steam_appid.txt
	swift run Client ${STEAM_SWIFT_FLAGS}

generate:
	swift run Generate

clean:
	swift package clean

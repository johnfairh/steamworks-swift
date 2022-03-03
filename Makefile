.PHONY: all build run clean test generate docs bin_setup

STEAM_SDK ?= ${CURDIR}/sdk
STEAM_INCLUDE := ${STEAM_SDK}/public

ifeq (${OS},Windows_NT)
	PLATFORM := win64
  XCTESTOS := Windows
	STEAM_DYLIB := steam_api64.dll
  TICKET_DYLIB := sdkencryptedappticket64.dll
else
	ifeq ($(shell uname -s),Darwin)
		PLATFORM := osx
    XCTESTOS := MacOS
		STEAM_DYLIB := libsteam_api.dylib
    TICKET_DYLIB := libsdkencryptedappticket.dylib
	else
		PLATFORM := linux64
    XCTESTOS := Linux
		STEAM_DYLIB := libsteam_api.so
    TICKET_DYLIB := libsdkencryptedappticket64.so
	endif
endif

STEAM_LIB := ${STEAM_SDK}/redistributable_bin/${PLATFORM}
TICKET_LIB := ${STEAM_SDK}/public/steam/lib/${PLATFORM}

STEAM_SWIFT_FLAGS := \
	-Xswiftc -I${STEAM_INCLUDE} \
 	-Xlinker -L${STEAM_LIB} \
	-Xlinker -L${TICKET_LIB} \
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
	ln -sf ${TICKET_LIB}/${TICKET_DYLIB} ${BINPATH}/
	echo 480 > ${BINPATH}/steam_appid.txt

test: bin_setup
	swift test ${STEAM_SWIFT_FLAGS}

run: bin_setup
	swift build --product Client ${STEAM_SWIFT_FLAGS}
	swift run --skip-build Client

run_ticket: bin_setup
	swift build --product TicketClient ${STEAM_SWIFT_FLAGS}
	swift run --skip-build TicketClient

docs: generate
	bebop

generate:
	swift run Generate

clean:
	swift package clean

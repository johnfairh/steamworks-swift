.PHONY: all build run clean test generate docs bin_setup redist

STEAM_INCLUDE := ${CURDIR}/redist/include

ifeq (${OS},Windows_NT)
	PLATFORM := win64
  XCTESTOS := Windows
else
	ifeq ($(shell uname -s),Darwin)
		PLATFORM := osx
    XCTESTOS := MacOS
	else
		PLATFORM := linux64
    XCTESTOS := Linux
	endif
endif

STEAM_LIB := ${CURDIR}/redist/lib/${PLATFORM}

all: build run

build: generate
	swift build

BINPATH := $(shell swift build --show-bin-path)
TESTBINPATH := ${BINPATH}/steamworks-swiftPackageTests.xctest/Contents/${XCTESTOS}

bin_setup:
	mkdir -p ${BINPATH} ${TESTBINPATH}
	ln -sf ${STEAM_LIB}/* ${BINPATH}/
	ln -sf ${STEAM_LIB}/* ${TESTBINPATH}/
	echo 480 > ${BINPATH}/steam_appid.txt

test: bin_setup
	swift test

run: bin_setup
	swift build --product Client
	swift run --skip-build Client

run_ticket: bin_setup
	swift build --product TicketClient
	swift run --skip-build TicketClient

docs: generate
	bebop

generate:
	swift run Generate

clean:
	swift package clean

# Populate the 'redist' tree from a Steamworks SDK

STEAM_SDK ?= ${CURDIR}/sdk

REDIST_ARCHS := osx win64 linux64

redist:
	rm -rf redist/*
	mkdir -p redist/include/steam redist/lib
	cp ${STEAM_SDK}/public/steam/*h redist/include/steam
	cp ${STEAM_SDK}/public/steam/*json redist/include/steam
	cp ${STEAM_SDK}/Readme.txt redist/
	for ARCH in ${REDIST_ARCHS} ; do \
		mkdir -p redist/lib/$${ARCH} ; \
		cp ${STEAM_SDK}/redistributable_bin/$${ARCH}/* redist/lib/$${ARCH}; \
		cp ${STEAM_SDK}/public/steam/lib/$${ARCH}/* redist/lib/$${ARCH}; \
	done

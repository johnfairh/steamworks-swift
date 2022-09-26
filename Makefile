.PHONY: all build run clean test generate docs bin_setup redist

all: build run

build: generate
	swift build

BINPATH := $(shell swift build --show-bin-path)

bin_setup:
	mkdir -p ${BINPATH}
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

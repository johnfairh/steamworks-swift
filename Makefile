.PHONY: all build run clean test generate docs

all: build run

build: generate
	swift build

test:
	swift test

run:
	swift build --product Client
	swift run --skip-build Client

run_ticket:
	swift build --product TicketClient
	swift run --skip-build TicketClient

docs: generate
	bebop

generate:
	swift run Generate

clean:
	swift package clean

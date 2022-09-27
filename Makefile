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

test_linux:
	docker run -v `pwd`:`pwd` -w `pwd` --name steamworks --rm swift:5.7 /bin/bash -c "apt-get update; apt-get install make; (cd sdk && make install); swift test"

shell_linux:
	docker run -it -v `pwd`:`pwd` -w `pwd` --name steamworks --rm swift:5.7 /bin/bash

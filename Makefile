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

# Random flags here to get around crap Linux C++ support
test_linux:
	docker run -v `pwd`:`pwd` -w `pwd` --name steamworks --rm swiftlang/swift:nightly-5.9-focal /bin/bash -c "apt-get update; apt-get install make; (cd sdk && make install); swift test -Xswiftc -cxx-interoperability-mode=default"

shell_linux:
	docker run -it -v `pwd`:`pwd` -w `pwd` --name steamworks --rm  swiftlang/swift:nightly-5.9-focal /bin/bash

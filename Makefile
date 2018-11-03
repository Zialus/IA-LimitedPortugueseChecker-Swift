DEBUGMODE = fulldebug
EXEC = TugaChecker

all:
	swift build -Xswiftc -O -Xswiftc -wmo -c release
	cp ./.build/release/$(EXEC) .

clean:
	swift package reset
	if [ -f ./$(EXEC) ]; then rm ./$(EXEC); fi

test: dutra_examples

dutra_examples:
	time ./$(EXEC) $(DEBUGMODE) < Input/dutraExamples.txt

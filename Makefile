DEBUGMODE = fulldebug

all:
	swift build -Xswiftc -O -c release
	mv ./.build/release/TugaChecker .

clean:
	swift package clean
	if [ -f ./TugaChecker ]; then rm ./TugaChecker; fi

test:
	./TugaChecker $(DEBUGMODE) < ./Input/dutraExamples.txt

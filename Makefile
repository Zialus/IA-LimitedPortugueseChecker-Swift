all:
	swift build -Xswiftc -O
	mv ./.build/debug/TugaChecker .

clean:
	if [ -f ./TugaChecker ]; then rm ./TugaChecker; fi
	if [ -d ./.build/ ]; then rm -rf ./.build/; fi

test:
	./TugaChecker fulldebug < ./Input/dutraExamples.txt

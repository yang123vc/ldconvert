ldconvert:
	mkdir -p bin/x32
	i686-w64-mingw32-g++ -c ldconvert.cpp -o bin/x32/ldconvert.o
	i686-w64-mingw32-g++ -shared -s -o bin/x32/ldconvert.dll bin/x32/ldconvert.o -static-libgcc
	rm bin/x32/ldconvert.o
	
	mkdir -p bin/x64
	x86_64-w64-mingw32-g++ -c ldconvert.cpp -o bin/x64/ldconvert.o
	x86_64-w64-mingw32-g++ -shared -s -o bin/x64/ldconvert.dll bin/x64/ldconvert.o -static-libgcc
	rm bin/x64/ldconvert.o
upload:
	tar -zcvf ldconvert.tar.gz bin
	curl --upload-file ldconvert.tar.gz https://transfer.sh/ldconvert.tar.gz && echo

# TEST SCRIPTS

-> C++11:

	g++ test.cpp `pkg-config opencv --cflags --libs` -o test

	./test
	
-> Python

	python test.py

-> C++11 qith gpu:

	g++ test_gpu.cpp `pkg-config opencv --cflags --libs` -o test

	./test

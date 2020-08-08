  CC=g++
TARGET=vps
CPPFLAGS=--std=c++11
GTK3_FLAGS=`pkg-config gtkmm-3.0 --cflags`
GTK3_LIBS=`pkg-config gtkmm-3.0 --libs`
OPENCV_FLAGS=`pkg-config opencv4 --cflags`
OPENCV_INC=-I /usr/local/include/opencv4

LDLIBS=-L /usr/local/lib -lopencv_core -lopencv_imgcodecs -lopencv_imgproc -lopencv_videoio -lpthread -lavformat -lavcodec -lavutil -lswscale

OBJS=main.o Helloworld.o

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(GTK3_LIBS)
	rm -f *.o

main.o: main.cpp
	$(CC) -c main.cpp $(CPPFLAGS) $(GTK3_FLAGS)

Helloworld.o: Helloworld.cpp
	$(CC) -c Helloworld.cpp $(CPPFLAGS) $(GTK3_FLAGS)

clean:
	rm -f $(TARGET)
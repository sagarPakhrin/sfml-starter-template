# this target will compile all the files
CFLAGS = -c -Wall
src = src
CC = g++

TARGET: main.o StateMachine.o AssetManager.o InputManager.o Game.o SplashState.o MainMenuState.o GameState.o 
	$(CC) StateMachine.o Game.o InputManager.o AssetManager.o SplashState.o MainMenuState.o GameState.o main.o -o main -lsfml-graphics -lsfml-window -lsfml-system

main.o: src/main.cpp $(src)/DEFINATIONS.hpp
	$(CC) $(CFLAGS) $(src)/main.cpp

StateMachine.o: $(src)/StateMachine.cpp $(src)/StateMachine.hpp
	$(CC) $(CFLAGS) $(src)/StateMachine.cpp

AssetManager.o: $(src)/AssetManager.cpp $(src)/AssetManager.hpp
	$(CC) $(CFLAGS) $(src)/AssetManager.cpp

InputManager.o: $(src)/InputManager.cpp $(src)/InputManager.hpp
	$(CC) $(CFLAGS) $(src)/InputManager.cpp

Game.o: $(src)/Game.cpp $(src)/Game.hpp
	$(CC) $(CFLAGS) $(src)/Game.cpp

SplashState.o: $(src)/SplashState.hpp $(src)/SplashState.cpp $(src)/DEFINATIONS.hpp
	$(CC) $(CFLAGS) $(src)/SplashState.cpp

MainMenuState.o: $(src)/MainMenuState.hpp $(src)/MainMenuState.cpp $(src)/DEFINATIONS.hpp
	$(CC) $(CFLAGS) $(src)/MainMenuState.cpp

GameState.o: $(src)/GameState.hpp $(src)/GameState.cpp $(src)/DEFINATIONS.hpp
	$(CC) $(CFLAGS) $(src)/GameState.cpp

clean:
	rm -f *.o main

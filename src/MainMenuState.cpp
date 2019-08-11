#include <sstream>
#include "MainMenuState.hpp"
#include "DEFINATIONS.hpp"
#include "GameState.hpp"
#include <iostream>

namespace Sagar
{
		MainMenuState::MainMenuState(GameDataRef data): _data(data)
		{

		}

		void MainMenuState::Init()
		{
				_data->assets.LoadTexture("Main Menu",MAIN_MENU_BACKGROUND_FILEPATH);
				_data->assets.LoadTexture("Play Button",PLAY_BUTTON_FILEPATH);

				_background.setTexture(this->_data->assets.GetTexture("Main Menu"));
				_background.setScale(sf::Vector2f(0.85f, 0.95f));


				_playButton.setTexture(this->_data->assets.GetTexture("Play Button"));

				_playButton.setScale(sf::Vector2f(0.8f, 0.8f));
				_playButton.setPosition( (SCREEN_WIDTH/2) - (_playButton.getGlobalBounds().width/2 ),(SCREEN_HEIGHT/2) -(_playButton.getGlobalBounds().height/2) + 160);
		}

		void MainMenuState::HandleInput()
		{
				sf::Event event;
				while(_data->window.pollEvent(event))
				{
						if(sf::Event::Closed == event.type)
						{
								_data->window.close();
						}
						if(_data->input.IsSpriteClicked(_playButton, sf::Mouse::Left, _data->window))
						{
								_data->machine.AddState(StateRef (new GameState(_data)), true);
						}
				}
		}


		void MainMenuState::Update(float dt)
		{

		}

		void MainMenuState::Draw(float dt)
		{
				_data->window.clear();
				_data->window.draw(_background);
				_data->window.draw(_title);
				_data->window.draw(_playButton);
				_data->window.display();
		}

}

#include <stdio.h>
#include <SFML/Graphics.hpp>
#include <SFML/Audio.hpp>
#include "Onegin.h"

//===========================================================

int Create_window(sf:: Music* music, sf:: Music* joke_music);

void Set_text(sf::Text* text, const sf::Font& font, const sf::Color color, size_t font_size, float x, float y, const char* str);

void Set_text(sf::Text* text, const sf::Font& font, const sf::Color color, size_t font_size, float x, float y);

int Crack(const sf::String& name_file);

int Hack(struct Text* bin);

int Hack2(struct Text* bin);

int Add_memory(struct Text* bin);

void Write_buffer(FILE* file, struct Text* bin);

//===========================================================

int main()
{
    sf::Music music;
    sf::Music joke_music;

    if (!music.openFromFile("EVA.ogg"))
    {
        printf("ERROR: Couldn't play \"EVA.ogg\"\n");
        return 1;
    }

    if (!joke_music.openFromFile("EVA_GACHI.ogg"))
    {
        printf("ERROR: Couldn't play \"EVA_GACHI.ogg\"\n");
        return 1;
    }
        
    music.play();
    music.setVolume(5);

    joke_music.play();
    joke_music.setVolume(0);

    Create_window(&music, &joke_music);
    
    music.stop();

    return 0;
}

int Create_window(sf:: Music* music, sf:: Music* joke_music)
{
    sf::RenderWindow window(sf::VideoMode(1920, 1980), "DDOS", sf::Style::Default);
    //window.setVerticalSyncEnabled(true);

    sf::Texture background;
    sf::Sprite  background_image;

    if (!background.loadFromFile("EVA_background.png"))
    {
        printf("ERROR: Couldn't display \"EVA_background.png\"\n");
        return 1;
    }

    background_image.setTexture(background);

    sf::Font font;
    font.loadFromFile("Minecraft.ttf");

    sf::Texture exit_button;
    sf::Sprite  exit_button_image;

    if (!exit_button.loadFromFile("buttonN.png"))
    {
        printf("ERROR: Couldn't display \"buttonN.png\"\n");
        return 1;
    }
    
    exit_button_image.setPosition(75.0f, 600.0f);
    exit_button_image.setScale(2.5f, 2.5f);
    exit_button_image.setTexture(exit_button);

    sf::Texture crack_button;
    sf::Sprite  crack_button_image;

    if (!crack_button.loadFromFile("buttonY.png"))
    {
        printf("ERROR: Couldn't display \"buttonY.png\"\n");
        return 1;
    }
    
    crack_button_image.setPosition(75.0f, 400.0f);
    crack_button_image.setScale(2.5f, 2.5f);
    crack_button_image.setTexture(crack_button);

    sf::Texture unmute_button;
    sf::Sprite  unmute_button_image;

    if (!unmute_button.loadFromFile("unmute.png"))
    {
        printf("ERROR: Couldn't display \"unmute.png\"\n");
        return 1;
    }
    
    unmute_button_image.setPosition(1700.0f, 50.0f);
    unmute_button_image.setScale(0.8f, 0.8f);
    unmute_button_image.setTexture(unmute_button);

    bool music_off        = true;
    int  game             = 10;
    bool input_resolution = false;
    int  result           = -1;
    bool false_click      = true;
    sf::String user_input;

    sf::Text crack_text;
    Set_text(&crack_text, font, sf::Color::Black, 60, 180.0f, 425.0f, "Crack");

    sf::Text exit_text;
    Set_text(&exit_text, font, sf::Color::Black, 60, 210.0f, 620.0f, "Exit");

    sf::Text file_text;
    Set_text(&file_text, font, sf::Color::Green, 60, 810.0f, 360.0f, "Input name file:");
    
    sf::Text input_text;
    Set_text(&input_text, font, sf::Color::Green, 60, 810.0f, 420.0f);
    
    sf::Text error_input_text;
    Set_text(&error_input_text, font, sf::Color::Green, 60, 810.0f, 420.0f, "ERROR: file not found!");
    
    sf::Text patch_text;
    Set_text(&patch_text, font, sf::Color::Green, 60, 810.0f, 420.0f, "DDOS attack complementation!!");
   
    while (window.isOpen())
    {
        if (!(music_off) && game) joke_music->setVolume(100);
        if (game == 0) false_click = true;

        sf::Event Event;

        while (window.pollEvent(Event))
        {
            switch (Event.type)
            {
                case sf::Event::Closed:
                    window.close();
                    break;

                case sf::Event::MouseMoved:
                    {
                        sf::Vector2i mouse_pos = sf::Mouse::getPosition(window);
                        sf::Vector2f mouse_pos_f(static_cast<float>(mouse_pos.x), static_cast<float>(mouse_pos.y));
                        
                        if (unmute_button_image.getGlobalBounds().contains(mouse_pos_f))
                        {
                            exit_button_image.setColor(sf::Color(255, 255, 255));
                            crack_button_image.setColor(sf::Color(255, 255, 255));

                            music_off = false;
                            music->setVolume(0);
                            game--;

                            unmute_button_image.setPosition(rand() % 1800, rand() % 900);
                            unmute_button_image.setColor(sf::Color(120, 255, 255));
                        }

                        else if (exit_button_image.getGlobalBounds().contains(mouse_pos_f))
                        {
                            exit_button_image.setColor(sf::Color(250, 20, 20));
                            crack_button_image.setColor(sf::Color(255, 255, 255));
                            unmute_button_image.setColor(sf::Color(255, 255, 255));
                        }

                        else if (crack_button_image.getGlobalBounds().contains(mouse_pos_f))
                        {
                            exit_button_image.setColor(sf::Color(255, 255, 255));
                            crack_button_image.setColor(sf::Color(20, 250, 20));
                            unmute_button_image.setColor(sf::Color(255, 255, 255));
                        }
                        
                        else
                        {
                            exit_button_image.setColor(sf::Color(255, 255, 255));
                            crack_button_image.setColor(sf::Color(255, 255, 255));
                            unmute_button_image.setColor(sf::Color(255, 255, 255));
                        }
                    }
                    break;
                
                case sf::Event::MouseButtonPressed:
                {
                    sf::Vector2i mouse_pos = sf::Mouse::getPosition(window);
                    sf::Vector2f mouse_pos_f( static_cast<float>(mouse_pos.x), static_cast<float>(mouse_pos.y));
                    
                    if (exit_button_image.getGlobalBounds().contains(mouse_pos_f))
                    {
                        false_click = false;

                        if ((false_click == false) && (game && music_off || !game && !music_off))
                        {
                            window.close();
                        }
                    }

                    if (crack_button_image.getGlobalBounds().contains(mouse_pos_f))
                    {
                        input_resolution = true;
                        result = -1;
                    }

                }
                break;

                case sf::Event::KeyPressed:
                {
                    if (input_resolution)
                    {
                        if (Event.key.code == sf::Keyboard::Enter)
                        {
                            input_resolution = false;

                            result = Crack(user_input); 

                            user_input.clear();
                            input_text.setString(user_input);
                        }

                        else if (Event.key.code == sf::Keyboard::BackSpace)
                        {
                           user_input.erase(user_input.getSize() - 1);
                        }
                    }
                }
                break;

                case sf::Event::TextEntered:
                {
                    if (input_resolution)
                    {
                        user_input.insert(user_input.getSize(), Event.text.unicode);
                        input_text.setString(user_input);
                    }  
                }
                break;

                default: break;
            }
        }

        window.clear();
        window.draw(background_image);

        if (false_click || game && music_off || !game && !music_off)
        {
            window.draw(exit_button_image);
            window.draw(exit_text);
        }

        if (input_resolution) 
        {   
            window.draw(file_text);
            window.draw(input_text);
        }
        
        switch (result)
        {
            case 1:
            {
                window.draw(crack_button_image);
                window.draw(crack_text);
                window.draw(error_input_text);
            }
            break;

            case 0: 
            {
                window.draw(patch_text);
            }
            break;
            
            case -1:
            {
                window.draw(crack_button_image);
                window.draw(crack_text);
            }
            break;

            default: break;
        }

        window.draw(unmute_button_image);
        window.display();
    }

    return 0;
}

void Set_text(sf::Text* text, const sf::Font& font, const sf::Color color, size_t font_size, float x, float y)
{
    text->setFont(font);
    text->setStyle(sf::Text::Bold);
    text->setFillColor(color);
    text->setCharacterSize(font_size);
    text->setPosition(x, y);
}

void Set_text(sf::Text* text, const sf::Font& font, const sf::Color color, size_t font_size, float x, float y, const char* str)
{
    text->setFont(font);
    text->setStyle(sf::Text::Bold);
    text->setString(str);
    text->setFillColor(color);
    text->setCharacterSize(font_size);
    text->setPosition(x, y);
}

int Crack(const sf::String& str)
{
    std::string name_file = str.toAnsiString();

    FILE* code = fopen(name_file.c_str(), "rb");

    if (code == nullptr)
    {
        return 1;
    }

    struct Text bin = {};
    bin.buffer = Create_buffer(code, &bin.n_lines, &bin.size);

    fclose(code);

    if (Hack2(&bin)) return 1;

    code = fopen(name_file.c_str(), "wb");
    Write_buffer(code, &bin);
    fclose(code);

    Free_memory(&bin);

    return 0;
}

int Hack(struct Text* bin)
{
    assert(bin != nullptr);

    if (Add_memory(bin)) return 1;

    bin->buffer[0x191 + 0] = 0xBA;
    bin->buffer[0x191 + 1] = 0x4D;
    bin->buffer[0x191 + 2] = 0x01;

    bin->buffer[0x191 + 3] = 0xE9;
    bin->buffer[0x191 + 4] = 0x77;
    bin->buffer[0x191 + 5] = 0xFE;

    return 0;
}

int Hack2(struct Text* bin)
{
    assert(bin != nullptr);

    for (size_t i = 0x017; i < 0x049; i++)
    {
        bin->buffer[i] = 0x21;
    }

    return 0;
}

int Add_memory(struct Text* bin)
{
    assert(bin != nullptr);

    char* save = bin->buffer;

    bin->buffer = (char*) realloc(bin->buffer, bin->size + 5);

    if (bin->buffer == nullptr)
    {
        return 1;
    }

    bin->size += 5;
    
    return 0;
}

void Write_buffer(FILE* file, struct Text* bin)
{
    assert(file != nullptr);
    assert(bin  != nullptr);

    fwrite(bin->buffer, sizeof(char), bin->size, file);
}

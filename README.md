# Overdrive

This is a submission for the CS2261 final project assignment. It is a single player, side scrolling hack and slash game. This project combines a variety of concepts for Mode 0 on the GBA, including scrolling backgrounds, audio, sprites, and animations. Further details on the game mechanics, controls, and game summary can be found at the top of the `main.c` file [here](./OverdriveProject/main.c). A dedicated instruction screen is also provided within the game itself.

## Project Setup
This game was developed for the GBA. To run the game on a Mac or Windows device, the [mGBA emulator](https://mgba.io/) must first be installed. Then, download or clone the repository. Open the emulator, select `File > Load ROM`, and open the `Overdrive.zip` file. Alternatively, opening the `Project.gba` file in the `OverdriveProject` folder through the emulator will also work.

To access and edit the project on Windows, the mGBA emulator and Visual Studio Code must first be installed. Then, install and set up the [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install). Additionally, install [Docker Desktop](https://www.docker.com/products/docker-desktop/). In the main project folder, locate the `.vscode` folder, then find the `tasks.json` file and edit line 15 to the correct file path of the installed GBA emulator. Finally, while Docker Desktop is running, open the Scaffold folder in Visual Studio Code, open the `main.c` file, and hit `ctrl`+`shift`+`b` to build and run the project.

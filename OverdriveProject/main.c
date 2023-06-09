/*
Comment Block for the TAs
What is finished so far (since milestone 3):
- A cheat mechanic: Press LSHOULDER and RSHOULDER simultaneously to spawn a blade, upon pickup you gain ranged attacks that stack
    on top of the melee damage bonus
- A final boss with a unique attack pattern, this one attacks 3 times in quick succession and is very large
- Added a lot more sound effects for Overdrive, getting hit, button presses, different menu themes, and more
- Fixed many bugs in playtesting, including audio not playing at the right time, and palettes overriding each other due to pausing
- I'm pretty much done! I'm overall happy with how the game has turned out

How to play the game:
Navigating the state machine:
    All the game states have been implemented with a placeholder background, showing splash, win, lose, pause, game, etc
        Splash: Press START to start the game, or press SELECT to see the instructions
        INSTRUCTIONS: Press SELECT to return to splash, or press START to switch to game state
        GAME: Press START to switch to pause state, and enter win or lose state depending on game condition
        PAUSE: Press START to return to game state, or SELECT to return to splash menu
        WIN and LOSE: Press START to return to splash menu

Playing the game:
- Use the left and right keys to move the player. The Up button will jump.
- Press the A button to attack. Pressing repeatedly will cycle through the player's 4-string attack combo. If you wait too long after attacking,
    the attack cycle will reset back to the first attack. You cannot move while attacking, but you can use dodge anytime to cancel an attack.
    Additionally, getting hit, jumping, or dodging while inbetween attack combos will reset the current attack pattern. Slight movement
    in the left and right direction will not interrupt the attack combo as long as the next attack is input before the attack combo resets.
- Press the B button to dodge. This will give you momentary invulnerability and movement. If no movement key is input, the player dodges
    backwards (left). If either left or right is input, the player will dodge in that direction. Remember that dodging gives invulnerability,
    even if it looks like you were hit by an enemy! Keep in mind, there is no collision damage, so touching the enemy will not harm you unless they
    are attacking. The dodge i-frame window was reduced, meaning it is much more accurate to the sprite indicator. Be careful!
- Your objective is to traverse through the platforms, maneuver through obstacles, and defeat enemies to reach the exotic blue flame/ectoplasm
    at the end of the map. You must first defeat the driller, who has a very telegraphed but powerful attack, dealing 40 damage per hit. You
    have 100 HP, while the driller has 300! Your attacks deal 5, 10, 25, and 40 damage in the attack combo, so it is encouraged to reach
    the end of the combo for maximum damage efficiency! You must then traverse through a laser obstacle, which you must fully utilize the dodge
    to pass. (Hint: dodging early will leave you stuck in the middle of the laser path, so go as far as possible and THEN dodge!). These lasers
    deal a whopping 70 damage, so don't get hit! Finally, you must face the Baller, which shoots a ranged bullet if you're too far. You can
    jump over this bullet or dodge through it to close the gap. When you are close, it will unleash a close range spike attack! The Baller
    has 250 HP, and it's bullet and spike attack does 20 and 50 damage respectively. After you defeat the Baller, progress to the right
    end of the map to collect the blue flame/ectoplasm to reach the win screen!
- While I do not have a UI setup currently to display health, the player, driller and baller health is printed each time it changes. Check the 
    print log to see how much health is left!
- There is now the Overdrive powerup! While dodging early is a surefire way to avoid damage (or is it?), it's not as cool! When you
    perform a perfect dodge while in range of an enemy JUST as they are about to launch an attack (look for when their orange indicator turns
    magenta), you will enter Overdrive mode, dealing an additional 2, 5, 12, and 20 damage depending on the attack combo! Additionally, time will
    slow down, as enemies move at half the speed! This effect will last a few seconds, and the cooldown is slightly longer than
    the effect duration. During Overdrive or when it is on cooldown, any perfect dodges will not trigger a subsequent Overdrive. If you're not
    sure whether you've activated overdrive, keep a lookout for the palette - it turns everything greyscale, it's hard to miss!
*/

#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "game.h"

#include "splashscreen.h"
#include "instructionscreen.h"
#include "gamescreen.h"
#include "pausescreen.h"
#include "winscreen.h"
#include "losescreen.h"
#include "tileset.h"
#include "tilemap.h"
#include "spritesheet.h"
#include "tilemap2.h"
#include "tilesetinvert.h"

#include "splashscreen2.h"
#include "background1.h"
#include "background2.h"

#include "instructionscreen2.h"
#include "instructionscreen3.h"
#include "instructionscreen4.h"
#include "instructionscreen5.h"
#include "instructionscreen6.h"

#include "foreground.h"

#include "sound.h"
#include "pausetheme.h"
#include "menutheme.h"
#include "wintheme.h"
#include "losetheme.h"
#include "buttons.h"

// #define MAPWIDTH 0
// #define MAPHEIGHT 0

void initialize();
void goToStart();
void start();
void goToInstruction();
void instruction();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

void setupInterrupts();
void interruptHandler();

enum {
    START,
    INSTRUCTION,
    PAUSE,
    GAME,
    WIN,
    LOSE
};
int gameState;

OBJ_ATTR shadowOAM[128];

unsigned short oldButtons;
unsigned short buttons;

int screenBlock;

int hOff;
int vOff;

int hOff1;
int hOff2;
int instructionState;

int main() {
    mgba_open();
    mgba_printf("Debug Log Initialized!");
    
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch (gameState) {
            case START:
                start();
                break;
            case INSTRUCTION:
                instruction();
                break;
            case PAUSE:
                pause();
                break;
            case GAME:
                game();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128*4);
    }
}


void initialize() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | BG_4BPP;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_SIZE_WIDE | BG_4BPP;
    REG_BG2CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(26) | BG_SIZE_SMALL | BG_4BPP;
    REG_BG3CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(22) | BG_SIZE_WIDE | BG_4BPP;

    DMANow(3, spritesheetPal, &SPRITEPALETTE[0], spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    setupSounds();
    setupInterrupts();

    playSoundA(menutheme_data, menutheme_length - 1000, 1);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    goToStart();
}

void setupInterrupts() {
    REG_IME = 0;
    REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
    REG_INTERRUPT = &interruptHandler;
    REG_IME = 1;
}

void interruptHandler() {

    REG_IME = 0;

    if (REG_IF & IRQ_VBLANK) {

        // TODO 2.0: Handle soundA
        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount > soundA.durationInVBlanks) {
                if (soundA.looping) {
                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);
                } else {
                    soundA.isPlaying = 0;
                    REG_TM0CNT = 0;
                    dma[1].cnt = 0;
                }
            }
        }

        // TODO 2.1: Handle soundB
        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount > soundB.durationInVBlanks) {
                if (soundB.looping) {
                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    REG_TM1CNT = 0;
                    dma[2].cnt = 0;
                }
            }
        }

    }

    if (REG_IF & IRQ_TIMER(2)) {
        // second has passed
    } 

    if (REG_IF & IRQ_TIMER(3)) {
        // minute has passed
    }

    REG_IF = REG_IF;
    REG_IME = 1;

}

void goToStart() {
    hOff1 = 0;
    hOff2 = 0;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(2) | BG_ENABLE(3) | SPRITE_ENABLE;
    gameState = START;
    hideSprites();

    DMANow(3, splashscreen2Tiles, &CHARBLOCK[2], sizeof(splashscreen2Tiles)/2);
    DMANow(3, splashscreen2Pal, PALETTE, sizeof(splashscreen2Pal)/2);
    DMANow(3, splashscreen2Map, &SCREENBLOCK[26], splashscreen2MapLen / 2);

    DMANow(3, background1Tiles, &CHARBLOCK[3], sizeof(background1Tiles)/2);
    DMANow(3, background1Pal + 16, PALETTE + 16, 16);
    DMANow(3, background1Map, &SCREENBLOCK[22], background1MapLen / 2);

    DMANow(3, background2Tiles, &CHARBLOCK[0], sizeof(background2Tiles)/2);
    DMANow(3, background2Pal + 32, PALETTE + 32, 16);
    DMANow(3, background2Map, &SCREENBLOCK[31], background2MapLen / 2);

    unpauseSounds();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
}

void start() {
    hOff1 += 2;
    if (hOff1 % 256 == 0) {
        hOff1 == 0;
    }
    REG_BG0HOFF = hOff1;

    hOff2++;
    if (hOff2 % 512 == 0) {
        hOff2 == 0;
    }
    REG_BG3HOFF = hOff2;

    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        initGame();
        goToGame();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        playSoundB(buttons_data, buttons_length - 100, 0);
        goToInstruction();
    }
}

void goToInstruction() {
    hOff1 = 0;
    hOff2 = 0;
    REG_BG0HOFF = hOff1;
    REG_BG3HOFF = hOff2;
    instructionState = 0;

    gameState = INSTRUCTION;
    DMANow(3, instructionscreenTiles, &CHARBLOCK[0], sizeof(instructionscreenTiles)/2);
    DMANow(3, instructionscreenPal, PALETTE, sizeof(instructionscreenPal)/2);
    DMANow(3, instructionscreenMap, &SCREENBLOCK[31], instructionscreenMapLen / 2);

    waitForVBlank();
    DMANow(3, shadowOAM,OAM, 512);
}

void instruction() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START) && instructionState == 5) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        initGame();
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_START) && instructionState != 5) {
        instructionState++;
        if (instructionState == 1) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen2Tiles, &CHARBLOCK[0], sizeof(instructionscreen2Tiles)/2);
            DMANow(3, instructionscreen2Pal, PALETTE, sizeof(instructionscreen2Pal)/2);
            DMANow(3, instructionscreen2Map, &SCREENBLOCK[31], instructionscreen2MapLen / 2);
        } else if (instructionState == 2) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen3Tiles, &CHARBLOCK[0], sizeof(instructionscreen3Tiles)/2);
            DMANow(3, instructionscreen3Pal, PALETTE, sizeof(instructionscreen3Pal)/2);
            DMANow(3, instructionscreen3Map, &SCREENBLOCK[31], instructionscreen3MapLen / 2);
        } else if (instructionState == 3) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen5Tiles, &CHARBLOCK[0], sizeof(instructionscreen5Tiles)/2);
            DMANow(3, instructionscreen5Pal, PALETTE, sizeof(instructionscreen5Pal)/2);
            DMANow(3, instructionscreen5Map, &SCREENBLOCK[31], instructionscreen5MapLen / 2);
        } else if (instructionState == 4) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen6Tiles, &CHARBLOCK[0], sizeof(instructionscreen6Tiles)/2);
            DMANow(3, instructionscreen6Pal, PALETTE, sizeof(instructionscreen6Pal)/2);
            DMANow(3, instructionscreen6Map, &SCREENBLOCK[31], instructionscreen6MapLen / 2);
        } else if (instructionState == 5) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen4Tiles, &CHARBLOCK[0], sizeof(instructionscreen4Tiles)/2);
            DMANow(3, instructionscreen4Pal, PALETTE, sizeof(instructionscreen4Pal)/2);
            DMANow(3, instructionscreen4Map, &SCREENBLOCK[31], instructionscreen4MapLen / 2);
        }
    }

    if (BUTTON_PRESSED(BUTTON_SELECT) && instructionState == 0) {
        playSoundB(buttons_data, buttons_length - 100, 0);
        goToStart();
    } else if (BUTTON_PRESSED(BUTTON_SELECT) && instructionState != 0) {
        instructionState--;
        if (instructionState == 0) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreenTiles, &CHARBLOCK[0], sizeof(instructionscreenTiles)/2);
            DMANow(3, instructionscreenPal, PALETTE, sizeof(instructionscreenPal)/2);
            DMANow(3, instructionscreenMap, &SCREENBLOCK[31], instructionscreenMapLen / 2);
        } else if (instructionState == 1) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen2Tiles, &CHARBLOCK[0], sizeof(instructionscreen2Tiles)/2);
            DMANow(3, instructionscreen2Pal, PALETTE, sizeof(instructionscreen2Pal)/2);
            DMANow(3, instructionscreen2Map, &SCREENBLOCK[31], instructionscreen2MapLen / 2);
        } else if (instructionState == 2) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen3Tiles, &CHARBLOCK[0], sizeof(instructionscreen3Tiles)/2);
            DMANow(3, instructionscreen3Pal, PALETTE, sizeof(instructionscreen3Pal)/2);
            DMANow(3, instructionscreen3Map, &SCREENBLOCK[31], instructionscreen3MapLen / 2);
        } else if (instructionState == 3) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen5Tiles, &CHARBLOCK[0], sizeof(instructionscreen5Tiles)/2);
            DMANow(3, instructionscreen5Pal, PALETTE, sizeof(instructionscreen5Pal)/2);
            DMANow(3, instructionscreen5Map, &SCREENBLOCK[31], instructionscreen5MapLen / 2);
        } else if (instructionState == 4) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen6Tiles, &CHARBLOCK[0], sizeof(instructionscreen6Tiles)/2);
            DMANow(3, instructionscreen6Pal, PALETTE, sizeof(instructionscreen6Pal)/2);
            DMANow(3, instructionscreen6Map, &SCREENBLOCK[31], instructionscreen6MapLen / 2);
        }
    }
}

void goToGame() {
    REG_BG0HOFF = 0;
    gameState = GAME;
    DMANow(3, tilesetTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, PALETTE, sizeof(tilesetPal)/2);
    DMANow(3, tilemap2Map, &SCREENBLOCK[27], tilemap2MapLen / 2);

    DMANow(3, foregroundTiles, &CHARBLOCK[0], sizeof(foregroundTiles)/2);
    DMANow(3, foregroundPal + 16, PALETTE + 16, 16);
    DMANow(3, foregroundMap, &SCREENBLOCK[31], foregroundMapLen / 2);

    if (overdriving) {
        DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
        DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
        DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
    }

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
}

void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundB(buttons_data, buttons_length - 100, 0);
        goToPause();
    }

    if (winState) {
        stopSounds();
        playSoundA(wintheme_data, wintheme_length - 1000, 1);
        goToWin();
    }

    if (loseState) {
        stopSounds();
        playSoundA(losetheme_data, losetheme_length - 1000, 1);
        goToLose();
    }
}

void goToPause() {
    gameState = PAUSE;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    DMANow(3, pausescreenTiles, &CHARBLOCK[0], sizeof(pausescreenTiles)/2);
    DMANow(3, pausescreenPal, PALETTE, sizeof(pausescreenPal)/2);
    DMANow(3, pausescreenMap, &SCREENBLOCK[31], pausescreenMapLen / 2);
    
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    pauseA();
    playSoundB(pausetheme_data, pausetheme_length - 1000, 1);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;

        stopB();
        unpauseSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);

        goToGame();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        playSoundA(menutheme_data, menutheme_length - 1000, 1);
        goToStart();
    }
}

void goToWin() {
    gameState = WIN;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    DMANow(3, winscreenTiles, &CHARBLOCK[0], sizeof(winscreenTiles)/2);
    DMANow(3, winscreenPal, PALETTE, sizeof(winscreenPal)/2);
    DMANow(3, winscreenMap, &SCREENBLOCK[31], winscreenMapLen / 2);

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        playSoundA(menutheme_data, menutheme_length - 1000, 1);
        goToStart();
    }
}

void goToLose() {
    gameState = LOSE;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    DMANow(3, losescreenTiles, &CHARBLOCK[0], sizeof(losescreenTiles)/2);
    DMANow(3, losescreenPal, PALETTE, sizeof(losescreenPal)/2);
    DMANow(3, losescreenMap, &SCREENBLOCK[31], losescreenMapLen / 2);

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        playSoundA(menutheme_data, menutheme_length - 1000, 1);
        goToStart();
    }
}

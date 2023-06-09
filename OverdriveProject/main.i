# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 49 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 40 "gba.h"
void waitForVBlank();
# 57 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 73 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 105 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 50 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 51 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 52 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int width;
    int height;
    int direction;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
} SPRITE;
# 53 "main.c" 2
# 1 "game.h" 1





typedef struct {
    int x;
    int y;
    int hitboxX;
    int hitboxY;
    int hitboxWidth;
    int hitboxHeight;
    int speed;
    int width;
    int height;
    int framesPassed;
    int aniState;
    int aniFrame;
    int numFrames;
    int hide;
    int grounded;
    int jumpFrame;
    int attacking;
    int attackFrame;
    int attackForm;
    int attackCancel;
    int iframes;
    int dodge;
    int dodgeDirection;
    int health;
    int attackX;
    int attackY;
    int attackWidth;
    int attackHeight;
    int hit;
    int standingStill;
    int overdrive;
} PLAYER;

typedef struct {
    int x;
    int y;
    int hitboxX;
    int hitboxY;
    int width;
    int height;
    int hitboxWidth;
    int hitboxHeight;
    int hide;
    int aniState;
    int aniFrame;
    int health;
    int attackX;
    int attackY;
    int attackWidth;
    int attackHeight;
    int hit;
    int hitCount;
} DRILLER;

typedef struct {
    int x;
    int y;
    int hitboxX;
    int hitboxY;
    int width;
    int height;
    int hitboxWidth;
    int hitboxHeight;
    int hide;
    int aniState;
    int aniFrame;
    int health;
    int attackX;
    int attackY;
    int attackWidth;
    int attackHeight;
    int hit;
    int hitCount;
} BALLER;

typedef struct {
    int x;
    int y;
    int hitboxX;
    int hitboxY;
    int width;
    int height;
    int hitboxWidth;
    int hitboxHeight;
    int hide;
    int aniState;
    int aniFrame;
    int health;
    int attackX;
    int attackY;
    int attackWidth;
    int attackHeight;
    int hit;
    int hitCount;
} BOSS;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int hide;
    int speed;
    int active;
    int counter;
} BULLET;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int hide;
    int speed;
    int active;
    int counter;
    int hit;
} CRESCENT;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int timer;
    int aniFrame;
    int hide;
    int counter;
} LASER;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int hide;
    int aniFrame;
    int numFrames;
    int framesPassed;
} BLUEFLAME;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int hide;
    int aniFrame;
    int numFrames;
    int framesPassed;
    int collected;
} BLADE;

typedef struct {
    unsigned int sampleRate;
    unsigned int length;
    signed char* data;
} SONG;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int oldHealth;
    int healthTimer;
    int zero;
} HEALTH;

typedef struct {
    int x;
    int y;
    int hitboxWidth;
    int hitboxHeight;
    int oldHealth;
    int healthTimer;
    int hide;
} UPPERHEALTH;

typedef struct {
    int x;
    int y;
    int hitboxWidth;
    int hitboxHeight;
    int oldHealth;
    int healthTimer;
} LOWERHEALTH;




void initGame();
void initPlayer();
void initDriller();
void initBaller();
void initFlame();
void initBullets();
void initCrescents();
void initLasers();
void initBlade();
void initHealth();
void initEnemyHealth();
void initBoss();

void updateGame();
void updatePlayer();
void updateDriller();
void updateBaller();
void updateBullets();
void updateCrescents();
void spawnBullet();
void spawnCrescent();
void updateLasers();
void updateBlade();
void updateHealth();
void updateEnemyHealth();
void updateBoss();

void drawGame();
void drawPlayer();

void updatePlayer();
void animatePlayer();
void animateFlame();
void animateBlade();

int canMoveLeft();
int canMoveRight();
int canMoveUp();
void gravity();

extern int winState;
extern int loseState;
extern int hOff;
extern int vOff;
extern int screenBlock;
extern int overdriving;
# 54 "main.c" 2

# 1 "splashscreen.h" 1
# 22 "splashscreen.h"
extern const unsigned short splashscreenTiles[176];


extern const unsigned short splashscreenMap[1024];


extern const unsigned short splashscreenPal[256];
# 56 "main.c" 2
# 1 "instructionscreen.h" 1
# 22 "instructionscreen.h"
extern const unsigned short instructionscreenTiles[3088];


extern const unsigned short instructionscreenMap[1024];


extern const unsigned short instructionscreenPal[256];
# 57 "main.c" 2
# 1 "gamescreen.h" 1
# 22 "gamescreen.h"
extern const unsigned short gamescreenTiles[64];


extern const unsigned short gamescreenMap[1024];


extern const unsigned short gamescreenPal[256];
# 58 "main.c" 2
# 1 "pausescreen.h" 1
# 22 "pausescreen.h"
extern const unsigned short pausescreenTiles[2288];


extern const unsigned short pausescreenMap[1024];


extern const unsigned short pausescreenPal[256];
# 59 "main.c" 2
# 1 "winscreen.h" 1
# 22 "winscreen.h"
extern const unsigned short winscreenTiles[2160];


extern const unsigned short winscreenMap[1024];


extern const unsigned short winscreenPal[256];
# 60 "main.c" 2
# 1 "losescreen.h" 1
# 22 "losescreen.h"
extern const unsigned short losescreenTiles[1728];


extern const unsigned short losescreenMap[1024];


extern const unsigned short losescreenPal[256];
# 61 "main.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[16384];


extern const unsigned short tilesetPal[256];
# 62 "main.c" 2
# 1 "tilemap.h" 1







extern const unsigned short tilemapMap[1024];
# 63 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 64 "main.c" 2
# 1 "tilemap2.h" 1







extern const unsigned short tilemap2Map[4096];
# 65 "main.c" 2
# 1 "tilesetinvert.h" 1
# 21 "tilesetinvert.h"
extern const unsigned short tilesetinvertTiles[16384];


extern const unsigned short tilesetinvertPal[256];
# 66 "main.c" 2

# 1 "splashscreen2.h" 1
# 22 "splashscreen2.h"
extern const unsigned short splashscreen2Tiles[3808];


extern const unsigned short splashscreen2Map[1024];


extern const unsigned short splashscreen2Pal[256];
# 68 "main.c" 2
# 1 "background1.h" 1
# 22 "background1.h"
extern const unsigned short background1Tiles[784];


extern const unsigned short background1Map[2048];


extern const unsigned short background1Pal[256];
# 69 "main.c" 2
# 1 "background2.h" 1
# 22 "background2.h"
extern const unsigned short background2Tiles[432];


extern const unsigned short background2Map[1024];


extern const unsigned short background2Pal[256];
# 70 "main.c" 2

# 1 "instructionscreen2.h" 1
# 22 "instructionscreen2.h"
extern const unsigned short instructionscreen2Tiles[5488];


extern const unsigned short instructionscreen2Map[1024];


extern const unsigned short instructionscreen2Pal[256];
# 72 "main.c" 2
# 1 "instructionscreen3.h" 1
# 22 "instructionscreen3.h"
extern const unsigned short instructionscreen3Tiles[6512];


extern const unsigned short instructionscreen3Map[1024];


extern const unsigned short instructionscreen3Pal[256];
# 73 "main.c" 2
# 1 "instructionscreen4.h" 1
# 22 "instructionscreen4.h"
extern const unsigned short instructionscreen4Tiles[5056];


extern const unsigned short instructionscreen4Map[1024];


extern const unsigned short instructionscreen4Pal[256];
# 74 "main.c" 2
# 1 "instructionscreen5.h" 1
# 22 "instructionscreen5.h"
extern const unsigned short instructionscreen5Tiles[4768];


extern const unsigned short instructionscreen5Map[1024];


extern const unsigned short instructionscreen5Pal[256];
# 75 "main.c" 2
# 1 "instructionscreen6.h" 1
# 22 "instructionscreen6.h"
extern const unsigned short instructionscreen6Tiles[5616];


extern const unsigned short instructionscreen6Map[1024];


extern const unsigned short instructionscreen6Pal[256];
# 76 "main.c" 2

# 1 "foreground.h" 1
# 22 "foreground.h"
extern const unsigned short foregroundTiles[224];


extern const unsigned short foregroundMap[1024];


extern const unsigned short foregroundPal[256];
# 78 "main.c" 2

# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();

void pauseA();
void pauseB();
void stopA();
void stopB();
void unpauseA();
void unpauseB();
# 56 "sound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 80 "main.c" 2
# 1 "pausetheme.h" 1


extern const unsigned int pausetheme_sampleRate;
extern const unsigned int pausetheme_length;
extern const signed char pausetheme_data[];
# 81 "main.c" 2
# 1 "menutheme.h" 1


extern const unsigned int menutheme_sampleRate;
extern const unsigned int menutheme_length;
extern const signed char menutheme_data[];
# 82 "main.c" 2
# 1 "wintheme.h" 1


extern const unsigned int wintheme_sampleRate;
extern const unsigned int wintheme_length;
extern const signed char wintheme_data[];
# 83 "main.c" 2
# 1 "losetheme.h" 1


extern const unsigned int losetheme_sampleRate;
extern const unsigned int losetheme_length;
extern const signed char losetheme_data[];
# 84 "main.c" 2
# 1 "buttons.h" 1


extern const unsigned int buttons_sampleRate;
extern const unsigned int buttons_length;
extern const signed char buttons_data[];
# 85 "main.c" 2




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
        buttons = (*(volatile unsigned short *)0x04000130);

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
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
    }
}


void initialize() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);

    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((31) << 8) | (0 << 14) | (0 << 7);
    (*(volatile unsigned short*)0x400000A) = ((1) << 2) | ((27) << 8) | (1 << 14) | (0 << 7);
    (*(volatile unsigned short*)0x400000C) = ((2) << 2) | ((26) << 8) | (0 << 14) | (0 << 7);
    (*(volatile unsigned short*)0x400000E) = ((3) << 2) | ((22) << 8) | (1 << 14) | (0 << 7);

    DMANow(3, spritesheetPal, &((u16 *)0x5000200)[0], 512 / 2);
    DMANow(3, spritesheetTiles, &((charblock *)0x06000000)[4], 32768 / 2);

    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    setupSounds();
    setupInterrupts();

    playSoundA(menutheme_data, menutheme_length - 1000, 1);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    goToStart();
}

void setupInterrupts() {
    *(unsigned short*)0x4000208 = 0;
    *(unsigned short*)0x4000200 = (1 << 0) | (1 << ((2 % 4) + 3)) | (1 << ((3 % 4) + 3));
    *(unsigned short*)0x4000004 = (1 << 3);
    *((ihp*)0x03007FFC) = &interruptHandler;
    *(unsigned short*)0x4000208 = 1;
}

void interruptHandler() {

    *(unsigned short*)0x4000208 = 0;

    if (*(volatile unsigned short*)0x4000202 & (1 << 0)) {


        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount > soundA.durationInVBlanks) {
                if (soundA.looping) {
                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);
                } else {
                    soundA.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = 0;
                    dma[1].cnt = 0;
                }
            }
        }


        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount > soundB.durationInVBlanks) {
                if (soundB.looping) {
                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    *(volatile unsigned short*)0x4000106 = 0;
                    dma[2].cnt = 0;
                }
            }
        }

    }

    if (*(volatile unsigned short*)0x4000202 & (1 << ((2 % 4) + 3))) {

    }

    if (*(volatile unsigned short*)0x4000202 & (1 << ((3 % 4) + 3))) {

    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
    *(unsigned short*)0x4000208 = 1;

}

void goToStart() {
    hOff1 = 0;
    hOff2 = 0;
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (2 % 4))) | (1 << (8 + (3 % 4))) | (1 << 12);
    gameState = START;
    hideSprites();

    DMANow(3, splashscreen2Tiles, &((charblock *)0x06000000)[2], sizeof(splashscreen2Tiles)/2);
    DMANow(3, splashscreen2Pal, ((unsigned short *)0x5000000), sizeof(splashscreen2Pal)/2);
    DMANow(3, splashscreen2Map, &((screenblock *)0x6000000)[26], 2048 / 2);

    DMANow(3, background1Tiles, &((charblock *)0x06000000)[3], sizeof(background1Tiles)/2);
    DMANow(3, background1Pal + 16, ((unsigned short *)0x5000000) + 16, 16);
    DMANow(3, background1Map, &((screenblock *)0x6000000)[22], 4096 / 2);

    DMANow(3, background2Tiles, &((charblock *)0x06000000)[0], sizeof(background2Tiles)/2);
    DMANow(3, background2Pal + 32, ((unsigned short *)0x5000000) + 32, 16);
    DMANow(3, background2Map, &((screenblock *)0x6000000)[31], 2048 / 2);

    unpauseSounds();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void start() {
    hOff1 += 2;
    if (hOff1 % 256 == 0) {
        hOff1 == 0;
    }
    (*(volatile unsigned short *)0x04000010) = hOff1;

    hOff2++;
    if (hOff2 % 512 == 0) {
        hOff2 == 0;
    }
    (*(volatile unsigned short *)0x0400001C) = hOff2;

    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        initGame();
        goToGame();
    }

    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        playSoundB(buttons_data, buttons_length - 100, 0);
        goToInstruction();
    }
}

void goToInstruction() {
    hOff1 = 0;
    hOff2 = 0;
    (*(volatile unsigned short *)0x04000010) = hOff1;
    (*(volatile unsigned short *)0x0400001C) = hOff2;
    instructionState = 0;

    gameState = INSTRUCTION;
    DMANow(3, instructionscreenTiles, &((charblock *)0x06000000)[0], sizeof(instructionscreenTiles)/2);
    DMANow(3, instructionscreenPal, ((unsigned short *)0x5000000), sizeof(instructionscreenPal)/2);
    DMANow(3, instructionscreenMap, &((screenblock *)0x6000000)[31], 2048 / 2);

    waitForVBlank();
    DMANow(3, shadowOAM,((OBJ_ATTR*)(0x7000000)), 512);
}

void instruction() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) && instructionState == 5) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        initGame();
        goToGame();
    } else if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) && instructionState != 5) {
        instructionState++;
        if (instructionState == 1) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen2Tiles, &((charblock *)0x06000000)[0], sizeof(instructionscreen2Tiles)/2);
            DMANow(3, instructionscreen2Pal, ((unsigned short *)0x5000000), sizeof(instructionscreen2Pal)/2);
            DMANow(3, instructionscreen2Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        } else if (instructionState == 2) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen3Tiles, &((charblock *)0x06000000)[0], sizeof(instructionscreen3Tiles)/2);
            DMANow(3, instructionscreen3Pal, ((unsigned short *)0x5000000), sizeof(instructionscreen3Pal)/2);
            DMANow(3, instructionscreen3Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        } else if (instructionState == 3) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen5Tiles, &((charblock *)0x06000000)[0], sizeof(instructionscreen5Tiles)/2);
            DMANow(3, instructionscreen5Pal, ((unsigned short *)0x5000000), sizeof(instructionscreen5Pal)/2);
            DMANow(3, instructionscreen5Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        } else if (instructionState == 4) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen6Tiles, &((charblock *)0x06000000)[0], sizeof(instructionscreen6Tiles)/2);
            DMANow(3, instructionscreen6Pal, ((unsigned short *)0x5000000), sizeof(instructionscreen6Pal)/2);
            DMANow(3, instructionscreen6Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        } else if (instructionState == 5) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen4Tiles, &((charblock *)0x06000000)[0], sizeof(instructionscreen4Tiles)/2);
            DMANow(3, instructionscreen4Pal, ((unsigned short *)0x5000000), sizeof(instructionscreen4Pal)/2);
            DMANow(3, instructionscreen4Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        }
    }

    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2)))) && instructionState == 0) {
        playSoundB(buttons_data, buttons_length - 100, 0);
        goToStart();
    } else if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2)))) && instructionState != 0) {
        instructionState--;
        if (instructionState == 0) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreenTiles, &((charblock *)0x06000000)[0], sizeof(instructionscreenTiles)/2);
            DMANow(3, instructionscreenPal, ((unsigned short *)0x5000000), sizeof(instructionscreenPal)/2);
            DMANow(3, instructionscreenMap, &((screenblock *)0x6000000)[31], 2048 / 2);
        } else if (instructionState == 1) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen2Tiles, &((charblock *)0x06000000)[0], sizeof(instructionscreen2Tiles)/2);
            DMANow(3, instructionscreen2Pal, ((unsigned short *)0x5000000), sizeof(instructionscreen2Pal)/2);
            DMANow(3, instructionscreen2Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        } else if (instructionState == 2) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen3Tiles, &((charblock *)0x06000000)[0], sizeof(instructionscreen3Tiles)/2);
            DMANow(3, instructionscreen3Pal, ((unsigned short *)0x5000000), sizeof(instructionscreen3Pal)/2);
            DMANow(3, instructionscreen3Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        } else if (instructionState == 3) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen5Tiles, &((charblock *)0x06000000)[0], sizeof(instructionscreen5Tiles)/2);
            DMANow(3, instructionscreen5Pal, ((unsigned short *)0x5000000), sizeof(instructionscreen5Pal)/2);
            DMANow(3, instructionscreen5Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        } else if (instructionState == 4) {
            playSoundB(buttons_data, buttons_length - 100, 0);
            DMANow(3, instructionscreen6Tiles, &((charblock *)0x06000000)[0], sizeof(instructionscreen6Tiles)/2);
            DMANow(3, instructionscreen6Pal, ((unsigned short *)0x5000000), sizeof(instructionscreen6Pal)/2);
            DMANow(3, instructionscreen6Map, &((screenblock *)0x6000000)[31], 2048 / 2);
        }
    }
}

void goToGame() {
    (*(volatile unsigned short *)0x04000010) = 0;
    gameState = GAME;
    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[1], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
    DMANow(3, tilemap2Map, &((screenblock *)0x6000000)[27], (8192) / 2);

    DMANow(3, foregroundTiles, &((charblock *)0x06000000)[0], sizeof(foregroundTiles)/2);
    DMANow(3, foregroundPal + 16, ((unsigned short *)0x5000000) + 16, 16);
    DMANow(3, foregroundMap, &((screenblock *)0x6000000)[31], 2048 / 2);

    if (overdriving) {
        DMANow(3, tilesetinvertTiles, &((charblock *)0x06000000)[1], sizeof(tilesetTiles)/2);
        DMANow(3, tilesetinvertPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
        DMANow(3, foregroundPal + 32, ((unsigned short *)0x5000000) + 16, 16);
    }

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
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
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    DMANow(3, pausescreenTiles, &((charblock *)0x06000000)[0], sizeof(pausescreenTiles)/2);
    DMANow(3, pausescreenPal, ((unsigned short *)0x5000000), sizeof(pausescreenPal)/2);
    DMANow(3, pausescreenMap, &((screenblock *)0x6000000)[31], 2048 / 2);

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    pauseA();
    playSoundB(pausetheme_data, pausetheme_length - 1000, 1);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void pause() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        (*(volatile unsigned short *)0x04000010) = hOff;
        (*(volatile unsigned short *)0x04000012) = vOff;

        stopB();
        unpauseSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);

        goToGame();
    }

    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        playSoundA(menutheme_data, menutheme_length - 1000, 1);
        goToStart();
    }
}

void goToWin() {
    gameState = WIN;
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    DMANow(3, winscreenTiles, &((charblock *)0x06000000)[0], sizeof(winscreenTiles)/2);
    DMANow(3, winscreenPal, ((unsigned short *)0x5000000), sizeof(winscreenPal)/2);
    DMANow(3, winscreenMap, &((screenblock *)0x6000000)[31], 2048 / 2);

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void win() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        playSoundA(menutheme_data, menutheme_length - 1000, 1);
        goToStart();
    }
}

void goToLose() {
    gameState = LOSE;
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    DMANow(3, losescreenTiles, &((charblock *)0x06000000)[0], sizeof(losescreenTiles)/2);
    DMANow(3, losescreenPal, ((unsigned short *)0x5000000), sizeof(losescreenPal)/2);
    DMANow(3, losescreenMap, &((screenblock *)0x6000000)[31], 2048 / 2);

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void lose() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        stopSounds();
        playSoundB(buttons_data, buttons_length - 100, 0);
        playSoundA(menutheme_data, menutheme_length - 1000, 1);
        goToStart();
    }
}

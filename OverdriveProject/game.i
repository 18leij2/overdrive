# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
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
# 2 "game.h" 2
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
# 3 "game.h" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 4 "game.h" 2


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
# 2 "game.c" 2
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
# 3 "game.c" 2

# 1 "collisionmap.h" 1
# 21 "collisionmap.h"
extern const unsigned short collisionmapBitmap[32768];


extern const unsigned short collisionmapPal[256];
# 5 "game.c" 2
# 1 "collisionmap2.h" 1
# 21 "collisionmap2.h"
extern const unsigned short collisionmap2Bitmap[131072];


extern const unsigned short collisionmap2Pal[256];
# 6 "game.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[16384];


extern const unsigned short tilesetPal[256];
# 7 "game.c" 2
# 1 "tilesetinvert.h" 1
# 21 "tilesetinvert.h"
extern const unsigned short tilesetinvertTiles[16384];


extern const unsigned short tilesetinvertPal[256];
# 8 "game.c" 2
# 1 "foreground.h" 1
# 22 "foreground.h"
extern const unsigned short foregroundTiles[224];


extern const unsigned short foregroundMap[1024];


extern const unsigned short foregroundPal[256];
# 9 "game.c" 2
# 1 "swordhit.h" 1


extern const unsigned int swordhit_sampleRate;
extern const unsigned int swordhit_length;
extern const signed char swordhit_data[];
# 10 "game.c" 2
# 1 "maintheme.h" 1


extern const unsigned int maintheme_sampleRate;
extern const unsigned int maintheme_length;
extern const signed char maintheme_data[];
# 11 "game.c" 2
# 1 "swordtriplehit.h" 1


extern const unsigned int swordtriplehit_sampleRate;
extern const unsigned int swordtriplehit_length;
extern const signed char swordtriplehit_data[];
# 12 "game.c" 2
# 1 "swordstab.h" 1


extern const unsigned int swordstab_sampleRate;
extern const unsigned int swordstab_length;
extern const signed char swordstab_data[];
# 13 "game.c" 2
# 1 "overdriven.h" 1


extern const unsigned int overdriven_sampleRate;
extern const unsigned int overdriven_length;
extern const signed char overdriven_data[];
# 14 "game.c" 2
# 1 "hitsound.h" 1


extern const unsigned int hitsound_sampleRate;
extern const unsigned int hitsound_length;
extern const signed char hitsound_data[];
# 15 "game.c" 2
# 1 "demonmode.h" 1


extern const unsigned int demonmode_sampleRate;
extern const unsigned int demonmode_length;
extern const signed char demonmode_data[];
# 16 "game.c" 2

inline unsigned char colorAt(int x, int y);

int hOff;
int vOff;

int oldAni;
int dodgeTime;
int hitTime;
int drillerTimer;
int ballerTimer;
int bossTimer;
int overdriveTimer;
int overdriveCooldown;

int drillerCounter;
int ballerCounter;
int bossCounter;

int winState;
int loseState;

int screenBlock;

int drillerDead;
int ballerDead;
int regenBar;

int cheatActive;
int demonMode;
int overdriving;

unsigned char* collisionMap;

PLAYER player;
DRILLER driller;
BLUEFLAME flame;
BALLER baller;
BULLET bullets[3];
CRESCENT crescents[10];
LASER lasers[8];
BLADE blade;
SONG song;
HEALTH health;
UPPERHEALTH upperHealth;
LOWERHEALTH lowerHealth;
BOSS boss;

void initGame() {
    collisionMap = (unsigned char*) collisionmap2Bitmap;
    hOff = 0;
    vOff = 0;
    oldAni = 0;
    dodgeTime = 0;
    hitTime = 0;
    drillerTimer = 0;
    ballerTimer = 0;
    bossTimer = 0;
    winState = 0;
    loseState = 0;
    screenBlock = 27;
    overdriveTimer = 0;
    overdriveCooldown = 0;
    drillerCounter = 0;
    ballerCounter = 0;
    bossCounter = 0;
    drillerDead = 0;
    ballerDead = 0;
    regenBar = 0;
    cheatActive = 0;
    demonMode = 0;
    overdriving = 0;

    song.sampleRate = maintheme_sampleRate;
    song.length = maintheme_length;
    song.data = (signed char*) maintheme_data;

    initPlayer();
    initDriller();
    initBaller();
    initBullets();
    initCrescents();
    initFlame();
    initLasers();
    initBlade();
    initHealth();
    initEnemyHealth();
    initBoss();

    playSoundA(song.data, song.length - 1000, 1);
}

void initPlayer() {
    player.x = 0;
    player.y = 50;
    player.hitboxX = player.x + 5;
    player.hitboxY = player.y + 2;
    player.speed = 2;
    player.width = 32;
    player.height = 16;
    player.hitboxWidth = 5;
    player.hitboxHeight = 14;
    player.framesPassed = 0;
    player.aniState = 0;
    player.aniFrame = 0;
    player.numFrames = 3;
    player.hide = 0;
    player.grounded = 1;
    player.jumpFrame = 0;
    player.attacking = 0;
    player.attackFrame = 0;
    player.attackForm = 0;
    player.attackCancel = 1;
    player.iframes = 0;
    player.dodge = 0;
    player.dodgeDirection = 0;
    player.health = 100;
    player.attackX = 10;
    player.attackY = 2;
    player.attackWidth = 14;
    player.attackHeight = 14;
    player.hit = 0;
    player.overdrive = 0;
}

void initDriller() {
    driller.x = 200;
    driller.y = 50;
    driller.hitboxX = driller.x + 13;
    driller.hitboxY = driller.y + 6;
    driller.width = 32;
    driller.height = 32;
    driller.hitboxWidth = 19;
    driller.hitboxHeight = 26;
    driller.hide = 0;
    driller.aniState = 0;
    driller.aniFrame = 0;
    driller.health = 300;
    driller.attackX = 0;
    driller.attackY = 8;
    driller.attackWidth = 16;
    driller.attackHeight = 23;
    driller.hit = 0;
    driller.hitCount = 0;
}

void initBaller() {
    baller.x = 712;
    baller.y = 50;
    baller.hitboxX = baller.x + 10;
    baller.hitboxY = baller.y + 7;
    baller.width = 32;
    baller.height = 32;
    baller.hitboxWidth = 22;
    baller.hitboxHeight = 25;
    baller.hide = 0;
    baller.aniState = 0;
    baller.aniFrame = 0;
    baller.health = 240;
    baller.attackX = baller.x - 4;
    baller.attackY = baller.y + 8;
    baller.attackWidth = 14;
    baller.attackHeight = 25;
    baller.hit = 0;
    baller.hitCount = 0;
}

void initBoss() {
    boss.x = 920;
    boss.y = 10;
    boss.hitboxX = boss.x + 31;
    boss.hitboxY = boss.y + 10;
    boss.width = 64;
    boss.height = 64;
    boss.hitboxWidth = 32;
    boss.hitboxHeight = 54;
    boss.hide = 0;
    boss.aniState = 12;
    boss.aniFrame = 18;
    boss.health = 1000;
    boss.attackX = boss.x;
    boss.attackY = boss.y + 11;
    boss.attackWidth = 32;
    boss.attackHeight = 54;
    boss.hit = 0;
    boss.hitCount = 0;
}

void initLasers() {
    for (int i = 0; i < 8; i++) {
        lasers[i].x = 455 + (i * 8);
        lasers[i].y = 71;
        lasers[i].width = 8;
        lasers[i].height = 32;
        lasers[i].timer = 0;
        lasers[i].aniFrame = 0;
        lasers[i].hide = 0;
        lasers[i].counter = 0;
    }
}

void initBullets() {
    for (int i = 0; i < 3; i++) {
        bullets[i].x = 0;
        bullets[i].y = 0;
        bullets[i].width = 16;
        bullets[i].height = 8;
        bullets[i].hide = 1;
        bullets[i].speed = 3;
        bullets[i].active = 0;
        bullets[i].counter = 0;
    }
}

void initCrescents() {
    for (int i = 0; i < 10; i++) {
        crescents[i].x = 0;
        crescents[i].y = 0;
        crescents[i].width = 8;
        crescents[i].height = 16;
        crescents[i].hide = 1;
        crescents[i].speed = 6;
        crescents[i].active = 0;
        crescents[i].counter = 0;
        crescents[i].hit = 0;
    }
}

void initBlade() {
    blade.x = 95;
    blade.y = 45;
    blade.width = 8;
    blade.height = 16;
    blade.hide = 1;
    blade.aniFrame = 0;
    blade.numFrames = 5;
    blade.framesPassed = 0;
    blade.collected = 0;
}

void initFlame() {
    flame.x = 1000;
    flame.y = 80;
    flame.width = 8;
    flame.height = 8;
    flame.hide = 0;
    flame.aniFrame = 0;
    flame.numFrames = 3;
    flame.framesPassed = 0;
}

void initHealth() {
    health.x = 0;
    health.y = 152;
    health.width = 64;
    health.height = 32;
    health.oldHealth = player.health;
    health.healthTimer = 0;
    health.zero = 0;
}

void initEnemyHealth() {
    upperHealth.x = 140;
    upperHealth.y = 152;
    upperHealth.hitboxWidth = 50;
    upperHealth.hitboxHeight = 8;
    upperHealth.oldHealth = 0;
    upperHealth.hide = 0;

    lowerHealth.x = 190;
    lowerHealth.y = 152;
    lowerHealth.hitboxWidth = 60;
    lowerHealth.hitboxHeight = 8;
    lowerHealth.oldHealth = driller.health;
}

void updateGame() {
    overdriving = player.overdrive;
    updatePlayer();
    animatePlayer();
    animateFlame();
    updateDriller();
    updateBaller();
    updateBlade();
    animateBlade();
    updateHealth();
    updateEnemyHealth();
    updateBoss();

    for (int i = 0; i < 3; i++) {
        updateBullets(&bullets[i]);
    }

    for (int i = 0; i < 10; i++) {
        updateCrescents(&crescents[i]);
    }

    for (int i = 0; i < 8; i++) {
        updateLasers(&lasers[i]);
    }

    if (player.health <= 0 && health.zero) {
        loseState = 1;
    } else if (driller.health <= 0 && collision(player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight,
        flame.x, flame.y, flame.width, flame.height)) {
        winState = 1;
    }

    if ((~(buttons) & ((1<<9))) && (~(buttons) & ((1<<8))) && !cheatActive) {
        cheatActive = 1;
        blade.hide = 0;
    }
}

void drawGame() {
    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000016) = vOff;

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = ((player.y - vOff) & 0xFF) | (1<<14);
        shadowOAM[0].attr1 = ((player.x - (hOff + ((screenBlock - 27) * 256))) & 0x1FF) | (2<<14);
        if (player.hit) {
            shadowOAM[0].attr2 = (((2) & 0xF) << 12) | (((player.aniFrame * 2) * 32 + (player.aniState * 4)) & 0x3FF);
        } else if (player.iframes && dodgeTime < 8) {
            shadowOAM[0].attr2 = (((1) & 0xF) << 12) | (((player.aniFrame * 2) * 32 + (player.aniState * 4)) & 0x3FF);
        } else if (player.overdrive) {
            shadowOAM[0].attr2 = (((3) & 0xF) << 12) | (((player.aniFrame * 2) * 32 + (player.aniState * 4)) & 0x3FF);
        } else {
            shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((player.aniFrame * 2) * 32 + (player.aniState * 4)) & 0x3FF);
        }
    }

    if (driller.hide) {
        shadowOAM[1].attr0 |= (2<<8);
    } else {
        shadowOAM[1].attr0 = ((driller.y - vOff) & 0xFF) | (0<<14);
        shadowOAM[1].attr1 = ((driller.x - (hOff + ((screenBlock - 27) * 256))) & 0x1FF) | (2<<14);
        if (driller.hit) {
            driller.hitCount++;
            if (driller.hitCount > 4) {
                driller.hit = 0;
            }
            shadowOAM[1].attr2 = (((1) & 0xF) << 12) | (((6 + (driller.aniFrame * 4)) * 32 + (driller.aniState * 4)) & 0x3FF);
        } else if (player.overdrive) {
            shadowOAM[1].attr2 = (((4) & 0xF) << 12) | (((6 + (driller.aniFrame * 4)) * 32 + (driller.aniState * 4)) & 0x3FF);
        } else {
            shadowOAM[1].attr2 = (((0) & 0xF) << 12) | (((6 + (driller.aniFrame * 4)) * 32 + (driller.aniState * 4)) & 0x3FF);
        }
    }

    if (baller.hide) {
        shadowOAM[2].attr0 |= (2<<8);
    } else {
        shadowOAM[2].attr0 = ((baller.y - vOff) & 0xFF) | (0<<14);
        shadowOAM[2].attr1 = ((baller.x - (hOff + ((screenBlock - 27) * 256))) & 0x1FF) | (2<<14);
        if (baller.hit) {
        baller.hitCount++;
            if (baller.hitCount > 4) {
                baller.hit = 0;
            }
            shadowOAM[2].attr2 = (((1) & 0xF) << 12) | (((14 + (baller.aniFrame * 4)) * 32 + (8)) & 0x3FF);
        } else if (player.overdrive) {
            shadowOAM[2].attr2 = (((4) & 0xF) << 12) | (((14 + (baller.aniFrame * 4)) * 32 + (8)) & 0x3FF);
        } else {
            shadowOAM[2].attr2 = (((0) & 0xF) << 12) | (((14 + (baller.aniFrame * 4)) * 32 + (8)) & 0x3FF);
        }
    }

    if (boss.hide) {
        shadowOAM[18].attr0 |= (2<<8);
    } else {
        shadowOAM[18].attr0 = ((boss.y - vOff) & 0xFF) | (0<<14);
        shadowOAM[18].attr1 = ((boss.x - (hOff + ((screenBlock - 27) * 256))) & 0x1FF) | (3<<14);
        if (boss.hit) {
        boss.hitCount++;
            if (boss.hitCount > 4) {
                boss.hit = 0;
            }
            shadowOAM[18].attr2 = (((1) & 0xF) << 12) | (((boss.aniFrame) * 32 + (boss.aniState)) & 0x3FF);
        } else if (player.overdrive) {
            shadowOAM[18].attr2 = (((4) & 0xF) << 12) | (((boss.aniFrame) * 32 + (boss.aniState)) & 0x3FF);
        } else {
            shadowOAM[18].attr2 = (((0) & 0xF) << 12) | (((boss.aniFrame) * 32 + (boss.aniState)) & 0x3FF);
        }
    }

    for (int i = 0; i < 3; i++) {
        if (bullets[i].hide) {
            shadowOAM[i + 4].attr0 |= (2<<8);
        } else {
            shadowOAM[i + 4].attr0 = ((bullets[i].y - vOff) & 0xFF) | (1<<14);
            shadowOAM[i + 4].attr1 = ((bullets[i].x - (hOff + ((screenBlock - 27) * 256))) & 0x1FF) | (0<<14);
            if (player.overdrive) {
                shadowOAM[i + 4].attr2 = (((4) & 0xF) << 12) | (((18) * 32 + (1)) & 0x3FF);
            } else {
                shadowOAM[i + 4].attr2 = (((0) & 0xF) << 12) | (((18) * 32 + (1)) & 0x3FF);
            }
        }
    }

    for (int i = 0; i < 10; i++) {
        if (crescents[i].hide) {
            shadowOAM[i + 20].attr0 |= (2<<8);
        } else {
            shadowOAM[i + 20].attr0 = ((crescents[i].y - vOff) & 0xFF) | (2<<14);
            shadowOAM[i + 20].attr1 = ((crescents[i].x - (hOff + ((screenBlock - 27) * 256))) & 0x1FF) | (0<<14);
            shadowOAM[i + 20].attr2 = (((0) & 0xF) << 12) | (((23) * 32 + (3)) & 0x3FF);

        }
    }

    for (int i = 0; i < 8; i++) {
        if (lasers[i].hide) {
            shadowOAM[i + 7].attr0 |= (2<<8);
        } else {
            shadowOAM[i + 7].attr0 = ((lasers[i].y - vOff) & 0xFF) | (2<<14);
            shadowOAM[i + 7].attr1 = ((lasers[i].x - (hOff + ((screenBlock - 27) * 256))) & 0x1FF) | (1<<14);
            if (player.overdrive) {
                shadowOAM[i + 7].attr2 = (((4) & 0xF) << 12) | (((19) * 32 + (1 + lasers[i].aniFrame)) & 0x3FF);
            } else {
                shadowOAM[i + 7].attr2 = (((0) & 0xF) << 12) | (((19) * 32 + (1 + lasers[i].aniFrame)) & 0x3FF);
            }
        }
    }

    if (flame.hide) {
        shadowOAM[3].attr0 |= (2<<8);
    } else {
        shadowOAM[3].attr0 = ((flame.y - vOff) & 0xFF) | (0<<14);
        shadowOAM[3].attr1 = ((flame.x - (hOff + ((screenBlock - 27) * 256))) & 0x1FF) | (0<<14);
        if (player.overdrive) {
            shadowOAM[3].attr2 = (((4) & 0xF) << 12) | (((18 + (flame.aniFrame)) * 32 + (0)) & 0x3FF);
        } else {
            shadowOAM[3].attr2 = (((0) & 0xF) << 12) | (((18 + (flame.aniFrame)) * 32 + (0)) & 0x3FF);
        }
    }

    if (blade.hide) {
        shadowOAM[14].attr0 |= (2<<8);
    } else {
        shadowOAM[14].attr0 = ((blade.y - vOff) & 0xFF) | (2<<14);
        shadowOAM[14].attr1 = ((blade.x - (hOff + ((screenBlock - 27) * 256))) & 0x1FF) | (0<<14);
        if (player.overdrive) {
            shadowOAM[14].attr2 = (((4) & 0xF) << 12) | (((21 + (2 * blade.aniFrame)) * 32 + (0)) & 0x3FF);
        } else {
            shadowOAM[14].attr2 = (((0) & 0xF) << 12) | (((21 + (2 * blade.aniFrame)) * 32 + (0)) & 0x3FF);
        }
    }

    shadowOAM[15].attr0 = ((health.y) & 0xFF) | (1<<14);
    shadowOAM[15].attr1 = ((health.x) & 0x1FF) | (3<<14);
    if (player.overdrive) {
        shadowOAM[15].attr2 = (((4) & 0xF) << 12) | (((14) * 32 + (12)) & 0x3FF);
    } else {
        shadowOAM[15].attr2 = (((0) & 0xF) << 12) | (((14) * 32 + (12)) & 0x3FF);
    }

    if (upperHealth.hide) {
        shadowOAM[16].attr0 |= (2<<8);
    } else {
        shadowOAM[16].attr0 = ((upperHealth.y) & 0xFF) | (1<<14);
        shadowOAM[16].attr1 = ((upperHealth.x) & 0x1FF) | (3<<14);
        if (player.overdrive) {
            shadowOAM[16].attr2 = (((4) & 0xF) << 12) | (((0) * 32 + (24)) & 0x3FF);
        } else {
            shadowOAM[16].attr2 = (((0) & 0xF) << 12) | (((0) * 32 + (24)) & 0x3FF);
        }
    }

    shadowOAM[17].attr0 = ((lowerHealth.y) & 0xFF) | (1<<14);
    shadowOAM[17].attr1 = ((lowerHealth.x) & 0x1FF) | (3<<14);
    if (player.overdrive) {
        shadowOAM[17].attr2 = (((4) & 0xF) << 12) | (((4) * 32 + (24)) & 0x3FF);
    } else {
        shadowOAM[17].attr2 = (((0) & 0xF) << 12) | (((4) * 32 + (24)) & 0x3FF);
    }

    if (overdriveCooldown) {
        shadowOAM[19].attr0 |= (2<<8);
    } else {
        shadowOAM[19].attr0 = ((8) & 0xFF) | (0<<14);
        shadowOAM[19].attr1 = ((8) & 0x1FF) | (1<<14);
        if (player.overdrive) {
            shadowOAM[19].attr2 = (((3) & 0xF) << 12) | (((23) * 32 + (1)) & 0x3FF);
        } else {
            shadowOAM[19].attr2 = (((0) & 0xF) << 12) | (((23) * 32 + (1)) & 0x3FF);
        }
    }


}

inline unsigned char colorAt(int x, int y) {
    return collisionMap[((y) * (1024) + (x))];
}

int canMoveLeft() {
    int left = player.hitboxX;

    int top = player.hitboxY;
    int bottom = player.hitboxY + player.hitboxHeight - 1;

    return colorAt(left - player.speed, top) && colorAt(left - player.speed, bottom) &&
        colorAt(left - player.speed, top + 4) && colorAt(left - player.speed, bottom - 4);
}

int canMoveRight() {

    int right = player.hitboxX + player.hitboxWidth - 1;
    int top = player.hitboxY;
    int bottom = player.hitboxY + player.hitboxHeight - 1;

    return colorAt(right + player.speed, top) && colorAt(right + player.speed, bottom) &&
        colorAt(right + player.speed, top + 4) && colorAt(right + player.speed, bottom - 4) &&
        (!(collision(player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight,
        driller.hitboxX, driller.hitboxY, driller.hitboxWidth, driller.hitboxHeight)) &&
        (!(collision(player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight,
        baller.hitboxX, baller.hitboxY - 3, baller.hitboxWidth, baller.hitboxHeight))) &&
        (!(collision(player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight,
        boss.hitboxX, boss.hitboxY , boss.hitboxWidth, boss.hitboxHeight))));
}

int canMoveUp(int upAmount) {
    int left = player.hitboxX;
    int right = player.hitboxX + player.hitboxWidth - 1;
    int top = player.hitboxY;


    return colorAt(left, top - upAmount) && colorAt(right, top - upAmount);
}

void gravity() {
    int left = player.hitboxX;
    int right = player.hitboxX + player.hitboxWidth - 1;

    int bottom = player.hitboxY + player.hitboxHeight - 1;

    if (colorAt(left, bottom + 4) && colorAt(right, bottom + 4)) {
        player.y += 4;
    } else if (colorAt(left, bottom + 3) && colorAt(right, bottom + 3)) {
        player.y += 3;
    } else if (colorAt(left, bottom + 2) && colorAt(right, bottom + 2)) {
        player.y += 2;
    } else if (colorAt(left, bottom + 1) && colorAt(right, bottom + 1)) {
        player.y += 1;
    } else if (!(colorAt(left, bottom + 1) && colorAt(right, bottom + 1))) {
        player.grounded = 1;
    }
}


void updatePlayer() {
    player.hitboxX = player.x + 5;
    player.hitboxY = player.y + 2;
    player.attackX = player.x + 10;
    player.attackY = player.y + 2;
    gravity();

    player.standingStill = 1;

    if (player.hit && (hitTime < 30)) {
        player.iframes = 1;
        if (hitTime < 8) {
            if (canMoveLeft()) {
                player.x -= 4;
            }
        }
        hitTime++;
    } else if (player.hit && (hitTime >= 30)) {
        hitTime = 0;
        player.hit = 0;
        player.iframes = 0;
    }

    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) && player.grounded && player.attackCancel && !player.hit) {
        player.attackForm++;
        attack(player.attackForm);
        if (player.attackForm == 4) {
            player.attackForm = 0;
        }
    }

    if ((~(buttons) & ((1<<5))) && canMoveLeft() && player.attackCancel && !player.hit) {
        player.x -= player.speed;
        player.aniState = 5;
        player.standingStill = 0;
    } else {
        player.standingStill = 1;
    }

    if ((~(buttons) & ((1<<4))) && canMoveRight() && player.attackCancel && !player.hit) {
        player.x += player.speed;
        player.aniState = 5;
        player.standingStill = 0;
    } else if (!(~(buttons) & ((1<<5)))) {
        player.standingStill = 1;
    }

    if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6)))) && player.grounded && player.attackCancel && !player.hit) {
        player.grounded = 0;
        player.jumpFrame = 10;
    }

    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1)))) && !player.dodge && !player.hit) {
        player.dodge = 1;
        player.iframes = 1;
        player.aniState = 0;
        player.attackCancel = 1;
        player.attackFrame = 0;
        player.attacking = 0;
        player.aniFrame = 0;
        player.attackForm = 0;
        shadowOAM[0].attr2 = (((1) & 0xF) << 12) | (((player.aniFrame * 2) * 32 + (player.aniState * 4)) & 0x3FF);
        if ((~(buttons) & ((1<<4)))) {
            player.dodgeDirection = 1;
        } else {
            player.dodgeDirection = 0;
        }

        if (collision(driller.x, driller.y, driller.width, driller.height, player.hitboxX, player.hitboxY,
            player.hitboxWidth, player.hitboxHeight) && !overdriveCooldown && !player.overdrive && drillerTimer >= 120 &&
            drillerTimer < 135) {
            player.overdrive = 1;
            playSoundB(overdriven_data, overdriven_length - 200, 0);
            pauseA();
            DMANow(3, tilesetinvertTiles, &((charblock *)0x06000000)[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, ((unsigned short *)0x5000000) + 16, 16);
        }

        if (collision(baller.x, baller.y, baller.width, baller.height, player.hitboxX, player.hitboxY,
            player.hitboxWidth, player.hitboxHeight) && ballerTimer >= 100 && ballerTimer < 115 && !overdriveCooldown &&
            !player.overdrive) {
            player.overdrive = 1;
            playSoundB(overdriven_data, overdriven_length - 200, 0);
            pauseA();
            DMANow(3, tilesetinvertTiles, &((charblock *)0x06000000)[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, ((unsigned short *)0x5000000) + 16, 16);
        }

        if (collision(boss.x, boss.y, boss.width, boss.height, player.hitboxX, player.hitboxY,
            player.hitboxWidth, player.hitboxHeight) && !overdriveCooldown && !player.overdrive &&
            ((bossTimer >= 150 && bossTimer < 165) || (bossTimer >= 180 && bossTimer < 195) ||
            (bossTimer >= 210 && bossTimer < 225))) {
            player.overdrive = 1;
            playSoundB(overdriven_data, overdriven_length - 200, 0);
            pauseA();
            DMANow(3, tilesetinvertTiles, &((charblock *)0x06000000)[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, ((unsigned short *)0x5000000) + 16, 16);
        }
    }

    if (player.dodge && dodgeTime < 30) {
        if (dodgeTime < 8) {
           if (player.dodgeDirection && canMoveRight()) {
                player.x += 4;
            } else if (canMoveLeft()) {
                player.x -= 4;
            }
        }

        if (dodgeTime >= 16) {
            player.iframes = 0;
        }
        dodgeTime++;
    } else {
        player.dodge = 0;
        dodgeTime = 0;
    }

    if (!player.grounded) {
        if (canMoveUp(player.jumpFrame) && canMoveUp(1)) {
            player.y -= player.jumpFrame;
        } else {
            for (int i = 0; i < player.jumpFrame; i++) {
                if (canMoveUp(player.jumpFrame - i) && canMoveUp(3)) {
                    player.y -= player.jumpFrame;
                    if (i == player.jumpFrame - 1) {
                        player.jumpFrame = 0;
                    }
                    break;
                }
            }
        }

        if (player.jumpFrame > 0) {
            player.jumpFrame--;
        }
    }

    if (player.attacking) {
        if (player.aniState < 3 && player.aniFrame == 2) {
            player.attackFrame++;
            if (player.attackFrame == 5 && !player.attackCancel) {
                player.attackFrame = 0;
                player.attackCancel = 1;
            }
        } else if (player.aniState == 3 && player.aniFrame == 6) {
            player.attackFrame++;
            if (player.attackFrame == 5 && !player.attackCancel) {
                player.attackFrame = 0;
                player.attackCancel = 1;
            }
        } else if (player.aniState == 4 && player.aniFrame == 6) {
            player.attackFrame++;
            if (player.attackFrame == 20 && !player.attackCancel) {
                player.attackFrame = 0;
                player.attackCancel = 1;
            }
        }

        if (player.attackCancel) {
            player.attackFrame++;
        }

        if (player.attackFrame > 30) {
            player.attackFrame = 0;
            player.attacking = 0;
            player.aniState = 0;
            player.aniFrame = 0;
            player.attackForm = 0;
        }
    }

    if (player.overdrive) {
        overdriveTimer++;

        if (overdriveTimer == 65) {
            unpauseA();
        }

        if (overdriveTimer == 250) {
            overdriveTimer = 0;
            player.overdrive = 0;
            overdriveCooldown = 1;
            DMANow(3, tilesetTiles, &((charblock *)0x06000000)[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 16, ((unsigned short *)0x5000000) + 16, 16);
        }
    }

    if (overdriveCooldown) {
        overdriveTimer++;
        if (overdriveTimer == 400) {
            overdriveTimer = 0;
            overdriveCooldown = 0;
        }
    }

    if (player.x < 0) player.x = 0;
    if (player.y < 0) player.y = 0;
    if (player.x > 1024 - player.hitboxWidth) player.x = 1024 - player.hitboxWidth;
    if (player.y > 256 - player.height) player.y = 256 - player.height;
# 784 "game.c"
    if (player.x + (player.width / 2) > 240 / 2) hOff = player.x - (screenBlock - 27) * 256 - (240 / 2) + (player.width / 2);

    if (screenBlock == 30 && hOff > 16) hOff = 16;

    if (hOff > 256) {
        screenBlock++;
        hOff -= 256;
        (*(volatile unsigned short*)0x400000A) = ((screenBlock) << 8) | ((1) << 2) | (1 << 14);
    }

    if (hOff <= 0) {
        screenBlock--;
        hOff += 256;
        (*(volatile unsigned short*)0x400000A) = ((screenBlock) << 8) | ((1) << 2) | (1 << 14);
    }

    (*(volatile unsigned short *)0x04000014) = hOff;

    if (player.standingStill && player.attackCancel && !player.attacking) {
        player.aniState = 0;
    }
}

void attack(int attack) {

    player.aniState = attack;
    player.attackFrame = 0;
    player.attacking = 1;
    player.attackCancel = 0;

    if (attack == 1 || attack == 2) {
        playSoundB(swordhit_data, swordhit_length - 100, 0);
    } else if (attack == 3) {
        playSoundB(swordtriplehit_data, swordtriplehit_length - 100, 0);
    } else if (attack == 4) {
        playSoundB(swordstab_data, swordstab_length - 100, 0);
    }

    if (collision(player.attackX, player.attackY, player.attackWidth, player.attackHeight,
        driller.hitboxX, driller.hitboxY, driller.hitboxWidth, driller.hitboxHeight)) {
        driller.hit = 1;
        if (attack == 1) {
            driller.health -= 5 + (player.overdrive * 2);
        } else if (attack == 2) {
            driller.health -= 10 + (player.overdrive * 5);
        } else if (attack == 3) {
            driller.health -= 25 + (player.overdrive * 12);
        } else if (attack == 4) {
            driller.health -= 40 + (player.overdrive * 20);
        }
        mgba_printf("Driller health: %d", driller.health);
    }

    if (collision(player.attackX, player.attackY, player.attackWidth, player.attackHeight,
        baller.hitboxX, baller.hitboxY, baller.hitboxWidth, baller.hitboxHeight)) {
        baller.hit = 1;
        if (attack == 1) {
            baller.health -= 5 + (player.overdrive * 2);
        } else if (attack == 2) {
            baller.health -= 10 + (player.overdrive * 5);
        } else if (attack == 3) {
            baller.health -= 25 + (player.overdrive * 12);
        } else if (attack == 4) {
            baller.health -= 40 + (player.overdrive * 20);
        }
        mgba_printf("Baller health: %d", baller.health);
    }

    if (collision(player.attackX, player.attackY, player.attackWidth, player.attackHeight,
        boss.hitboxX, boss.hitboxY, boss.hitboxWidth, boss.hitboxHeight)) {
        boss.hit = 1;
        if (attack == 1) {
            boss.health -= 5 + (player.overdrive * 2);
        } else if (attack == 2) {
            boss.health -= 10 + (player.overdrive * 5);
        } else if (attack == 3) {
            boss.health -= 25 + (player.overdrive * 12);
        } else if (attack == 4) {
            boss.health -= 40 + (player.overdrive * 20);
        }
        mgba_printf("Boss health: %d", boss.health);
    }

    if (cheatActive) {
        spawnCrescent();
    }
}

void updateDriller() {
    driller.hitboxX = driller.x + 13;
    driller.hitboxY = driller.y + 6;
    driller.attackX = driller.x;
    driller.attackY = driller.y + 8;

    if (driller.hitboxX - player.hitboxX > 240 || player.hitboxX - driller.hitboxX > 240) {
        driller.hide = 1;
    } else {
        driller.hide = 0;
    }

    if (driller.health <= 0) {
        driller.hide = 1;
        driller.x = 0;
        driller.y = 0;
    }

    int left = driller.hitboxX;
    int right = driller.hitboxX + driller.hitboxWidth - 1;

    int bottom = driller.hitboxY + driller.hitboxHeight - 1;

    if (colorAt(left, bottom + 4) && colorAt(right, bottom + 4)) {
        driller.y += 4;
    } else if (colorAt(left, bottom + 1) && colorAt(right, bottom + 1)) {
        driller.y += 1;
    }

    if (player.overdrive) {
        drillerCounter++;
        if (drillerCounter == 2) {
            drillerTimer++;
            drillerCounter = 0;
        }
    } else {
        drillerCounter = 0;
        drillerTimer++;
    }

    if (drillerTimer >= 80 && drillerTimer < 120) {
        driller.aniState = 1;
    } else if (drillerTimer >= 120 && drillerTimer < 135) {
        driller.aniFrame = 1;
# 924 "game.c"
    } else if (drillerTimer >= 135 && drillerTimer < 150) {
        driller.aniFrame = 2;
        if (drillerTimer >= 135 && drillerTimer < 140) {
            if (collision(driller.attackX, driller.attackY, driller.attackWidth, driller.attackHeight,
                player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight) && !player.hit && !player.iframes) {
                player.hit = 1;
                player.health -= 40;
                playSoundB(hitsound_data, hitsound_length - 100, 0);
                mgba_printf("Player Health: %d", player.health);
            }
        }
    } else if (drillerTimer >= 150) {
        drillerTimer = 0;
        driller.aniState = 0;
        driller.aniFrame = 0;
    }
}

void updateBaller() {
    baller.hitboxX = baller.x + 10;
    baller.hitboxY = baller.y + 7;
    baller.attackX = baller.x - 4;
    baller.attackY = baller.y + 8;

    if (baller.hitboxX - player.hitboxX > 240 || player.hitboxX - baller.hitboxX > 240) {
        baller.hide = 1;
    } else {
        baller.hide = 0;
    }

    if (baller.health <= 0) {
        baller.hide = 1;
        baller.x = 0;
        baller.y = 0;
    }

    int left = baller.hitboxX;
    int right = baller.hitboxX + baller.hitboxWidth - 1;

    int bottom = baller.hitboxY + baller.hitboxHeight - 1;

    if (colorAt(left, bottom + 4) && colorAt(right, bottom + 4)) {
        baller.y += 4;
    } else if (colorAt(left, bottom + 1) && colorAt(right, bottom + 1)) {
        baller.y += 1;
    }

    if (player.overdrive) {
        ballerCounter++;
        if (ballerCounter == 2) {
            ballerTimer++;
            ballerCounter = 0;
        }
    } else {
        ballerCounter = 0;
        ballerTimer++;
    }
    if (ballerTimer >= 60 && ballerTimer < 100) {
        baller.aniFrame = 1;
    } else if (ballerTimer >= 100 && ballerTimer < 115) {
        baller.aniFrame = 2;
# 993 "game.c"
    } else if (ballerTimer >= 115 && ballerTimer < 130) {
        if (baller.hitboxX - player.hitboxX > 60) {
            spawnBullet();
        } else {
            baller.aniFrame = 3;
            if (ballerTimer >= 115 && ballerTimer < 120) {
                if (collision(baller.attackX, baller.attackY, baller.attackWidth, baller.attackHeight,
                    player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight) && !player.hit && !player.iframes) {
                    player.hit = 1;
                    player.health -= 50;
                    playSoundB(hitsound_data, hitsound_length - 100, 0);
                    mgba_printf("Player Health: %d", player.health);
                }
            }
        }
    } else if (ballerTimer >= 160) {
        ballerTimer = 0;
        baller.aniFrame = 0;
    }
}

void updateBoss() {
    boss.hitboxX = boss.x + 31;
    boss.hitboxY = boss.y + 10;
    boss.attackX = boss.x;
    boss.attackY = boss.y + 11;

    if (boss.hitboxX - player.hitboxX > 240 || player.hitboxX - boss.hitboxX > 240) {
        boss.hide = 1;
    } else {
        boss.hide = 0;
    }

    if (boss.health <= 0) {
        boss.hide = 1;
        boss.x = 0;
        boss.y = 0;
    }

    int left = boss.hitboxX;
    int right = boss.hitboxX + boss.hitboxWidth - 1;

    int bottom = boss.hitboxY + boss.hitboxHeight - 1;

    if (colorAt(left, bottom + 4) && colorAt(right, bottom + 4)) {
        boss.y += 4;
    } else if (colorAt(left, bottom + 1) && colorAt(right, bottom + 1)) {
        boss.y += 1;
    }

    if (player.overdrive) {
        bossCounter++;
        if (bossCounter == 2) {
            bossTimer++;
            bossCounter = 0;
        }
    } else {
        bossCounter = 0;
        bossTimer++;
    }
    if (bossTimer >= 100 && bossTimer < 150) {
        boss.aniState = 20;
        boss.aniFrame = 8;
    } else if (bossTimer >= 150 && bossTimer < 165) {
        boss.aniState = 20;
        boss.aniFrame = 16;
# 1067 "game.c"
    } else if (bossTimer >= 165 && bossTimer < 180) {
        boss.aniState = 20;
        boss.aniFrame = 24;
        if (bossTimer >= 165 && bossTimer < 170) {
            if (collision(boss.attackX, boss.attackY, boss.attackWidth, boss.attackHeight,
                player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight) && !player.hit && !player.iframes) {
                player.hit = 1;
                player.health -= 30;
                playSoundB(hitsound_data, hitsound_length - 100, 0);
                mgba_printf("Player Health: %d", player.health);
            }
        }
    } else if (bossTimer >= 180 && bossTimer < 195) {
        boss.aniState = 20;
        boss.aniFrame = 16;
# 1090 "game.c"
    } else if (bossTimer >= 195 && bossTimer < 210) {
        boss.aniState = 20;
        boss.aniFrame = 24;
        if (bossTimer >= 195 && bossTimer < 200) {
            if (collision(boss.attackX, boss.attackY, boss.attackWidth, boss.attackHeight,
                player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight) && !player.hit && !player.iframes) {
                player.hit = 1;
                player.health -= 30;
                playSoundB(hitsound_data, hitsound_length - 100, 0);
                mgba_printf("Player Health: %d", player.health);
            }
        }
    } else if (bossTimer >= 210 && bossTimer < 225) {
        boss.aniState = 20;
        boss.aniFrame = 16;
# 1113 "game.c"
    } else if (bossTimer >= 225 && bossTimer < 240) {
        boss.aniState = 20;
        boss.aniFrame = 24;
        if (bossTimer >= 225 && bossTimer < 230) {
            if (collision(boss.attackX, boss.attackY, boss.attackWidth, boss.attackHeight,
                player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight) && !player.hit && !player.iframes) {
                player.hit = 1;
                player.health -= 30;
                playSoundB(hitsound_data, hitsound_length - 100, 0);
                mgba_printf("Player Health: %d", player.health);
            }
        }
    } else if (bossTimer >= 240 && bossTimer < 300) {
        boss.aniState = 12;
        boss.aniFrame = 18;
    } else if (bossTimer >= 300) {
        bossTimer = 0;
    }
}

void spawnBullet() {
    for (int i = 0; i < 3; i++) {
        if (!bullets[i].active) {
            bullets[i].active = 1;
            bullets[i].hide = 0;
            bullets[i].x = baller.x + 8;
            bullets[i].y = baller.y + 20;
            break;
        }
    }
}

void spawnCrescent() {
    for (int i = 0; i < 10; i++) {
        if (!crescents[i].active) {
            crescents[i].active = 1;
            crescents[i].hide = 0;
            crescents[i].x = player.hitboxX + 7;
            crescents[i].y = player.y;
            break;
        }
    }
}

void updateBullets(BULLET* b) {
    if (b->active) {
        if (b->x - player.hitboxX > 240 || player.hitboxX - b->x > 240) {
            b->hide = 1;
        } else {
            b->hide = 0;
        }

        if (player.overdrive) {
            b->counter++;
            if (b->counter == 2) {
                b->x -= b->speed;
                b->counter = 0;
            }
        } else {
            b->x -= b->speed;
        }

        if (collision(b->x, b->y, b->width, b->height, player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight) &&
            !player.hit && !player.iframes) {
            player.hit = 1;
            player.health -= 20;
            playSoundB(hitsound_data, hitsound_length - 100, 0);
            mgba_printf("Player Health: %d", player.health);
        } else if (collision(b->x, b->y, b->width, b->height, player.hitboxX, player.hitboxY,
            player.hitboxWidth, player.hitboxHeight) && player.dodge && player.iframes && !overdriveCooldown &&
            !player.overdrive) {
            player.overdrive = 1;
            playSoundB(overdriven_data, overdriven_length - 200, 0);
            pauseA();
            DMANow(3, tilesetinvertTiles, &((charblock *)0x06000000)[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, ((unsigned short *)0x5000000) + 16, 16);
        }

        if (!colorAt(b->x, b->y)) {
            b->active = 0;
        }
    } else {
        b->hide = 1;
        b->x = 0;
        b->y = 0;
    }
}

void updateCrescents(CRESCENT* c) {
    if (c->active) {
        if (c->x - player.hitboxX > 250) {
            c->active = 0;
        }

        c->x += c->speed;

        if (collision(c->x, c->y, c->width, c->height, driller.hitboxX, driller.hitboxY, driller.hitboxWidth, driller.hitboxHeight)) {
            driller.health -= 30 + (player.overdrive * 15);
            c->active = 0;
        } else if (collision(c->x, c->y, c->width, c->height, baller.hitboxX, baller.hitboxY, baller.hitboxWidth, baller.hitboxHeight)) {
            baller.health -= 30 + (player.overdrive * 15);
            c->active = 0;
        } else if (collision(c->x, c->y, c->width, c->height, boss.hitboxX, boss.hitboxY, boss.hitboxWidth, boss.hitboxHeight)) {
            boss.health -= 30 + (player.overdrive * 15);
            c->active = 0;
        }

        if (!colorAt(c->x, c->y)) {
            c->active = 0;
        }
    } else {
        c->hide = 1;
        c->x = 0;
        c->y = 0;
    }
}

void updateLasers(LASER* l) {
    if (l->x - player.hitboxX > 240 || player.hitboxX - l->x > 240) {
        l->hide = 1;
    } else {
        l->hide = 0;
    }

    if (player.overdrive) {
        l->counter++;
        if (l->counter == 2) {
            l->timer++;
            l->counter = 0;
        }
    } else {
        l->timer++;
    }

    if (l->timer <= 10) {
        l->aniFrame = 0;
    } else if (l->timer > 10 && l->timer <= 20) {
        l->aniFrame = 1;
    } else if (l->timer > 20 && l->timer <= 30) {
        l->aniFrame = 2;
    } else if (l->timer > 30 && l->timer <= 50) {
        l->aniFrame = 3;
        if (collision(l->x, l->y, l->width, l->height, player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight) &&
            !player.hit && !player.iframes) {
            player.hit = 1;
            player.health -= 70;
            playSoundB(hitsound_data, hitsound_length - 100, 0);
            mgba_printf("Player Health: %d", player.health);
        } else if (collision(l->x, l->y, l->width, l->height, player.hitboxX, player.hitboxY,
            player.hitboxWidth, player.hitboxHeight) && player.dodge && player.iframes && !overdriveCooldown &&
            !player.overdrive) {
            player.overdrive = 1;
            playSoundB(overdriven_data, overdriven_length - 200, 0);
            pauseA();
            DMANow(3, tilesetinvertTiles, &((charblock *)0x06000000)[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, ((unsigned short *)0x5000000) + 16, 16);
        }
    } else if (l->timer > 50) {
        l->timer = 0;
    }
}

void updateBlade() {
    if (collision(blade.x, blade.y, blade.width, blade.height, player.hitboxX, player.hitboxY, player.hitboxWidth, player.hitboxHeight) &&
        cheatActive) {
        blade.collected = 1;
        blade.hide = 1;
        ((screenblock *)0x6000000)[31].tilemap[((1) * (32) + (28))] = ((12 & 0x3FF)) | ((1 & 0xF) << 12);
        ((screenblock *)0x6000000)[31].tilemap[((2) * (32) + (28))] = ((13 & 0x3FF)) | ((1 & 0xF) << 12);

        if (!demonMode && blade.collected) {
            demonMode = 1;
            playSoundB(demonmode_data, demonmode_length - 100, 0);
        }
    }
}

void updateHealth() {
    if (health.oldHealth > player.health) {
        health.healthTimer++;
        if (health.healthTimer % 2 == 0 && (health.oldHealth > player.health)) {
            if (health.oldHealth - player.health > 40) {
                health.oldHealth -= 6;
                health.x -= 3;
            } else if (health.oldHealth - player.health > 20) {
                health.oldHealth -= 4;
                health.x -= 2;
            } else {
                health.oldHealth -= 2;
                health.x--;
            }
        }
    } else {
        health.healthTimer = 0;
    }

    if (health.x <= -50) {
        health.zero = 1;
    }
}

void updateEnemyHealth() {
    if (!drillerDead) {
        if (lowerHealth.oldHealth > driller.health) {
            lowerHealth.healthTimer++;
            if (lowerHealth.healthTimer % 2 == 0 && (lowerHealth.oldHealth > driller.health)) {
                if (lowerHealth.oldHealth - driller.health > 40) {
                    lowerHealth.oldHealth -= 9;
                    lowerHealth.x += 3;
                    upperHealth.x += 3;
                } else if (lowerHealth.oldHealth - driller.health > 20) {
                    lowerHealth.oldHealth -= 6;
                    lowerHealth.x += 2;
                    upperHealth.x += 2;
                } else {
                    lowerHealth.oldHealth -= 3;
                    lowerHealth.x++;
                    upperHealth.x++;
                }

                if (upperHealth.x >= 240 && driller.health <= 0) {
                    drillerDead = 1;
                    lowerHealth.healthTimer = 0;
                }
            }
        } else {
            lowerHealth.healthTimer = 0;
        }
    } else if (regenBar < 1) {
        if (upperHealth.healthTimer == 100) {
            if (upperHealth.x > 160) {
                upperHealth.x--;
                lowerHealth.x--;
            } else {
                regenBar = 1;
                upperHealth.healthTimer = 0;
                lowerHealth.oldHealth = baller.health;
            }
        } else {
            upperHealth.healthTimer++;
        }
    }

    if (drillerDead && !ballerDead && (regenBar != 0)) {
        if (lowerHealth.oldHealth > baller.health) {
            lowerHealth.healthTimer++;
            if (lowerHealth.healthTimer % 2 == 0 && (lowerHealth.oldHealth > baller.health)) {
                if (lowerHealth.oldHealth - baller.health > 40) {
                    lowerHealth.oldHealth -= 9;
                    lowerHealth.x += 3;
                    upperHealth.x += 3;
                } else if (lowerHealth.oldHealth - baller.health > 20) {
                    lowerHealth.oldHealth -= 6;
                    lowerHealth.x += 2;
                    upperHealth.x += 2;
                } else {
                    lowerHealth.oldHealth -= 3;
                    lowerHealth.x++;
                    upperHealth.x++;
                }

                if (upperHealth.x >= 240 && baller.health <= 0) {
                    ballerDead = 1;
                    lowerHealth.healthTimer = 0;
                }
            }
        } else {
            lowerHealth.healthTimer = 0;
        }
    } else if (ballerDead && regenBar < 2) {
        if (upperHealth.healthTimer == 50) {
            if (upperHealth.x > 140) {
                upperHealth.x--;
                lowerHealth.x--;
            } else {
                regenBar = 2;
                upperHealth.healthTimer = 0;
                lowerHealth.oldHealth = boss.health;
            }
        } else {
            upperHealth.healthTimer++;
        }
    }

    if (drillerDead && ballerDead && (regenBar != 0) && (regenBar != 1)) {
        if (lowerHealth.oldHealth > boss.health) {
            lowerHealth.healthTimer++;
            if (lowerHealth.healthTimer % 2 == 0 && (lowerHealth.oldHealth > boss.health)) {
                if (lowerHealth.oldHealth - boss.health > 40) {
                    lowerHealth.oldHealth -= 30;
                    lowerHealth.x += 3;
                    upperHealth.x += 3;
                } else if (lowerHealth.oldHealth - boss.health > 20) {
                    lowerHealth.oldHealth -= 20;
                    lowerHealth.x += 2;
                    upperHealth.x += 2;
                } else {
                    lowerHealth.oldHealth -= 10;
                    lowerHealth.x++;
                    upperHealth.x++;
                }

                if (upperHealth.x >= 240 && boss.health <= 0) {
                    lowerHealth.healthTimer = 0;
                } else if (upperHealth.x < 240 && boss.health <= 0) {
                    upperHealth.x = 240;
                    lowerHealth.x = 240;
                }
            }
        } else {
            lowerHealth.healthTimer = 0;
        }
    }
}

void animatePlayer() {
    if (oldAni == player.aniState) {
        if (player.aniState == 0) {
            player.framesPassed++;
            if (player.framesPassed == 10) {
                player.framesPassed = 0;
                player.aniFrame = (player.aniFrame + 1) % player.numFrames;
            }
        } else if (player.aniState == 5) {
            player.framesPassed++;
            if (player.framesPassed == 4) {
                player.framesPassed = 0;
                player.aniFrame = (player.aniFrame + 1) % player.numFrames;
            }
        } else if (player.aniState == 1) {
            player.framesPassed++;
            if (player.framesPassed == 3) {
                player.framesPassed = 0;
                if (player.aniFrame < 2) {
                    player.aniFrame = player.aniFrame + 1;
                }
            }
        } else if (player.aniState == 2) {
            player.framesPassed++;
            if (player.framesPassed == 3) {
                player.framesPassed = 0;
                if (player.aniFrame < 2) {
                    player.aniFrame = player.aniFrame + 1;
                }
            }
        } else if (player.aniState == 3) {
            player.framesPassed++;
            if (player.framesPassed == 3) {
                player.framesPassed = 0;
                if (player.aniFrame < 6) {
                    player.aniFrame = player.aniFrame + 1;
                }
            }
        } else if (player.aniState == 4) {
            player.framesPassed++;
            if (player.framesPassed == 3) {
                player.framesPassed = 0;
                if (player.aniFrame < 6) {
                    player.aniFrame = player.aniFrame + 1;
                }
            }
        }

    } else {
        oldAni = player.aniState;
        player.aniFrame = 0;
        player.framesPassed = 0;
    }
}

void animateFlame() {
    if (flame.x - player.hitboxX > 240) {
        flame.hide = 1;
    } else {
        flame.hide = 0;
    }

    flame.framesPassed++;
    if (flame.framesPassed == 5) {
        flame.framesPassed = 0;
        flame.aniFrame = (flame.aniFrame + 1) % flame.numFrames;
    }
}

void animateBlade() {
    if (blade.x - player.hitboxX > 240 || player.hitboxX - blade.x > 240) {
        blade.hide = 1;
    } else if (cheatActive && !blade.collected) {
        blade.hide = 0;
    }

    blade.framesPassed++;
    if (blade.framesPassed == 5) {
        blade.framesPassed = 0;
        blade.aniFrame = (blade.aniFrame + 1) % blade.numFrames;
    }
}

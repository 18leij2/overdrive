#include "gba.h"
#include "sprites.h"
#include "mode0.h"

// structs
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

#define MAPWIDTH 1024
#define MAPHEIGHT 256

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
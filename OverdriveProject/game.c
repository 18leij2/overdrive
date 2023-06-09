#include "game.h"
#include "print.h"
#include "sprites.h"
#include "collisionmap.h"
#include "collisionmap2.h"
#include "tileset.h"
#include "tilesetinvert.h"
#include "foreground.h"
#include "swordhit.h"
#include "maintheme.h"
#include "swordtriplehit.h"
#include "swordstab.h"
#include "overdriven.h"
#include "hitsound.h"
#include "demonmode.h"

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

    if (BUTTON_HELD(BUTTON_LSHOULDER) && BUTTON_HELD(BUTTON_RSHOULDER) && !cheatActive) {
        cheatActive = 1;
        blade.hide = 0;
    }
}

void drawGame() {
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_WIDE;
        shadowOAM[0].attr1 = ATTR1_X(player.x - (hOff + ((screenBlock - 27) * 256))) | ATTR1_MEDIUM;
        if (player.hit) {
            shadowOAM[0].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(player.aniState * 4, player.aniFrame * 2);
        } else if (player.iframes && dodgeTime < 8) {
            shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(player.aniState * 4, player.aniFrame * 2);
        } else if (player.overdrive) {
            shadowOAM[0].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(player.aniState * 4, player.aniFrame * 2);
        } else {
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 4, player.aniFrame * 2);
        }
    }

    if (driller.hide) {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[1].attr0 = ATTR0_Y(driller.y - vOff) | ATTR0_SQUARE;
        shadowOAM[1].attr1 = ATTR1_X(driller.x - (hOff + ((screenBlock - 27) * 256))) | ATTR1_MEDIUM;
        if (driller.hit) {
            driller.hitCount++;
            if (driller.hitCount > 4) {
                driller.hit = 0;
            }
            shadowOAM[1].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(driller.aniState * 4, 6 + (driller.aniFrame * 4));
        } else if (player.overdrive) {
            shadowOAM[1].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(driller.aniState * 4, 6 + (driller.aniFrame * 4));
        } else {
            shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(driller.aniState * 4, 6 + (driller.aniFrame * 4));
        }
    }

    if (baller.hide) {
        shadowOAM[2].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[2].attr0 = ATTR0_Y(baller.y - vOff) | ATTR0_SQUARE;
        shadowOAM[2].attr1 = ATTR1_X(baller.x - (hOff + ((screenBlock - 27) * 256))) | ATTR1_MEDIUM;
        if (baller.hit) {
        baller.hitCount++;
            if (baller.hitCount > 4) {
                baller.hit = 0;
            }
            shadowOAM[2].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(8, 14 + (baller.aniFrame * 4));
        } else if (player.overdrive) {
            shadowOAM[2].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(8, 14 + (baller.aniFrame * 4));
        } else {
            shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 14 + (baller.aniFrame * 4));
        }
    }

    if (boss.hide) {
        shadowOAM[18].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[18].attr0 = ATTR0_Y(boss.y - vOff) | ATTR0_SQUARE;
        shadowOAM[18].attr1 = ATTR1_X(boss.x - (hOff + ((screenBlock - 27) * 256))) | ATTR1_LARGE;
        if (boss.hit) {
        boss.hitCount++;
            if (boss.hitCount > 4) {
                boss.hit = 0;
            }
            shadowOAM[18].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(boss.aniState, boss.aniFrame);
        } else if (player.overdrive) {
            shadowOAM[18].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(boss.aniState, boss.aniFrame);
        } else {
            shadowOAM[18].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(boss.aniState, boss.aniFrame);
        }
    }

    for (int i = 0; i < 3; i++) {
        if (bullets[i].hide) {
            shadowOAM[i + 4].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i + 4].attr0 = ATTR0_Y(bullets[i].y - vOff) | ATTR0_WIDE;
            shadowOAM[i + 4].attr1 = ATTR1_X(bullets[i].x - (hOff + ((screenBlock - 27) * 256))) | ATTR1_TINY;
            if (player.overdrive) {
                shadowOAM[i + 4].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(1, 18);
            } else {
                shadowOAM[i + 4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 18);
            }
        }
    }

    for (int i = 0; i < 10; i++) {
        if (crescents[i].hide) {
            shadowOAM[i + 20].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i + 20].attr0 = ATTR0_Y(crescents[i].y - vOff) | ATTR0_TALL;
            shadowOAM[i + 20].attr1 = ATTR1_X(crescents[i].x - (hOff + ((screenBlock - 27) * 256))) | ATTR1_TINY;
            shadowOAM[i + 20].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, 23);

        }
    }

    for (int i = 0; i < 8; i++) {
        if (lasers[i].hide) {
            shadowOAM[i + 7].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i + 7].attr0 = ATTR0_Y(lasers[i].y - vOff) | ATTR0_TALL;
            shadowOAM[i + 7].attr1 = ATTR1_X(lasers[i].x - (hOff + ((screenBlock - 27) * 256))) | ATTR1_SMALL;
            if (player.overdrive) {
                shadowOAM[i + 7].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(1 + lasers[i].aniFrame, 19);
            } else {
                shadowOAM[i + 7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1 + lasers[i].aniFrame, 19);
            }  
        }
    }

    if (flame.hide) {
        shadowOAM[3].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[3].attr0 = ATTR0_Y(flame.y - vOff) | ATTR0_SQUARE;
        shadowOAM[3].attr1 = ATTR1_X(flame.x - (hOff + ((screenBlock - 27) * 256))) | ATTR1_TINY;
        if (player.overdrive) {
            shadowOAM[3].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(0, 18 + (flame.aniFrame));
        } else {
            shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 18 + (flame.aniFrame));
        }
    }

    if (blade.hide) {
        shadowOAM[14].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[14].attr0 = ATTR0_Y(blade.y - vOff) | ATTR0_TALL;
        shadowOAM[14].attr1 = ATTR1_X(blade.x - (hOff + ((screenBlock - 27) * 256))) | ATTR1_TINY;
        if (player.overdrive) {
            shadowOAM[14].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(0, 21 + (2 * blade.aniFrame));
        } else {
            shadowOAM[14].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 21 + (2 * blade.aniFrame));
        }
    }

    shadowOAM[15].attr0 = ATTR0_Y(health.y) | ATTR0_WIDE;
    shadowOAM[15].attr1 = ATTR1_X(health.x) | ATTR1_LARGE;
    if (player.overdrive) {
        shadowOAM[15].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(12, 14);
    } else {
        shadowOAM[15].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 14);
    }

    if (upperHealth.hide) {
        shadowOAM[16].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[16].attr0 = ATTR0_Y(upperHealth.y) | ATTR0_WIDE;
        shadowOAM[16].attr1 = ATTR1_X(upperHealth.x) | ATTR1_LARGE;
        if (player.overdrive) {
            shadowOAM[16].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(24, 0);
        } else {
            shadowOAM[16].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 0);
        }
    }

    shadowOAM[17].attr0 = ATTR0_Y(lowerHealth.y) | ATTR0_WIDE;
    shadowOAM[17].attr1 = ATTR1_X(lowerHealth.x) | ATTR1_LARGE;
    if (player.overdrive) {
        shadowOAM[17].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(24, 4);
    } else {
        shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 4);
    }

    if (overdriveCooldown) {
        shadowOAM[19].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[19].attr0 = ATTR0_Y(8) | ATTR0_SQUARE;
        shadowOAM[19].attr1 = ATTR1_X(8) | ATTR1_SMALL;
        if (player.overdrive) {
            shadowOAM[19].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(1, 23);
        } else {
            shadowOAM[19].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 23);
        }
    }

    // DMANow(3, shadowOAM, OAM, 512);
}

inline unsigned char colorAt(int x, int y) {
    return collisionMap[OFFSET(x, y, MAPWIDTH)];
}

int canMoveLeft() {
    int left = player.hitboxX;
    // int right = player.x + player.width - 1;
    int top = player.hitboxY;
    int bottom = player.hitboxY + player.hitboxHeight - 1;

    return colorAt(left - player.speed, top) && colorAt(left - player.speed, bottom) &&
        colorAt(left - player.speed, top + 4) && colorAt(left - player.speed, bottom - 4);
}

int canMoveRight() {
    // int left = player.x;
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
    // int bottom = player.y + player.height - 1;

    return colorAt(left, top - upAmount) && colorAt(right, top - upAmount);
}

void gravity() {
    int left = player.hitboxX;
    int right = player.hitboxX + player.hitboxWidth - 1;
    // int top = player.hitboxY;
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

    if (BUTTON_PRESSED(BUTTON_A) && player.grounded && player.attackCancel && !player.hit) {
        player.attackForm++;
        attack(player.attackForm);
        if (player.attackForm == 4) {
            player.attackForm = 0;
        }
    }

    if (BUTTON_HELD(BUTTON_LEFT) && canMoveLeft() && player.attackCancel && !player.hit) {
        player.x -= player.speed;
        player.aniState = 5;
        player.standingStill = 0;
    } else {
        player.standingStill = 1;
    }

    if (BUTTON_HELD(BUTTON_RIGHT) && canMoveRight() && player.attackCancel && !player.hit) {
        player.x += player.speed;
        player.aniState = 5;
        player.standingStill = 0;
    } else if (!BUTTON_HELD(BUTTON_LEFT)) {
        player.standingStill = 1;
    }

    if (BUTTON_PRESSED(BUTTON_UP) && player.grounded && player.attackCancel && !player.hit) {
        player.grounded = 0;
        player.jumpFrame = 10;
    }

    if (BUTTON_PRESSED(BUTTON_B) && !player.dodge && !player.hit) {
        player.dodge = 1;
        player.iframes = 1;
        player.aniState = 0;
        player.attackCancel = 1;
        player.attackFrame = 0;
        player.attacking = 0;
        player.aniFrame = 0;
        player.attackForm = 0;
        shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(player.aniState * 4, player.aniFrame * 2);
        if (BUTTON_HELD(BUTTON_RIGHT)) {
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
            DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
        }

        if (collision(baller.x, baller.y, baller.width, baller.height, player.hitboxX, player.hitboxY,
            player.hitboxWidth, player.hitboxHeight) && ballerTimer >= 100 && ballerTimer < 115 && !overdriveCooldown &&
            !player.overdrive) {
            player.overdrive = 1;
            playSoundB(overdriven_data, overdriven_length - 200, 0);
            pauseA();
            DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
        }

        if (collision(boss.x, boss.y, boss.width, boss.height, player.hitboxX, player.hitboxY,
            player.hitboxWidth, player.hitboxHeight) && !overdriveCooldown && !player.overdrive &&
            ((bossTimer >= 150 && bossTimer < 165) || (bossTimer >= 180 && bossTimer < 195) ||
            (bossTimer >= 210 && bossTimer < 225))) {
            player.overdrive = 1;
            playSoundB(overdriven_data, overdriven_length - 200, 0);
            pauseA();
            DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
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
            DMANow(3, tilesetTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetPal, PALETTE, sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 16, PALETTE + 16, 16);
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
    if (player.x > MAPWIDTH - player.hitboxWidth) player.x = MAPWIDTH - player.hitboxWidth;
    if (player.y > MAPHEIGHT - player.height) player.y = MAPHEIGHT - player.height;

    // keep screen in bounds, commented out as replaced by code for XL background
    // hOff = player.x - (SCREENWIDTH - player.width) / 2;
    // vOff = player.y - (SCREENWIDTH - player.height) / 2;

    // if (hOff < 0) hOff = 0;
    // if (vOff < 0) vOff = 0;
    // if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    // if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;

    // wide screen code for player position
    if (player.x + (player.width / 2) > SCREENWIDTH / 2) hOff = player.x - (screenBlock - 27) * 256 - (SCREENWIDTH / 2) + (player.width / 2);

    if (screenBlock == 30 && hOff > 16) hOff = 16;

    if (hOff > 256) {
        screenBlock++;
        hOff -= 256;
        REG_BG1CNT = BG_SCREENBLOCK(screenBlock) | BG_CHARBLOCK(1) | BG_SIZE_WIDE;
    } 

    if (hOff <= 0) {
        screenBlock--;
        hOff += 256;
        REG_BG1CNT = BG_SCREENBLOCK(screenBlock) | BG_CHARBLOCK(1) | BG_SIZE_WIDE;
    }

    REG_BG1HOFF = hOff; 

    if (player.standingStill && player.attackCancel && !player.attacking) {
        player.aniState = 0;
    }
}

void attack(int attack) {
    // hitbox calculation
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
    // int top = player.hitboxY;
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
        // if (collision(driller.x, driller.y, driller.width, driller.height, player.hitboxX, player.hitboxY,
        //     player.hitboxWidth, player.hitboxHeight) && player.dodge && player.iframes && !overdriveCooldown &&
        //     !player.overdrive) {
        //     player.overdrive = 1;
        //     DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
        //     DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
        //     DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
        // }
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
    // int top = player.hitboxY;
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
        // if (collision(baller.x, baller.y, baller.width, baller.height, player.hitboxX, player.hitboxY,
        //     player.hitboxWidth, player.hitboxHeight) && player.dodge && player.iframes && !overdriveCooldown &&
        //     !player.overdrive) {
        //     player.overdrive = 1;
        //     DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
        //     DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
        //     DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
        // }
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
    // int top = player.hitboxY;
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
        // if (collision(boss.x, boss.y, boss.width, boss.height, player.hitboxX, player.hitboxY,
        //     player.hitboxWidth, player.hitboxHeight) && player.dodge && player.iframes && !overdriveCooldown &&
        //     !player.overdrive) {
        //     player.overdrive = 1;
        //     DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
        //     DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
        //     DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
        // }
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
        // if (collision(boss.x, boss.y, boss.width, boss.height, player.hitboxX, player.hitboxY,
        //     player.hitboxWidth, player.hitboxHeight) && player.dodge && player.iframes && !overdriveCooldown &&
        //     !player.overdrive) {
        //     player.overdrive = 1;
        //     DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
        //     DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
        //     DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
        // }
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
        // if (collision(boss.x, boss.y, boss.width, boss.height, player.hitboxX, player.hitboxY,
        //     player.hitboxWidth, player.hitboxHeight) && player.dodge && player.iframes && !overdriveCooldown &&
        //     !player.overdrive) {
        //     player.overdrive = 1;
        //     DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
        //     DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
        //     DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
        // }
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
            DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
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
            DMANow(3, tilesetinvertTiles, &CHARBLOCK[1], sizeof(tilesetTiles)/2);
            DMANow(3, tilesetinvertPal, PALETTE, sizeof(tilesetPal)/2);
            DMANow(3, foregroundPal + 32, PALETTE + 16, 16);
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
        SCREENBLOCK[31].tilemap[OFFSET(28, 1, 32)] = TMAP_ENTRY_TILEID(12) | TMAP_ENTRY_PALROW(1);
        SCREENBLOCK[31].tilemap[OFFSET(28, 2, 32)] = TMAP_ENTRY_TILEID(13) | TMAP_ENTRY_PALROW(1);

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

//{{BLOCK(gamescreen)

//======================================================================
//
//	gamescreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 4 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 128 + 2048 = 2688
//
//	Time-stamp: 2023-04-01, 15:50:54
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN_H
#define GRIT_GAMESCREEN_H

#define gamescreenTilesLen 128
extern const unsigned short gamescreenTiles[64];

#define gamescreenMapLen 2048
extern const unsigned short gamescreenMap[1024];

#define gamescreenPalLen 512
extern const unsigned short gamescreenPal[256];

#endif // GRIT_GAMESCREEN_H

//}}BLOCK(gamescreen)

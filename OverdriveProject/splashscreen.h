
//{{BLOCK(splashscreen)

//======================================================================
//
//	splashscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 352 + 2048 = 2912
//
//	Time-stamp: 2023-04-01, 15:01:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASHSCREEN_H
#define GRIT_SPLASHSCREEN_H

#define splashscreenTilesLen 352
extern const unsigned short splashscreenTiles[176];

#define splashscreenMapLen 2048
extern const unsigned short splashscreenMap[1024];

#define splashscreenPalLen 512
extern const unsigned short splashscreenPal[256];

#endif // GRIT_SPLASHSCREEN_H

//}}BLOCK(splashscreen)

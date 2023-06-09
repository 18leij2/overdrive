
//{{BLOCK(instructionscreen)

//======================================================================
//
//	instructionscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 193 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 6176 + 2048 = 8736
//
//	Time-stamp: 2023-04-25, 06:08:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSCREEN_H
#define GRIT_INSTRUCTIONSCREEN_H

#define instructionscreenTilesLen 6176
extern const unsigned short instructionscreenTiles[3088];

#define instructionscreenMapLen 2048
extern const unsigned short instructionscreenMap[1024];

#define instructionscreenPalLen 512
extern const unsigned short instructionscreenPal[256];

#endif // GRIT_INSTRUCTIONSCREEN_H

//}}BLOCK(instructionscreen)

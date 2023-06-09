# 1 "buttons.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "buttons.c"


const unsigned int buttons_sampleRate = 11025;
const unsigned int buttons_length = 2456;

const signed char buttons_data[] = {
0, -1, -1, 0, 0, 0, 0, -1, -1, -1, 0, 0, -1, 0, 0, 0, 0, 0, -1, -1, -1,
0, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, -1, 0, -1, -1, -1, -1, -1, 0, 0,
-1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1,
-1, 0, 0, 0, 0, 0, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, -1, -1, -1, -1, -1, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, -1, -1, -1,
-1, -1, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, -1, -1, -1, -1, -1,
0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, 0, 0, 0, -1, 0, -1, 0, -1, -1, -1, -1, 0, 0, 0, -1,
-1, -1, 0, 0, 0, 0, -1, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, 0, -1, -1, -1, 0, -1, -1, 0, 0, -1, 0, 0, -1, -1, 0,
0, -1, 0, -1, -1, 0, 0, -1, -1, -1, 0, -1, -1, -1, 0, 0, -1, -1, 0, 0,
-1, -1, 0, -1, -1, 0, -1, -1, -1, 0, -1, -1, -2, 0, 0, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, -1, 1, -2, -2, -3, 4, -5, 2, 1, 0, -7, -2, 11, 4, -8,
-11, -4, 4, 3, -3, 11, 3, -4, -9, -1, -6, -13, -11, 12, 21, 13, 4, -13, -13, -10,
9, 17, 8, -12, -10, -7, -3, -2, 8, 10, 3, 4, 0, -2, -9, -15, -6, 3, 2, 5,
4, 0, -4, -5, -2, 1, 3, 3, 1, -3, -8, -7, -3, 1, 3, 7, 6, 2, 0, -3,
-4, -7, -3, 2, 7, 6, 0, -5, -7, -3, 1, 5, 5, 1, -2, -5, -6, -4, -2, 0,
4, 5, 4, -1, -6, -8, -7, -2, 0, 3, 3, 2, -1, -3, -3, 0, 3, 1, 1, 0,
1, -2, -3, -4, 0, 3, 3, 4, 1, -1, -4, -3, -2, 1, 2, 1, 0, 0, 0, -1,
-2, -3, 0, 1, 1, -1, -1, -2, -2, -2, -2, 1, 2, 1, -1, -2, -2, -2, -3, -1,
2, 2, 1, -1, -1, -1, -2, -2, 0, 3, 3, 2, 0, 0, -1, -2, -2, 0, 2, 2,
1, -1, -3, -2, -1, -1, 0, 1, 1, -1, -3, -2, -2, -1, -1, 1, 1, 0, -2, -3,
-2, -1, 0, 1, 2, 1, 0, -2, -2, -1, -1, 0, 1, 1, 2, 1, -1, -1, -1, -1,
0, 1, 1, 0, -1, -2, -2, -1, 0, 0, 0, 0, -1, -2, -2, -1, -1, 0, 0, 1,
0, -1, -2, -1, 0, -1, 0, 0, 1, 0, -1, -1, -1, 0, 0, 0, 0, 1, 0, 0,
-1, -1, -1, 0, 0, 0, 0, -1, -2, -2, -1, 0, 0, 0, 0, 0, -1, -1, -1, -1,
-1, 0, 0, 0, 0, -1, -1, -1, 0, 1, 0, -1, -1, -1, 0, 0, 0, 1, 1, 0,
-1, -1, -1, -1, 0, 0, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, -1, -1, -1, 0,
0, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, 0, -1,
-1, 0, 0, -1, -1, 0, 0, -1, 0, -1, -1, -1, -1, 0, 0, 0, 0, -1, -1, -1,
-1, 0, 0, 0, 0, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0,
0, 0, 0, 0, 0, -1, 0, -1, -1, -1, 0, 0, -1, -1, -1, -1, -1, -1, 0, 0,
-1, -1, -1, -1, -1, 0, 0, 0, 0, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0,
-1, -1, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, -1,
-1, 0, 0, 0, 0, -1, -1, -1, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, 0,
0, 0, -1, -1, 0, -1, -1, 0, 0, 0, 0, -1, -1, -1, -1, -1, 0, 0, -1, -1,
-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, -1, -1, 0,
0, 0, 0, 0, 0, 0, -1, -1, -1, -1, 0, 0, -1, -1, -1, -1, -1, 0, 0, 0,
-1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, -1, -1, 0, -1, -1,
-1, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, -1, -1, -1, -1, -1, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1,
0, -1, -1, -1, -1, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, -1,
-1, -1, -1, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, -1, -1, -1, -1,
-1, -1, 0, 0, -1, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0,
0, 0, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, -1, -1, -1, 0, 0, 0, 0, -1,
-1, -1, -1, -1, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, -1, -1, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, 0, 0, -1, -1,
0, 0, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, 0, 0, 0, -1,
0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, 0, 0, -1, -1, -1, -1, -1,
0, -1, 0, 0, -1, 0, 0, -1, -1, -1, 0, -1, 0, 0, 0, -1, -1, -1, 0, 0,
-1, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, 0, 0, -1, 0, -1, 0,
-1, -1, 0, 0, 0, 0, -1, -1, 0, 0, 0, -1, 0, 0, 0, -1, 0, -1, -1, -1,
0, 0, 0, -1, -1, -1, 0, -1, 0, 0, -1, 0, 0, 0, -1, -1, -1, 0, 0, 0,
0, -1, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0,
-1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, 0, -1, 0, -1,
0, -1, -1, 0, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0,
-1, -1, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0,
-1, 0, -1, 0, 0, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0,
0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1,
0, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0,
0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1,
0, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0,
-1, 0, -1, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1,
0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1,
0, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0,
-1, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0,
-1, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1,
0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0,
-1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, -1, 0, -1, 0, -1, 0,
0, -1, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0,
-1, 0, 0, -1, 0, -1, 0, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0,
-1, 0, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, 0, 0,
-1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, -1, 0, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1,
0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0,
-1, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, -1,
0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, };

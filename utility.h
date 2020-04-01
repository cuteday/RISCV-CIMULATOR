#ifndef HAPPY_HAPPY_FRIENDS
#define HAPPY_HAPPY_FRIENDS

#include <iostream>
#include <cstring>
#include <cstdio>
#include <cmath>
#include <ctime>
#include <cstdlib>

#define FALSE false
#define TRUE true

typedef unsigned int uint;
typedef long long ll;
typedef unsigned long long ull;
typedef unsigned char uchar;
typedef unsigned short ushort;

extern bool debug_on;
extern void DEBUG(const char format[], ...);

extern const char *op_names[];
extern const char *reg_names[];
extern const char *scall_names[];

extern ull calc_mulh(ull a, ull b);

#endif

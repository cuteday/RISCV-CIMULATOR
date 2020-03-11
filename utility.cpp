#include <cstdarg>
#include <cstdio>
#include "utility.h"

bool debug_on;
void DEBUG(char* format, ...){
    // 变长参数用于调试...!
    if(debug_on){
        va_list ap;
        va_start(ap, format);
        vfprintf(stderr, format, ap);
        va_end(ap);
    }
}
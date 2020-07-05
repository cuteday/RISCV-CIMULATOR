# RISCV-CIMULATOR
C++ Implementation of a simple risc-v simulator.\
This is the homework for Practicum of Computer Organization and Architecture 2020 Spring, Peking Univ.

## Usage
~~~
    make
    ./run       [args]
    ./runtrace  [args]
~~~

## Arguments

### RISC-V Simulator
Use compiled executable `run`
~~~
-f      [risc-v64 file]: run executable in simulator
-d:     print debug impormation for simulator (verbose)
-e:     print elf file parsing results
-cache: enable cache simulation
-h:     print help information
~~~
Example: `./run -cache -f ./tests/self_tests/ackerman.riscv`
### Cache Simulator (Trace file input needed)
Use compiled executable `runtrace`\
Edit default configuration in `Cache.cpp`
~~~
-f      [trace file]: run executable in simulator
-hex:   Indicates the addresses is in hexadecimal
-v:     print debug impormation for cache (verbose)
~~~
Example: `./runtrace -f ./tests/trace/02-stream-gem5-xaa.trace -hex`

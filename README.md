# CMPE 310 Lab 5

## Compile and run

In GitHub Codespaces or x86 Linux with the 32-bit GCC/G++ libraries installed (`gcc-multilib` and `g++-multilib` on Ubuntu), run:

```sh
# Part IA: no optimization
gcc -O0 -S -m32 part_i.c -o part_ia.s

# Part IB: optimized
gcc -O4 -S -m32 part_i.c -o part_ib.s

# Part II: C and C++ Hello World
gcc -O0 -S -m32 hello_c.c -o hello_c.s
g++ -O0 -S -m32 hello_cpp.cpp -o hello_cpp.s
wc -lc hello_c.s hello_cpp.s
gcc -m32 -no-pie hello_c.s -o hello_c
g++ -m32 -no-pie hello_cpp.s -o hello_cpp
./hello_c
./hello_cpp

# Part III: while loop and array maximum
gcc -O0 -S -m32 while_loop.c -o while_loop.s
gcc -m32 -no-pie while_loop.s -o while_loop
./while_loop
gcc -m32 -no-pie max_array.s -o max_array
./max_array
```

The while loop finishes with `i = 11`. The array program prints `Maximum: 23`.

The generated assembly files were produced with GCC/G++ 13.3.0 on Ubuntu 24.04. Assembly output, file sizes, and line counts can vary with the compiler version.

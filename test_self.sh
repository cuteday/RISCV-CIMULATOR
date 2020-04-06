echo Starting Self Tests...

echo ------------------Testing syscall...        ------------------
./build/run -f ./tests/self_tests/ecall.riscv
echo ------------------Testing mat-mul...        ------------------
./build/run -f ./tests/self_tests/mat-mul.riscv
echo ------------------Testing qsort...          ------------------
./build/run -f ./tests/self_tests/qsort.riscv
echo ------------------Testing rev-pairs...      ------------------
./build/run -f ./tests/self_tests/rev-pairs.riscv
echo ------------------Testing ackerman...       ------------------
./build/run -f ./tests/self_tests/ackerman.riscv

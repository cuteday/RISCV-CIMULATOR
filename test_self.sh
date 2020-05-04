echo Starting Self Tests...

echo ------------------Testing syscall...        ------------------
./run -f ./tests/self_tests/ecall.riscv
echo ------------------Testing mat-mul...        ------------------
./run -f ./tests/self_tests/mat-mul.riscv
echo ------------------Testing qsort...          ------------------
./run -f ./tests/self_tests/qsort.riscv
echo ------------------Testing rev-pairs...      ------------------
./run -f ./tests/self_tests/rev-pairs.riscv
echo ------------------Testing ackerman...       ------------------
./run -f ./tests/self_tests/ackerman.riscv

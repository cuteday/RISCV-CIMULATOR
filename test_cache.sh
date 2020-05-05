echo Starting Tests [With Cache Enabled]...

echo ------------------Testing mat-mul...        ------------------
./run -cache -f ./tests/self_tests/mat-mul.riscv
echo ------------------Testing qsort...          ------------------
./run -cache -f ./tests/self_tests/qsort.riscv
echo ------------------Testing rev-pairs...      ------------------
./run -cache -f ./tests/self_tests/rev-pairs.riscv
echo ------------------Testing ackerman...       ------------------
./run -cache -f ./tests/self_tests/ackerman.riscv
echo Starting Performance Tests...

echo ------------------ Testing add.c...          ------------------
./run -f ./tests/performance_tests/add.riscv
echo ------------------ Testing mul-div.c...      ------------------
./run -f ./tests/performance_tests/mul-div.riscv
echo ------------------ Testing n!.c...           ------------------
./run -f ./tests/performance_tests/n!.riscv
echo ------------------ Testing simple-fuction.c...-----------------
./run -f ./tests/performance_tests/simple-fuction.riscv
echo ------------------ Testing qsort.c...        ------------------=
./run -f ./tests/performance_tests/qsort.riscv
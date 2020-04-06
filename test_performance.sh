echo Starting Performance Tests...

echo ------------------ Testing add.c...          ------------------
./build/run -f ./tests/performance_tests/add.riscv
echo ------------------ Testing mul-div.c...      ------------------
./build/run -f ./tests/performance_tests/mul-div.riscv
echo ------------------ Testing n!.c...           ------------------
./build/run -f ./tests/performance_tests/n!.riscv
echo ------------------ Testing simple-fuction.c...-----------------
./build/run -f ./tests/performance_tests/simple-fuction.riscv
echo ------------------ Testing qsort.c...        ------------------=
./build/run -f ./tests/performance_tests/qsort.riscv
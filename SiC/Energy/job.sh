#!/bin/bash
#SBATCH -J Energy
#SBATCH -n 24
#SBATCH -N 1
#SBATCH -o out
#SBATCH -x cu[09-18]

for x in $(seq 1 3);do
cd Dst0$x
for i in $(seq 1 11);do
j=`printf "%02d\n" $i`
cd Dst0"$x"_$j
mpirun -np $SLURM_NTASKS pw.x -inp Dst0"$x"_$j.in > Dst0"$x"_$j.out
rm -rf tmp
cd ..
done
cd ..
done

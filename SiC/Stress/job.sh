#!/bin/bash
#SBATCH -J Stress
#SBATCH -n 24
#SBATCH -N 1
#SBATCH -o out
#SBATCH -x cu[09-18]

cd Dst01
for i in $(seq 1 11);do
j=$(printf "%02d\n" $i)
cd Dst01_$j
mpirun -np $SLURM_NTASKS pw.x -inp Dst01_$j.in > Dst01_$j.out
rm -rf tmp
cd ..
done

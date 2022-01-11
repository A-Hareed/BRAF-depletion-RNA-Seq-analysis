#!/usr/bin/bash

# bash script that downloads sra files and fastq files
# using sra-run-table


# activate the right conda environment 
#conda activate rna-seq


## make a list of sra file names extracted from the RunTable
VAR=$( tail -n +2 BRAF_SraRunTable.txt | cut -d ',' -f 1)

echo "${VAR}"
for i in ${VAR}
do
	prefetch --force all ${i}
	if [ -f "${i}.fastq.gz" ]
	then
		echo "file ${i} already exists"
	else
		echo "(o) downloading SRA entry: ${i}"
		fastq-dump --gzip --defline-qual '+' $DATAsra/sra/${i}.sra
		echo "(0) finished downloading ${i}"
	fi
done


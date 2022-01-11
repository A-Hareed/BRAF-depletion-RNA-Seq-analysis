#!/usr/bin/bash

# Uses given fastq files along with index genome to run
# salmon 

# activate the right conda environment 
#conda activate msa

# geo_accession_braf.csv contains all the geo accession names
# this is used to seprate the samples and allows 
# salmon to be run per individual cell samples
GEO=$(cat geo_accessions_braf.csv)


GG='wget '
for i in ${GEO}
do
#	echo "${i}"
	SRR=$(grep  ${i} BRAF_SraRunTable.txt | cut -d ',' -f 1)
#	echo ${SRR}
	#SRR=$(echo ${SRR} | sed 's/ /.fastq.gz /g')
	SRR=${SRR}.fastq.gz
	echo "sra file: ${SRR}"
	echo "salmon starting with ${i}"
	#salmon quant -i /home/ayub/share_1/gencode_v39_index -l A -o ${i} -r ${SRR}
done



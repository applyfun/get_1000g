#!/bin/bash -l
#SBATCH --output=/scratch/users/%u/%j.out --mem=10000 --partition brc,shared

# this script is meant to be run as a job as files are too large to download interactively

cd ~/brc_scratch/data/get_1000g

module load apps/samtools/1.9.0-singularity

######## SOURCE https://www.biostars.org/p/335605/ #######

prefix="ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.chr" ;

suffix=".phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz" ;

#for chr in {10..22} X,Y; do
#    wget "${prefix}""${chr}""${suffix}" "${prefix}""${chr}""${suffix}".tbi ;
#done

#wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/working/20130606_sample_info/20130606_g1k.ped ;

#wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.gz ;

#wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.fai ;

wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.gz ;

#end


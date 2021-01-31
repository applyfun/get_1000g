#!/bin/bash -l
#SBATCH --output=%j.out --mem=20000 --partition brc,shared

module load apps/samtools/1.9.0-singularity

cd ~/brc_scratch/scripts/

bcfpath=$(sed '15q;d' paths.txt)

echo $bcfpath

cd ~/brc_scratch/data/get_1000g

# add location of bcftools to path

PATH=$PATH:${bcfpath}Software/bcftools-1.8/

for chr in {1..22}; do
    bcftools norm -m-any --check-ref w -f human_g1k_v37.fasta \
      ALL.chr"${chr}".phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz | \

     bcftools norm -Ob --rm-dup both \
        > ALL.chr"${chr}".phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.bcf ;

    bcftools index ALL.chr"${chr}".phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.bcf ;

done


#


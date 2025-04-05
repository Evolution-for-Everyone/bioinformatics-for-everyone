#!/bin/bash
#$ -S /bin/bash
. /etc/profile
#$ -o /home/leticiamagpali/bioinfo4everyone/tutorials/molecular_evolution_starter/tutorial_6
#$ -e /home/leticiamagpali/bioinfo4everyone/tutorials/molecular_evolution_starter/tutorial_6
#$ -M leticiamagpali@dal.ca
#$ -m be

cd /home/leticiamagpali/bioinfo4everyone/tutorials/molecular_evolution_starter/tutorial_6
source activate prank
prank -d=FOXP2_nuc_mafft_nostops.fasta -o=FOXP2_codon_prank -codon -F

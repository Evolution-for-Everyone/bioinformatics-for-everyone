#!/bin/bash
#$ -S /bin/bash
. /etc/profile
#$ -o /home/leticiamagpali/bioinfo4everyone/tutorials/molecular_evolution_starter/tutorial_6
#$ -e /home/leticiamagpali/bioinfo4everyone/tutorials/molecular_evolution_starter/tutorial_6
#$ -M leticiamagpali@dal.ca
#$ -m be

cd /home/leticiamagpali/bioinfo4everyone/tutorials/molecular_evolution_starter/tutorial_6
source activate iqtree

iqtree -s FOXP2_codon_prank.best.fas -st CODON -m MFP -pre FOXP2_codon_tree 

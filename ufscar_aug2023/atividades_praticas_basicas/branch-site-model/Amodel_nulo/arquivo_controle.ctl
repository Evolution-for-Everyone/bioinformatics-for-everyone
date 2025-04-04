seqfile   = Mx_alinhamento_codon_PAL2NAL.txt        			* Path to the alignment file
treefile = Mx_arvore_marcada.tre    							* Path to the tree file
outfile = out_exercicio4_Amodel_null.txt           				* Path to the output file
noisy  = 3                         								* Display moderate information on the screen
verbose = 1                        								* Detailed output file
seqtype = 1                        								* Codon data
ndata  = 1                        								* One gene alignment
icode  = 0                         								* Universal genetic code
cleandata = 0                   								* Do not remove sites with ambiguity data
model  = 2                        								* Two or more ω for branches  
NSsites = 2                        								* One ω for all sites (M0 and branch model)
CodonFreq = 2    												* Use F3x4 model
clock  = 0                         								* Assume no clock
fix_omega = 1                    								* Enables option to estimate omega
omega  = 1                     								    * Initial omega value
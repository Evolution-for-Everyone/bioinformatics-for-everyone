from Bio import AlignIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio.Align import MultipleSeqAlignment
import sys

def remove_stop_codons_alignio(input_file, output_file, format="fasta"):
    stop_codons = {"TAA", "TAG", "TGA", "taa", "tag", "tga"}
    alignment = AlignIO.read(input_file, format)
    new_records = []

    for record in alignment:
        seq = str(record.seq)
        
        # Check if sequence length is a multiple of 3
        if len(seq) % 3 != 0:
            print(f"Error: sequence length ({len(seq)}) is not a multiple of 3! May contain incomplete codons.")
            return
        
        # Build new sequence without stop codons
        cleaned_seq = []
        for codon_index in range(0, len(seq), 3):
            codon = seq[codon_index:codon_index+3]
            if codon not in stop_codons:
                cleaned_seq.append(codon)  # Add valid codons to the list
        
        # Convert list to string and create a new sequence record
        new_seq = Seq("".join(cleaned_seq))
        new_records.append(SeqRecord(new_seq, id=record.id, description=""))

    # Write modified alignment
    new_alignment = MultipleSeqAlignment(new_records)
    AlignIO.write(new_alignment, output_file, format)

# Run the function
INPUT_FILE = sys.argv[1]
OUTPUT_FILE = sys.argv[2]
remove_stop_codons_alignio(INPUT_FILE, OUTPUT_FILE)

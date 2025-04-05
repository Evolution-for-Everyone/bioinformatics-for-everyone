# Removes the first line (header) from the file and passes the rest to the next command
tail -n +2 transcript_protein.tsv | \
# Extracts the first column (gene IDs)
cut -f1 | \
# Sorts gene IDs alphabetically and removes duplicates
sort -u | \
# Reads each unique gene ID one by one
while read GENE_IDS; do

        # Searches for lines where the first column matches the gene ID
        LONGEST=$(grep -w "^$GENE_IDS" transcript_protein.tsv | \
        # Sorts the filtered lines numerically (-n), in descending order (-r), based on column 7 (protein length)
        sort -t$'\t' -nr -k7 | \
        # Selects the top row (the transcript with the longest protein sequence)
        head -n1 | \
        # Extracts column 4 (transcript ID) and column 6 (protein ID)
        cut -f4,6 | \
        # Converts the tab-separated values into newline-separated values
        tr '\t' '\n');

        # Appends the transcript ID and protein ID of the longest transcript to longest.list
        printf "$LONGEST\n" >> longest.list;

done

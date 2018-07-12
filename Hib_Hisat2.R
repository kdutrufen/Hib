# HISAT, StringTie and Ballgown

setwd("C:/Users/3Green/Google Drive/Script")
setwd("C:/Users/Kdu/Google Drive/Script")
setwd("/home/carlos/Dropbox/Script")
setwd("/home/carlos/Documentos/ProcessedData")

system("sudo apt-get install hisat2")

system("sudop wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-1.3.3b.Linux_x86_64.tar.gz")
system("cd ~/src/")
system("tar xvfz ~/Downloads/stringtie-1.3.3b.Linux_x86_64.tar.gz")
system("cd stringtie-1.3.3b.Linux_x86_64")
system("make release")

# build a HISAT2 index, which will be named hib_tran
# usage: hisat2-build [options]* <reference_in> <ht2_base>
# <reference_in> -> A comma-separated list of FASTA files containing the reference sequences to be aligned to
# <ht2_base> -> The basename of the index files to write. By default, hisat2-build writes files named NAME.1.ht2, NAME.2.ht2, NAME.3.ht2, NAME.4.ht2, NAME.5.ht2, NAME.6.ht2, NAME.7.ht2, and NAME.8.ht2 where NAME is <ht2_base>.
#system("time hisat2-build /home/carlos/Dropbox/Script/hib_annot_sequence.txt /home/carlos/Dropbox/Script/genome/hib_genome.fasta hib_tran")
system("time hisat2-build /home/carlos/Dropbox/Script/genome/hib_genome.fasta hib_tran")
system("ls -l hib_tran*") # checa se todos os 8 indices hisat estão presentes


# Align the RNA-seq reads to the genome
# HibPP06-16 02h -> S01B01 -> HibPP061602h_CAGATC_r1_good_clean.common.fastq; HibPP061602h_CAGATC_r2_good_clean.common.fastq 
# HibPP06-16 08h -> S02B01 -> HibPP061608h_CTTGTA_r1_good_clean.common.fastq; HibPP061608h_CTTGTA_r2_good_clean.common.fastq 
# HibPP06-16 10h -> S03B01 -> HibPP061611h_AGTTCC_r1_good_clean.common.fastq; HibPP061611h_AGTTCC_r2_good_clean.common.fastq Obs: Nome trocado no tubo de coleta (10-11)
# HibPP06-16 11h -> S04B01 -> HibPP061610h_AGTCAA_r1_good_clean.common.fastq; HibPP061610h_AGTCAA_r2_good_clean.common.fastq Obs: Nome trocado no tubo de coleta (10-11)
# HibPP06-16 15h -> S05B01 -> HibPP061615h_CGATGT_r1_good_clean.common.fastq; HibPP061615h_CGATGT_r2_good_clean.common.fastq
# HibPP07-16 20h -> S06B01 -> HibPP061620h_TGACCA_r1_good_clean.common.fastq; HibPP061620h_TGACCA_r2_good_clean.common.fastq
# HibPP07-16 02h -> S01B02 -> HibPP071602h_ATGTCA_r1_good_clean.common.fastq; HibPP071602h_ATGTCA_r2_good_clean.common.fastq 
# HibPP07-16 08h -> S02B02 -> HibPP071608h_CCGTCC_r1_good_clean.common.fastq; HibPP071608h_CCGTCC_r2_good_clean.common.fastq 
# HibPP07-16 10h -> S03B02 -> HibPP071610h_GTCCGC_r1_good_clean.common.fastq; HibPP071610h_GTCCGC_r2_good_clean.common.fastq 
# HibPP07-16 11h -> S04B02 -> HibPP071611h_GTGAAA_r1_good_clean.common.fastq; HibPP071611h_GTGAAA_r2_good_clean.common.fastq 
# HibPP07-16 15h -> S05B02 -> HibPP071615h_ACAGTG_r1_good_clean.common.fastq; HibPP071615h_ACAGTG_r2_good_clean.common.fastq 
# HibPP07-16 20h -> S06B02 -> HibPP071620h_GCCAAT_r1_good_clean.common.fastq; HibPP071620h_GCCAAT_r2_good_clean.common.fastq 
# HibPP08-16 02h -> S01B03 -> HibPP081602h_ATCACG_r1_good_clean.common.fastq; HibPP081602h_ATCACG_r2_good_clean.common.fastq 
# HibPP08-16 08h -> S02B03 -> HibPP081608h_TTAGGC_r1_good_clean.common.fastq; HibPP081608h_TTAGGC_r2_good_clean.common.fastq 
# HibPP08-16 10h -> S03B03 -> HibPP081610h_ACTTGA_r1_good_clean.common.fastq; HibPP081610h_ACTTGA_r2_good_clean.common.fastq 
# HibPP08-16 11h -> S04B03 -> HibPP081611h_GATCAG_r1_good_clean.common.fastq; HibPP081611h_GATCAG_r2_good_clean.common.fastq 
# HibPP08-16 15h -> S05B03 -> HibPP081615h_TAGCTT_r1_good_clean.common.fastq; HibPP081615h_TAGCTT_r2_good_clean.common.fastq 
# HibPP08-16 20h -> S06B03 -> HibPP081620h_GGCTAC_r1_good_clean.common.fastq; HibPP081620h_GGCTAC_r2_good_clean.common.fastq 
# HibPP02-17 02h -> S01B04 -> HibPP021702h_GTGGCC_r1_good_clean.common.fastq; HibPP021702h_GTGGCC_r2_good_clean.common.fastq
# HibPP02-17 08h -> S02B04 -> HibPP021708h_GTTTCG_r1_good_clean.common.fastq; HibPP021708h_GTTTCG_r2_good_clean.common.fastq
# HibPP02-17 10h -> S03B04 -> HibPP021710h_CGTACG_r1_good_clean.common.fastq; HibPP021710h_CGTACG_r2_good_clean.common.fastq 
# HibPP02-17 11h -> S04B04 -> HibPP021711h_GAGTGG_r1_good_clean.common.fastq; HibPP021711h_GAGTGG_r2_good_clean.common.fastq 
# HibPP02-17 15h -> S05B04 -> HibPP021715h_ACTGAT_r1_good_clean.common.fastq; HibPP021715h_ACTGAT_r2_good_clean.common.fastq 
# HibPP02-17 20h -> S06B04 -> HibPP021720h_ATTCCT_r1_good_clean.common.fastq; HibPP021720h_ATTCCT_r2_good_clean.common.fastq 

# -p -> The -p option causes HISAT2 to launch a specified number of parallel search threads
# --dta -> --downstream-transcriptome-assembly -> With this option, HISAT2 requires longer anchor lengths for de novo discovery of splice sites. This leads to fewer alignments with short-anchors, which helps transcript assemblers improve significantly in computation and memory usage.
# -x <hisat2-idx> -> The basename of the index for the reference genome. The basename is the name of any of the index files up to but not including the final .1.ht2 / etc. hisat2 looks for the specified index first in the current directory, then in the directory specified in the HISAT2_INDEXES environment variable.
# --no-unal -> Suppress SAM records for reads that failed to align.
# --un-conc-gz <path> -> Write paired-end reads that fail to align concordantly to file(s) at <path>. These reads correspond to the SAM records with the FLAGS 0x4 bit set and either the 0x40 or 0x80 bit set (depending on whether it's mate #1 or #2). .1 and .2 strings are added to the filename to distinguish which file contains mate #1 and mate #2.
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S01B01_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP061602h_CAGATC_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP061602h_CAGATC_r2_good_clean.common.fastq.gz -S S01B01_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S01B02_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP071602h_ATGTCA_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP071602h_ATGTCA_r2_good_clean.common.fastq.gz -S S01B02_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S01B03_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP081602h_ATCACG_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP081602h_ATCACG_r2_good_clean.common.fastq.gz -S S01B03_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S01B04_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP021702h_GTGGCC_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP021702h_GTGGCC_r2_good_clean.common.fastq.gz -S S01B04_hib_hisat.sam")

system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S02B01_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP061608h_CTTGTA_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP061608h_CTTGTA_r2_good_clean.common.fastq.gz -S S02B01_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S02B02_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP071608h_CCGTCC_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP071608h_CCGTCC_r2_good_clean.common.fastq.gz -S S02B02_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S02B03_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP081608h_TTAGGC_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP081608h_TTAGGC_r2_good_clean.common.fastq.gz -S S02B03_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S02B04_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP021708h_GTTTCG_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP021708h_GTTTCG_r2_good_clean.common.fastq.gz -S S02B04_hib_hisat.sam")

system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S03B01_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP061611h_AGTTCC_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP061611h_AGTTCC_r2_good_clean.common.fastq.gz -S S03B01_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S03B02_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP071610h_GTCCGC_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP071610h_GTCCGC_r2_good_clean.common.fastq.gz -S S03B02_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S03B03_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP081610h_ACTTGA_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP081610h_ACTTGA_r2_good_clean.common.fastq.gz -S S03B03_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S03B04_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP021710h_CGTACG_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP021710h_CGTACG_r2_good_clean.common.fastq.gz -S S03B04_hib_hisat.sam")

system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S04B01_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP061610h_AGTCAA_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP061610h_AGTCAA_r2_good_clean.common.fastq.gz -S S04B01_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S04B02_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP071611h_GTGAAA_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP071611h_GTGAAA_r2_good_clean.common.fastq.gz -S S04B02_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S04B03_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP081611h_GATCAG_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP081611h_GATCAG_r2_good_clean.common.fastq.gz -S S04B03_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S04B04_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP021711h_GAGTGG_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP021711h_GAGTGG_r2_good_clean.common.fastq.gz -S S04B04_hib_hisat.sam")

system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S05B01_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP061615h_CGATGT_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP061615h_CGATGT_r2_good_clean.common.fastq.gz -S S05B01_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S05B02_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP071615h_ACAGTG_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP071615h_ACAGTG_r2_good_clean.common.fastq.gz -S S05B02_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S05B03_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP081615h_TAGCTT_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP081615h_TAGCTT_r2_good_clean.common.fastq.gz -S S05B03_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S05B04_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP021715h_ACTGAT_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP021715h_ACTGAT_r2_good_clean.common.fastq.gz -S S05B04_hib_hisat.sam")

system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S06B01_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP061620h_TGACCA_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP061620h_TGACCA_r2_good_clean.common.fastq.gz -S S06B01_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S06B02_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP071620h_GCCAAT_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP071620h_GCCAAT_r2_good_clean.common.fastq.gz -S S06B02_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S06B03_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP081620h_GGCTAC_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP081620h_GGCTAC_r2_good_clean.common.fastq.gz -S S06B03_hib_hisat.sam")
system("time hisat2 -p 8 --dta -x hib_tran --no-unal --un-conc-gz S06B04_hib.unmapped.fq --fr -1 /home/carlos/Documentos/ProcessedData/HibPP021720h_ATTCCT_r1_good_clean.common.fastq.gz -2 /home/carlos/Documentos/ProcessedData/HibPP021720h_ATTCCT_r2_good_clean.common.fastq.gz -S S06B04_hib_hisat.sam")

# Sort and convert the SAM files to BAM
# sort -> Sort alignments by leftmost coordinates, or by read name when -n is used. An appropriate @HD-SO sort order header tag will be added or an existing one updated if necessary.
# The sorted output is written to standard output by default, or to the specified file (out.bam) when -o is used.
# Sorted BAM is a useful format because the alignments are (a) compressed, which is convenient for long-term storage, and (b) sorted, which is conveneint for variant discovery
# @ -> the -@ option can be used to allocate additional threads to be used for compression
system("time samtools sort -@ 2 -o S01B01_hib_hisat_sorted.bam S01B01_hib_hisat.sam")
system("time samtools sort -@ 2 -o S01B02_hib_hisat_sorted.bam S01B02_hib_hisat.sam")
system("time samtools sort -@ 2 -o S01B03_hib_hisat_sorted.bam S01B03_hib_hisat.sam")
system("time samtools sort -@ 2 -o S01B04_hib_hisat_sorted.bam S01B04_hib_hisat.sam")

system("time samtools sort -@ 2 -o S02B01_hib_hisat_sorted.bam S02B01_hib_hisat.sam")
system("time samtools sort -@ 2 -o S02B02_hib_hisat_sorted.bam S02B02_hib_hisat.sam")
system("time samtools sort -@ 2 -o S02B03_hib_hisat_sorted.bam S02B03_hib_hisat.sam")
system("time samtools sort -@ 2 -o S02B04_hib_hisat_sorted.bam S02B04_hib_hisat.sam")

system("time samtools sort -@ 2 -o S03B01_hib_hisat_sorted.bam S03B01_hib_hisat.sam")
system("time samtools sort -@ 2 -o S03B02_hib_hisat_sorted.bam S03B02_hib_hisat.sam")
system("time samtools sort -@ 2 -o S03B03_hib_hisat_sorted.bam S03B03_hib_hisat.sam")
system("time samtools sort -@ 2 -o S03B04_hib_hisat_sorted.bam S03B04_hib_hisat.sam")

system("time samtools sort -@ 2 -o S04B01_hib_hisat_sorted.bam S04B01_hib_hisat.sam")
system("time samtools sort -@ 2 -o S04B02_hib_hisat_sorted.bam S04B02_hib_hisat.sam")
system("time samtools sort -@ 2 -o S04B03_hib_hisat_sorted.bam S04B03_hib_hisat.sam")
system("time samtools sort -@ 2 -o S04B04_hib_hisat_sorted.bam S04B04_hib_hisat.sam")

system("time samtools sort -@ 2 -o S05B01_hib_hisat_sorted.bam S05B01_hib_hisat.sam")
system("time samtools sort -@ 2 -o S05B02_hib_hisat_sorted.bam S05B02_hib_hisat.sam")
system("time samtools sort -@ 2 -o S05B03_hib_hisat_sorted.bam S05B03_hib_hisat.sam")
system("time samtools sort -@ 2 -o S05B04_hib_hisat_sorted.bam S05B04_hib_hisat.sam")

system("time samtools sort -@ 2 -o S06B01_hib_hisat_sorted.bam S06B01_hib_hisat.sam")
system("time samtools sort -@ 2 -o S06B02_hib_hisat_sorted.bam S06B02_hib_hisat.sam")
system("time samtools sort -@ 2 -o S06B03_hib_hisat_sorted.bam S06B03_hib_hisat.sam")
system("time samtools sort -@ 2 -o S06B04_hib_hisat_sorted.bam S06B04_hib_hisat.sam")


# Assemble and quantify expressed genes and transcripts
# usage: stringtie <aligned_reads.bam> [options]*
# -G <ref_ann.gff> -> Use the reference annotation file (in GTF or GFF3 format) to guide the assembly process. The output will include expressed reference transcripts as well as any novel transcripts that are assembled. This option is required by options -B, -b, -e, -C.
# -o [<path/>]<out.gtf> -> Sets the name of the output GTF file where StringTie will write the assembled transcripts. This can be specified as a full path, in which case directories will be created as needed. By default StringTie writes the GTF at standard output. 
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S01B01_hib_hisat.gff S01B01_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S01B02_hib_hisat.gff S01B02_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S01B03_hib_hisat.gff S01B03_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S01B04_hib_hisat.gff S01B04_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S02B01_hib_hisat.gff S02B01_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S02B02_hib_hisat.gff S02B02_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S02B03_hib_hisat.gff S02B03_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S02B04_hib_hisat.gff S02B04_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S03B01_hib_hisat.gff S03B01_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/DS01B01_hib_rsubread.BAMropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S03B02_hib_hisat.gff S03B02_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S03B03_hib_hisat.gff S03B03_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S03B04_hib_hisat.gff S03B04_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S04B01_hib_hisat.gff S04B01_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S04B02_hib_hisat.gff S04B02_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S04B03_hib_hisat.gff S04B03_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S04B04_hib_hisat.gff S04B04_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S05B01_hib_hisat.gff S05B01_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S05B02_hib_hisat.gff S05B02_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S05B03_hib_hisat.gff S05B03_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S05B04_hib_hisat.gff S05B04_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S06B01_hib_hisat.gff S06B01_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S06B02_hib_hisat.gff S06B02_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S06B03_hib_hisat.gff S06B03_hib_hisat_sorted.bam")
system("time stringtie -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o S06B04_hib_hisat.gff S06B04_hib_hisat_sorted.bam")

# Merge transcripts from all samples
# merges all the genes found in any of the samples. Thus, a transcript that was missing an exon in one sample because of a lack of coverage might be restored to its full length
# --merge ->  In the merge mode, StringTie takes as input a list of GTF/GFF files and merges/assembles these transcripts into a non-redundant set of transcripts. This mode is used in the new differential analysis pipeline to generate a global, unified set of transcripts (isoforms) across multiple RNA-Seq samples. 
# If the -G option (reference annotation) is provided, StringTie will assemble the transfrags from the input GTF files with the reference transcripts.
system("time stringtie --merge -p 8 -G /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -o stringtie_merged_Hib.gff /home/carlos/Dropbox/Script/Hib_merge_list.txt")

# Examine how the transcripts compare with the reference annotation
# -r -> The –r option is followed by the annotation file to use as reference
# -G -> the –G option tells gffcompare to compare all transcripts in the input transcripts.gtf file, even those that might be redundant
system("gffcompare -r /home/carlos/Dropbox/Script/GCA_000210875.1_ASM21087v1_genomic.gff -G -o merged stringtie_merged_Hib.gff")

# Estimate transcript abundances and create table counts
# -e -> Limits the processing of read alignments to only estimate and output the assembled transcripts matching the reference transcripts given with the -G option
# -e -> With this option, read bundles with no reference transcripts will be entirely skipped, which may provide a considerable speed boost when the given set of reference transcripts is limited to a set of target genes, for example.
# -B -> This switch enables the output of Ballgown input table files (*.ctab) containing coverage data for the reference transcripts given with the -G option
# -B -> With this option StringTie can be used as a direct replacement of the tablemaker program included with the Ballgown distribution. 
# -p -> a regular expression that selects the sample subdirectories
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S01B01/S01B01_hib_hisat.gff S01B01_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S01B02/S01B02_hib_hisat.gff S01B02_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S01B03/S01B03_hib_hisat.gff S01B03_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S01B04/S01B04_hib_hisat.gff S01B04_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S02B01/S02B01_hib_hisat.gff S02B01_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S02B02/S02B02_hib_hisat.gff S02B02_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S02B03/S02B03_hib_hisat.gff S02B03_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S02B04/S02B04_hib_hisat.gff S02B04_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S03B01/S03B01_hib_hisat.gff S03B01_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S03B02/S03B02_hib_hisat.gff S03B02_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S03B03/S03B03_hib_hisat.gff S03B03_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S03B04/S03B04_hib_hisat.gff S03B04_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S04B01/S04B01_hib_hisat.gff S04B01_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S04B02/S04B02_hib_hisat.gff S04B02_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S04B03/S04B03_hib_hisat.gff S04B03_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S04B04/S04B04_hib_hisat.gff S04B04_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S05B01/S05B01_hib_hisat.gff S05B01_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S05B02/S05B02_hib_hisat.gff S05B02_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S05B03/S05B03_hib_hisat.gff S05B03_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S05B04/S05B04_hib_hisat.gff S05B04_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S06B01/S06B01_hib_hisat.gff S06B01_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S06B02/S06B02_hib_hisat.gff S06B02_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S06B03/S06B03_hib_hisat.gff S06B03_hib_hisat_sorted.bam")
system("time stringtie -e -B -p 8 -G stringtie_merged_Hib.gff -o ballgown/S06B04/S06B04_hib_hisat.gff S06B04_hib_hisat_sorted.bam")

# Read in the raw expression data that were calculated by StringTie - prepDE.py
# The prepDE.py script expects the GTF files produced by StringTie to be located inside each sample sub-directory located in the main output directory (named ballgown in the StringTie protocol paper). 
# one can execute the prepDE.py script in the main working directory (which is the parent of the ./ballgown directory)
# prepDE.py generates two CSV files containing the count matrices for genes and transcripts, using the coverage values found in the output of stringtie -e
# -p -> if a different prefix is used for geneIDs assigned by StringTie [default: MSTRG]
system("time /home/carlos/Downloads/stringtie/prepDE.py --input=/home/carlos/Dropbox/Script/ballgown -g  stringtie_gene_count_table.csv -t stringtie_transcript_count_table.csv -p S0 ")

stringtieCountData = read.csv("C:/Users/3green/Dropbox/Script/stringtie_gene_count_table.csv", header = TRUE, sep = ",", row.names = 1)
stringtieCountData = read.csv("/home/carlos/Dropbox/Dados_Alinhamento/Hisat_Stringtie/stringtie_gene_count_table.csv", header = TRUE, sep = ",", row.names = 1)

#from RefSeq
library('ballgown')
RefSeqgff <- gffRead("/home/carlos/Dropbox/Script/GCF_000210875.1_ASM21087v1_genomic.gff")
RefSeqgff.genes <- RefSeqgff[RefSeqgff[,3]=="gene",]
RefSeqgff.genes$Name <- getAttributeField(RefSeqgff.genes$attributes, "Name", attrsep = "; ")
RefSeqgff.genes$ID <- getAttributeField(RefSeqgff.genes$attributes, "ID", attrsep = "; ")
RefSeqgff.genes$OldLocusTag <- getAttributeField(RefSeqgff.genes$attributes, "old_locus_tag", attrsep = "; ")
colnames(RefSeqgff.genes)

rownames(stringtieCountData)[[which(rownames(stringtieCountData)=="gene2001")]] = RefSeqgff.genes[which(RefSeqgff.genes[,11]=="gene2001"),12]
rownames(stringtieCountData)[[which(rownames(stringtieCountData)=="gene927")]] = RefSeqgff.genes[which(RefSeqgff.genes[,11]=="gene927"),12]
rownames(stringtieCountData)[[which(rownames(stringtieCountData)=="gene809")]] = RefSeqgff.genes[which(RefSeqgff.genes[,11]=="gene809"),12]
rownames(stringtieCountData)[[which(rownames(stringtieCountData)=="gene775")]] = RefSeqgff.genes[which(RefSeqgff.genes[,11]=="gene775"),12]
rownames(stringtieCountData)[[which(rownames(stringtieCountData)=="gene776")]] = RefSeqgff.genes[which(RefSeqgff.genes[,11]=="gene776"),12]
rownames(stringtieCountData)[[which(rownames(stringtieCountData)=="gene777")]] = RefSeqgff.genes[which(RefSeqgff.genes[,11]=="gene777"),12]
rownames(stringtieCountData)[[which(rownames(stringtieCountData)=="gene297")]] = RefSeqgff.genes[which(RefSeqgff.genes[,11]=="gene297"),12]
rownames(stringtieCountData)[[which(rownames(stringtieCountData)=="gene179")]] = RefSeqgff.genes[which(RefSeqgff.genes[,11]=="gene179"),12]


library("stringr")

for (i in 1:nrow(stringtieCountData)){
  if (str_detect(rownames(stringtieCountData)[[i]], "gene")==TRUE){
    rownames(stringtieCountData)[[i]] = RefSeqgff.genes[which(RefSeqgff.genes[,11]==rownames(stringtieCountData)[[i]]),10]
  }
}

stringtieCountData = stringtieCountData[ order(row.names(stringtieCountData)), ]

which(str_detect(rownames(stringtieCountData), "HIB_r")==TRUE)
which(str_detect(rownames(stringtieCountData), "HIB_RS03980")==TRUE)
which(str_detect(rownames(stringtieCountData), "HIB_RS03810")==TRUE)
which(str_detect(rownames(stringtieCountData), "HIB_RS00900")==TRUE)
which(str_detect(rownames(stringtieCountData), "HIB_RS04560")==TRUE)


stringtieCountData = stringtieCountData[-which(str_detect(rownames(stringtieCountData), "HIB_r")==TRUE),]
stringtieCountData = stringtieCountData[-which(str_detect(rownames(stringtieCountData), "HIB_RS03980")==TRUE),]
stringtieCountData = stringtieCountData[-which(str_detect(rownames(stringtieCountData), "HIB_RS03810")==TRUE),]
stringtieCountData = stringtieCountData[-which(str_detect(rownames(stringtieCountData), "HIB_RS00900")==TRUE),]
stringtieCountData = stringtieCountData[-which(str_detect(rownames(stringtieCountData), "HIB_RS04560")==TRUE),]




for (i in 1:nrow(RefSeqgff.genes)){
  if (is.na(RefSeqgff.genes[i,12])=="FALSE"){
    rownames(stringtieCountData)[which(rownames(stringtieCountData)==RefSeqgff.genes[i,10])] = RefSeqgff.genes[i,12]
  }
}

stringtieCountData = stringtieCountData[ order(row.names(stringtieCountData)), ]

Stringtie_Count_Renamed_noRNA_table = stringtieCountData

write.table(Stringtie_Count_Renamed_noRNA_table, "~/Dropbox/Dados_Alinhamento/Hisat_Stringtie/Stringtie_Count_Table_Renamed_without_rRNA.csv", sep = "\t", row.names=TRUE, col.names = TRUE)


Stringtie_Count_Renamed_noRNA_table = read.csv("/home/carlos//Dropbox/Dados_Alinhamento/Hisat_Stringtie/Stringtie_Count_Table_Renamed_without_rRNA.csv", header = TRUE, sep = "\t", row.names = 1)

Stringtie_Count_Renamed_noRNA_table = Stringtie_Count_Renamed_noRNA_table[ order(row.names(Stringtie_Count_Renamed_noRNA_table)), ]

#for (i in 1:nrow(stringtieCountData)){
#  if (is.na(RefSeqgff.genes[i,12])=="FALSE"&&str_detect(RefSeqgff.genes[i,12], "HIB_r12")=="FALSE"&&str_detect(RefSeqgff.genes[i,12], "HIB_r13")=="FALSE"&&str_detect(RefSeqgff.genes[i,12], "HIB_r14")=="FALSE"&&str_detect(RefSeqgff.genes[i,12], "HIB_r15")=="FALSE"&&str_detect(RefSeqgff.genes[i,12], "HIB_r16")=="FALSE"&&str_detect(RefSeqgff.genes[i,12], "HIB_r17")=="FALSE"&&str_detect(RefSeqgff.genes[i,12], "HIB_r18")=="FALSE"&&str_detect(RefSeqgff.genes[i,12], "HIB_r19")==FALSE){
#    rownames(stringtieCountData)[[i]] = RefSeqgff.genes[i,12]
#  }
#}

#Hib_Stringtie_Final_Matrix = stringtieCountData[-which(str_detect(rownames(stringtieCountData), "HIB_r")==TRUE),]

#write.table(Hib_Stringtie_Renamed_Matrix, "Count_Matrix_Final_Hib_stringtie.csv", sep = "\t", row.names=TRUE, col.names = TRUE)

# proximo: Hib_Trinity.R 

# file Hib_Trinity_hisat.fasta

### Blast2go

# file blastn_Hib_Trinity_hisat_stringtie_blast2go.fasta

#Anotação funcioanl com Blast2GO - FASTA handling

setwd("/home/carlos/Dropbox/Dados_Alinhamento")

library("Biostrings")
library("stringr")
fastaFile = readDNAStringSet("blastn_Hib_Trinity_hisat_stringtie_blast2go.fasta")
seq_name = names(fastaFile)
sequence = paste(fastaFile)
df <- data.frame(seq_name, sequence)
df[,1] = sub(" \\[locus_tag","| \\[locus_tag",df[,1])
df[,1] = sub(" NC_","| NC_",df[,1])
df[,1] = sub(" NZ_","| NZ_",df[,1])
df[,1] = sub(" \\[gene","| \\[gene",df[,1])

library("seqRFLP")
df.fasta = dataframe2fas(df, file="blastn_Hib_Trinity_hisat_stringtie_blast2go.fasta")


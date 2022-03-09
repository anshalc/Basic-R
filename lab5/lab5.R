library(tidyverse)
#1
vcf <-read_tsv("MLLT3_small.vcf", comment  = "##", na = "NA" )
head(vcf)
spec(vcf)
#2
vcf <-read_tsv("MLLT3_small.vcf", comment  = "##", na ="NA",
               col_types=cols(
                 REF=col_factor(),
                 ALT=col_factor()
  
                     ))
#3
spec(vcf)

mm<-read_tsv("MLLT3_small.vcf", comment  = "##", na = "NA" )
mm <- rename(mm, `#CHROM` = CHROM)
mm

             
### Create ID lists of various pop in 1000g for pruning based on pop-specific LD ref
### 07/09/2020

data_dir <- "~/brc_scratch/data/get_1000g/"

library(openxlsx)

#https://www.internationalgenome.org/data/

sample_info <- read.xlsx(paste0(data_dir,"20130606_sample_info.xlsx"))

GBR <- sample_info[sample_info$Population=="GBR",]
dim(GBR)

CEU <- sample_info[sample_info$Population=="CEU",]
dim(CEU)

#remove parent/child or half sins or full sibs

`%!in%` = Negate(`%in%`)

CEU <- CEU[CEU$Sample %!in% CEU$`Unexpected.Parent/Child`,]
CEU <- CEU[CEU$Sample %!in% CEU$Siblings,]
CEU <- CEU[CEU$Sample %!in% CEU$Half.Siblings,]

dim(CEU)

GBR <- GBR[GBR$Sample %!in% GBR$`Unexpected.Parent/Child`,]
GBR <- GBR[GBR$Sample %!in% GBR$Siblings,]
GBR <- GBR[GBR$Sample %!in% GBR$Half.Siblings,]

dim(GBR)

#create FID column with zeros

GBR$SampleFID <- 0
CEU$SampleFID <- 0

#write.ids to file

write.table(CEU[c("SampleFID", "Sample")], paste0(data_dir,"CEU_ids_norels_plink_format.txt"), sep="\t",col.names = F, quote=F, row.names=F)
write.table(GBR[c("SampleFID", "Sample")], paste0(data_dir,"GBR_ids_norels_plink_format.txt"), sep="\t",col.names=F, quote=F, row.names=F)


#

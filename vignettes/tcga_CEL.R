library(dplyr)
library(tibble)
library(GenomicDataCommons)

#

q_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-GBM' & data_category == 'Transcriptome Profiling' & data_format == 'CEL') |> manifest()
#OR use filter fn
q_3 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-GBM' & data_category == 'Transcriptome Profiling' & data_format == 'CEL') |> GenomicDataCommons::filter(access=='OPEN') |> manifest()

for(i in seq(10,12))
{
uid<-0;
uid<-as.character(q_3[i,1])
gdcdata(uid)
}


#
n<-which(q_2["access"] == 'open')
for(j in seq(2,3))
{
Id<-0
Id<-as.character(q_3[n[j],1])
gdcdata(Id)
}



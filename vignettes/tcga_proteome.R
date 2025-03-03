library(dplyr)
library(tibble)
library(GenomicDataCommons)

p_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-THCA' & data_type == 'Protein Expression Quantification' & data_format == 'tsv') |> manifest()
#locate open data
open_access<-which(p_2$access=="open")
#381 files
#download select files 
#for(i in length(open_access))
#for(i in seq(3,5))
#for(i in seq(20,24))

for(i in seq(200,202))
{
uid<-0;uid<-as.character(p_2[open_access[i],1])
gdcdata(uid)
}

#sanity check , use the filter function 


p_3 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-THCA' & data_type == 'Protein Expression Quantification' & data_format == 'tsv') |> filter(access == 'open') |> manifest()

for(i in seq(20,24))
{
uid<-0;uid<-as.character(p_3[i,1])
gdcdata(uid)
}

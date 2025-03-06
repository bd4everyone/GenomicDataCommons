library(dplyr)
library(tibble)
library(GenomicDataCommons)

#get files for project TCGA-THCA
#build a manifest file 
#use col names  with function calls
p_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-THCA' & data_category == 'Clinical' & data_type == 'Clinical Supplement' & data_format == 'BCR XML')  |> filter(access == "open") |> manifest()
#get select data
for(i in seq(20,24))
{
uid<-0;uid<-as.character(p_2[i,1])
gdcdata(uid)
}

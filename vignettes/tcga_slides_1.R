library(dplyr)
library(tibble)
library(GenomicDataCommons)

q_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-COAD' & data_type == 'Slide Image' & data_format == 'svs') |> manifest()
#locate open data
open_access<-which(q_2$access=="open")

#for(i in length(open_access))
#for(i in seq(3,5))
#for(i in seq(20,24))
for(i in seq(200,202))
{
uid<-0;uid<-as.character(q_2[open_access[i],1])
gdcdata(uid)
}


#or sanity check

q_3 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-COAD' & data_type == 'Slide Image' & data_format == 'svs') |> filter(access == 'open') |> manifest()

for(i in seq(2,4))
{
uid<-0;uid<-as.character(q_3[i,1])
gdcdata(uid)
}

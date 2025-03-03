library(dplyr)
library(tibble)
library(GenomicDataCommons)

#specify project name
#q_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-KIRC' & data_type == 'Slide Image' & data_format == 'svs') |> manifest()
q_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-BRCA' & data_type == 'Slide Image' & data_format == 'svs') |> manifest()
#locate open data
open_access<-which(q_2$access=="open")

#select files
#for(i in length(open_access))
#for(i in seq(3,5))
#for(i in seq(20,24))
for(i in seq(200,202))
{
uid<-0;uid<-as.character(q_2[open_access[i],1])
gdcdata(uid)
}


######alternatively, use filter 
#both approaches should list same files
q_3 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-BRCA' & data_type == 'Slide Image' & data_format == 'svs') |> filter(access == 'open') |>  manifest()


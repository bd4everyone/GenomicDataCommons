library(GenomicDataCommons)
library(dplyr)
library(tibble)
#Clear Cell Sarcoma of the Kidney. Disease Type. Complex Mixed and Stromal Neoplasms. Primary Site. Kidney. Program. TARGET


cn_manifest_CCSK <- files() |> GenomicDataCommons::filter( cases.project.project_id == 'TARGET-CCSK') |>  GenomicDataCommons::filter( analysis.workflow_type == 'ASCAT2')  |> manifest()
n<-which(cn_manifest_CCSK$access=='open')

#save dat to file
write.csv(cn_manifest_CCSK[n,],file='out.txt',quote=FALSE,row.names=FALSE)
##########----------#######################
#select files
for( i in seq(1,length(n)))
{
#
id<-0;
        id<-as.character(cn_manifest_CCSK[n[i],1])
###### 
gdcdata(id)
}

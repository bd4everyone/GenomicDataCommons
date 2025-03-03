library(GenomicDataCommons)
library(dplyr)
library(tibble)
#Clear Cell Sarcoma of the Kidney. Disease Type. Complex Mixed and Stromal Neoplasms. Primary Site. Kidney. Program. TARGET

#get familiar with aggregations
q_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TARGET-CCSK') |> facet(c("data_type","data_format","analysis.workflow_type","file_id","file_name")) |> aggregations()



q_1 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TARGET-CCSK') |> facet(c("data_type","data_format","analysis.workflow_type")) |> aggregations()

idat_manifest_CCSK <- files() |> GenomicDataCommons::filter( cases.project.project_id == 'TARGET-CCSK') |> GenomicDataCommons::filter( data_type == 'Methylation Beta Value' ) |> GenomicDataCommons::filter( analysis.workflow_type == 'SeSAMe Methylation Beta Estimation')  |> manifest()
n<-which(idat_manifest_CCSK$access=='open')

#save data to file
write.csv(idat_manifest_CCSK[n,],file='manifest.txt',quote=FALSE,row.names=FALSE)


###### test  single file 
gdcdata(idat_manifest_CCSK[n[1],1]))

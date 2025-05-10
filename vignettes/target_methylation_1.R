library(GenomicDataCommons)
library(dplyr)
library(tibble)


idat_manifest_CCSK <- files() |> GenomicDataCommons::filter( cases.project.project_id == 'TARGET-CCSK') |> GenomicDataCommons::filter( data_type == 'Methylation Beta Value' ) |> GenomicDataCommons::filter( analysis.workflow_type == 'SeSAMe Methylation Beta Estimation')  |> manifest()
n<-which(idat_manifest_CCSK$access=='open')

##########----------#######################
for( i in seq(1,length(n)))
{
#use cast
id<-0;
	id<-as.character(idat_manifest_CCSK[n[i],1])
######only test with single file 
gdcdata(id)
}

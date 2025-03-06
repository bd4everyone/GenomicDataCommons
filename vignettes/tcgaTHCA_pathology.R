library(dplyr)
library(tibble)
library(GenomicDataCommons)


# get pathology reports
q_2 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-THCA' & data_category == 'Clinical' & data_type == 'Pathology Report') |> manifest()

for(i in seq(20,24))
{
uid<-0;uid<-as.character(q_2[i,1])
gdcdata(uid)
}

#use updated datetime to filter data
q_3 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-THCA' & data_category == 'Clinical' & data_type == 'Pathology Report' &  (updated_datetime ==  "2022-12-06T15:32:24.960627-06:00")) |> manifest()

#or 

q_4 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-THCA' & data_category == 'Clinical' & data_type == 'Pathology Report' &  (updated_datetime > "2022-12-06T15:32:24.960627-06:00")) |> manifest()

for(i in seq(20,24))
{
uid<-0;uid<-as.character(q_4[i,1])
gdcdata(uid)
}

#use file size to filter and updated datetime
#single hit
q_5 = files() |> GenomicDataCommons::filter(cases.project.project_id == 'TCGA-THCA' & data_category == 'Clinical' & data_type == 'Pathology Report' &  (updated_datetime == "2022-12-06T15:32:24.960627-06:00") & file_size < 2350000) |> manifest()
#get one file that fits above criteria
gdcdata(q_5[1,"id"])


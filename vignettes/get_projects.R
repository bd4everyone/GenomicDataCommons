library(GenomicDataCommons)


#more than one possibility to get availble projects on the gdc portal
#perhaps useful for anyone searching for gdc data to combine with existing laboratory samples
gdc_proj<-projects()

#get available keys to build queries
#available_fields(gdc_proj)
#facet(gdc_proj)

####get available gdc projects
res_1<-(gdc_proj |> facet('project_id') |> aggregations() )
#save to file
write.csv(res$project_id$key,file="project_id.txt",quote=FALSE,row.names=FALSE)

#get gdc project names
res_2<-(gdc_proj |> facet('program.name') |> aggregations() )
#Save to file
write.csv(res$program.name$key,file=='program.name.txt',quote=FALSE,row.names=FALSE)

#addtional exp details
res_3<-(gdc_proj |> facet('name') |> aggregations() )
#get list components
#names(res)
write.csv(res$name["key"],file=='project_name.txt',quote=FALSE,row.names=FALSE)

#get biospecimen, tissue site 
res_4<-(gdc_proj |> facet('primary_site') |> aggregations() )

write.csv(res$primary_site['key'],file=='primary_site.txt',quote=FALSE,row.names=FALSE)

####use multiple fields
res_5<-(gdc_proj |> facet(gdc_proj$fields[c(4:5,7)]) |> aggregations() )

x<-list(N=res$name["key"],P=res$project_id["key"],T=res$primary_site["key"])

#save to file , not a 1-1 map
#cat(capture.output(print(x), file="test.txt"))

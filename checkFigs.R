##File name: checkFigs.R
##Creation date: Jun 26, 2015
##Last modified: Wed Jul 22, 2015  11:00PM
##Created by: scott
##Summary: List out figures to check all subfigures refd

#texFiles<-sapply(chaps,list.files,'*.tex',full.names=TRUE)
texFiles<-list.files('.','*.tex$',recursive=TRUE,full.names=TRUE)
tex<-lapply(texFiles,readLines)
if(any(grep('Figure [0-9]',unlist(tex))))stop(simpleError('Directly numbered figure found'))
if(any(grep('Table [0-9]',unlist(tex))))stop(simpleError('Directly numbered table found'))
texWords<-lapply(tex,function(x)unlist(strsplit(x,'[() .,\t]')))
refWords<-lapply(texWords,function(x)unique(x[grep('\\\\ref',x)]))
labelWords<-lapply(texWords,function(x)x[grep('\\\\label',x)])
if(any(duplicated(unlist(labelWords))))stop(simpleError('Duplicate label'))
labels<-sub('\\\\label\\{([^}]+)\\}','\\1',unlist(labelWords))
refs<-sub('\\\\ref\\{([^}]+)\\}([a-zA-Z-]*)','\\1',unlist(refWords))
subrefs<-sub('\\\\ref\\{([^}]+)\\}([a-zA-Z-]*)','\\2',unlist(refWords))
undefinedRefs<-!refs %in% labels
if(any(undefinedRefs))stop(simpleError(sprintf('Undefined references: %s',paste(refs[undefinedRefs],collapse=','))))
unreferencedLabels<-!labels %in% refs
if(any(unreferencedLabels))stop(simpleError(sprintf('Unreferenced label: %s',paste(labels[unreferencedLabels],collapse=','))))
sublabeledRefs<-refs %in% unique(refs[subrefs!=''])
print(table(refs[sublabeledRefs],subrefs[sublabeledRefs]))



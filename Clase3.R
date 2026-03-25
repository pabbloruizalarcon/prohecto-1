expressionValues <- matrix (rnorm (300), nrow=30)
colnames(expressionValues) <- paste0("sample",1:10)
head(expressionValues)

targets <- data.frame(sampleNames = paste0("sample",1:10),
                      group=c(paste0("CTL",1:5),paste0("TR",1:5)),
                      age = rpois(10, 30),
                      sex=as.factor(sample(c("Male", "Female"),10,replace=TRUE)),
                      row.names=1)
head(targets, n=10)

myGenes <- paste0("gene",1:30)

myInfo=list(myName="Pablo Ruiz",
            myLab="Bioinformatics Lab",
            myContact="pabbloruizalarcon@gmail.com",
            myTitle="Practical Exercise on ExpressionSets")
show(myInfo)

myEset <- ExpressionSet(expressionValues)
class(myEset)
myEset <- ExpressionSet(expressionValues)
class(myEset)

columnDesc <-  data.frame(labelDescription= c("Treatment/Control", 
                                              "Age at disease onset", 
                                              "Sex of patient (Male/Female"))
myAnnotDF <- new("AnnotatedDataFrame", data=targets, varMetadata= columnDesc)
show(myAnnotDF)
phenoData(myEset) <- myAnnotDF
myEset <- ExpressionSet(assayData=expressionValues, phenoData=myAnnotDF)
show(myEset)
myEset <- ExpressionSet(assayData=expressionValues,
                        phenoData=myAnnotDF,
                        featureNames =myGenes)
# show(myEset)
myDesc <- new("MIAME", name= myInfo[["myName"]],
              lab= myInfo[["myLab"]],
              contact= myInfo[["myContact"]] ,
              title=myInfo[["myTitle"]])
myEset <- ExpressionSet(assayData=expressionValues,
                        phenoData=myAnnotDF,
                        fetureNames =myGenes,
                        experimentData = myDesc)
show(myEset)

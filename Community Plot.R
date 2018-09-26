#---- C1 ----
library("ggplot2")
library("GGally")
library("sand")
library("mcclust")
library("gridExtra")

path <- "/Users/marvin/Desktop/CSC 495"
setwd(path)
project <- read.graph("dir_total_transfer_aggr_etype.graphml", format="graphml")
summary(project)

set.seed(19940708)
pro.wt.10 <- cluster_walktrap(project,steps = 10)

modularity(pro.wt.10)
length(pro.wt.10)

#---- C2 ----
SE <- read.graph("SE.graphml", format="graphml")
summary(SE)
SP <- read.graph("SP.graphml", format="graphml")
summary(SP)
hist(E(SE)$type)
hist(E(SP)$type)

#---- C3 ----
League <- V(SE)$League
outdegree.1 <- degree(SE, v = V(SE), mode = c("out"))
g1 <- ggplot(data.frame(OutDegree=outdegree.1), aes(x=OutDegree,fill=League))
g1 <- g1 + geom_histogram(position = "dodge",binwidth = 3)         
print(g1+ggtitle("Out-Degree Histogram for SE"))

League <- V(SP)$League
outdegree.2 <- degree(SP, v = V(SP), mode = c("out"))
g2 <- ggplot(data.frame(OutDegree=outdegree.2), aes(x=OutDegree,fill=League))
g2 <- g2 + geom_histogram(position = "dodge", binwidth = 3)    
print(g2+ggtitle("Out-Degree Histogram for SP"))

League <- V(SE)$League
indegree.1 <- degree(SE, v = V(SE), mode = c("in"))
g1 <- ggplot(data.frame(InDegree=indegree.1), aes(x=InDegree,fill=League))
g1 <- g1 + geom_histogram(position = "dodge", binwidth = 3)    
print(g1+ggtitle("In-Degree Histogram for SE"))

League <- V(SP)$League
indegree.2 <- degree(SP, v = V(SP), mode = c("in"))
g2 <- ggplot(data.frame(InDegree=indegree.2), aes(x=InDegree,fill=League))
g2 <- g2 + geom_histogram(position = "dodge", binwidth = 3)
print(g2+ggtitle("In-Degree Histogram for SP"))

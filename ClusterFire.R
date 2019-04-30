#Clustering
#K-means

ab = read.csv("forestfires.csv")
a = ab[,c(3:8)]

str(a)
rownames(a)

complete.cases(a)
all(complete.cases(a))

# 2 standardize your data
Xs = scale(a)
Xs

# 3 Compute the "distance" between observation
dd = dist(Xs)
dd

# 4 K-means pick k
km=kmeans(dd,3) # 3 clusters (just for example)
km
km$cluster

#How many clusters should we use? 
#Use the following algorithm

ws = 0
for (i in 1:15) ws[i]=kmeans(dd,i,nstart = 50)$tot.withinss
plot(1:15,ws,type="b",xlab="Number of clusters",ylab="within groups variable")
#I see an elbow at 4!

km=kmeans(dd,4,nstart = 50)

library(cluster)
clusplot(Xs,km$cluster,color=T,shade=T,groups=ab$month)

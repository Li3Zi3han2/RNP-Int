load("C:\\Users\\Li Zihan\\Desktop\\课题最终版\\TCGA\\GBM\\origin.RData")
name <- names(data)
for(i in 1:length(data))
{
  write.csv(as.data.frame(data[[i]]), paste("C:\\Users\\Li Zihan\\Desktop\\课题最终版\\TCGA\\GBM\\", name[i], ".csv", sep = ""))
}

load("C:\\Users\\Li Zihan\\Desktop\\课题最终版\\TCGA\\LUAD\\origin.RData")
name <- names(data)
for(i in 1:length(data))
{
  write.csv(as.data.frame(data[[i]]), paste("C:\\Users\\Li Zihan\\Desktop\\课题最终版\\TCGA\\LUAD\\", name[i], ".csv", sep = ""))
}

load("C:\\Users\\Li Zihan\\Desktop\\课题最终版\\TCGA\\LUSC\\origin.RData")
name <- names(data)
for(i in 1:length(data))
{
  write.csv(as.data.frame(data[[i]]), paste("C:\\Users\\Li Zihan\\Desktop\\课题最终版\\TCGA\\LUSC\\", name[i], ".csv", sep = ""))
}

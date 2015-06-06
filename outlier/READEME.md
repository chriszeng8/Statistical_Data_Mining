##Outlier

In statistics, an outlier is an observation point that is distant from other observations.[1] An outlier may be due to variability in the measurement or it may indicate experimental error; the latter are sometimes excluded from the data set.[2]
####Inter-quartile Range (IQR)
The difference between the upper and lower: Q3-Q1

####Definition
The outliers in a boxplot are computed as any points greater than the third quartile plus the inter-quartile range (IQR), or any points less than the first quartile minus the inter-quartile range (IQR). They are actually computed as any points greater than the third quartile plus 1.5xIQR, or less than the first quartile minus 1.5xIQR. In other words, the outliers are the points outside the range of [Q1 - k (Q3 - Q1) , Q3 + k (Q3 - Q1)], where k=1.5


####Views on outliers
People seem to have different views on how to deal with [outliers](http://www.theanalysisfactor.com/outliers-to-drop-or-not-to-drop/)
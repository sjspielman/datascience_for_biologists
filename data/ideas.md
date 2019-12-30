## Datasets for class


+ Known datasets already:
	+ crabs
	+ biopsy
	+ olive
	+ wine

+ `portal_data_joined.csv` is an ecological dataset from [Data Carpentry](https://datacarpentry.org/R-ecology-lesson/) (contains useful exercises as well)
	+ [Figshare link](https://ndownloader.figshare.com/files/2292169)
	+ "We are studying the species repartition and weight of animals caught in plots in our study area"

+ `dslabs::us_contagious_diseases` for fuck you antivaxxers

```
> head(dslabs::us_contagious_diseases)      disease   state year weeks_reporting count population1 Hepatitis A Alabama 1966              50   321    33457872 Hepatitis A Alabama 1967              49   291    33641303 Hepatitis A Alabama 1968              52   314    33860684 Hepatitis A Alabama 1969              49   380    34124505 Hepatitis A Alabama 1970              51   413    34441656 Hepatitis A Alabama 1971              51   378    3481798
```

+ `dslabs::brca` (from UCI ML Repo)
	+ A list of two matrices describing breast cancer samples where matrix named `x` gives features and `y` tells if benign or malignant. 
	+ Can be used for data wrangling (creating a tibble), binary classification
+ `gapminder`

```
> head(gapminder)
              country year infant_mortality life_expectancy fertility population          gdp continent1             Albania 1960           115.40           62.87      6.19    1636054           NA    Europe2             Algeria 1960           148.20           47.50      7.65   11124892  13828152297    Africa3              Angola 1960           208.00           35.98      7.32    5270844           NA    Africa4 Antigua and Barbuda 1960               NA           62.97      4.43      54681           NA  Americas5           Argentina 1960            59.87           65.39      3.11   20619075 108322326649  Americas6             Armenia 1960               NA           66.86      4.55    1867396           NA      Asia           region1 Southern Europe2 Northern Africa3   Middle Africa4       Caribbean5   South America6    Western Asia```


+ Two climate datasets: `greenhouse_gases` has levels over time for CO2, CH4, NO2 (yes over 2000 years), and `historic_co2` contain ice core and mauna loa co2 levels

```
> head(dslabs::greenhouse_gases)  year gas concentration1   20 CO2         277.72   40 CO2         277.83   60 CO2         277.34   80 CO2         277.35  100 CO2         277.56  120 CO2         277.6

> head(historic_co2)  year    co2    source1 1959 315.97 Mauna Loa2 1960 316.91 Mauna Loa3 1961 317.64 Mauna Loa4 1962 318.45 Mauna Loa5 1963 318.99 Mauna Loa6 1964 319.62 Mauna Loa
```

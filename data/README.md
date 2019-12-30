## Repos w/ data for biostatistics

+ Phage attenuation [https://github.com/benjaminjack/phage_attenuation](https://github.com/benjaminjack/phage_attenuation)
+ AG3C [https://github.com/marcottelab/AG3C_starvation_tc/tree/master/data_processing](https://github.com/marcottelab/AG3C_starvation_tc/tree/master/data_processing)
+ Data galore [https://github.com/caesar0301/awesome-public-datasets](https://github.com/caesar0301/awesome-public-datasets)
	+ [GO annotations](http://geneontology.org/page/download-annotations)
	+ [American Gut](https://github.com/biocore/American-Gut)
	+ [Broad cancer](http://portals.broadinstitute.org/cgi-bin/cancer/datasets.cgi)
	
## Datasets for biostatistics

### For teaching and exercises


+ `gapminder` [https://github.com/jennybc/gapminder](https://github.com/jennybc/gapminder)
	+ in unfiltered, tabulate n entries per country? per region?
 
+ **untidy data:** `hiv_prevalence.csv` is from [gapminder.org](gapminder.org)
 	+ The data from 1990 onwards you see in this graph is from UNAIDS, but Gapminder has provided extra estimates for some countries before 1990, and the compilation was documented and could be accessed from the link below.Due to visualization limits, we only display the countries with the 1st available estimate before 1988, and for countries that have no data or estimate available until 1988, we display it from 1990 onwards using the data from UNAIDS. Data for Brazil was the average of the high and low estimate from UNAIDS from 1990 onwards, and 1979 was the estimate from Gapminder Foundation.
 		+ Column 1 `Estimated HIV Prevalence% - (Ages 15-49)`	
 
+ `MOMv3.3.txt`

	+ Metadata
		+ `Felisa A. Smith, S. Kathleen Lyons, S. K. Morgan Ernest, Kate E. Jones, Dawn M. Kauffman, Tmar Dayan, Pablo A. Marquet, James H. Brown, and John P. Haskell. 2003. Body mass of late Quaternary mammals. Ecology 84:3403.`
		+ [http://www.esapubs.org/archive/ecol/E084/094/metadata.htm](http://www.esapubs.org/archive/ecol/E084/094/metadata.htm)
		+ Mammals occurring on more than one continent have multiple records; continent-specific masses were used when available. Moreover, for four of the continents (Africa, North and South America and Australia), we included the mammalian species that went extinct at the late Pleistocene (an additional 230 species).  Overall, we have 5731 rows of data.  We defined “late Pleistocene” as approximately 11 ka for Africa, North and South America, and as 50 ka for Australia, because these times predate anthropogenic impacts on mammalian fauna (e.g., Klein 1984; Martin 1984; Kurten 1988; Lessa and Farina 1996; Flannery and Roberts 1999; Martin and Steadman 1999 and Stuart 1999). About half the records in our data set are derived from previous compilations (Silva and Downing 1995; Marquet and Cofre 1999; Jones et al. 2003); the remainder are largely drawn directly from the primary literature.
		+ We have body masses for the following:  Artiodactyla (280 records), Bibymalagasia (2 records), Carnivora (393 records), Cetacea (75 records), Chiroptera (1071 records), Dasyuromorphia (67 records), Dermoptera (3 records), Didelphimorphia (68 records), Diprotodontia (127 records), Hydracoidea (5 records), Insectivora (234 records), Lagomorpha (53 records), Litopterna (2 records), Macroscelidea (14 records), Microbiotheria (1 record), Monotremata (7 records), Notoryctemorphia (1 record), Notoungulata (5 records), Paucituberculata (5 records), Peramelemorphia (24 records), Perissodactyla (47 records), Pholidota (8 records), Primates (276 records), Proboscidea (14 records), Rodentia (1425 records), Scandentia (15 records), Sirenia (6 records), Tubulidentata (1 record), and Xenarthra (75 records). 
 
+ `avian_ssd_jan07.tsv` [https://doi.org/10.1890/06-2054](https://doi.org/10.1890/06-2054)
	+ **abstract:** Body size is an important characteristic of animals, influencing physiology, life histories, and general ecology. Hence, it often needs to be taken into account even if the aim is to test for relationships among other traits. We provide a comprehensive data set on avian body sizes that would be useful for future comparative studies of avian biology. We extracted species-specific measurements on male and female body mass, wing length, tarsus length, bill length, and tail length from major ornithological text books and some other sources covering bird species of Africa, Australia, New Zealand, Antarctica, North America, and the western Palearctic. These measurements were matched with measures of egg and clutch sizes, and scores of mating system, sexual display agility, and the degree of intersexual resource division. We present morphometric data ranging from 2350 species (minimum, tail length) to 2979 species (maximum, wing length) where measurements for both sexes are known, some additional data where only one sex or unsexed birds have been measured, and explanatory data ranging from 1218 species (minimum, display agility) to 2603 species (maximum, egg mass). In total, 3769 species from 125 of 146 different bird families are included. We have used the data in comparative studies of avian sexual size dimorphism, where we test adaptive hypotheses concerning the influence of sexual selection, fecundity, and the degree of within-pair resource sharing. By publishing the data we intend to give easy access to a large data set containing variables relevant for a wide range of comparative studies on birds, thus saving researchers from the time- and resource-consuming data gathering process. In addition, the data set will function to point out species where baseline data on body size and relevant information on reproduction and behavior are currently lacking or of poor quality, thus stimulating the publication of such data.

+ `shrubs`, for practice tidying, joining

+ `mammalian_life_history.tsv` [http://esapubs.org/archive/ecol/E084/093/](http://esapubs.org/archive/ecol/E084/093/)

	+ Maximum life span: Maximum life span (months) is the oldest age recorded for a member (male or female) of that species. Maximum life span, unlike the other variables, represents a single datapoint not an average. If a longer maximum life span is found than the number currently in the database, then the previous datapoint is replaced with the new value.

	+ Age of First Reproduction (AFR): AFR is the age (months) at which a female individual of the species first breeds and could potentially conceive. By definition, this is only recorded for females. This variable does not include gestation. If the age of first birth is given by a data source then gestation length was subtracted from the value to yield an estimate of first breeding.

	+ Gestation length: Gestation (months) is the length of active gestating of a fetus. Gestation length does not include the period of delayed implantation.

	+ Weaning length: Weaning length (months) is the time from the birth of an offspring to the independence of that offspring from milk.

	+ Weaning mass: Weaning mass (grams) is the weight of a single offspring at the time of independence from milk.

	+ Litter size: The number of offspring birthed in a single litter. If a data source indicated that its litter size estimate was based on embryo counts or reproductive scars, it was excluded since it is relatively common for a subset of embryos in a litter to be resorbed.

	+ Litter frequency: The number of litters birthed by a female in a 12-month period. Captive studies attempting to maximize litter production were excluded as possible.

	+ Neonate mass: The weight (grams) of a single newborn offspring. If a data source indicated that the mass of the newborn was taken > 12 hours after birth it was excluded.

	+ Adult mass: The weight (grams) of a reproductive adult. If strong sexual dimorphism exists in a species, then only data sources specifying female weight were included. References 16 and 18 were only used for body masses. Furthermore, these references were only used if other body mass estimates were not available from the sources which supplied life history data.



+ `2014 global nutrition report` [https://datahub.io/dataset/2014-global-nutrition-report-dataset](https://datahub.io/dataset/2014-global-nutrition-report-dataset)

+ `Portal project database` [https://github.com/weecology/portal-teachingdb](https://github.com/weecology/portal-teachingdb)
	+ Unprocessed version: [http://esapubs.org/archive/ecol/E090/118/#data](http://esapubs.org/archive/ecol/E090/118/#data)
	+ MS in `Ernest_et_al-2016-Ecology.pdf`

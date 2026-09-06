* Encoding: UTF-8.

************************************************************************************OPEN DATA***************************************************************************************************************
***Open Add Health Wave 1 processed data (parent + in-home merged).
get file ="C:\Users\rcm5550\OneDrive - The Pennsylvania State University\SPR Cup 2026\AddHealth_AllData.sav".
********************************************************************************************************************************************************************************************************************


*****************************CHILD SEX.
*Q: What is your biological sex?
***check frequencies for zeros.
frequencies variables = bio_sex /statistics = all.
*male = 1, female = 2.

*create dummy code for child biological sex (female = 1).
if(bio_sex eq 1) bio_sexD = 0.
if(bio_sex eq 2) bio_sexD = 1.
variable labels bio_sexD
    "child biological sex".
value labels bio_sexD
    0 "male"
    1 "female".
execute.

*check frequencies of new variable.
frequencies variables = bio_sexD /statistics = all.
******************************************************************************

*****************************CHILD AGE WAVE 1.
*Q: What is your birth month and year?
***check frequencies for zeros.
frequencies variables = H1GI1M h1gi1y /statistics = all.
*no answer = 96.

*set missing values for birth date components.
compute birthday = 15.
execute.
if(H1GI1M eq 96 or h1gi1y eq 96) birthday = 96.
missing values birthday (96).
missing values H1GI1M (96).
missing values h1gi1y (96).
execute.

*create date variable for interview date.
COMPUTE idate = DATE.MDY(imonth, iday, iyear).
FORMATS idate (ADATE10).
EXECUTE.

*create date variable for birth date (using 15th as birthday).
COMPUTE bdate = DATE.MDY(h1gi1m, birthday, h1gi1y).
FORMATS bdate (ADATE10).
EXECUTE.

*create age variable for wave 1 (in years).
compute wave1age = datediff(idate, bdate, "years").
execute.

*check frequencies of new variable.
frequencies variables = wave1age  /statistics = all.

*create mean-centered age.
compute wave1ageC = wave1age - 15.5114.
variable labels wave1ageC
    "wave 1 age mean centered".
execute.

descriptives variables = wave1age /save.

*check frequencies of new variable.
frequencies variables = wave1ageC  wave1age Zwave1age /statistics = all.

*****************************CHILD AGE WAVE 3.
*Q: What is your birth month and year?
***check frequencies for zeros.
frequencies variables = H1GI1M H1GI1Y /statistics = all.
*no answer = 96.

*set missing values for birth date components.
compute birthday3 = 15.
execute.
if (H1GI1M eq 96 or H1GI1Y eq 96) birthday3 = 96.
missing values birthday3 (96).
missing values H1GI1M (96).
missing values H1GI1Y (96).
execute.

*check frequencies for wave 3 interview date variables.
frequencies variables = imonth3 iday3 iyear3 /statistics = all.

*create date variable for wave 3 interview date.
compute idate3 = DATE.MDY(imonth3, iday3, iyear3).
formats idate3 (ADATE10).
execute.

*create date variable for birth date (using 15th as birthday).
compute bdate3 = DATE.MDY(H1GI1M, birthday3, H1GI1Y).
formats bdate3 (ADATE10).
execute.

*create age variable for wave 3 (in years).
compute wave3age = datediff(idate3, bdate3, "years").
execute.

*check frequencies of new variable.
frequencies variables = wave3age /statistics = all.

*create mean-centered age.
*Note: replace mean value below with actual wave 3 mean age from frequencies output above.
compute wave3ageC = wave3age - 21.8179.
variable labels wave3ageC "Wave 3 age mean centered".
execute.

descriptives variables = wave3age /save.

*check frequencies of new variable.
frequencies variables = wave3ageC wave3age Zwave3age /statistics = all.
*******************************************************************************

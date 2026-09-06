* Encoding: UTF-8.

************************************************************************************OPEN DATA***************************************************************************************************************
***Open Add Health Wave 1 processed data (parent + in-home merged).
get file ="C:\Users\rcm5550\OneDrive - The Pennsylvania State University\SPR Cup 2026\Analysis\AddHealth_AllData.sav".
********************************************************************************************************************************************************************************************************************



******************************************************************************COMMUNITY RESOURCES - CONNECTEDNESS (ADOLESCENT REPORT)**********************************************************************************

*Note: Items reverse-scored here so higher = LOWER community resources (disadvantage direction),
*consistent with the structural disadvantage framing of this composite.
*Community Connectedness (Wickrama & Bryant 2003): 4 items, yes/no (0/1), summed 0-4.
*Reverse scoring: recode 1->0 and 0->1 so high score = LOW connectedness = more disadvantage.

*****************************KNOW MOST NEIGHBORS.
*Q: You know most of the people in your neighborhood. (H1NB1, true=1, false=2).
***check frequencies for zeros.
frequencies variables = H1NB1 /statistics = all.
*answer codes: 1=true, 2=false, 6=refused, 8=don't know, 9=not applicable.

if (H1NB1 eq 1) knowneighbR = 0.   
    *knows neighbors = connected (reverse to 0=low disadvantage).
if (H1NB1 eq 2) knowneighbR = 1.   
    *doesn't know = disconnected = higher disadvantage.
if (H1NB1 eq 6 or H1NB1 eq 8 or H1NB1 eq 9) knowneighbR = -99.
recode knowneighbR (-99 = sysmis).
variable labels knowneighbR
    "Does NOT know most neighbors (H1NB1 reversed, 1=low connectedness/more disadvantage)".
value labels knowneighbR 0 "knows most neighbors" 1 "does not know most neighbors".
execute.

frequencies variables = knowneighbR /statistics = all.
*******************************************************************************

*****************************TALKED WITH NEIGHBOR.
*Q: In the past month, you have stopped to talk with someone in your neighborhood. (H1NB2).
***check frequencies for zeros.
frequencies variables = H1NB2 /statistics = all.
*answer codes: 1=true, 2=false, 6=refused, 8=don't know, 9=not applicable.

if (H1NB2 eq 1) talkneighbR = 0.
if (H1NB2 eq 2) talkneighbR = 1.
if (H1NB2 eq 6 or H1NB2 eq 8 or H1NB2 eq 9) talkneighbR = -99.
recode talkneighbR (-99 = sysmis).
variable labels talkneighbR
    "Has NOT talked with neighbor (H1NB2 reversed, 1=low connectedness/more disadvantage)".
value labels talkneighbR 0 "talked with neighbor" 1 "has not talked with neighbor".
execute.

frequencies variables = talkneighbR /statistics = all.
*******************************************************************************

*****************************NEIGHBORS LOOK OUT FOR EACH OTHER.
*Q: People in this neighborhood look out for each other. (H1NB3).
***check frequencies for zeros.
frequencies variables = H1NB3 /statistics = all.
*answer codes: 1=true, 2=false, 6=refused, 8=don't know, 9=not applicable.

if (H1NB3 eq 1) neighbwatchR = 0.
if (H1NB3 eq 2) neighbwatchR = 1.
if (H1NB3 eq 6 or H1NB3 eq 8 or H1NB3 eq 9) neighbwatchR = -99.
recode neighbwatchR (-99 = sysmis).
variable labels neighbwatchR
    "Neighbors do NOT look out for each other (H1NB3 reversed, 1=low connectedness/more disadvantage)".
value labels neighbwatchR 0 "neighbors look out" 1 "neighbors do not look out".
execute.

frequencies variables = neighbwatchR /statistics = all.
*******************************************************************************

*****************************FEELS SAFE IN NEIGHBORHOOD.
*Q: Do you usually feel safe in your neighborhood? (H1NB5).
*Note: nbhdunsafeD already created in subjective neighborhood section above.
*Use nbhdunsafeD directly in the community connectedness composite (1=unsafe=low connectedness=disadvantage).
*******************************************************************************
    
**********NOT REVERSE SCORED VERSION - PROTECTIVE.

*****************************KNOW MOST NEIGHBORS.
*Q: You know most of the people in your neighborhood. (H1NB1, true=1, false=2).
***check frequencies for zeros.
frequencies variables = H1NB1 /statistics = all.
*answer codes: 1=true, 2=false, 6=refused, 8=don't know, 9=not applicable.

if (H1NB1 eq 1) knowneighb = 1.
if (H1NB1 eq 2) knowneighb = 0.
if (H1NB1 eq 6 or H1NB1 eq 8 or H1NB1 eq 9) knowneighb = -99.
recode knowneighb (-99 = sysmis).
variable labels knowneighb "Knows most neighbors (H1NB1, 1=yes, higher = more connectedness)".
value labels knowneighb 0 "does not know most neighbors" 1 "knows most neighbors".
execute.

frequencies variables = knowneighb /statistics = all.
*******************************************************************************

*****************************TALKED WITH NEIGHBOR.
*Q: In the past month, you have stopped to talk with someone in your neighborhood. (H1NB2).
***check frequencies for zeros.
frequencies variables = H1NB2 /statistics = all.
*answer codes: 1=true, 2=false, 6=refused, 8=don't know, 9=not applicable.

if (H1NB2 eq 1) talkneighb = 1.
if (H1NB2 eq 2) talkneighb = 0.
if (H1NB2 eq 6 or H1NB2 eq 8 or H1NB2 eq 9) talkneighb = -99.
recode talkneighb (-99 = sysmis).
variable labels talkneighb "Talked with neighbor in past month (H1NB2, 1=yes, higher = more connectedness)".
value labels talkneighb 0 "has not talked with neighbor" 1 "talked with neighbor".
execute.

frequencies variables = talkneighb /statistics = all.
*******************************************************************************

*****************************NEIGHBORS LOOK OUT FOR EACH OTHER.
*Q: People in this neighborhood look out for each other. (H1NB3).
***check frequencies for zeros.
frequencies variables = H1NB3 /statistics = all.
*answer codes: 1=true, 2=false, 6=refused, 8=don't know, 9=not applicable.

if (H1NB3 eq 1) neighbwatch = 1.
if (H1NB3 eq 2) neighbwatch = 0.
if (H1NB3 eq 6 or H1NB3 eq 8 or H1NB3 eq 9) neighbwatch = -99.
recode neighbwatch (-99 = sysmis).
variable labels neighbwatch "Neighbors look out for each other (H1NB3, 1=yes, higher = more connectedness)".
value labels neighbwatch 0 "neighbors do not look out" 1 "neighbors look out".
execute.

frequencies variables = neighbwatch /statistics = all.
*******************************************************************************

*****************************FEELS SAFE IN NEIGHBORHOOD.
*Q: Do you usually feel safe in your neighborhood? (H1NB5).
***check frequencies for zeros.
frequencies variables = H1NB5 /statistics = all.
*answer codes: 0=no, 1=yes, 6=refused, 8=don't know.

if (H1NB5 eq 1) nbhdsafe = 1.
if (H1NB5 eq 0) nbhdsafe = 0.
if (H1NB5 eq 6 or H1NB5 eq 8) nbhdsafe = -99.
recode nbhdsafe (-99 = sysmis).
variable labels nbhdsafe "Feels safe in neighborhood (H1NB5, 1=yes, higher = more connectedness)".
value labels nbhdsafe 0 "does not feel safe" 1 "feels safe".
execute.

frequencies variables = nbhdsafe /statistics = all.

    
*****************************COMMUNITY CONNECTEDNESS INDEX (Wickrama & Bryant 2003).
*Items coded in protective direction (1 = connected):
*knowneighb, talkneighb, neighbwatch, nbhdsafe.
*Sum 0-4; higher = more connectedness = more protective.

compute commconnect = sum(knowneighb, talkneighb, neighbwatch, nbhdsafe).
variable labels commconnect
    "Community connectedness (Wickrama & Bryant 2003, sum 0-4, higher = more connectedness)".
execute.

reliability variables = knowneighb talkneighb neighbwatch nbhdsafe
    /scale('commconnect') all /statistics = all.
*alpha = .51.

frequencies variables = commconnect /statistics = all.


*standardize based on weight filtered dataset.
delete variables  Zcommconnect.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = commconnect / save.
*******************************************************************************

******************************************************************************COMMUNITY RESOURCES - INTEGRATION (PARENT REPORT)**********************************************************************************

*Note: Community Integration (Wickrama & Bryant 2003): parent involvement in 5 community organizations.
*Reverse scored so higher = lower integration = more disadvantage.

*****************************COMMUNITY INTEGRATION — PARENT ORGANIZATIONAL MEMBERSHIP.
*Q: Are you a member of any of the following? (PA27A-E).
*   PA27A = Parent/teacher organization
*   PA27B = Military veterans organization
*   PA27C = Labor union
*   PA27D = Hobby or sports group (e.g., bowling team, ham radio club)
*   PA27E = Civic or social organization (e.g., Junior League, Rotary, Knights of Columbus)
*Items coded 0=no, 1=yes, 6=refused, system missing.
*Higher = more integration.
***check frequencies for zeros.
frequencies variables = PA27A PA27B PA27C PA27D PA27E /statistics = all.

if (PA27A eq 1) commint_pto = 1.
if (PA27A eq 0) commint_pto = 0.
if (PA27A eq 6) commint_pto = -99.
recode commint_pto (-99 = sysmis).
variable labels commint_pto "NOT in parent/teacher organization (PA27A , 1 = member/more protective".
value labels commint_pto 0 "member" 1 "not a member".
execute.

if (PA27B eq 1) commint_mil = 1.
if (PA27B eq 0) commint_mil = 0.
if (PA27B eq 6) commint_mil = -99.
recode commint_mil (-99 = sysmis).
variable labels commint_mil "NOT in military/veterans organization (PA27B , 1 = member/more protective".
value labels commint_mil 0 "member" 1 "not a member".
execute.

if (PA27C eq 1) commint_union = 1.
if (PA27C eq 0) commint_union = 0.
if (PA27C eq 6) commint_union = -99.
recode commint_union (-99 = sysmis).
variable labels commint_union "NOT in labor union (PA27C , 1 = member/more protective".
value labels commint_union 0 "member" 1 "not a member".
execute.

if (PA27D eq 1) commint_sport = 1.
if (PA27D eq 0) commint_sport = 0.
if (PA27D eq 6) commint_sport = -99.
recode commint_sport (-99 = sysmis).
variable labels commint_sport "NOT in hobby/sports group (PA27D , 1 = member/more protective".
value labels commint_sport 0 "member" 1 "not a member".
execute.

if (PA27E eq 1) commint_civic = 1.
if (PA27E eq 0) commint_civic = 0.
if (PA27E eq 6) commint_civic = -99.
recode commint_civic (-99 = sysmis).
variable labels commint_civic "NOT in civic/social organization (PA27E , 1 = member/more protective".
value labels commint_civic 0 "member" 1 "not a member".
execute.

*check frequencies of all new variables.
frequencies variables = commint_pto commint_mil commint_union commint_sport commint_civic /statistics = all.

*****************************COMMUNITY INTEGRATION INDEX (Wickrama & Bryant 2003).
*Parent report; 5 organizational involvement items reversed in File 1 so 1=not involved=disadvantage.
*Sum 0-5; higher = more  integration = more protective.

compute commintegr_disadv = sum(commint_pto, commint_mil, commint_union, commint_sport, commint_civic) .
variable labels commintegr_disadv
    "Community integration  (Wickrama & Bryant 2003 reversed, sum 0-5, higher = more integration)".
execute.

reliability variables = commint_pto commint_mil commint_union commint_sport commint_civic 
       /scale('commintegr') all /statistics = all.
*alpha = .35.

frequencies variables = commintegr_disadv /statistics = all.


*standardize based on weight filtered dataset.
delete variables  Zcommintegr_disadv.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = commintegr_disadv / save.
*******************************************************************************


******************************************************************************PROTECTIVE FACTORS - INDIVIDUAL: ADOLESCENT AGENCY**********************************************************************************

*****************************SELF-EFFICACY ITEMS (Wickrama & Noh 2010)
*Q: When you get what you want, it's usually because you worked hard for it (H1PF14);
*   You have a lot of energy (H1PF26); You seldom get sick (H1PF27);
*   When you get sick, you get better quickly (H1PF28).
*Answer codes: 1=strongly agree, 2=agree, 3=neither, 4=disagree, 5=strongly disagree,
*              6=refused, 7=legit skip, 8=don't know.
*Reverse code so 5=high self-efficacy.
***check frequencies for zeros.
frequencies variables = H1PF14 H1PF26 H1PF27 H1PF28 /statistics = all.

recode H1PF14 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into eff_hardwork.
variable labels eff_hardwork "Gets what wants through hard work (H1PF14, reverse-coded, higher = more self-efficacy)".
execute.

recode H1PF26 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into eff_energy.
variable labels eff_energy "Has a lot of energy (H1PF26, reverse-coded, higher = more self-efficacy)".
execute.

recode H1PF27 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into eff_rarelyill.
variable labels eff_rarelyill "Seldom gets sick (H1PF27, reverse-coded, higher = more self-efficacy)".
execute.

recode H1PF28 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into eff_recoverfast.
variable labels eff_recoverfast "Gets better quickly when sick (H1PF28, reverse-coded, higher = more self-efficacy)".
execute.

frequencies variables = eff_hardwork eff_energy eff_rarelyill eff_recoverfast /statistics = all.

*****************************SELF-EFFICACY COMPOSITE  (Wickrama & Noh 2010)
*4 items: eff_hardwork, eff_energy, eff_rarelyill, eff_recoverfast.
*All reverse-coded; higher = more self-efficacy.

compute selfefficacy = mean(eff_hardwork, eff_energy, eff_rarelyill, eff_recoverfast).
variable labels selfefficacy
    "Self-efficacy composite: mean of 4 items (higher = more self-efficacy)".
execute.

reliability variables = eff_hardwork eff_energy eff_rarelyill eff_recoverfast
    /scale('selfefficacy') all /statistics = all.
*alpha = .43.

frequencies variables = selfefficacy /statistics = all /histogram.


*standardize based on weight filtered dataset.
delete variables  Zselfefficacy.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = selfefficacy / save.
*******************************************************************************
    
*****************************SELF-EFFICACY ITEMS (Add Health Scale)
*Q (>= 15): If you wanted to use birth control, how sure are you that you could stop yourself and use birth control once you were highly aroused or turned on? (H1SE1);
*   How sure are you that you could plan ahead to have some form of birth control available? (H1SE2)
*   How sure are you that you could resist sexual intercourse if your partner did not want to use some form of birth control? (H1SE3)
*Answer codes: 1=very sure, 2=moderately sure, 3=neither sure nor unsure, 4=moderately unsure, 5= very unsure,
*              6=I never want to use birth contnrol, 97=legit skip, 98=don't know, 96 = refused
*Reverse code so 5=high self-efficacy.
Q: Compared with other people your age, how intelligent are you? (H1SE4)
*Answer codes: 1= moderately below average, 2= slightly below average, 3=about average, 4= slighly above average, 5= moderately above average,
*              6= extremely above average, 98=don't know, 96 = refused
***check frequencies for zeros.
frequencies variables = H1SE1 H1SE2 H1SE3 H1SE4 /statistics = all.

recode H1SE1  H1SE2 H1SE3  (1=5)(2=4)(3=3)(4=2)(5=1)(96=sysmis)(97=sysmis)(98=sysmis) into self_efficacy1 self_efficacy2 self_efficacy3.
recode H1SE4  (1=1)(2=2)(3=3)(4=4)(5=5)(96=sysmis)(97=sysmis)(98=sysmis) into self_efficacy4.
execute.

 *****************************SELF-EFFICACY COMPOSITE (Add Health Scale).

compute self_efficacy = mean(self_efficacy1,self_efficacy2, self_efficacy3, self_efficacy4 ).
execute.

reliability variables = self_efficacy1 self_efficacy3 self_efficacy3 self_efficacy4
    /scale('efficacy') all /statistics = all.
 *alpha = .67.


*standardize based on weight filtered dataset.
delete variables  Zself_efficacy.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = self_efficacy / save.

*****************************OPTIMISM - FUTURE ORIENTATION ITEMS.
*Q: How likely to attend college (H1EE2); how likely to live to age 35 (H1EE12);
*   How often felt hopeful about the future (H1FS8).
*Note: H1EE2 and H1EE12 coded 1=almost no chance to 5=almost certain (higher=more optimistic).
*H1FS8: 0=never or rarely, 1=sometimes, 2=a lot of the time, 3=most/all of the time (higher=more hopeful).

***check frequencies for zeros.
frequencies variables = H1EE2 H1EE12 H1FS8 /statistics = all.
*answer codes H1EE2/H1EE12: 1=almost no chance, 2=some chance, 3=50-50, 4=good chance, 5=almost certain,
*                            6=refused, 8=don't know.
*answer codes H1FS8: 0-3 scale, 6=refused, 8=don't know.

*H1EE2 and H1EE12 are already directional (higher = more optimistic); pass through.
if (H1EE2 ge 1 and H1EE2 le 5) opt_college = H1EE2.
if (H1EE2 eq 6 or H1EE2 eq 8) opt_college = -99.
recode opt_college (-99 = sysmis).
variable labels opt_college
    "Perceived likelihood of attending college (H1EE2, 1=almost no chance to 5=almost certain)".
execute.

if (H1EE12 ge 1 and H1EE12 le 5) opt_live35 = H1EE12.
if (H1EE12 eq 6 or H1EE12 eq 8) opt_live35 = -99.
recode opt_live35 (-99 = sysmis).
variable labels opt_live35
    "Perceived likelihood of living to age 35 (H1EE12, 1=almost no chance to 5=almost certain)".
execute.

*H1FS8 (hopeful about future): already directional, rescale to 1-4 for consistency with other items.
if (H1FS8 ge 0 and H1FS8 le 3) opt_hopeful = H1FS8 + 1.
if (H1FS8 eq 6 or H1FS8 eq 8) opt_hopeful = -99.
recode opt_hopeful (-99 = sysmis).
variable labels opt_hopeful
    "Felt hopeful about future (H1FS8 rescaled 1-4, higher = more hopeful/optimistic)".
value labels opt_hopeful
    1 "never or rarely"
    2 "sometimes"
    3 "a lot of the time"
    4 "most or all of the time".
execute.

frequencies variables = opt_college opt_live35 opt_hopeful /statistics = all.

correlations variables = opt_college opt_live35 opt_hopeful /print = nosig.
*r = .18 to .20.

reliability variables = opt_college opt_live35 opt_hopeful
    /scale('optimism') all /statistics = all.
 *alpha = .41.

*standardize based on weight filtered dataset.
delete variables  Zopt_college Zopt_live35 Zopt_hopeful.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = opt_college opt_live35 opt_hopeful / save.
*******************************************************************************
    

*****************************SELF-ESTEEM COMPOSITE (Wickrama & Noh 2010)
*6 items: se_goodqualities, se_proudof, se_likemyself, se_doingright, se_socialaccept, se_lovedwanted.
*All reverse-coded in File 1; higher = more self-esteem. 

compute selfesteem = mean(se_goodqualities, se_proudof, se_likemyself, se_doingright, se_socialaccept, se_lovedwanted).
variable labels selfesteem
    "Self-esteem composite: mean of 6 items (higher = more self-esteem)".
execute.

reliability variables = se_goodqualities se_proudof se_likemyself se_doingright se_socialaccept se_lovedwanted
    /scale('selfesteem') all /statistics = all.
*alpha = .85.

frequencies variables = selfesteem /statistics = all /histogram.

*standardize based on weight filtered dataset.
delete variables  Zselfesteem.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = selfesteem / save.
*******************************************************************************


******************************************************************************PROTECTIVE FACTORS - FAMILY LEVEL**********************************************************************************

*****************************PARENTAL WARMTH - MOTHER.
*Q: Most of the time, your mother is warm and loving toward you. (H1PF1).
***check frequencies for zeros.
frequencies variables = H1PF1 /statistics = all.
*answer codes: 1=strongly agree, 2=agree, 3=neither, 4=disagree, 5=strongly disagree,
*              6=refused, 7=legit skip [no resident MOM].

recode H1PF1 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis) into warmth_mom.
variable labels warmth_mom
    "Mother is warm and loving (H1PF1, reverse-coded, higher = more parental warmth)".
value labels warmth_mom
    1 "strongly disagree (low warmth)"
    2 "disagree"
    3 "neither"
    4 "agree"
    5 "strongly agree (high warmth)".
execute.

frequencies variables = warmth_mom /statistics = all.

*****************************PARENTAL WARMTH - FATHER.
*Q: Most of the time, your father is warm and loving toward you. (H1PF23).
***check frequencies for zeros.
frequencies variables = H1PF23 /statistics = all.
*answer codes: 1=strongly agree, 2=agree, 3=neither, 4=disagree, 5=strongly disagree,
*              6=refused, 7=legit skip [no resident DAD].

recode H1PF23 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis) into warmth_dad.
variable labels warmth_dad
    "Father is warm and loving (H1PF23, reverse-coded, higher = more parental warmth)".
value labels warmth_dad
    1 "strongly disagree (low warmth)"
    2 "disagree"
    3 "neither"
    4 "agree"
    5 "strongly agree (high warmth)".
execute.

frequencies variables = warmth_dad /statistics = all.

*****************************PARENT ENCOURAGES INDEPENDENCE - MOTHER.
*Q: Your mother encourages you to be independent. (H1PF2).
***check frequencies for zeros.
frequencies variables = H1PF2 /statistics = all.
*answer codes: 1=strongly agree to 5=strongly disagree, 6=refused, 7=legit skip [no MOM], 8=don't know.

recode H1PF2 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into autonomy_mom.
variable labels autonomy_mom
    "Mother encourages independence (H1PF2, reverse-coded, higher = more autonomy-granting)".
value labels autonomy_mom
    1 "strongly disagree (low autonomy)"
    2 "disagree"
    3 "neither"
    4 "agree"
    5 "strongly agree (high autonomy)".
execute.

frequencies variables = autonomy_mom /statistics = all.

*****************************PARENT HELPS UNDERSTAND MISTAKES - MOTHER.
*Q: When you do something wrong, your mother talks it over and helps you understand why it is wrong. (H1PF3).
***check frequencies for zeros.
frequencies variables = H1PF3 /statistics = all.
*answer codes: 1=strongly agree to 5=strongly disagree, 6=refused, 7=legit skip, 8=don't know, 9=n/a.

recode H1PF3 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis)(9=sysmis) into explain_mom.
variable labels explain_mom
    "Mother explains mistakes (H1PF3, reverse-coded, higher = more explanatory parenting)".
value labels explain_mom
    1 "strongly disagree"
    2 "disagree"
    3 "neither"
    4 "agree"
    5 "strongly agree".
execute.

frequencies variables = explain_mom /statistics = all.

*****************************PARENT-CHILD COMMUNICATION SATISFACTION - MOTHER.
*Q: You are satisfied with the way your mother and you communicate with each other. (H1PF4).
***check frequencies for zeros.
frequencies variables = H1PF4 /statistics = all.
*answer codes: 1=strongly agree to 5=strongly disagree, 6=refused, 7=legit skip, 8=don't know, 9=n/a.

recode H1PF4 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis)(9=sysmis) into commsat_mom.
variable labels commsat_mom
    "Satisfied with mother communication (H1PF4, reverse-coded, higher = more satisfaction)".
value labels commsat_mom
    1 "strongly disagree (low satisfaction)"
    2 "disagree"
    3 "neither"
    4 "agree"
    5 "strongly agree (high satisfaction)".
execute.

frequencies variables = commsat_mom /statistics = all.

*****************************PARENT-CHILD RELATIONSHIP SATISFACTION - MOTHER.
*Q: Overall, you are satisfied with your relationship with your mother. (H1PF5).
***check frequencies for zeros.
frequencies variables = H1PF5 /statistics = all.
*answer codes: 1=strongly agree to 5=strongly disagree, 6=refused, 7=legit skip, 8=don't know, 9=n/a.

recode H1PF5 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis)(9=sysmis) into relsat_mom.
variable labels relsat_mom
    "Satisfied with mother relationship (H1PF5, reverse-coded, higher = more satisfaction)".
value labels relsat_mom
    1 "strongly disagree (low satisfaction)"
    2 "disagree"
    3 "neither"
    4 "agree"
    5 "strongly agree (high satisfaction)".
execute.

frequencies variables = relsat_mom /statistics = all.

*****************************PARENT-CHILD COMMUNICATION SATISFACTION - FATHER.
*Q: You are satisfied with the way your father and you communicate with each other. (H1PF24).
***check frequencies for zeros.
frequencies variables = H1PF24 /statistics = all.
*answer codes: 1=strongly agree to 5=strongly disagree, 6=refused, 7=legit skip [no resident DAD].

recode H1PF24 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis)(9=sysmis) into commsat_dad.
variable labels commsat_dad
    "Satisfied with father communication (H1PF24, reverse-coded, higher = more satisfaction)".
value labels commsat_dad
    1 "strongly disagree (low satisfaction)"
    2 "disagree"
    3 "neither"
    4 "agree"
    5 "strongly agree (high satisfaction)".
execute.

frequencies variables = commsat_dad /statistics = all.

*****************************PARENT-CHILD RELATIONSHIP SATISFACTION - FATHER.
*Q: Overall, you are satisfied with your relationship with your father. (H1PF25).
***check frequencies for zeros.
frequencies variables = H1PF25 /statistics = all.
*answer codes: 1=strongly agree to 5=strongly disagree, 6=refused, 7=legit skip [no resident DAD].

recode H1PF25 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis)(9=sysmis) into relsat_dad.
variable labels relsat_dad
    "Satisfied with father relationship (H1PF25, reverse-coded, higher = more satisfaction)".
value labels relsat_dad
    1 "strongly disagree (low satisfaction)"
    2 "disagree"
    3 "neither"
    4 "agree"
    5 "strongly agree (high satisfaction)".
execute.

frequencies variables = relsat_dad /statistics = all.


*****************************PARENT-CHILD RELATIONSHIP COMPOSITE (Williams & Merten 2014)).
*5 core items per Wickrama: warmth (mom/dad avg), autonomy-granting (mom), explaining mistakes (mom),
*communication satisfaction (mom/dad avg), relationship satisfaction (mom/dad avg).
*Use mean() for parent scales to retain one-parent households.

*Step 1: Average mother and father items where both available.
compute warmth_avg = mean(warmth_mom, warmth_dad).
variable labels warmth_avg "Average parental warmth mom+dad (mean, handles missing parent)".
execute.

compute commsat_avg = mean(commsat_mom, commsat_dad).
variable labels commsat_avg "Average parent-child communication satisfaction mom+dad".
execute.

compute relsat_avg = mean(relsat_mom, relsat_dad).
variable labels relsat_avg "Average parent-child relationship satisfaction mom+dad".
execute.

*Step 2: Compute parent-child relationship composite (5 domain items0
*Items: warmth_avg, autonomy_mom, explain_mom, commsat_avg, relsat_avg.
*Use mean() to handle missing items.

compute parentchild_rel = mean(warmth_avg, autonomy_mom, explain_mom, commsat_avg, relsat_avg).
variable labels parentchild_rel
    "Parent-child relationship quality composite: mean of warmth, autonomy, explaining, comm sat, rel sat (1-5, higher = better relationship)".
execute.

reliability variables = warmth_avg autonomy_mom explain_mom commsat_avg relsat_avg
    /scale('parentchild_rel') all.
*alpha = .83.

frequencies variables = parentchild_rel /statistics = all /histogram.

*standardize based on weight filtered dataset.
delete variables  Zparentchild_rel.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = parentchild_rel / save.
*******************************************************************************
    

******************************************************************************PROTECTIVE FACTORS - SOCIAL/SCHOOL LEVEL**********************************************************************************

*****************************SCHOOL CONNECTEDNESS.
*Q: You feel close to people at your school (H1ED19); you feel like you are part of your school (H1ED20);
*   You are happy to be at your school (H1ED22).
*Answer codes: 1=strongly agree, 2=agree, 3=neither, 4=disagree, 5=strongly disagree,
*              6=refused, 7=legit skip, 8=don't know.
*Reverse code so 5=high connectedness.
***check frequencies for zeros.
frequencies variables = H1ED19 H1ED20 H1ED22 /statistics = all.

recode H1ED19 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into schcon_close.
variable labels schcon_close
    "Feels close to people at school (H1ED19, reverse-coded, higher = more connectedness)".
execute.

recode H1ED20 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into schcon_partof.
variable labels schcon_partof
    "Feels part of school (H1ED20, reverse-coded, higher = more connectedness)".
execute.

recode H1ED22 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into schcon_happy.
variable labels schcon_happy
    "Happy to be at school (H1ED22, reverse-coded, higher = more connectedness)".
execute.

frequencies variables = schcon_close schcon_partof schcon_happy /statistics = all.

*****************************SCHOOL CONNECTEDNESS COMPOSITE.
*3 items: schcon_close, schcon_partof, schcon_happy. All reverse-coded; higher = more connected.

compute schoolconnect = mean(schcon_close, schcon_partof, schcon_happy).
variable labels schoolconnect
    "School connectedness composite: mean of 3 items (higher = more connected to school)".
execute.

reliability variables = schcon_close schcon_partof schcon_happy
    /scale('schoolconnect') all .
*alpha = .78.

frequencies variables = schoolconnect /statistics = all /histogram.

*standardize based on weight filtered dataset.
delete variables  Zschoolconnect.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = schoolconnect / save.
*******************************************************************************

*****************************PERCEIVED ADULT CARE AND SOCIAL SUPPORT.
*Q: How much do you feel that adults care about you? (H1PR1); teachers care (H1PR2);
*   parents care (H1PR3); friends care (H1PR4).
*Answer codes: 1=not at all, 2=very little, 3=somewhat, 4=quite a bit, 5=very much,
*              6=does not apply, 96=refused, 98=don't know.
*Items are already directional (higher=more care); pass through.
***check frequencies for zeros.
frequencies variables = H1PR1 H1PR2 H1PR3 H1PR4 /statistics = all.

if (H1PR1 ge 1 and H1PR1 le 5) adultscare = H1PR1.
if (H1PR1 eq 6 or H1PR1 eq 96 or H1PR1 eq 98) adultscare = -99.
recode adultscare (-99 = sysmis).
variable labels adultscare "Adults care about adolescent (H1PR1, 1=not at all to 5=very much)".
execute.

if (H1PR2 ge 1 and H1PR2 le 5) teacherscare = H1PR2.
if (H1PR2 eq 6 or H1PR2 eq 96 or H1PR2 eq 98) teacherscare = -99.
recode teacherscare (-99 = sysmis).
variable labels teacherscare "Teachers care about adolescent (H1PR2, 1=not at all to 5=very much)".
execute.

if (H1PR3 ge 1 and H1PR3 le 5) parentscare = H1PR3.
if (H1PR3 eq 6 or H1PR3 eq 96 or H1PR3 eq 98) parentscare = -99.
recode parentscare (-99 = sysmis).
variable labels parentscare "Parents care about adolescent (H1PR3, 1=not at all to 5=very much)".
execute.

if (H1PR4 ge 1 and H1PR4 le 5) friendscare = H1PR4.
if (H1PR4 eq 6 or H1PR4 eq 96 or H1PR4 eq 98) friendscare = -99.
recode friendscare (-99 = sysmis).
variable labels friendscare "Friends care about adolescent (H1PR4, 1=not at all to 5=very much)".
execute.

frequencies variables = adultscare teacherscare parentscare friendscare /statistics = all.

*****************************TEACHER FAIRNESS AND SUPPORT.
*Q: The teachers at your school treat students fairly (H1ED23); You feel safe in your school (H1ED24).
***check frequencies for zeros.
frequencies variables = H1ED23 H1ED24 /statistics = all.
*answer codes: 1=strongly agree to 5=strongly disagree, 6=refused, 7=legit skip, 8=don't know.

recode H1ED23 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into teach_fair.
variable labels teach_fair
    "Teachers treat students fairly (H1ED23, reverse-coded, higher = more positive school climate)".
execute.

recode H1ED24 (1=5)(2=4)(3=3)(4=2)(5=1)(6=sysmis)(7=sysmis)(8=sysmis) into school_safe.
variable labels school_safe
    "Feels safe in school (H1ED24, reverse-coded, higher = safer school environment)".
execute.

frequencies variables = teach_fair school_safe /statistics = all.

*****************************POSITIVE SCHOOL CLIMATE COMPOSITE.
*Items: teach_fair (H1ED23), school_safe (H1ED24), teacherscare (H1PR2), adultscare (H1PR1).
*Combine connectedness and climate into broader positive school environment.

compute schoolclimate = mean(teach_fair, school_safe, teacherscare, adultscare).
variable labels schoolclimate
    "Positive school environment: mean of teacher fairness, school safety, teacher care, adult care (higher = more positive)".
execute.

reliability variables = teach_fair school_safe teacherscare adultscare
    /scale('schoolclimate') all.
*alpha = .61.

frequencies variables = schoolclimate /statistics = all /histogram.

*standardize based on weight filtered dataset.
delete variables  Zschoolclimate.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = schoolclimate / save.
*******************************************************************************


*****************************PERCEIVED SOCIAL SUPPORT (FAMILY AND FRIENDS).
*Items: parentscare (H1PR3), friendscare (H1PR4).
*Adults and teachers care items (H1PR1, H1PR2) used in school/social composite.

compute socsupport_fam = mean(parentscare, friendscare).
variable labels socsupport_fam
    "Perceived social support from family and friends: mean of parents care + friends care (1-5, higher = more support)".
execute.

correlations variables = parentscare friendscare /print = nosig.
*r = .26.

reliability variables = parentscare friendscare
    /scale('support') all.
*alpha = .39.

frequencies variables = socsupport_fam /statistics = all.

*standardize based on weight filtered dataset.
delete variables   Zparentscare .
 delete variables Zfriendscare.
 delete variables  Zsocsupport_fam.
    *delete variable if previously standardized with whole sample. 
temporary.
    *temporary can't be used with delete.
select if (GSWGT3_2 ge 0). 
descriptives variables = parentscare friendscare socsupport_fam / save.

*****************************SPORTS PARTICIPATION.
*Q: Are you on any school sports teams?
***check frequencies for zeros.
frequencies variables =  S44A18 to S44A29 /statistics = all.
*no = 0, yes = 1.

*create sum score of number of sports.
compute sport_sum = sum(S44A18 to S44A29).
execute.

*check frequencies of new variable.
frequencies variables = sport_sum 
     /statistics = all
     /histogram.
*kurtotic (8.353), range 0-12.

*find 95% value for outliers cut-off.
examine variables = sport_sum
    /plot none
    /statistics none
    /percentiles(95) haverage.
*95% value is 3.

*find 5 value for outliers cut-off.
examine variables = sport_sum
    /plot none
    /statistics none
    /percentiles(5) haverage.
*5 value is 0.

*examine if outliers above 3.
if(sport_sum ge 4) sport_sum_outlier = 1.
execute.
frequencies variables = sport_sum_outlier /statistics = all.
*233 outliers.

*winsorize outliers.
if(sport_sum eq 0) WSDsport = 0.
if(sport_sum eq 1) WSDsport = 1.
if(sport_sum eq 2) WSDsport = 2.
if(sport_sum ge 3) WSDsport = 3.
execute.

*check frequencies of new variable.
frequencies variables = WSDsport /statistics = all.
*******************************************************************************

*****************************EXTRACURRICULAR ACTIVITIES.
*Q: Are you a member of any clubs or organizations at school?
***check frequencies for zeros.
frequencies variables = S44A1 to S44A16 S44A30 to S44A33 /statistics = all.
*no = 0, yes = 1.

*create sum score of number of extracurricular activities.
compute activity_sum = sum(S44A1 to S44A16, S44A30 to S44A33).
execute.

*check frequencies of new variable.
frequencies variables = activity_sum /statistics = all.

*check frequencies of new variable.
frequencies variables = activity_sum 
     /statistics = all
     /histogram.
*kurtotic (30.584), slightly skewed (3.817), range 0-20.

*find 95% value for outliers cut-off.
examine variables = activity_sum
    /plot none
    /statistics none
    /percentiles(95) haverage.
*95% value is 4.

*find 5 value for outliers cut-off.
examine variables = activity_sum
    /plot none
    /statistics none.
    *5 value is 0.

*examine if outliers above 4.
if(activity_sum ge 5) activity_sum_outlier = 1.
execute.
frequencies variables = activity_sum_outlier /statistics = all.
*289 outliers.

*winsorize outliers.
if(activity_sum eq 0) WSDactivity= 0.
if(activity_sum eq 1) WSDactivity = 1.
if(activity_sum eq 2) WSDactivity = 2.
if(activity_sum eq 3) WSDactivity = 3.
if(activity_sum ge 4) WSDactivity = 4.
execute.

*check frequencies of new variable.
frequencies variables = WSDactivity /statistics = all.
*******************************************************************************

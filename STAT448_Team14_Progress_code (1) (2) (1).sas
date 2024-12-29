/* Final project Stat448 Spring 2024 */
/* Data from UCI: https://archive.ics.uci.edu/dataset/320/student+performance */

data math;
	infile '/home/u63756428/Personal/student-mat.csv' dsd dlm=";" missover firstobs=2;
	input school$ sex $ age address $ famsize $ Pstatus $ Medu Fedu Mjob $ Fjob $ reason$ guardian $ traveltime 
	studytime failures schoolsup $ famsup $ paid $ activities $ nursery $ higher $
	internet $ romantic $ famrel freetime goout Dalc Walc health absences G1 G2 G3; 
run;

data por;
	infile '/home/u63756428/Personal/student-por.csv' dsd dlm=";" missover firstobs=2;
	input school$ sex $ age address $ famsize $ Pstatus $ Medu Fedu Mjob $ Fjob $ reason$ guardian $ traveltime 
	studytime failures schoolsup $ famsup $ paid $ activities $ nursery $ higher $
	internet $ romantic $ famrel freetime goout Dalc Walc health absences G1 G2 G3; 
run;

proc print data=math(obs=10);
run;


proc univariate data=por;
var G1 G2 G3;
run;

proc print data=por(obs=10);
run;


proc univariate data=por;
var G1 G2 G3;
run;





*Density plot to show distribution of G1 grade;
PROC SGPLOT DATA=por;
    DENSITY G3; /* Replace with your actual variable name */
    XAXIS LABEL="Final Grade G3";
RUN;






*Descriptive statistics starts here--------------------------------------------------------;

*Getting the mean, median, mode, std,  min, max for continous variables;

proc means data=por mean median std var min max maxdec = 1;
  var age G1 G2 G3;
run;

*Pairwise Scatterplot;
proc sgscatter data=por;
	matrix age G1 G2 G3;
run;



*STARTING WITH CATEGORICAL VARIABELES;

*School - Proportion of students;
PROC FREQ DATA = por;
    TABLES school sex address Pstatus internet romantic Dalc Walc health failures reason Medu Fedu Mjob Fjob absences famrel Pstatus;
RUN;

*Plotting bar charts to visualise these findings;

proc sgplot data=por;
  vbar school / group=sex  groupdisplay=cluster datalabel datalabelattrs=(size=8 color=black);
  title "Bar Chart of School with Sex Grouped Bars";
run;

proc sgplot data=por;
  vbar school / group=STUDYTIME  groupdisplay=cluster datalabel datalabelattrs=(size=8 color=black);
  title "Bar Chart of School with Studytime Grouped Bars";
run;


proc sgplot data=por;
  vbar school / stat=freq datalabel datalabelattrs=(size=8 color=black);
  title "Bar Chart for School";
run;

proc sgplot data=por;
  vbar sex / group=school stat=freq datalabel datalabelattrs=(size=8 color=black);
  title "Bar Chart of Sex Grouped by School";
run;

proc sgplot data=por;
  vbar address / stat=freq datalabel datalabelattrs=(size=8 color=black);
  title "Bar Chart for Address";
run;

proc sgplot data=por;
  vbar Pstatus / stat=freq datalabel datalabelattrs=(size=8 color=black);
  title "Bar Chart for Pstatus";
run;

proc sgplot data=por;
  vbar Failures / stat=freq datalabel datalabelattrs=(size=8 color=black);
  title "Bar Chart for Failures";
run;

proc sort data=school_sex_freq;
  by school;
run;

ods graphics / width=800px height=400px;
proc sgpie data=por;
  pie Fjob /  datalabelattrs=(size=8 color=black);
  title "Pie Chart of Father's Job";
run;

proc sgpie data=por;
  pie Mjob /  datalabelattrs=(size=8 color=black);
  title "Pie Chart of Mother's job";
run;

proc sgplot data=por;
  vbar Fedu / stat=freq datalabel datalabelattrs=(size=8 color=black);
  title "Bar Chart for Fathers education";
run;

proc sgplot data=por;
	by school;
  pie failures / datalabelattrs=(size=8 color=black);
  title "Bar Chart for Failures";
run;

proc sgplot data=por;
  vbar Medu / stat=freq datalabel datalabelattrs=(size=8 color=black);
  title "Bar Chart for Mothers education";
run;



*BASIC DESCRIPTIVE CODE DONE-----------------------------;

*2) ANNOVA - TESTING GROUP MEANS;

*T - Tests for binary predictors;

proc reg data=por;
	model G1 =  G1 G2 G3 / vif;
run;

/* T-test for the variable 'school' for G3 */
proc ttest data=por;
   class school;
   var G3;
   title 'T-test for Final Grade by School';
run;

/* T-test for the variable 'sex' for G3 */
proc ttest data=por;
   class sex;
   var G3;
   title 'T-test for Final Grade by Sex';
run;


/* T-test for the variable 'internet' for G3 */
proc ttest data=por;
   class internet;
   var G3;
   title 'T-test for Final Grade by internet';
run;


/* T-test for the variable 'studytime' for G3 */
proc ttest data=por;
   class studytime;
   var G3;
   title 'T-test for Final Grade by Studytime';
run;

/* T-test for the variable 'romantic' for G3 */
proc ttest data=por;
   class romantic;
   var G3;
   title 'T-test for Final Grade by romantic';
run;



proc anova data=por;
   class Fjob;
   model G3 = Fjob;
   title 'ANOVA for Final Grade by Father’s Job';
   means Fjob /hovtest tukey cldiff;
run;

proc anova data=por;
   class Fjob;
   model G1 = Fjob;
   title 'ANOVA for Final Grade by Father’s Job';
   means Fjob /hovtest tukey cldiff;
run;

proc anova data=por;
   class Fjob;
   model G2 = Fjob;
   title 'ANOVA for Final Grade by Father’s Job';
   means Fjob /hovtest tukey cldiff;
run;


proc anova data=por;
   class Mjob;
   model G3 = Mjob;
   title 'ANOVA for Final Grade by Mother’s Job';
   means Mjob /hovtest tukey cldiff;
run;

proc anova data=por;
   class Mjob;
   model G3 = Mjob;
   title 'ANOVA for Final Grade by Mother’s Job';
   means Mjob /hovtest tukey cldiff;
run;

proc anova data=por;
   class Mjob;
   model G3 = Mjob;
   title 'ANOVA for Final Grade by Mother’s Job';
   means Mjob /hovtest tukey cldiff;
run;

proc anova data=por;
   class Fedu;
   model G3 = Fedu;
   title 'ANOVA for Final Grade by Father’s education';
   means Fedu /hovtest tukey cldiff;
run;


proc anova data=por;
   class Medu;
   model G3 = Medu;
   title 'ANOVA for Final Grade by Mother’s education';
   means Medu /hovtest tukey cldiff;
run;

proc anova data=por;
   class studytime;
   model G3 = studytime;
   title 'ANOVA for Final Grade by studytime';
   means studytime /hovtest tukey cldiff;
run;

proc anova data=por;
   class Walc;
   model G3 = Walc;
   title 'ANOVA for Final Grade by Weekend Alcohol consumption';
   means Walc /hovtest tukey cldiff;
run;

*Testing for Association;
*FOR G3;
*FOR NUMERIC;
proc glm data=por;
	class studytime fedu medu dalc walc traveltime failures famrel freetime goout health;
    model G3 = studytime fedu medu dalc walc traveltime failures famrel freetime goout health;
    lsmeans studytime fedu medu dalc walc traveltime failures famrel freetime goout health / pdiff=all cl adjust=bon;
    ods select OverallANOVA ModelANOVA LSMeans LSMeanDiffCL DiagnosticsPanel ParameterEstimates;
run;

#STATISTICAL ANALYSIS FOR NUMERICAL PREDICTORS;
proc reg data=por;
    model G3 = age Medu Fedu traveltime studytime failures famrel freetime goout Dalc Walc health absences;
run;

*NumericaL data - summary - QUESTION 3;
proc reg data=por;
    model G2 = age Medu Fedu traveltime studytime failures famrel freetime goout Dalc Walc health absences;
run;

*FOR BINARY AND NOMINAL;
proc glm data=por;
	class school sex address famsize Pstatus Mjob Fjob reason guardian schoolsup famsup paid activities nursery higher internet romantic;
    model G3 =  school sex address famsize Pstatus Mjob Fjob reason guardian schoolsup famsup paid activities nursery higher internet romantic;
    lsmeans  school sex address famsize Pstatus Mjob Fjob reason guardian schoolsup famsup paid activities nursery higher internet romantic / pdiff=all cl;
    ods select OverallANOVA ModelANOVA LSMeans LSMeanDiffCL DiagnosticsPanel;
run;

proc glm data=por;
    model G3 = age absences;
    means age absences / tukey cl;
    ods select OverallANOVA ModelANOVA Means TukeyGrouping;
run;


#Numeric summary;
proc means data=por mean std min max;
	var age Medu Fedu traveltime studytime failures famrel freetime goout Dalc Walc health absences G1 G2 G3;
run;

    
*Addtional Analysis;
proc genmod data=por;
    class school sex address famsize Pstatus Mjob Fjob reason guardian schoolsup famsup paid activities nursery higher internet romantic;
    model G3 = school sex address famsize Pstatus Mjob Fjob reason guardian schoolsup famsup paid activities nursery higher internet romantic 
              age Medu Fedu traveltime studytime failures famrel freetime goout Dalc Walc health absences / dist=normal;
    lsmeans school sex address famsize Pstatus Mjob Fjob reason guardian schoolsup famsup paid activities nursery higher internet romantic / adjust=tukey pdiff=all;
    run;

  
quit;



# Quality Control

## Summary:
Contains scripts to take FastQC output and process it into summary tables. 

#### Input/Output
Input: 		FASTQC data
Output: 	LaTeX tables which summarise fastQC output

#### Script Purposes:

- makeLine.sh:			Extracts the pass/fail data from FastQC output
- makeQCTableLeft.sh:	Even in landscape, there are too many columns of data to fit on a single A4 page. so I broke it into two.
- makeQCTableRight.sh: 	Summons a wise programming deity to remind you of the precious internet space you are using with your useless scripts.
- makeQCTables.sh: 		Literally exists only to call both makeTables.
- Runtrimgalore.sh:		Runs trimgalore.pl
- unzip.sh: 			Unzips multiple files in a folder


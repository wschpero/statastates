{smcl}
{* 01july2016}
{title: Title}

{p 4 8}{cmd:statastates} - Stata module for merging U.S. state identifiers

{title: Syntax}

{p 4 8}{cmd:statastates}, {cmdab:i:dentifier}({it:string})

{title: Description}

{p 4 8}{cmd:statastates} is a simple Stata module for adding U.S. state identifiers (abbreviation, name, and FIPS code) that may be missing from your dataset.

{p 4 8}{cmd:statastates} is compatible with Stata v12.1+. While it may be compatible with earlier versions, it has not been tested in those environments.

{title: Options}

{p 4 8}{bf:Note:} The argument below is required.

{p 4 8}{cmdab:i:dentifier}({it:string}) Use this option to indicate whether you would like to merge the state identifiers using the state abbreviation (specify state_abbrev), state name (specify state_name), or state FIPS code (use state_fips).

{title: Examples}

{p 4 8}statastates is pretty easy to use. Just run the command below and indicate which kind of variable (abbreviation, name, or FIPS code) you would like to use to merge the state identifiers.

{p 4 8}{cmd:statastates}, {cmdab:i:dentifier}({it:state_abbrev})

{p 4 8}Note that the name of the variable you are using for the merge in your master dataset must match the relevant variable in the statastates "using" dataset (i.e., state_abbrev, state_name, or state_fips).

{title: Author}

{p 4 4}William L. Schpero

{title: Contact}

{p 4 4}{browse "mailto:william.schpero@yale.edu":william.schpero@yale.edu}{break}

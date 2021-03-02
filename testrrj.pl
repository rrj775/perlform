#!/usr/bin/perl
use strict;
use warnings;



print "Content-type:text/html\n\n";




print <<HTMLEND
<HTML> 
	<BODY BGCOLOR="#8a0c0a">
	
	<H1>Basic Form </H1>
	
	<FORM ACTION="process.pl" METHOD="POST">
	<p>Select your first name: 
	
	<INPUT TYPE="TEXT" NAME="first_name" LENGTH=30 placeholder="First Name..">
	</p> 
	<P>
	
	Select your last name :

    
    <input type="TEXT" id="last_name" name="last_name" placeholder="LAST NAME..">
	
	<P>
	
	<INPUT TYPE="SUBMIT" VALUE="Submit Form" CLASS="SUBMIT">
	<style>
  		h1 {color:yellow;}
  		p {color:blue;}
	</style>
	<style>
	.submit:hover{
  	color: pink;
	}
	</style>
	</FORM>
	
	</BODY>
	</HTML>

HTMLEND
;

#!/usr/bin/perl

print "Content-type:text/html\r\n\r\n";
use DBI;

 $host = "localhost"; 
 $database = "testing";
 #$dsn = "DBI:$host:database= $database";
 $user = "root";
 $password = "rsvp1260";

$dbh = DBI->connect("DBI:mysql:$database:$host",$user,$password)
	or die ("can't connect to the database");

 if($dbh){
     print "Connected";
 }   

local ($buffer, @pairs, $pair, $name, $value, %FORM);
# Read in text
$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
if ($ENV{'REQUEST_METHOD'} eq "POST") {
   read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
} else {
   $buffer = $ENV{'QUERY_STRING'};
}
# Split information into name/value pairs
@pairs = split(/&/, $buffer);
foreach $pair (@pairs) {
   ($name, $value) = split(/=/, $pair);
   $value =~ tr/+/ /;
   $value =~ s/%(..)/pack("C", hex($1))/eg;
   $FORM{$name} = $value;
}
$first_name = $FORM{first_name};
$last_name  = $FORM{last_name};

$Query=("INSERT INTO details(first_name,last_name)values('$first_name','$last_name')");
print $Query;

my $sth = $dbh->prepare($Query);
# $sth->bind_param( 1, $first_name ); 
# $sth->bind_param( 2, $last_name );


if($sth->execute()){
   print "row suceessfully inserted";

}
else {
   print "ERROR: $Query <br> $dbh->error";
}

						

$sth->finish();
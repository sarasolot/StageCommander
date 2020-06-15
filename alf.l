Newline               \r?\n
Ws                    [ \t]
Int                   [0-9]+
String                \"[^\;\+\-\*\\\%\"]+\"|\"[^\;]*\"
Identifier            [A-Za-z_\%][A-Za-z\%_0-9]*
Comment               \&.*\&
light                 #light
createLight           @createLight\(\)
loop                  $repeat
if                    $if
loop_while            $repeatWhile
propriety             \![A-Za-z_0-9]+

%%

{if}                  {return 'IF'; }
{propriety}           {return 'PROPRIETY';}
{loop}                {return 'REPEAT'; }
{loop_while}          {return 'REPEAT_WHILE'; }
{createLight}         {return 'CREATELIGHT';}
"("                   { return 'LP'; }
")"	              { return 'RP'; }
"=>"                  {return 'ASSIGNEQUALS'; }
"="                   {return 'EQUALS'; }
"{"                   {return 'START';}
'}'                   {return "END";}
{light}               {return 'LIGHT'; }
{movement}            {return 'MOVEMENT'; }
{Int}                 { return 'INT'; }
{String}              { return 'STRING'; }
{Identifier}          { return 'IDENTIFIER'; }
on           { return 'ON'; }
off          { return 'OFF'; }
strobe		{ return 'STROBE'; }
laser		{ return 'LASER'; }
spotlight	{ return 'SPOTLIGHT'; }
{Ws}                  { /*skip whitespace*/ }
{Newline}             {}
{Comment}             {/*skip comment*/}

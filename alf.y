%{
    var lightsArray = [];
    var count = 0;
    function addLight() {
        count ++;
        lightsArray.push({color:"white", lightType:"spotLight", x: 90, y: 90, z: 90, lightIntensity: 100, power: "off" });
    }

%}

%% 

start: statements                           { 
                                                
                                            }
    ;

statements: statements statement	{
                                              
                                            }
            | statement		{
                                              
                                            }
            ;


statement:  LIGHT IDENTIFIER ASSIGNEQUALS CREATELIGHT {
                                                addLight();
						console.log("Light created");
							console.log("type:" +lightsArray[count-1].lightType)
							console.log("color:" +lightsArray[count-1].color)

							console.log("intensity:" +lightsArray[count-1].lightIntensity)
 
							console.log("power:" + lightsArray[count-1].power)
							console.log("x degrees:" +lightsArray[count-1].x)
							console.log("y degrees:" +lightsArray[count-1].y)
							console.log("z degrees:" +lightsArray[count-1].z)
							console.log("");
                                            }
            | INT PROPRIETY EQUALS value {
		
		$2 = $2.substring(1);
		//$4 = $4.substring(1);
		//$4 = $4.substring(0, $4.length - 1);

		lightsArray[$1][$2] = $4;
		console.log("");
		console.log("Propriety changed");
		//console.log($1);
		//console.log($2);
		//console.log($4);
		console.log("type:" +lightsArray[$1].lightType)
		console.log("color:" +lightsArray[$1].color)

		console.log("intensity:" +lightsArray[$1].lightIntensity)

		console.log("power:" + lightsArray[$1].power)
		console.log("x degrees:" +lightsArray[$1].x)
		console.log("y degrees:" +lightsArray[$1].y)
		console.log("z degrees:" +lightsArray[$1].z)
		console.log("");
                
            }
            | REPEAT LP INT RP START statements END  {
                                                //$$ = rule ('statement', [$1], yylineno);
                                            }
            | REPEAT_WHILE LP INT RP START statements END  {
                                                //$$ = rule ('statement', [$1], yylineno);
                                            }
            ;

value: INT | STRING | ON | OFF | STROBE | LASER | SPOTLIGHT;

function main()

	local cHtml 	:= ''
	local n 		:= 10 
	local cStatic 	:= 'Test...'		
	
	TEXT TO cHtml 
		<!DOCTYPE html>
		<html>
		<head>		 
		  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		</head>
		<body>	
			<h3>Test Prepro...</h3><hr>			
	ENDTEXT
	
	for n := 1 to 10 
	
		TEXT cHtml PARAMS n, cStatic
			<ul>
				<li>Register <$ str(n) $> <$ cStatic $> <$ dtoc( date() + n ) $></li>
			</ul>		
		ENDTEXT
		
	next
	
	TEXT TO cHtml 
		</body>
		<html>	
	ENDTEXT	
	
retu cHtml
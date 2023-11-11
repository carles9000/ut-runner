#xcommand TEXT <into:TO,INTO> <v> => #pragma __cstream|<v>+=%s

function MyMenu()

	local cHtml := ''
	local cUser

	if ! USessionReady()
		//URedirect( '/runner/flow/login.html' )
		URedirect( 'login' )
		retu nil
	endif	
	
	USessionStart()	
	
	cUser := Usession( 'credentials' )[ 'user' ]
	
	cHtml := '<h3>Welcome ' + cUser + '</h3><h4>Menu</h4><hr>' 

	TEXT TO cHtml 
		<form action="dispatcher">
			
			<input type="submit" value="Order"      name='menu'>					
			<input type="submit" value="Statistic"  name='menu'>					
			<input type="submit" value="Logout"     name='menu'>					

		</form> 	
	ENDTEXT 

	
retu cHtml
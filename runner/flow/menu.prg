#xcommand TEXT <into:TO,INTO> <v> => #pragma __cstream|<v>+=%s

function Menu()

	local cHtml := ''
	local cUser

	if ! USessionReady()
		URedirect( '/runner/flow/login.html' )
		retu nil
	endif	
	
	USessionStart()	
	
	cUser := Usession( 'credentials' )[ 'user' ]
	
	cHtml := '<h3>Welcome ' + cUser + '</h3><h4>Menu</h4><hr>' 

	TEXT TO cHtml 
		<form action="/runner/flow/dispatcher.prg">
			
			<input type="submit" value="Order"      name='menu'>					
			<input type="submit" value="Statistic"  name='menu'>					
			<input type="submit" value="Logout"     name='menu'>					

		</form> 	
	ENDTEXT 

	
retu cHtml
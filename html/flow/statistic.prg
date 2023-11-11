function Statistic()

	local cHtml := ''
	
	if ! USessionReady()
		URedirect( 'login' )
		retu nil
	endif
	
	TEXT TO cHtml 
		<h3>Process: Statistic</h3><hr>
		<a href="menu">Go To menu</a>
	ENDTEXT 		
	
retu cHtml
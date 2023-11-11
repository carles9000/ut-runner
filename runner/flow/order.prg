function Order()

	local cHtml := ''
	
	if ! USessionReady()
		URedirect( '/runner/flow/login.html' )
		retu nil
	endif
	
	TEXT TO cHtml 
		<h3>Process: Order</h3><hr>
		<a href="/runner/flow/menu.prg">Go To menu</a>
	ENDTEXT 		
	
retu cHtml
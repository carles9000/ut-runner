function Logout()

	if ! USessionReady()
		URedirect( 'login' )
		retu nil
	endif
	
	USessionEnd()	

	URedirect( '/' )
	
retu ''
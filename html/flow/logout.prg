function Logout()

	local h
	
	if ! USessionReady()
		URedirect( 'login' )
		retu nil
	endif
	
	USessionEnd()	

	URedirect( '/' )
	
retu ''
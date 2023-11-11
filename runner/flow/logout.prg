function Logout()

	local h
	
	if ! USessionReady()
		URedirect( '/runner/flow/login.html' )
		retu nil
	endif
	
	USessionEnd()	


	URedirect( '/runner/flow/index.html' )
	
retu ''
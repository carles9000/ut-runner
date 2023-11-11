function Access()

	local h := UPost()
	local cMsg
	
	if h[ 'action' ] == 'Home'
		URedirect( '/runner/flow' )	
		retu nil 
	endif
	
	if lower( h[ 'user' ] ) == 'john' .and. h[ 'psw' ] == '123'
		
		USessionStart()								//	Init Session 
		Usession( 'credentials', h )				//	Save data to Session
		URedirect( '/runner/flow/menu.prg' )		
	else
	
		cMsg := '?msg=Error access !'
	
		URedirect( '/runner/flow/login.html' + cMsg )				
	endif

retu nil 
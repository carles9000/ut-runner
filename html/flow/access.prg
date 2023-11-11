function Access()

	local h := UPost()
	local cMsg
	
	if h[ 'action' ] == 'Home'
		URedirect( '/' )	
		retu nil 
	endif
	
	if lower( h[ 'user' ] ) == 'john' .and. h[ 'psw' ] == '123'
		
		USessionStart()							//	Init Session 
		Usession( 'credentials', h )				//	Save data to Session
		URedirect( 'menu' )		
	else
	
		cMsg := '?msg=Error access !'
	
		URedirect( 'login' + cMsg )				
	endif

retu nil 
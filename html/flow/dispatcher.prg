function Dispatcher()

	local h
	
	if ! USessionReady()
		URedirect( 'login' )
		retu nil
	endif
	
	h := UGet()
	
	do case
		case lower(h[ 'menu' ]) == 'order'		; URedirect( 'order' )
		case lower(h[ 'menu' ]) == 'statistic'	; URedirect( 'statistic' )			
		case lower(h[ 'menu' ]) == 'logout'	; URedirect( 'logout' )
	endcase	
	
retu ''
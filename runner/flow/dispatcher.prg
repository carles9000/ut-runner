function Dispatcher()

	local h
	
	if ! USessionReady()
		URedirect( '/runner/flow/login.html' )
		retu nil
	endif
	
	h := UGet()
	
	do case
		case lower(h[ 'menu' ]) == 'order'		; URedirect( '/runner/flow/order.prg' )
		case lower(h[ 'menu' ]) == 'statistic'	; URedirect( '/runner/flow/statistic.prg' )			
		case lower(h[ 'menu' ]) == 'logout'		; URedirect( '/runner/flow/logout.prg' )
	endcase	
	
retu ''
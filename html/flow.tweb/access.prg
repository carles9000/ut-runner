function Access( oDom )

	do case	
		
		case oDom:GetProc() == 'login'			; Upd_Login( oDom )								

		otherwise 				
			oDom:SetError( "Proc don't defined => " + oDom:GetProc())
	endcase
	
retu oDom:Send()	

// -------------------------------------------------- //

static function Upd_Login( oDom )

	local cUser 	:= lower( oDom:Get( 'user' ) )
	local cPsw 		:= lower( oDom:Get( 'psw' ) )
	local hData 	:= {=>}
	
	if cUser == 'john' .and. cPsw == '123'			
	
		hData[ 'user' ] := cUser 
		hData[ 'name' ] := 'John Kocinsky'
				
		USessionStart()
		Usession( 'credentials', hData )
		URedirect( 'menu' )
		
	else					

		oDom:SetError( 'User/Psw is wrong !' )			
		
	endif	

retu nil

// -------------------------------------------------- //

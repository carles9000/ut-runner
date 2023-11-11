function ws1()

	local h := {=>}
	
	h[ 'start' ] := Seconds()
	
	inkey(3)
	
	h[ 'end' ] := Seconds()
	
	UAddHeader("Content-Type", "application/json")
	
retu hb_jsonEncode( h )

//	------------------------------ //

function ws2()

	local cAlias, hRow 		
	
	USE 'data\test.dbf' shared new
	
	cAlias := Alias()
	
	(cAlias)->( DbGoto( hb_randomint(1,100) ) )
	
	hRow := { 	'_now' => hb_milliseconds(),;
				'_recno' => (cAlias)->( Recno() ),;
				'first' => alltrim((cAlias)->first), ;
				'last' => alltrim((cAlias)->last), ;
				'street' => alltrim((cAlias)->street), ;
				'age' => (cAlias)->age, ;
				'married' => (cAlias)->married;
			}
			
	UAddHeader("Content-Type", "application/json")
	
retu hb_jsonEncode( hRow )

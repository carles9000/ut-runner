function main()

	local cAlias, hRow, cHtml
	
	USE 'data\test.dbf' shared new
	
	cAlias := Alias()
	
	(cAlias)->( DbGoto( hb_randomint(1,100) ) )
	
	cHtml := '<h2>Table example with dbf</h2><hr>'
	cHtml += '<table border="1">'
	cHtml += '<tr>'
	cHtml += '<th>Recno</th>'
	cHtml += '<th>First</th>'
	cHtml += '<th>Last</th>'
	cHtml += '<th>Street</th>'
	cHtml += '<th>Age</th>'
	
	for n := 1 to 10 
	
		hRow := LoadRow( cAlias )
		
		cHtml += '<tr>'
		cHtml += '<td>' + str( hRow[ '_recno' ]) + '</td>'
		cHtml += '<td>' + hRow[ 'first' ] + '</td>'
		cHtml += '<td>' + hRow[ 'last' ] + '</td>'
		cHtml += '<td>' + hRow[ 'street' ] + '</td>'
		cHtml += '<td>' + str( hRow[ 'age' ] ) + '</td>'
		cHtml += '</tr>'
		
		(cAlias)->( DbSkip() )
	
	next
	
	cHtml += '</table>'		
	cHtml += '<br><div>'
	cHtml += '<button onClick="window.location.reload();">Refresh Page</button>'
	cHtml += '</div>'
	
	
retu cHtml

// --------------------------------------------- //

function LoadRow( cAlias )

	local hRow := {'_now' => hb_milliseconds(),;
					'_recno' => (cAlias)->( Recno() ),;
					'first' => alltrim((cAlias)->first), ;
					'last' => alltrim((cAlias)->last), ;
					'street' => alltrim((cAlias)->street), ;
					'age' => (cAlias)->age, ;
					'married' => (cAlias)->married;
				}
retu hRow
#include "lib/tweb/tweb.ch"

function main()

    LOCAL o, oWeb, oBrw, aOptions, aBtns
	LOCAL aData := LoadData()	

	DEFINE WEB oWeb TITLE 'Browse' 
	
		oWeb:cRootRelative = '../../'		
		
		DEFINE FORM o ID 'brw' API 'api_brw_basic' OF oWeb 
		
		INIT FORM o 

			ROWGROUP o
				SAY LABEL '<h4>Table example with dbf</h4><hr>' GRID 12 OF o
			ENDROW o
			
			
			ROWGROUP o 			
			
				COL o CLASS 'p-2' GRID 12									
				
					aOptions := { ;
						'height' => '300px'	;											
					}															
					
					DEFINE BROWSE oBrw ID 'mytable' OPTIONS aOptions TITLE '<h5>Customer list</h5>' OF o 										
						
						COL oCol TO oBrw CONFIG { 'title' => "Recno", 'field' => "_recno" }
						COL oCol TO oBrw CONFIG { 'title' => "First", 'field' => "first" }
						COL oCol TO oBrw CONFIG { 'title' => "Last", 'field' => "last" }
						COL oCol TO oBrw CONFIG { 'title' => "Street", 'field' => "street" }
						COL oCol TO oBrw CONFIG { 'title' => "Age", 'field' => "age" }
						
					INIT BROWSE oBrw DATA aData		
			
				ENDCOL o				
				
			ENDROW o

			ROWGROUP o
				BUTTON LABEL 'Refresh Page' ACTION 'window.location.reload();' OF o
			ENDROW o

		ENDFORM o

	INIT WEB oWeb RETURN

retu nil

// --------------------------------------------- //

function LoadData()

	local cDbf 	:= hb_dirbase() + '/data/test.dbf'
	local aRows 	:= {}
	local cAlias, hRow
	
	USE (cDbf) shared new
	
	cAlias := Alias()
	
	(cAlias)->( DbGoto( hb_randomint(1,100) ) )
	
	for n := 1 to 10 
	
		hRow := LoadRow( cAlias )
		
		Aadd( aRows, hRow )

		(cAlias)->( DbSkip() )
	
	next		
	
retu aRows

// --------------------------------------------- //

function LoadRow( cAlias )

	local hRow := {'_recno' => (cAlias)->( Recno() ),;
					'first' => alltrim((cAlias)->first), ;
					'last' => alltrim((cAlias)->last), ;
					'street' => alltrim((cAlias)->street), ;
					'age' => (cAlias)->age, ;
					'married' => (cAlias)->married;
				}
retu hRow
#include "lib/tweb/tweb.ch" 

function MyMenu()

	local cHtml := ''
	local cUser

	if ! USessionReady()
		URedirect( 'login' )
		retu nil
	endif	
	
retu View()			

//	--------------------------- //

static function View()

	DEFINE WEB oWeb TITLE 'Menu'
	
		NAV oNav ID 'nav' TITLE '&nbsp;My Enterprise...' LOGO 'files/images/mini-mercury.png' ;
			ROUTE 'menu' WIDTH 30 HEIGHT 30 sidebar  BURGUERLEFT OF oWeb		//	BURGUERLEFT ,  SIDEBAR [side 'right' ]

			MENU GROUP 'General' OF oNav
			
				MENUITEM 'Order' 	  ICON '<i class="fa fa-home" aria-hidden="true"></i>' ROUTE 'order' 	  OF oNav
				MENUITEM 'Statistic' ICON '<i class="fa fa-list" aria-hidden="true"></i>' ROUTE 'statistic' OF oNav 
				MENUITEM 'Logout' ICON '<i class="fa fa-times-circle" aria-hidden="true"></i>' ROUTE 'logout' 	OF oNav 
				
			ENDMENU OF oNav					
			
		DEFINE FORM o OF oWeb			

			HTML o 
				<div class="text-center">
					<h3>Main Menu...</h3><hr>					
				</div>
			ENDTEXT			
			
			
		ENDFORM o 				
		
	INIT WEB oWeb RETURN 

retu nil 
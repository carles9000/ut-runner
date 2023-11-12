#include "lib/tweb/tweb.ch" 

function Statistic()

	if ! USessionReady()
		URedirect( 'login' )
		retu nil
	endif
	
retu View()			

//	--------------------------- //

static function View()

    LOCAL o, oWeb
	
	DEFINE WEB oWeb TITLE 'Flow'
	
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
					<h3>Process: Statistic</h3><hr>
					<a href="menu">Go To menu</a>
				</div>
			ENDTEXT

		INIT FORM o

		ENDFORM o	
	
	INIT WEB oWeb RETURN

retu nil 

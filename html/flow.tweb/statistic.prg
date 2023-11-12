/*
	Este ejemplo es el mismo que order.prg pero con diferencias importantes
	1.- La vista no esta "embedida", sino que carga cada vez el fichero html.
	2.- Vemos como en el View() podemos recolectar datos para luego pasarlos al html y tratarlos
	3.- El html siempre debera estar con la ejecucion del programa. Si esta embedido
	    una vez se ha ejecutado y creado su hrb, se puede eliminar los fuentes para
		el cliente.
*/

#include "lib/tweb/tweb.ch" 

function Statistic()

	if ! USessionReady()
		URedirect( 'login' )
		retu nil
	endif
	
retu View()			

//	--------------------------- //

static function View()

	local cName 
	
	USessionStart()
	
	cName := USession( 'credentials' )[ 'name' ]

retu ULoadHtml( 'flow.tweb/view_statistic.html', cName )
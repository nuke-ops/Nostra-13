//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "modular_nostration\_maps\map_files\generic\CentCom_nostration.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "modular_nostration\map_files\Mining\Lavaland_nostration.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "modular_nostration\_maps\map_files\Deltastation\DeltaStation2_nostration.dmm"
		#include "modular_nostration\_maps\map_files\MetaStation\MetaStation_nostration.dmm"
		#include "modular_nostration\_maps\map_files\OmegaStation\OmegaStation_nostration.dmm"
		#include "modular_nostration\_maps\map_files\PubbyStation\PubbyStation_nostration.dmm"
		#include "modular_nostration\_maps\map_files\BoxStation\BoxStation_nostration.dmm"
		#include "modular_nostration\_maps\map_files\LambdaStation\lambda_nostration.dmm"

		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif

//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom_nostra.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Mining\Lavaland_nostra.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "map_files\Deltastation\DeltaStation2_nostra.dmm"
		#include "map_files\MetaStation\MetaStation_nostra.dmm"
		#include "map_files\OmegaStation\OmegaStation_nostra.dmm"
		#include "map_files\PubbyStation\PubbyStation_nostra.dmm"
		#include "map_files\BoxStation\BoxStation_nostra.dmm"
		#include "map_files\LambdaStation\lambda_nostra.dmm"

		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif

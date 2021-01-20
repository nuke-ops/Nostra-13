//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Mining\Lavaland.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "map_files\Deltastation\DeltaStation2_nostration.dmm"
		#include "map_files\MetaStation\MetaStation_nostration.dmm"
		#include "map_files\OmegaStation\OmegaStation_nostration.dmm"
		#include "map_files\PubbyStation\PubbyStation_nostration.dmm"
		#include "map_files\BoxStation\BoxStation_nostration.dmm"
		#include "map_files\LambdaStation\lambda.dmm"

		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif

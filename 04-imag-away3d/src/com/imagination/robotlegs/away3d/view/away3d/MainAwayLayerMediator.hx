package com.imagination.robotlegs.away3d.view.away3d;

import robotlegs.bender.bundles.mvcs.Mediator;

/**
 * ...
 * @author P.J.Shand
 */

@:rtti
@:keepSub
class MainAwayLayerMediator extends Mediator 
{
	@inject public var view:MainAwayLayer;
	
	public function new() 
	{
		
	}
	
	override public function initialize():Void
	{
		trace("MainAwayLayerMediator");
		view.initialize();
	}
}
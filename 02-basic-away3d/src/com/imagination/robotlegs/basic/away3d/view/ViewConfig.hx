package com.imagination.robotlegs.basic.away3d.view;

import openfl.display3D.Context3DProfile;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.stage3D.base.api.IRenderer;
import robotlegs.bender.extensions.stage3D.base.api.IStack;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;

import com.imagination.core.view.BaseViewConfig;

import com.imagination.robotlegs.basic.away3d.view.away3d.MainAwayLayer;
import com.imagination.robotlegs.basic.away3d.view.away3d.MainAwayLayerMediator;

import com.imagination.robotlegs.basic.away3d.view.away3d.display.ExampleAwayObject;
import com.imagination.robotlegs.basic.away3d.view.away3d.display.ExampleAwayObjectMediator;

/**
 * ...
 * @author P.J.Shand
 */

@:rtti
@:keepSub
class ViewConfig implements IConfig 
{
	@inject public var context:IContext;
	@inject public var mediatorMap:IMediatorMap;
	@inject public var stack:IStack;
	@inject public var renderer:IRenderer;
	@inject public var contextView:ContextView;
	
	public function new()
	{
		
	}
	
	public function configure():Void
	{
		context.afterInitializing(init);
	}
	
	private function init():Void
	{
		renderer.onReady.addOnce(OnContext3DReady);
		renderer.init("baseline", 0);
		renderer.start();
	}
	
	private function OnContext3DReady():Void 
	{
		mapMediators();
		initView();
		renderer.start();
	}
	
	private function mapMediators():Void 
	{
		mediatorMap.map(MainAwayLayer).toMediator(MainAwayLayerMediator);
		mediatorMap.map(ExampleAwayObject).toMediator(ExampleAwayObjectMediator);
	}
	
	private function initView():Void 
	{
		stack.addLayer(MainAwayLayer);
	}
}
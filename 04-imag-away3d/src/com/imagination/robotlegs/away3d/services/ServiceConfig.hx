package com.imagination.robotlegs.away3d.services;

import com.imagination.robotlegs.away3d.services.example.ExampleService;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

/**
 * ...
 * @author P.J.Shand
 */

@:rtti
@:keepSub
class ServiceConfig implements IConfig 
{
	@inject public var injector:IInjector;
	
	public function new() { }
	
	public function configure():Void
	{
		injector.map(ExampleService).asSingleton();
	}
}
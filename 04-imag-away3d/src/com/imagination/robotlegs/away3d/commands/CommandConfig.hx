package com.imagination.robotlegs.away3d.commands;

import robotlegs.bender.extensions.imag.impl.signals.AppSetupCompleteSignal;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;
import com.imagination.robotlegs.away3d.commands.example.ExampleCommand;

/**
 * ...
 * @author P.J.Shand
 */

@:rtti
@:keepSub
class CommandConfig implements IConfig 
{
	@inject public var commandMap:ISignalCommandMap;
	@inject public var injector:IInjector;
	
	public function new() { }
	
	public function configure():Void
	{
		//commandMap.map(ExampleSignal).toCommand(ExampleCommand);
		commandMap.map(AppSetupCompleteSignal).toCommand(ExampleCommand);
		
		// Only if not already mapped to a command
		//injector.map(ExampleSignal).asSingleton();
	}
}
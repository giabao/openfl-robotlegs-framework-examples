// ------------------------------------------------------------------------------
// Copyright (c) 2011 the original author or authors. All Rights Reserved.
//
// NOTICE: You are permitted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// ------------------------------------------------------------------------------

package robotlegs.bender.extensions.stage3D.flare3d.impl
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.stage3D.base.api.IDisplayObject;
	import robotlegs.bender.extensions.stage3D.flare3d.impl.FlareCollection;
	import robotlegs.bender.extensions.stage3D.flare3d.api.IFlare3DViewMap;
	
	/**
	 * The <code>Flare3DViewMap</code> class performs managing Flare3D scene and 
	 * views automatic mediation. When view is added or removed from scene, it will
	 * automatically create or destroy its mediator.
	 */	
	public class Flare3DViewMap implements IFlare3DViewMap	
	{
		/*============================================================================*/
		/* Public Properties                                                         */
		/*============================================================================*/
		
		//[Inject]
		/** Instance of View3D which contains scene receiving display objects. **/
		//public var view3D:View3D;
		
		[Inject]
		/** Collection of Starling views which will receive display objects. **/
		public var flareCollection:FlareCollection;
		
		[Inject]
		/** Map for mediating views. **/
		public var mediatorMap : IMediatorMap;
		
		/*============================================================================*/
		/* Constructor
		/*============================================================================*/
		public function Flare3DViewMap() { }
		
		[PostConstruct]
		/**
		 * Initialize listeners on Flare3D scene.
		 */		
		public function init() : void
		{
			// FIX
			/*var view3D:View3D;
			
			for each (view3D in flareCollection.items) 
			{
				// listen for ObjectContainer3D events
				if (!view3D) continue;
				view3D.scene.addEventListener( Scene3DEvent.ADDED_TO_SCENE, onSceneAdded );
				view3D.scene.addEventListener( Scene3DEvent.REMOVED_FROM_SCENE, onSceneRemoved );

				// add scene as view to allow a Flare3D Scene Mediator
				// Note : we don't support swapping scenes now - one scene will do.
				addFlare3DView( view3D.scene );
			}*/
		}

		/*============================================================================*/
		/* Public Methods
		/*============================================================================*/
		
		/** @inheritDoc **/
		public function addFlare3DView(view : *) : void
		{
			if( validateView(view))
			{
				if (view is IDisplayObject)
					IDisplayObject(view).init();
				mediatorMap.mediate(view);
			}
			else
				throw new Error("Not sure what to do with this view type..");
		}

		/** @inheritDoc **/
		public function removeFlare3DView(view : *) : void
		{
			if (view is IDisplayObject)
				IDisplayObject(view).destroy();
			mediatorMap.unmediate(view);
		}

		/*============================================================================*/
		/* Private Methods
		/*============================================================================*/
		
		/**
		 * Validate if view added on scene is of type either <code>Scene3D</code> or 
		 * <code>ObjectContainer3D</code>, and this is required since <code>Scene3D</code> 
		 * doesn't extend <code>ObjectContainer3D</code>.
		 * 
		 * @param view View that needs to be validated.
		 * 
		 * @return Returns <code>true</code> if view is of valid type, or <code>false</code>
		 * otherwise.
		 */		
		private function validateView(view:*):Boolean
		{
			return true;
			/*if( view is Scene3D || view is ObjectContainer3D ){
				return true;
			}else
				return false;*/
		}
		
		/**
		 * Handle view added to scene.
		 * 
		 * @param event View added to scene.
		 */	
		/*private function onSceneAdded(event : Scene3DEvent) : void
		{
			addFlare3DView(event.objectContainer3D);
		}*/
		
		/**
		 * Handle view removed from scene.
		 * 
		 * @param event View removed from scene.
		 */	
		/*private function onSceneRemoved(event : Scene3DEvent) : void
		{
			removeFlare3DView(event.objectContainer3D);
		}*/
	}
}
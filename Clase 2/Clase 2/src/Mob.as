package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class Mob extends Sprite 
	{
		public var skin:Sprite;
		
		public function Mob() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = DLoader.getAssets("bomb");
			skin = new c();
			addChild(skin);
		}
		
	}

}
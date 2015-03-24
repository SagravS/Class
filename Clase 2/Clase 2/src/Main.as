package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author
	 */
	public class Main extends Sprite
	{
		private var mob;
		var up:Boolean;
		var down:Boolean;
		var right:Boolean;
		var left:Boolean;
		var speed:int = 5;
		
		public function Main()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			DLoader.Load("assets.swf", goGame);
		}
		
		private function goGame():void
		{
			trace("game");
			mob = new Mob();
			addChild(mob);
			stage.addEventListener(Event.ENTER_FRAME, bucle);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUP);
		}
		
		private function keyUP(e:KeyboardEvent):void 
		{
			
			if (e.keyCode == Keyboard.W || e.keyCode == Keyboard.UP)
			{up = false;}
			if (e.keyCode == Keyboard.D || e.keyCode == Keyboard.RIGHT)
			{right = false;}
			if (e.keyCode == Keyboard.A || e.keyCode == Keyboard.LEFT)
			{left = false;}
			if (e.keyCode == Keyboard.S || e.keyCode == Keyboard.DOWN)
			{down = false;}
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W || e.keyCode == Keyboard.UP)
			{up = true;}
			if (e.keyCode == Keyboard.D || e.keyCode == Keyboard.RIGHT)
			{right = true;}
			if (e.keyCode == Keyboard.A || e.keyCode == Keyboard.LEFT)
			{left = true;}
			if (e.keyCode == Keyboard.S || e.keyCode == Keyboard.DOWN)
			{down = true;}
		}
		
		private function bucle(e:Event):void
		{
			if (up)
			{mob.y -= speed };
			if (down)
			{mob.y += speed };
			if (left)
			{mob.x -= speed };
			if (right)
			{mob.x += speed };
		}
	}

}
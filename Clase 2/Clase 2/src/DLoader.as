package 
{
	import flash.display.Loader;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author 
	 */
	public class DLoader 
	{
		static private var loader:Loader;
		static private var _callback:Function;
		
		static public function Load(url:String, callback:Function=null):void
		{
			loader = new Loader();
			_callback = callback;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.load(new URLRequest(url));
		}
		
		static private function onError(e:IOErrorEvent):void
		{
			trace("error");
		}
		static private function onComplete(e:Event):void
		{
			trace("complete");
			_callback();
		}
		static public function getAssets(name:String):Class
		{
			var c:Class = loader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
			return c;
		}
		
	}

}
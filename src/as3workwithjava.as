package
{
	import com.flashhtml5.core.AMFLoader;
	import com.flashhtml5.events.AMFLoaderevent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import projectTest.RoutTable.RouteType;
	
	public class as3workwithjava extends Sprite
	{
		public function as3workwithjava()
		{
			 
			trace("as3workwithjava")
			
			
			var javaloader:AMFLoader=new AMFLoader("1.baetestjava0.duapp.com","amf");
			//var javaloader:AMFLoader=new AMFLoader("demojava0.sdapp.cn","testAmf");
			
			javaloader.addEventListener(AMFLoaderevent.Event_OnData,doData)
			javaloader.addEventListener(AMFLoaderevent.Event_OnIOError,doDataIOError)
			javaloader.addEventListener(AMFLoaderevent.Event_OnDataError,doDataError)
				
			javaloader.request_get(RouteType.testrout1);
			
			
		}
		
		protected function doDataError(event:Event):void
		{
			// TODO Auto-generated method stub
			trace("DataError")
		}
		
		protected function doDataIOError(event:Event):void
		{
			// TODO Auto-generated method stub
			trace("ioError")
		}
		
		protected function doData(event:Event):void
		{
			// TODO Auto-generated method stub
			var targ:AMFLoader=event.target as AMFLoader;
			
			var data:Object=targ.data;
			
			
			trace(data.userName);
			
		}
	}
}
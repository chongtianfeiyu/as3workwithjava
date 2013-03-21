package com.flashhtml5.core
{
	import com.flashhtml5.configer.siteconfig;
	import com.flashhtml5.events.AMFLoaderevent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class AMFLoader extends EventDispatcher
	{
		/**
		 * 
		 * @param serverip ip或域名
		 * @param serverport 端品号
		 * @param servergate 入口名
		 * @param protoltype
		 * 
		 */		
		public function AMFLoader(serverip:String,servergate:String="AMFGATE",serverport:int=80,protoltype:String="http://")
		{
			
			config_gateurl=siteconfig.initloader(protoltype,serverip,serverport,servergate);
			
			child_loader=new URLLoader();
			
			child_loader.dataFormat=URLLoaderDataFormat.BINARY;
			
			child_loader.addEventListener(Event.COMPLETE,doDataLoaded)
			child_loader.addEventListener(IOErrorEvent.IO_ERROR,doDataLoadError)
			
			//child_loader.addEventListener(Event.COMPLETE,doDataLoaded)
			
		}
		
		
		protected function doDataLoadError(event:IOErrorEvent):void
		{
			// TODO Auto-generated method stub
			dispatchEvent(new Event(AMFLoaderevent.Event_OnIOError))
		}
		
		protected function doDataLoaded(event:Event):void
		{
			// TODO Auto-generated method stub
			var loadbytedata:ByteArray=event.target.data;
			
			try
			{
				
				loadbytedata.uncompress();
				
				data=loadbytedata.readObject();
				
				dispatchEvent(new Event(AMFLoaderevent.Event_OnData));
			
			} 
			catch(error:Error) 
			{
			
				dispatchEvent(new Event(AMFLoaderevent.Event_OnDataError))
			}
			
			
		}
		
		public function dispose():void{
		
			child_loader.removeEventListener(Event.COMPLETE,doDataLoaded)
			child_loader.removeEventListener(IOErrorEvent.IO_ERROR,doDataLoadError)
			
			child_loader=null;
		
		}
		
		public var data:*
		
		private var child_loader:URLLoader;
		
		private var config_gateurl:String;
		
		public function request_get(routetype:int,args:Array=null):void{
			
			var gateurl:String=config_gateurl;
			
			var getreq:URLRequest=getRequest(gateurl);
			
			trace("[request_get]"+getreq.url);
			
			child_loader.load(getreq)
		
		}
		
		
		private function getRequest(url:String,type:String="get",argdata:Dictionary=null):URLRequest{
		
		
				var request:URLRequest=new URLRequest(url);
				
				return request;
		
		}
		
		
	}
}
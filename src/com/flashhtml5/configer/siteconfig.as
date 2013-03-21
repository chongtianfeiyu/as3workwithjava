package com.flashhtml5.configer
{
	public class siteconfig
	{
		public function siteconfig()
		{
		}
		
		private  static var siteip:String;
		private  static var siteport:int;
		private  static var gate:String;
		private  static var prottype:String
		
		public static function initloader(protype:String,siteip:String,siteport:int,gate:String):String{
		
			siteconfig.prottype=protype;
			siteconfig.siteip=siteip;
			siteconfig.siteport=siteport;
			siteconfig.gate=gate;
			
			return getGateUrl()
			
		}
		
		private static function getGateUrl():String{
		
			var gatestr:String=prottype+siteip+":"+siteport+"/"+gate;
			
			return gatestr;
			
		}
		
		private static function getGateRouterUrl(router:String):String{
		
		
			var gateurl:String=getGateUrl();
			
			gateurl+="/"+router+"/"
				
				return gateurl;
		
		}
		
	}
}
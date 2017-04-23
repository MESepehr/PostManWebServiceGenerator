package
{
	import restDoaService.RestDoaServiceCaller;
	
	public class [ServiceName] extends RestDoaServiceCaller
	{
		public var data:* = {};
		
		public function [ServiceName](offlineDataIsOK_v:Boolean=true, instantOfflineData_v:Boolean=false, maximomOfflineData:Date=null)
		{
			super([myWebServiceLocation], data, offlineDataIsOK_v, instantOfflineData_v, maximomOfflineData, [IsGet]);
		}
		
		public function load():void
		{
			super.loadParam();
		}
	}
}
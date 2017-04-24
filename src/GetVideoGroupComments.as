package
{
	import restDoaService.RestDoaServiceCaller;
	
	public class GetVideoGroupComments extends RestDoaServiceCaller
	{
		public var data:Vector.<GetVideoGroupCommentsRespond> = new Vector.<GetVideoGroupCommentsRespond>() ;
		
		public function GetVideoGroupComments(offlineDataIsOK_v:Boolean=true, instantOfflineData_v:Boolean=false, maximomOfflineData:Date=null)
		{
			super('http://185.83.208.175:8076/api/Video/GetVideoGroupComments?videoGroupId=1026', data, offlineDataIsOK_v, instantOfflineData_v, maximomOfflineData, true);
		}
		
		public function load(videoGroupId:String):void
		{
			super.loadParam({videoGroupId:videoGroupId});
		}
	}
}
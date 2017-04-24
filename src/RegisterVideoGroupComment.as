package 
{
	import restDoaService.RestDoaServiceCaller;
	
	public class RegisterVideoGroupComment extends RestDoaServiceCaller
	{
		public var data:* = {};
		
		public function RegisterVideoGroupComment(offlineDataIsOK_v:Boolean=true, instantOfflineData_v:Boolean=false, maximomOfflineData:Date=null)
		{
			super('http://185.83.208.175:8076/api/video/RegisterVideoGroupComment', data, offlineDataIsOK_v, instantOfflineData_v, maximomOfflineData, false);
		}
		
		public function load(CommentText:String,UserId:String,VideoGroupId:int):void
		{
			super.loadParam({CommentText,UserId,VideoGroupId});
		}
	}
}
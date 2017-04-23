package
{
	import com.mteamapp.JSONParser;
	
	import contents.TextFile;
	
	import flash.desktop.NativeDragManager;
	import flash.display.Sprite;
	import flash.events.NativeDragEvent;
	import flash.filesystem.File;
	
	import otherPlatforms.postMan.ServiceGenerator;
	import otherPlatforms.postMan.model.PostManExportModel;
	
	public class WebServiceGenerator extends Sprite
	{
		public function WebServiceGenerator()
		{
			super();
			//register for the drag enter event
			addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, onDragged);
			
			//register for the drag drop event
			addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onDragged);
			
			var service:String = TextFile.load(File.desktopDirectory.resolvePath("Panjereh-video share.postman_collection.json"));
			//trace(service);
			var serviceData:PostManExportModel = new PostManExportModel();
			JSONParser.parse(service,serviceData);
			trace("serviceData : "+serviceData.item.length);
			var serviceGenerator:ServiceGenerator = new ServiceGenerator();
			for(var i:uint = 0 ; i<serviceData.item.length ; i++)
			{
				serviceGenerator.ServiceName = serviceData.item[i].name ;
				serviceGenerator.IsGet = serviceData.item[i].request.method=="GET" ;
				serviceGenerator.myWebServiceLocation = serviceData.item[i].request.url ;
				
				var serviceFile:File = File.desktopDirectory.resolvePath(serviceGenerator.ServiceName+'.as');
				TextFile.save(serviceFile,serviceGenerator.toString());
			}
		}
		
		protected function onDragged(event:NativeDragEvent):void
		{
			trace(event.dropAction);
		}
	}
}
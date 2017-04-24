package
{
	import contents.TextFile;
	
	import flash.display.Sprite;
	import flash.events.NativeDragEvent;
	import flash.filesystem.File;
	
	import otherPlatforms.postMan.PostManToASFiles;
	
	import restDoaService.RestDoaService;
	
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
				PostManToASFiles.saveClasses(File.desktopDirectory.resolvePath('classes'),service);
				//PostManToASFiles.SaveJSONtoAs(JSON.parse(service),File.desktopDirectory.resolvePath('classes'),'PostManMain');
			RestDoaService.setUp("http://");
			var myservice:GetVideoGroupComments = new GetVideoGroupComments();
			myservice.load('1026');
			var saveComment:RegisterVideoGroupComment = new RegisterVideoGroupComment();
			saveComment.load('hi',"78f242e7-c6ea-4879-93c0-500032350d65",1026);
		}
		
		protected function onDragged(event:NativeDragEvent):void
		{
			trace(event.dropAction);
		}
	}
}
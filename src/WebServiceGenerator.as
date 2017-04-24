package
{
	import contents.TextFile;
	
	import flash.desktop.ClipboardFormats;
	import flash.desktop.NativeDragManager;
	import flash.display.Sprite;
	import flash.events.NativeDragEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import otherPlatforms.postMan.PostManToASFiles;
	
	import restDoaService.RestDoaService;
	
	public class WebServiceGenerator extends Sprite
	{
		private var dragArea:Sprite ;
		
		public function WebServiceGenerator()
		{
			super();
			dragArea = new Sprite();
			dragArea.graphics.beginFill(0xffff00,1);
			dragArea.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
			this.addChild(dragArea);
			dragArea.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, onDragged);
			
			
			NativeDragManager.acceptDragDrop(this);
			//NativeDragManager.doDrag(;
			
			//var service:String = TextFile.load(File.desktopDirectory.resolvePath("Panjereh-video share.postman_collection.json"));
			//trace(service);
				//PostManToASFiles.saveClasses(File.desktopDirectory.resolvePath('classes'),service);
				//PostManToASFiles.SaveJSONtoAs(JSON.parse(service),File.desktopDirectory.resolvePath('classes'),'PostManMain');
			/*RestDoaService.setUp("http://");
			var myservice:GetVideoGroupComments = new GetVideoGroupComments();
			myservice.load('1026');
			var saveComment:RegisterVideoGroupComment = new RegisterVideoGroupComment();
			saveComment.load('hi',"78f242e7-c6ea-4879-93c0-500032350d65",1026);*/
		}
		
		private var currentFile:File;

		protected function onDragged(event:NativeDragEvent):void
		{
			var files:Array = event.clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
			currentFile = files[0];
			var arrPath:Array = currentFile.name.split('.');
			var type:String = arrPath[arrPath.length-1];
			if (!currentFile.isDirectory && (type == 'json' || type == 'txt')) {
				NativeDragManager.acceptDragDrop(dragArea);
				dragArea.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onDropped);
			}
		}
		
		private function onDropped(event:NativeDragEvent):void
		{
			dragArea.removeEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onDropped);
			PostManToASFiles.saveClasses(File.desktopDirectory,TextFile.load(currentFile));
		}
	}
}
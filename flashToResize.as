package  {
	import flash.external.ExternalInterface;
	import flash.text.TextField;
	import flash.display.*;
	import flash.events.Event;
	import flash.system.Security;
	import flash.system.SecurityDomain;
	
	public class flashToResize extends MovieClip{
		private var myStageHeight:Number = stage.stageHeight;
		private var myStageWidth:Number = stage.stageWidth;

		public function flashToResize() {
			introFunction();
		}
		
		private function introFunction():void{
			controls.slAlpha.addEventListener(Event.CHANGE, sliderChanged);
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;	
			Security.allowDomain("C:/vojtaciml/SlidesLive/WEB/SlidesLiveCSS/");
			var isAvailable:Boolean = ExternalInterface.available;
			ExternalInterface.call("sendData", controls.slAlpha.value);	
		}		
		
		private function sliderChanged(evt:Event):void {
			controls.statusTxt.appendText("Size: " + stage.stageWidth+" "+stage.stageHeight+" ")
			trace(controls.slAlpha.value);
			recalculatePositions();
		}
		
		private function recalculatePositions():void {
				var videoRatio:Number = (16/9);
				var slideRatio:Number = (4/3);
				videoImage.width = controls.slAlpha.value;
				videoImage.height = videoImage.width / videoRatio;
				
				slideImage.width = myStageWidth - 30 - videoImage.width;
				slideImage.height = slideImage.width / slideRatio;
				slideImage.x = videoImage.width + 20;
				
				controls.y = myStageHeight - controls.height;
			
				
				
				if(videoImage.height > slideImage.height){
					myStageHeight = videoImage.height + controls.height+20;								
				} else {
					myStageHeight = slideImage.height + controls.height+20;								
				}
				
				gradientik.height = myStageHeight;
				
				var result:Object = ExternalInterface.call("sendData", myStageHeight); 		
		
		}			

	}
}

package  {
import flash.external.ExternalInterface;
import flash.text.TextField;
import flash.display.Stage;
import flash.display.MovieClip;
	
	public class flashToResize extends MovieClip{

		public function flashToResize() {
			// constructor code
		}

	}
	
function sliderChanged(evt:Event):void {
    controls.statusTxt.appendText("Size: " + stage.stageWidth+" "+stage.stageHeight+" ")
	trace(controls.slAlpha.value);
	recalculatePositions();
}

function recalculatePositions():void {
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

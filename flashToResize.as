package  {
	import flash.external.ExternalInterface;
	import flash.text.TextField;
	import flash.display.*;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;	
	import flash.system.Security;
	import flash.system.SecurityDomain;
	
	public class flashToResize extends MovieClip{
		private var myStageHeight:Number = stage.stageHeight;
		private var myStageWidth:Number = stage.stageWidth;
		
		//Youtube
		public var playerYT:Object;
		public var loaderYT:Loader;
		private var videoParameter:String = "hdugASdZGiI";
		private var videoHeight:int = 298;
		private var videoWidth:int = 530;		

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
			initYoutube();
		}		
		
		private function sliderChanged(evt:Event):void {
			controls.statusTxt.text = ("Size: Image:  " + videoImage.height+" YT ldr: "+loaderYT.height+" YT player: "+playerYT.height+" \n") + controls.statusTxt.text;
			//controls.statusTxt.appendText("Size: Image:  " + videoImage.height+" YT: "+videoImage.playerYT+" \n")
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
		
		private function initYoutube():void {
			Security.allowDomain("www.youtube.com");  
			Security.allowDomain("youtube.com");  
			Security.allowDomain('s.ytimg.com');  
			Security.allowDomain('i.ytimg.com');	
			createYTPlayer();			
		}
		
		public function createYTPlayer():void {
			loaderYT = new Loader();
			loaderYT.contentLoaderInfo.addEventListener(Event.INIT, onLoaderInit);
			loaderYT.addEventListener(IOErrorEvent.IO_ERROR, YTLoaderError);
			var requestYT:URLRequest = new URLRequest("http://www.youtube.com/apiplayer?version=3");
			loaderYT.load(requestYT);
		}		
		
		private function YTLoaderError(e:IOErrorEvent):void {
			trace("YOUTUBE Module failed to load YT API Player");
		}
		
		private function onLoaderInit(e:Event):void {
			loaderYT.content.addEventListener("onReady", onPlayerReady);
			loaderYT.content.addEventListener("onError", onPlayerError);
			loaderYT.content.addEventListener("onStateChange", onPlayerStateChange);
			loaderYT.content.addEventListener("onPlaybackQualityChange", onVideoPlaybackQualityChange);
		}		
		
		private function onPlayerReady(event:Event):void {
			playerYT = loaderYT.content;
			playerYT.setSize(videoWidth, videoHeight);
			playerYT.cueVideoById(videoParameter, 0, "large");
			trace("YOUTUBE Player created");
			videoImage.addChild(loaderYT);
		}
		
		private function onPlayerError(event:Event):void {
			trace("YOUTUBE Player error");			
		}

		
		
		private function onPlayerStateChange(event:Event):void {

		}
		
		private function onVideoPlaybackQualityChange(event:Event):void {
			
		}				

	}
}

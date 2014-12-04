package 
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import MathForKids.Bg;
	
	/**
	 * ...
	 * @author Saket Kumar
	 */
	public class Main extends Sprite 
	{
		public var canvas:Canvas;
		private var bg:Bg;
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			bg = new Bg();
			addChild(bg);
			var scale:Number = Math.min(stage.stageWidth / (bg.width-400), stage.stageHeight / (bg.height-400));
			bg.scaleX = scale;
			bg.scaleY = scale;
			
			bg.x = stage.stageWidth - bg.width >> 1;
			bg.y = stage.stageHeight - bg.height >> 1;
			
			canvas = new Canvas();
			addChild(canvas);
			canvas.init();
			// new to AIR? please read *carefully* the readme.txt files!
		}
		
		private function deactivate(e:Event):void 
		{
			// auto-close
	//		NativeApplication.nativeApplication.exit();
		}
		
	}
	
}
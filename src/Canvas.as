package  
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import view.Exit;
	import view.Problem;
	import view.Settings;
	
	/**
	 * ...
	 * @author Saket Kumar
	 */
	public class Canvas extends Sprite 
	{
		public static const maxWidth:Number = 600;
		public static const maxHeight:Number = 800;
		public var home:Home;
		public var problem:Problem;
		public var settings:Settings;
		public var exit:Exit;
		private var controller:Controller;
		public static var i:Canvas;
		public function Canvas() 
		{
			i = this;
			controller = new Controller();
			home = new Home();
			problem = new Problem();
			settings = new Settings();
			exit = new Exit();
			home.enableRate();
			controller.home = home;
		}
		
		public function init():void
		{
			cleanUp();
			addChild(home);
			fixToScreen();
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN, handleBack, false, 0, true);
		}
		private function cleanUp():void
		{
			while (this.numChildren > 0) {
				removeChildAt(0);
			}
		}
		
		private function fixToScreen():void 
		{
			var scale:Number = Math.min(stage.stageWidth / this.width, stage.stageHeight / this.height);
			this.scaleX = scale;
			this.scaleY = scale;
			
			this.x = stage.stageWidth - this.width >> 1;
			this.y = stage.stageHeight - this.height >> 1;
		}
		
		public function showProblem():void
		{
			problem.init();
			addChild(problem);
			showHomeContent();
		}
		
		public function handleBack(e:KeyboardEvent):void 
		{
			if (KeyboardEvent.KEY_DOWN) {
				e.preventDefault();
				e.stopImmediatePropagation();
				if (settings.parent) {
					settings.close();
					showHomeContent();
				}else if (problem.parent) {
					problem.showQuestion();
					removeChild(problem);
					home.disableHomeButton();
					showHomeContent();
				}else {
					addChild(exit);
				}
			}
		}
		
		public function showSettings():void
		{
			settings.refresh();
			addChild(settings);
			home.enableHomeButton();
			showHomeContent();
		}
		
		public function showHome():void
		{
			if (problem.parent) {
				problem.showQuestion();
				removeChild(problem);
			}
			settings.close();
			home.disableHomeButton();
			showHomeContent();
		}
		
		public function addBackEvenetListener():void
		{
			if (stage.hasEventListener(KeyboardEvent.KEY_DOWN)) {
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, handleBack);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, handleBack);
			}else {
				stage.addEventListener(KeyboardEvent.KEY_DOWN, handleBack);
			}
			
		}
		
		public function showHomeContent():void
		{
			if (problem.parent || settings.parent) {
				home.hide();
			}else {
				home.show();
			}
		}
	}

}
package view 
{
	import com.theconfluence.control.Button;
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import MathForKids.ExitClip;
	
	/**
	 * ...
	 * @author Saket Kumar
	 */
	public class Exit extends Sprite 
	{
		private var _exitClip:ExitClip;
		
		public function Exit() 
		{
			_exitClip = new ExitClip();
			_exitClip.x = 50;
			_exitClip.y = 190;
			addChild(_exitClip);
			var btn:Button
			btn = new Button(_exitClip.btnYes, yes);
			_exitClip.addChild(btn);
			btn = new Button(_exitClip.btnNo, no);
			_exitClip.addChild(btn);
		}
		
		private function no(e:MouseEvent):void 
		{
			if (this.parent) {
				this.parent.removeChild(this);
			}
		}
		
		private function yes(e:MouseEvent):void 
		{
			NativeApplication.nativeApplication.exit();
		}
		
	}

}
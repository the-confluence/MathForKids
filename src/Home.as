package
{
	import com.theconfluence.control.Button;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import MathForKids.HomeClip;
	
	/**
	 * ...
	 * @author Saket Kumar
	 */
	public class Home extends Sprite
	{
		private var _homeClip:HomeClip;
		private var _buttonClips:Array;
		private var _buttons:Array;
		
		public function Home()
		{
			_homeClip = new HomeClip();
			addChild(_homeClip);
			_buttonClips = [_homeClip.btnRate, _homeClip.btnHome, _homeClip.btnSettings, _homeClip.btnAdd, _homeClip.btnSubtract, _homeClip.btnMultiply, _homeClip.btnDivide];
			_buttons = [];
			var btn:Button;
			for each (var btnClip:MovieClip in _buttonClips)
			{
				btn = new Button(btnClip, Controller.i.handleHomeButtons);
				_buttons.push(btn);
				addChild(btn);
			}
			disableHomeButton();
			disableRate();
		}
		
		public function disableHomeButton():void
		{
			for each (var btn:Button in _buttons)
			{
				if (btn.name == 'btnHome')
				{
					btn.state = Button.DISABLED;
				}
			}
		}
		
		public function disableRate():void
		{
			for each (var btn:Button in _buttons)
			{
				if (btn.name == 'btnRate')
				{
					btn.state = Button.DISABLED;
				}
			}
		}
		
		public function enableHomeButton():void
		{
			for each (var btn:Button in _buttons)
			{
				if (btn.name == 'btnHome')
				{
					btn.state = Button.ENABLED;
				}
			}
		}
		
		public function enableRate():void
		{
			if (Controller.i.settings.counter < 100) {
				return;
			}
			for each (var btn:Button in _buttons)
			{
				if (btn.name == 'btnRate')
				{
					btn.state = Button.ENABLED;
				}
			}
		}
		
		public function fixToScreen():void
		{
			/*_buttons[0].y = -this.parent.y;
			_buttons[1].y = -this.parent.y;*/
		}
		
		public function hide():void 
		{
			_homeClip.bg.visible = false;
			_homeClip.btnAdd.visible = false;
			_homeClip.btnSubtract.visible = false;
			_homeClip.btnMultiply.visible = false;
			_homeClip.btnDivide.visible = false;
			
		}
		
		public function show():void 
		{
			_homeClip.bg.visible = true;
			_homeClip.btnAdd.visible = true;
			_homeClip.btnSubtract.visible = true;
			_homeClip.btnMultiply.visible = true;
			_homeClip.btnDivide.visible = true;
		}
	
	}

}
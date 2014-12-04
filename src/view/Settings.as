package view 
{
	import com.theconfluence.control.Button;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import MathForKids.SettingsClip;
	
	/**
	 * ...
	 * @author Saket Kumar
	 */
	public class Settings extends Sprite 
	{
		private var _difficultyLevels:Array = ['Easy', 'Medium', 'Hard'];
		private var _settingsClip:SettingsClip;
		private var _isChangedDifficulty:Boolean = false;
		public function Settings() 
		{
			_settingsClip = new SettingsClip();
			_settingsClip.x = 50;
			_settingsClip.y = 190;
			addChild(_settingsClip);
			_settingsClip.btnDifficulty.addEventListener(MouseEvent.CLICK, changeDifficulty);
			_settingsClip.btnSound.addEventListener(MouseEvent.CLICK, changeSound);
			refresh();
			var btn:Button = new Button(_settingsClip.btnClose, close);
			_settingsClip.addChild(btn);
		}
		
		public function close(e:MouseEvent = null):void 
		{
			if (this.parent) {
				this.parent.removeChild(this);
			}
			Controller.i.disableHomeButton();
			if (_isChangedDifficulty && Canvas.i.problem.parent) {
				Controller.i.loadProblem(Controller.i.problem.operation);
				_isChangedDifficulty = false;
			}
			Canvas.i.showHomeContent();
		}
		
		private function changeSound(e:MouseEvent):void 
		{
			Controller.i.settings.setSound(!Controller.i.settings.sound);
			refresh();
		}
		
		public function refresh():void 
		{
			_settingsClip.btnDifficulty.txt.text = Controller.i.settings.difficulty;
			_settingsClip.btnSound.txt.text = Controller.i.settings.sound?'On':'Off';
		}
		
		private function changeDifficulty(e:MouseEvent):void 
		{
			_isChangedDifficulty = true;
			var index:int = _difficultyLevels.indexOf(Controller.i.settings.difficulty);
			index++;
			index = index % 3;
			Controller.i.settings.setDifficulty(_difficultyLevels[index]);
			refresh();
		}
		
	}

}
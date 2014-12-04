package model 
{
	import flash.net.SharedObject;
	/**
	 * ...
	 * @author Saket Kumar
	 */
	public class Settings 
	{
		private var _settings:SharedObject;
		private static const SETTINGS_PATH:String = 'mathforkids/settings';
		public static const EASY:String = 'Easy';
		public static const MEDIUM:String = 'Medium';
		public static const HARD:String = 'Hard';
		public var sound:Boolean;
		public var counter:int;
		public var difficulty:String;
		public function Settings() 
		{
			_settings = SharedObject.getLocal(SETTINGS_PATH);
			if (_settings.data.hasOwnProperty('sound')) {
				sound = _settings.data.sound;
			}else {
				sound = true;
				_settings.data.sound = sound;
			}
			if (_settings.data.hasOwnProperty('difficulty')) {
				difficulty = _settings.data.difficulty;
			}else {
				difficulty = EASY;
				_settings.data.difficulty = difficulty;
			}
			if (_settings.data.hasOwnProperty('counter')) {
				counter = _settings.data.counter;
			}else {
				counter = 0;
				_settings.data.counter = counter;
			}
			_settings.flush();
		}
		
		public function setSound(value:Boolean):void
		{
			sound = value;
			_settings.data.sound = sound;
			_settings.flush();
		}
		public function setDifficulty(value:String):void
		{
			difficulty = value;
			_settings.data.difficulty = difficulty;
			_settings.flush();
		}
		public function incrementCount():void
		{
			counter++;
			_settings.data.counter = counter;
			_settings.flush();
		}
		
	}

}
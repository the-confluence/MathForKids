package view
{
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.media.SoundChannel;
	import MathForKids.ProblemClip;
	import Sound.Flip;
	
	/**
	 * ...
	 * @author Saket Kumar
	 */
	public class Problem extends Sprite 
	{
		public static const QUESTION:String = 'question';
		public static const ANSWER:String = 'answer';
		private var _problemClip:ProblemClip;
		private var _state:String;
		private var _flip:Flip;
		private var _scFlip:SoundChannel;
		public function Problem() 
		{
			_problemClip = new ProblemClip();
			_problemClip.x = 50;
			_problemClip.y = 190;
			addChild(_problemClip);
			this.addEventListener(MouseEvent.CLICK, flip);
			_flip = new Flip();
		}
		
		private function flip(e:MouseEvent):void 
		{
			this.removeEventListener(MouseEvent.CLICK, flip);
			TweenLite.to(_problemClip, .4, { x:50 + _problemClip.width * .49, scaleX:.01, onComplete:changeSide } );
			if (_state == QUESTION && Controller.i.settings.sound) {
				_flip.play();
			}
		}
		
		private function changeSide():void 
		{
			if (_state == QUESTION) {
				showAnswer();
			}else if (_state == ANSWER) {
				Controller.i.loadProblem(Controller.i.problem.operation);
				showQuestion();
			}
			TweenLite.to(_problemClip, .4, { x:50, scaleX:1, onComplete:activate } );
		}
		
		private function activate():void 
		{
			this.addEventListener(MouseEvent.CLICK, flip);
		}
		
		public function init():void 
		{
			showQuestion();
		}
		
		public function showQuestion():void
		{
			_problemClip.gotoAndStop(1);
			_problemClip.num1.text = String(Controller.i.problem.num1);
			_problemClip.num2.text = String(Controller.i.problem.num2);
			_problemClip.operation.text = String(Controller.i.problem.operation);
			_problemClip.result.text = '';
			_state = QUESTION;
		}
		
		private function showAnswer():void
		{
			_problemClip.gotoAndStop(2);
			_problemClip.result.text = String(Controller.i.problem.result);
			_state = ANSWER;
			Controller.i.settings.incrementCount();
		}
		
	}

}
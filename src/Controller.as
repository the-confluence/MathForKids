package  
{
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import model.Problem;
	import model.Settings;
	/**
	 * ...
	 * @author Saket Kumar
	 */
	public class Controller 
	{
		public static var i:Controller;
		public var settings:Settings;
		public var problem:Problem;
		public var home:Home;
		public function Controller() 
		{
			settings = new Settings();
			problem = new Problem();
			i = this;
		}
		
		public function handleHomeButtons(e:MouseEvent):void
		{
			var name:String = e.target.name;
			switch (name) 
			{
				case 'btnAdd':
					problem.operation = Problem.OPERATION_ADD;
					loadProblem(problem.operation);
				break;
				case 'btnSubtract':
					problem.operation = Problem.OPERATION_SUBTRACT;
					loadProblem(problem.operation);
				break;
				case 'btnMultiply':
					problem.operation = Problem.OPERATION_MULTIPLY;
					loadProblem(problem.operation);
				break;
				case 'btnDivide':
					problem.operation = Problem.OPERATION_DIVIDE;
					loadProblem(problem.operation);
				break;
			case 'btnHome':
					Canvas.i.showHome();
				break;
				case 'btnSettings':
					Canvas.i.showSettings();
				break;
				case 'btnRate':
					var req:URLRequest = new URLRequest('market://details?id=air.air.com.bewitchedgames.mathoperations');
					navigateToURL(req);
				break;
				default:
			}
		}
		
		public function loadProblem(operation:String):void 
		{
			var max:int;
			var n1:int;
			var n2:int;
			if (settings.difficulty == Settings.EASY) {
				if (operation == Problem.OPERATION_MULTIPLY || operation == Problem.OPERATION_DIVIDE) {
					max = 5;
				}else {
					max = 9;
				}
			}else if (settings.difficulty == Settings.MEDIUM) {
				if (operation == Problem.OPERATION_MULTIPLY || operation == Problem.OPERATION_DIVIDE) {
					max = 10;
				}else {
					max = 99;
				}
			}else if (settings.difficulty == Settings.HARD) {
				if (operation == Problem.OPERATION_MULTIPLY || operation == Problem.OPERATION_DIVIDE) {
					max = 25;
				}else {
					max = 999;
				}
			}
			n1 = Math.ceil(Math.random() * max);
			n2 = Math.ceil(Math.random() * max);
			switch (operation) 
			{
				case Problem.OPERATION_ADD:
					if (n1 > n2) {
						problem.num1 = n1;
						problem.num2 = n2;
					}else {
						problem.num1 = n2;
						problem.num2 = n1;
					}
					problem.result = problem.num1 + problem.num2;
				break;
				case Problem.OPERATION_SUBTRACT:
					if (n1 > n2) {
						problem.num1 = n1;
						problem.num2 = n2;
					}else {
						problem.num1 = n2;
						problem.num2 = n1;
					}
					problem.result = problem.num1 - problem.num2;
				break;
				case Problem.OPERATION_MULTIPLY:
					if (n1 > n2) {
						problem.num1 = n1;
						problem.num2 = n2;
					}else {
						problem.num1 = n2;
						problem.num2 = n1;
					}
					problem.result = problem.num1 * problem.num2;
				break;
				case Problem.OPERATION_DIVIDE:
					problem.num1 = n1*n2;
					problem.num2 = n1;
					problem.result = n2;
				break;
				default:
			}
			showProblem();
		}
		
		private function showProblem():void 
		{
			Canvas.i.showProblem();
			home.enableHomeButton();
		}
		public function disableHomeButton():void
		{
			if (!Canvas.i.problem.parent) {
				home.disableHomeButton()
			}
		}
	}

}
package com.theconfluence.control 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Saket Kumar
	 */
	public class Button extends Sprite 
	{
		public static const ENABLED:int = 1;
		public static const DISABLED:int = 0;
		
		private const OUT:int = 1;
		private const OVER:int = 2;
		private const DOWN:int = 3;
		private const DISABLE:int = 4;
		
		private var _enabled:Boolean = false;
		private var _functionNormal:Function;
		private var _clip:MovieClip;
		public function Button(clip:MovieClip, fn:Function) 
		{
			_clip = clip;
			addChild(_clip);
			name = _clip.name;
			this.buttonMode = false;
			this.mouseChildren = false;
			_functionNormal = fn;
			enable();
		}
		
		private function enable():void
		{
			try {
				if (!_enabled) {
					if (_functionNormal != null) {
						this.buttonMode = true;
						this.addEventListener(MouseEvent.MOUSE_OVER, handleMouseOver);
						this.addEventListener(MouseEvent.MOUSE_OUT, handleMouseOut);
						this.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
						this.addEventListener(MouseEvent.CLICK, handleClick);
						_clip.gotoAndStop(OUT);
						_enabled = true;
					}else {
						throw(new Error("please attach the function before trying to enable it."));
					}
				}
			}catch (e:Error) {
				trace(e.message);
			}
		}
		
		private function disable():void
		{
			this.buttonMode = false;
			if (this.hasEventListener(MouseEvent.MOUSE_OVER)) {
				this.removeEventListener(MouseEvent.MOUSE_OVER, handleMouseOver);
			}
			if (this.hasEventListener(MouseEvent.MOUSE_OUT)) {
				this.removeEventListener(MouseEvent.MOUSE_OUT, handleMouseOut);
			}
			if (this.hasEventListener(MouseEvent.MOUSE_DOWN)) {
				this.removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			}
			if (this.hasEventListener(MouseEvent.CLICK)) {
				this.removeEventListener(MouseEvent.CLICK, handleClick);
			}
			_clip.gotoAndStop(DISABLE);
			_enabled = false;
		}
		
		private function handleClick(e:MouseEvent):void 
		{
			_functionNormal(e);
		}
		
		private function handleMouseDown(e:MouseEvent):void 
		{
			_clip.gotoAndStop(DOWN);
		}
		
		private function handleMouseOut(e:MouseEvent):void 
		{
			_clip.gotoAndStop(OUT);
		}
		
		private function handleMouseOver(e:MouseEvent):void 
		{
			_clip.gotoAndStop(OVER);
		}
		
		public function isEnabled():Boolean 
		{
			return _enabled;
		}
		
		public function set state(value:int):void {
			if (value == Button.ENABLED) {
				enable();
			}else if (value == Button.DISABLED) {
				disable();
			}
		}
	}

}
package com.helladank.smashmyguy.game.enemies 
{
	import com.helladank.smashmyguy.game.Game;
	import com.helladank.smashmyguy.game.Window;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	
	/**
	 * ...
	 * @author Ryan Wirth
	 */
	public class Enemy extends MovieClip
	{
		public static const DEATH_TIME_LEFT:int = 60;
		
		private var _finalX:int;
		private var _window:Window;
		private var _game:Game;
		private var _alive:Boolean;
		private var _deathTimeLeft:int = 0;
		
		public function Enemy(textures:Vector.<Texture>, window:Window, initialX:int, finalX:int) 
		{
			super(textures, 4);
			
			play();
			textureSmoothing = TextureSmoothing.NONE;
			
			_alive = true;
			_window = window;
			_finalX = finalX;
			x = initialX;
		}
		
		public function tick():void
		{
			if (!_alive)
			{
				if (_deathTimeLeft <= 0) destroy();
				else _deathTimeLeft--;
				return;
			}
			
			x++;
			
			if (x >= _finalX + width) {
				destroy();
			}
		}
		
		public function kill():void
		{
			_alive = false;
			_deathTimeLeft = DEATH_TIME_LEFT;
		}
		
		public function destroy():void
		{
			_window.removeEnemy(this);
			_window = null;
			removeFromParent(true);
		}
		
		public function get IS_ALIVE():Boolean
		{
			return _alive;
		}
	}
	
}
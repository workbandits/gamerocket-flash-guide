package com.workbandits.gamerocket.guide
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.gamerocket.as3.*;
	
	public class CreatePlayer extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			GameRocket.initialize(Environment.PRODUCTION, "your_apikey", "your_secretkey");
			
			var playerOptions:Object = new Object();
			playerOptions.name = "a_player_name";
			playerOptions.locale = "a_player_locale"; // Example: en_US or fr_FR
			
			Player.create(playerOptions, function(player:Object, response:Response):void {
				if (response.success) {
					trace(player.id);
				} else {
					trace(response.error);
				}
			});
		}
	}
}
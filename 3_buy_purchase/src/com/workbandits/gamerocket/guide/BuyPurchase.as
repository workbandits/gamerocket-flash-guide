package com.workbandits.gamerocket.guide
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.gamerocket.as3.*;
	
	public class BuyPurchase extends Sprite 
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

			var parameters:Object = new Object();
			parameters.player = "use_player_id";

			Purchase.buy("unlock-content", parameters, function(result:Object, response:Response):void {
				if (response.success) {
					trace (result.data.message);
				} else {
					trace (response.error);
				}
			});
		}
	}
}
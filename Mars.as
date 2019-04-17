package
{
	import flash.display.MovieClip;
	import flash.events.*
		import flash.geom.Point;

	public class Mars extends MovieClip
	{
		const R: Number = 180 / 3.1416;
		const sunD:Number=2.279 //*10^8 km
		const camD:Number=2.55
		const D:Number=6794 //km
		const speed:Number=24     //km/s
		const kmTopixel:Number=0.0157;
		var day:Number=0
		var x0,y0:Number
		var a0:Number=2.3
		var m1,m2:MovieClip

		public function Mars()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event: Event): void
		{
			m1=MovieClip(root).map1;
			m2=MovieClip(root).map2;
			stage.addEventListener(Event.ENTER_FRAME, ef);
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		private function onRemovedFromStage(event: Event): void
		{
			stage.removeEventListener(Event.ENTER_FRAME, ef);
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		private function ef(event: Event): void
		{
			day++
			x0=sunD*Math.sin(-0.00915*day+a0)
			y0=sunD*Math.cos(-0.00915*day+a0)
			//trace(0.00915*sunD* Math.cos(-0.00915*day+a0))		
			/*
			trace(Math.abs(x0-MovieClip(parent).home.sunD)-0.01*(2.55-y0))
			if(Math.abs(x0-MovieClip(parent).home.sunD)<0.01*(2.55-y0))
			{
				//visible=true;
				width=270/(2.55-5*y0);
				height=width;
				x=450-40000*(MovieClip(parent).home.sunD-x0)/(2.55-y0)
			}*/
			trace(x)
			x+=-0.00915*sunD* Math.cos(-0.00915*day+a0)//-MovieClip(parent).home.v*MovieClip(parent).home.vrate*0.0000288;
			//width=270/(2.55-y0);
			//height=width

			//trace(MovieClip(root).map2.model_mars.x)
			MovieClip(root).map2.model_mars.x=MovieClip(root).map2.center.x+(x0*MovieClip(root).map2.path.mars.width)/(2*sunD);
			MovieClip(root).map2.model_mars.y=MovieClip(root).map2.center.y+(y0*MovieClip(root).map2.path.mars.height)/(2*sunD);

            //x+=kmTopixel*speed*Math.sin(0.0091*day);//Math.sin(speed*sec*/sunDistance)
			//width=D*kmTopixel*
			
		}
	}
}
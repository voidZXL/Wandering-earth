package
{
	import flash.display.MovieClip;
	import flash.events.*
		import flash.geom.Point;

	public class star extends MovieClip
	{
		const R: Number = 180 / 3.1416;


		public function star()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event: Event): void
		{
			stage.addEventListener(Event.ENTER_FRAME, ef);
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		private function onRemovedFromStage(event: Event): void
		{
			stage.removeEventListener(Event.ENTER_FRAME, ef);
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		public function cross()
		{
			//x = Math.random() *
		}
		private function ef(event: Event): void
		{

			x -= MovieClip(parent).home.vx*scaleX
			y -= MovieClip(parent).home.vy*scaleY

					var mp: Point = new Point(x, y)
		var mx = MovieClip(parent).localToGlobal(mp).x
		var my = MovieClip(parent).localToGlobal(mp).y


			if (mx > 0 && mx < 800 && my < 600 && my > 0)
			{
				visible = true;

				//gotoAndStop(2);
			}
			else
			{
				visible = false;
			}
			if (mx < -800)
			{
				x = 1000 + 1000 * Math.random() + MovieClip(parent).x
				y = 600 * Math.random()
			}
			if (my > 700 && MovieClip(parent).home.vy <= 0)
			{
				x = 1000 * Math.random()
				y = 400 * Math.random() - 600
			}
			if (my < -100 && MovieClip(parent).home.vy >= 0)
			{
				x = 1000 * Math.random()
				y = 400 * Math.random() + 800
			}
		}
	}
}
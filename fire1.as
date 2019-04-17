package
{
	import flash.display.MovieClip;
	import flash.events.*

	public class fire1 extends MovieClip
	{
		public var on: Boolean = false;
		public function fire1()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event: Event): void
		{
			MovieClip(parent).fire.push(MovieClip(this));
			   gotoAndStop(2);
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		private function onRemovedFromStage(event: Event): void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		public function ignite()
		{
			if(!on)
			{
			gotoAndPlay(2);
			on=true
			}
		}
		public function ext()
		{
			if(on)
			{
			gotoAndPlay("out");
			on=false
			}
		}
	}
}
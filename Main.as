package
{
	import flash.display.MovieClip;
	import flash.events.*

	public class Main extends MovieClip
	{

		public function Main()
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
		private function ef(event: Event): void
		{

		}
	}
}
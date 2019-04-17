package
{
	import flash.display.*;
	import flash.events.*
		import flash.text.TextField

	public class earth extends MovieClip
	{

		var f: int = 0
		var v: Number = 1
		const vrate:Number=16
		public var sunD:Number=1.69;
		var vx, vy: Number;
        var day:int=257;
		var t:int=0;
		var year:int=2032;
		var w: Number = 0
		const R: Number = 180 / 3.1416;
		var fv: Number = 1
		var fw: Number = 1
		var r: Number = 0
		var aw: Number = 0
		var maxw: Number = 0.1
		public var fire: Array = new Array();


		public function earth()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event: Event): void
		{

			stage.addEventListener(Event.ENTER_FRAME, ef);
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//trace("asssssssssssssss")
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		private function onRemovedFromStage(event: Event): void
		{
			stage.removeEventListener(Event.ENTER_FRAME, ef);
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		public function control(sx: Number, sy: Number)
		{
			r = Math.atan2(sy - y, sx - x) * R;
			//trace(rotation - r)
			if(w!=0&&MovieClip(parent).sp.keydown)
			{

				//MovieClip(parent).lineFromTo(x,y,sx,sy);
				MovieClip(parent).join.gotoAndStop(1)
				
				MovieClip(parent).join.x = x
				MovieClip(parent).join.y = y
				MovieClip(parent).join.rotation = r;
				MovieClip(parent).join.width = sx - x;
			}
			else
			{
				MovieClip(parent).join.gotoAndStop(3)
			}
			if (rotation < r - 2)
			{
				fw = 1;
				for (var i: int = 0; i < fire.length; i++)
				{
					if (fire[i].y < -100 + 2*(r - rotation))
					{
						fire[i].ignite();
						f++;
					}
					else
					{
						fire[i].ext();
					}
				}
				w = 0.03 + f / 200
				f = 0;
			}
			else if (rotation > r + 2)
			{
				fw = 1;
				for (var j: int = 0; j < fire.length; j++)
				{
					if (fire[j].y > 100 + 2*(r - rotation))
					{
						fire[j].ignite();
						f++;
					}
					else
					{

						fire[j].ext();
					}
				}
				w = -0.03 - f / 200
				f = 0;
			}
			else
			{
				for (var k: int = 0; k < fire.length; k++)
				{
					fire[k].ext();
				}
				fw = 0.8
				aw = 0
				if (flame.rotation < -90.2)
				{
					flame.rotation += 0.2
				}
				else if (flame.rotation > -89.8)
				{
					flame.rotation -= 0.2
				}
				//w=0;
			}
		}
		private function ef(event: Event): void
		{
			vx = v * Math.cos(rotation / R)
			vy = v * Math.sin(rotation / R)
			if (Math.abs(vy) > 0)
			{
				MovieClip(parent).line.visible = true
			}
			else
			{
				MovieClip(parent).line.visible = false
			}


			MovieClip(parent).line.y -= vy;
			//TEXT
			t++;
			if(t>30)
			{
				t=0;
				day++;
			}
			//trace(sunD)
			if(day>365)
			{
				day=0;
				year++;
			}
			sunD+=v*vrate*0.0000288;
			
			MovieClip(root).inf.yeartxt.text=String(year)
			MovieClip(root).inf.daytxt.text=String(day)
			MovieClip(root).inf.vtxt.text=String(v*vrate)
			MovieClip(root).inf.dtxt.text=String(sunD.toFixed(3))
			MovieClip(root).map2.model_earth.x=MovieClip(root).map2.center.x+sunD*23
			MovieClip(root).map1.e1.y=(y-MovieClip(parent).line.y)/33
			MovieClip(root).map1.s1.y=(MovieClip(parent).sp.y-y)/33
			////////
			rotation += w

			flame.rotation -= 0.1 * w / fw
			if (w > maxw)
			{
				w = maxw;
			}
			if (w < -maxw)
			{
				w = -maxw;
			}
			if (Math.abs(w) < 0.03)
			{
				w = 0;
			}
			//trace(flame.rotation)
			w *= fw;
		}
	}
}
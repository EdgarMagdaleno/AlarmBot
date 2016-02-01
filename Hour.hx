class Hour {
	private var hours:Collar<Int>;
	private var minutes:Collar<Int>;
	private var seconds:Collar<Int>;

	private var hourString:String;
	private var minuteString:String;
	private var secondString:String;

	public function new(?h:Int = 0, ?m:Int = 0, ?s:Int = 0):Void {
		populate();

		hours.setIndex(h);
		minutes.setIndex(m);
		seconds.setIndex(s);
	}

	public function populate():Void {
		hours = new Collar<Int>();
		minutes = new Collar<Int>();
		seconds = new Collar<Int>();

		for ( i in 0 ... 24)
			hours.push(i);

		for ( i in 0 ... 60 ) {
			minutes.push(i);
			seconds.push(i);
		}
	}

	public function getTime():String {
		if ( hours.get() < 10 ) hourString = "0" + hours.get();
		else hourString = "" + hours.get();

		if ( minutes.get() < 10 ) minuteString = "0" + minutes.get();
		else minuteString = "" + minutes.get();

		if ( seconds.get() < 10 ) secondString = "0" + seconds.get();
		else secondString = "" + seconds.get(); 

		return hourString + ":" + minuteString + ":" + secondString;
	}

	public function setHour(?h:Int, ?m:Int, ?s:Int):Void {
		hours.setIndex(h);
		minutes.setIndex(m);
		seconds.setIndex(s);
	}

	public function sync(hour:Hour):Void {
		hours.setIndex(hour.hours.pointer);
		minutes.setIndex(hour.minutes.pointer);
		seconds.setIndex(hour.seconds.pointer);
	}

	public function now():String {
		return Date.now().toString().substring(11);
	}
}
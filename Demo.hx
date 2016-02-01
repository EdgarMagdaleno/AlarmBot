class Demo {
	private var option:Int;
	private var input = Sys.stdin();
	private var alarms:Array<Alarm>;

	public static function main():Void {
		new Demo();
	}
	
	public function new():Void {
		alarms = new Array<Alarm>();
		do {
			Sys.println(" - Alarm Bot - ");
			Sys.println("[1] \t Start" );
			Sys.println("[2] \t Create alarm" );
			Sys.println("[3] \t List alarms");
			Sys.println("[4] \t Exit");
			Sys.print("Option: ");
			option = Std.parseInt(input.readLine());

			switch (option) {
				case 1: alarmLoop();
				case 2: createAlarm();
				case 3: print();
				case 4: Sys.exit(0);
				default: Sys.println("ERROR: Invalid option");
			}			
		} while (option != 4);
	}

	public function createAlarm():Void {
		Sys.print("Hour: ");
		var hours:Int = Std.parseInt(input.readLine());

		Sys.print("Minute: ");
		var minutes:Int = Std.parseInt(input.readLine());

		Sys.print("Seconds: ");
		var seconds:Int = Std.parseInt(input.readLine());

		Sys.print("Message: ");
		var message:String = input.readLine();
		alarms.push(new Alarm(hours, minutes, seconds, message));
	}

	public function alarmLoop():Void {
		Sys.print("Checking...");
		while ( true ) {
			for ( alarm in alarms ) 
				if ( alarm.isTriggered() ) 
					Sys.print("\nAlarm triggered! " + alarm.message);
			Sys.sleep(1);
		}
	}

	public function print():Void {
		for ( i in 0 ... alarms.length )
			if ( alarms[i].message != null ) 
				Sys.println("Alarm " + i + ": " + alarms[i].getTime() + " " + alarms[i].message);
	}
}
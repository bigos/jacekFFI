// gui vala

// here passing strings works
public static void print_experiment (string a) {
	stdout.printf("printFing %s\n", a);
}

int zzz () {
	int status = 7;
	return status;
}

[CCode (cname = "comFn", has_target = false)]
public delegate unowned string ComResult (int a);
 
public static ComResult afni = null;

public static void set_afni (ComResult fn) {
	global::afni = fn;
	stdout.printf("setting pointer \n");
}

[CCode ( cname = "myCallback", has_target = false)]
delegate int MyCallback (int a);

static int myMult (int x, int y, MyCallback fn ) {
	var res = x * x;
	stdout.printf("%d\n", res);

	stdout.printf("Callbacked %d\n", fn (3) );
	return (res * 2);
}

public static int vala_main (string[] args) {
	var app = new Gui ();	
	return app.run (args);
}

public class Gui : Gtk.Application {
	public Gui () {
		Object (
			application_id : "org.jacek.vala1",
			flags : ApplicationFlags.FLAGS_NONE
			);
	}	

	protected override void activate () {
		var main_window = new Gtk.ApplicationWindow (this);
		main_window.default_height = 300;
		main_window.default_width = 300;
		main_window.title = "Hello World";				

		string res = global::afni(2+5);
		string da_label = @"blah $res";
		Gtk.Label label = new Gtk.Label (da_label);
		main_window.add (label);
		main_window.show_all ();
	}
}

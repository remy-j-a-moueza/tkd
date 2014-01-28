/**
 * Tk interpreter module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.interpreter.tk;

/**
 * Imports.
 */
import std.conv;
import tcltk.tk;
import tkd.interpreter.tcl;

/**
 * Simple singleton wrapper for the Tk interpreter.
 */
class Tk : Tcl
{
	/**
	 * An instance of this tk interpreter.
	 */
	private static Tk _instance;

	/**
	 * Create the interpreter and initialise it.
	 *
	 * Throws:
	 *     Exception if Tk interpreter cannot be initialised.
	 */
	protected this()
	{
		super();

		debug this._log.info("Inititalising Tk");

		if (Tk_Init(this._interpreter) != TCL_OK)
		{
			throw new Exception(Tcl_GetStringResult(this._interpreter).to!(string));
		}
	}

	/**
	 * Get the instance of this class.
	 *
	 * Returns:
	 *     If An instance doesn't exist, one is created and returned.
	 *     If one already exists, that is returned.
	 */
	public static Tk getInstance()
	{
		if (Tk._instance is null)
		{
			Tk._instance = new Tk();
		}
		return Tk._instance;
	}

	/**
	 * Run the tk main loop, show the gui and start processing events.
	 */
	public void run()
	{
		debug this._log.info("Running Tk main loop");

		Tk_MainLoop();
	}
}

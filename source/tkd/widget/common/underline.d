/**
 * Underline module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.common.underline;

/**
 * These are common commands that apply to all widgets that have them injected.
 */
mixin template Underline()
{
	/**
	 * Underline one of the characters in the widget text.
	 *
	 * Params:
	 *     index = The index of the character to underline.
	 */
	public void underlineChar(int index)
	{
		this._tk.eval("%s configure -underline %s", this.id, index);
	}
}

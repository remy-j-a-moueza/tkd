/**
 * Widget module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.textwidget;

/**
 * Imports.
 */
import std.string;
import tkd.element.uielement;
import tkd.image.image;
import tkd.image.imageposition;
import tkd.widget.widget;

/**
 * The text widget base class.
 *
 * See_Also:
 *     $(LINK2 ./widget.html, tkd.widget.widget)
 */
abstract class TextWidget : Widget
{
	/**
	 * The name of the text variable that contains the widget's text.
	 */
	protected string _textVariable;

	/**
	 * The image of this widget.
	 */
	protected Image _image;

	/**
	 * Construct the widget.
	 *
	 * Params:
	 *     parent = An optional parent of this widget.
	 *
	 * See_Also:
	 *     $(LINK2 ../element/uielement.html, tkd.element.uielement)
	 */
	public this(UiElement parent = null)
	{
		super(parent);

		this._elementId    = "textwidget";
		this._textVariable = format("variable-%s", this.generateHash(this.id));
	}

	/**
	 * Set the widget text.
	 *
	 * Params:
	 *     text = The widget text.
	 */
	public void setText(string text)
	{
		this._tk.setVariable(this._textVariable, text);
	}

	/**
	 * Get the widget text.
	 *
	 * Returns:
	 *     A string containing the widget text.
	 */
	public string getText()
	{
		return this._tk.getVariable(this._textVariable);
	}

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

	/**
	 * Set the image for this widget.
	 *
	 * Params:
	 *     image = The image to set on the widget.
	 *     imagePosition = The position of the image relative to the text.
	 *
	 * See_Also:
	 *     $(LINK2 ../image/image.html, tkd.image.image) $(BR)
	 *     $(LINK2 ../image/png.html, tkd.image.png) $(BR)
	 *     $(LINK2 ../image/gif.html, tkd.image.gif) $(BR)
	 *     $(LINK2 ../image/imageposition.html, tkd.image.imageposition) $(BR)
	 */
	public void setImage(Image image, string imagePosition = ImagePosition.image)
	{
		this._image = image;

		this._tk.eval("%s configure -image %s", this.id, this._image.id);
		this.setImagePosition(imagePosition);
	}

	/**
	 * Change the position of the image in relation to the text.
	 *
	 * Params:
	 *     imagePosition = The position of the image relative to the text.
	 *
	 * See_Also:
	 *     $(LINK2 ../image/imageposition.html, tkd.image.imageposition)
	 */
	public void setImagePosition(string imagePosition)
	{
		this._tk.eval("%s configure -compound %s", this.id, imagePosition);
	}

	/**
	 * Set the text character width.
	 *
	 * Params:
	 *     characterWidth = The width of characters to set the label to.
	 */
	public void setTextCharacterWidth(int characterWidth)
	{
		this._tk.eval("%s configure -width %s", this.id, characterWidth);
	}
}
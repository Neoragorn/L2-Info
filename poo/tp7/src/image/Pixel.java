package image;

import java.lang.Math;
import image.color.GrayColor;

public class Pixel
{
	/**
	* Attribut de type Graycolor
	* Correspond à la couleur du pixe
	*/
	private GrayColor color;

	/**
	* Constructeur de la classe Pixel
	*/
	public Pixel(GrayColor color)
	{
		this.color = color;
	}

	/**
	* @param color : Couleur choisie pour le pixel
	* Methode changeant la couleur Graycolor du pixel
    */

	public void setColor(GrayColor color)
	{
		this.color = color;
	}

	/** 
	* @return le couleur Graycolor du pixel 
	*/
	public GrayColor getColor()
	{
		return this.color;
	}

	/** 
	* Methode verifiant si un objet est identique au pixel
	* @return true si identique, sinon false
	*/

	public boolean equals(Object o)
	{
		if (o instanceof Pixel)
		{
			Pixel new_o = (Pixel)o;
			return (this.color == new_o.getColor());
		}
		else
			return false;
	}

	/**
	* Methode calculant la difference de couleur entre deux pixels 
	* @param : p Le pixel qu'on va comparer
	* @return la difference entre les couleurs
	*/ 
	public int colorDifference(Pixel p)
	{
		int result = (this.color.getLevel()) - (p.color.getLevel());

		result = Math.abs(result);
		return result;
	}
}
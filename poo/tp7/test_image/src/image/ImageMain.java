package image;

import image.color.*;

public class ImageMain
{
	public static void main (String[] args)
	{
		ImageDisplayer image_display = new ImageDisplayer();
		String file = new String(args[0]);
		Image cadre = new Image(800, 600);
		Image image = cadre.initImagePGM(file);
		Image image_contours = image.edge(Integer.parseInt(args[1]));
		Image image_gray = image.decreaseGrayLevels(Integer.parseInt(args[2])); 
		image_display.display(image,"Image",100,100);
		image_display.display(image_contours,"Edge",500,100);
		image_display.display(image_gray,"Gray Levels",900,100);
	}
}
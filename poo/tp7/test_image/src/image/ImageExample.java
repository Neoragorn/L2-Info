package image;

import image.color.*;

public class ImageExample
{
	public static void main(String[] args)
	{
		Image t = new Image(100, 200);
		for (int i = 10 ; i <= 30 ; i++) {
			for (int j = 30 ; j <= 60 ; j++) {
				t.getPixel(i,j).setColor(GrayColor.BLACK);
			}
		}
		for (int k = 50 ; k <= 70 ; k++) {
			for (int l = 50 ; l <= 100 ; l++) {
				t.getPixel(k,l).setColor(new GrayColor(64));
			}
		}
		for (int m = 20 ; m <= 40 ; m++) {
			for (int n = 110 ; n <= 160 ; n++) {
				t.getPixel(m,n).setColor(new GrayColor(230));
			}
		}
		ImageDisplayer image_display = new ImageDisplayer();
		image_display.display(t,"T",100,200);
		Image c1 = t.edge(10);
		image_display.display(c1, "T2", 100,200);
		Image c2 = t.edge(20);
		image_display.display(c2, "T3", 100,200);
		Image c3 = t.edge(30);
		image_display.display(c3, "T4", 100,200);
		Image c4 = t.edge(150);
		image_display.display(c4, "T5", 100,200);
	}
}
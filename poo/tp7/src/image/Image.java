package image;

import image.Image;
import image.color.*;

import java.util.*;

public class Image
{
    private Pixel[][] pixeltab;
    private int largeur;
    private int hauteur;

    /** 
    * Constructeur de la classe image
    * @param: largeur , hauteur les tailles de l'image
    */
    public Image(int largeur, int hauteur)
    {
        this.pixeltab = new Pixel[hauteur][largeur];        
        this.largeur = largeur;
        this.hauteur = hauteur;
        for (int i = 0; i < hauteur; i++)
            for (int j = 0; j < largeur; j++)
                this.pixeltab[i][j] = new Pixel(GrayColor.WHITE);
    }

    /** 
    * @return la largeur de l'image
    */
    public int getWidth()
    {
        return this.largeur;
    }

    /**
    * @return la hauteur de l'image
    */
    public int getHeight()
    {
        return this.hauteur;
    }

    /**
    * @param x : la position en abscisse du pixel
    * @param y : la position en ordonnée du pixel
    * Methode renvoyant le pixel en (x,y)
    * @return le pixel en x et y
    */    
    public Pixel getPixel(int x, int y) throws ArrayIndexOutOfBoundsException
    {
        if (x > this.largeur && y > this.hauteur)
            throw new ArrayIndexOutOfBoundsException();
        if (x < 0 && y < 0)
            throw new ArrayIndexOutOfBoundsException();
        return (this.pixeltab[y][x]);
    }

    /** 
    * @param x = la position en abscisse du pixel
    * @param y = la position en ordonnée du pixel
    * @param color = Couleur avec laquelle on veut changer le pixel
    * @exception = renvoie l'exception ArrayIndexOutOfBoundException
    * si le x et le y sont hors de l'image
    * Methode changeant la couleur du pixel en x et y
    */
    public void changeColorPixel(int x, int y, GrayColor color)
    {
        try
        {
            Pixel p = this.getPixel(x,y);
            p.setColor(color);
        }
        catch (ArrayIndexOutOfBoundsException e)
        {
            System.out.print("Error on changing color pixel\n");
        }

    }

    /**
     * @param threshold = Seuil fixé pour l'extraction des contours
     * @return l'image obtenue après extraction des contours
     */

 public Image edge(int threshold)
 {
        Image new_image = new Image(this.getWidth(),this.getHeight());
        for (int j = 0 ; j != this.getHeight() - 1; j++) {
            for (int i = 0 ; i != this.getWidth() - 1; i++) {
                if (j == this.getHeight() - 1) {
                    Pixel pixelCourant = this.pixeltab[j][i];    
                    Pixel pixelDroit = this.pixeltab[j][i+1];
                    if (pixelCourant.colorDifference(pixelDroit) > threshold)
                        new_image.getPixel(i,j).setColor(GrayColor.BLACK);
                }
                else {
                    if (i == this.getWidth() - 1) {
                            Pixel pixelCourant = this.pixeltab[j][i];    
                            Pixel pixelBas = this.pixeltab[j+1][i];
                            if (pixelCourant.colorDifference(pixelBas) > threshold)
                            new_image.getPixel(i,j).setColor(GrayColor.BLACK);
                    }
                    else {
                        Pixel pixelCourant = this.pixeltab[j][i];    
                        Pixel pixelDroit = this.pixeltab[j][i+1];
                            Pixel pixelBas = this.pixeltab[j+1][i];
                            if ((pixelCourant.colorDifference(pixelDroit) > threshold)
                                || (pixelCourant.colorDifference(pixelBas) > threshold))
                                new_image.getPixel(i,j).setColor(GrayColor.BLACK);
                        }

                    }
                }
            }
            return new_image;
    }

    /**
     * @param nbGrayLevels = niveau de gris pour modifier l'image
     * @return Image modifiée en fonction du niveau de gris
     */
    public Image decreaseGrayLevels(int nbGrayLevels)
    {
        Image new_image = new Image(this.largeur, this.hauteur);
        int   t = 256 / nbGrayLevels;

        for (int i = 0; i < this.hauteur; i++)
        {
            for (int j = 0; j < this.largeur; j++)
            {
                int k = (this.getPixel(j,i).getColor().getLevel()) / t;
                GrayColor new_color = new GrayColor(k * t);
                new_image.getPixel(j,i).setColor(new_color);
            }
        }
            return new_image;
    }

    // ======================================================================
    /** Reads a PGM image from file.
     * It is assumed that file respect the following PGM file syntax:
     *  <ul><li> first line with string "P2"</li>
     *  <li>second line : a comment</li> 
     *  <li>one int for width <code>w</code>, one int for height<code>h</code></li>
     *  <li>one int for max gray level (not used here, we consider this level to be 255 in our images)</li>
     *  <li><code>w</code> x <code>h</code> integers between 0 and max (for us =255) for each pixel</li></ul>
     *  
     *  @param fileName the name of the file with the image
     */

    public static Image initImagePGM(String fileName)
    {
        Scanner scan = new Scanner(Image.class.getResourceAsStream(fileName));

        scan.nextLine(); // line P2
        scan.nextLine(); // line comment
        // read width
        int width = scan.nextInt();
        // read height        
        int height = scan.nextInt();
        // read max gray level (not used)
        scan.nextInt(); 
        // create an initially white image
        Image result = new Image(width, height); 
        // rad pixels
        for (int x = 0; x < height; x++) {
            for (int y = 0; y < width; y++) {
                result.changeColorPixel(y, x, new GrayColor (scan.nextInt()));
            }
        }
        return result;
    }
}

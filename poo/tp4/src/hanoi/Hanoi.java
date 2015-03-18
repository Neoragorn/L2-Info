/**
 * Classe implementant le probleme des tours de Hanoi
 * @author Casier Sofian
 */

package hanoi;

import hanoi.utils.*;
import io.*;

public class Hanoi
{
	/**
	* Constructeur de la classe Hanoi
	*/
	private Tower[] my_towers;

	public Hanoi() 
	{
		this.my_towers = new Tower[3];
		Tower t1 = new Tower(Tower.nb_disk_max);
		Tower t2 = new Tower(Tower.nb_disk_max);
		Tower t3 = new Tower(Tower.nb_disk_max);
		for (int i = Tower.nb_disk_max ; i != 0; i--)
			t1.putDisk(new Disk(i));
		my_towers[0] = t1;
		my_towers[1] = t2;
		my_towers[2] = t3;
	}

	/**
	* @return le tableau de Tower du jeu
	*/

	public	Tower[] getTowers()
	{
		return this.my_towers;
	}

	/**
	* @param a, b : Verifie les valeurs des disques les plus haut de deux tours
	* @return true si la valeur de a est supérieure a b
	*/

	public boolean check_value_disk(int a, int b)
	{
		if (b == 0)
			return true;
		if (a > b)
			return false;
		return true;
	}

	/**
	* @param a , b : deux Tower
	* Bouge un disk de la tour A a la tour B puis affiche le jeu
	*/

	public void move_disk(Tower a, Tower b)
	{
		if (check_value_disk(a.getTopDiskValue(), b.getTopDiskValue()))
		{
			Disk d = a.takeDisk();
			if (d != null)
				b.putDisk(d);
		}
		display_game();
	}

	/**
	* Methode s'occupant de la résolution du probleme d'Hanoi
	* @param nb : Nombre de disques restant sur la premiere tour
	*         a, b, c : les towers entre lesquelles vont etre echangés les disk
	*/

	public void resolution_move(int nb, Tower a, Tower b, Tower c)
	{
		if (nb == 1)
			move_disk(a, b);
		else
			{
				resolution_move(nb - 1, a, c, b);
				move_disk(a, b);
				resolution_move(nb - 1, c, b, a);
			}
	}
	
	/**
	* Methode s'occupant de l'affichage du jeu
	*/

	public void display_game()
	{
		int nb_d = Tower.nb_disk_max;
		int	last = 0;
		int	i = this.getTowers()[0].getDisk() - 1;
		int	y = this.getTowers()[1].getDisk() - 1;
		int	z = this.getTowers()[2].getDisk() - 1;

		if (i >= y && i >= z)
			last = i;
		else if (y >= i && y >= z)
			last = y;
		else 
			last = z;
		System.out.print("\n"); 
		System.out.print("\n******************************************************\n\n");  
		while (nb_d != 0 && last >= 0)
		{
			System.out.print("|\t");
			if (this.getTowers()[0].getTowerDisk()[last] != null)
			{
				this.getTowers()[0].getTowerDisk()[last].afficherTaille();
				nb_d--;
				i--;
			}
			System.out.print("\t|\t"); 
			if (this.getTowers()[1].getTowerDisk()[last] != null)
			{
				this.getTowers()[1].getTowerDisk()[last].afficherTaille();
				nb_d--;
				y--;
			}
			System.out.print("\t|\t"); 
			if (this.getTowers()[2].getTowerDisk()[last] != null)
			{
				this.getTowers()[2].getTowerDisk()[last].afficherTaille();
				nb_d--;
				z--;
			}
			System.out.print("\t|"); 
			last--;
			System.out.print("\n"); 
		}
		System.out.print("\n--------------------------------------------------\n");
	}

	/**
	* Methode lançant la résolution automatique d'Hanoi
	*/

	public void resolution_game()
	{
		resolution_move(this.my_towers[0].getDisk(), this.my_towers[0],
			this.my_towers[2], this.my_towers[1]);
	}

	/**
	* Methode s'occupant de récupérer les input afin de permettre
	* à l'utilisateur de modifier les tours et les disk
	*/

	public void interactive_game()
	{
		HanoiInput input = new HanoiInput();
		boolean start = input.isMove();
		int		check_resolution = 0;

		while (start && (this.getTowers()[2].getDisk() != Tower.nb_disk_max))
		{
			try
			{
				input.readInput();
				String cmd = new String(input.getFrom()+""+input.getTo());
				if (cmd.equals("01"))
					this.move_disk(this.getTowers()[0], this.getTowers()[1]);
				else if (cmd.equals("02"))
					this.move_disk(this.getTowers()[0], this.getTowers()[2]);
				else if (cmd.equals("10"))
					this.move_disk(this.getTowers()[1], this.getTowers()[0]);
				else if (cmd.equals("12"))
					this.move_disk(this.getTowers()[1], this.getTowers()[2]);
				else if (cmd.equals("20"))
					this.move_disk(this.getTowers()[2], this.getTowers()[0]);
				else if (cmd.equals("21"))
					this.move_disk(this.getTowers()[2], this.getTowers()[1]);
				else if (cmd.equals("00"))
				{
					if (check_resolution == 0)
					{
						resolution_move(this.my_towers[0].getDisk(), this.my_towers[0],
							this.my_towers[2], this.my_towers[1]);
						System.out.print("Cheating is bad !\n");
					}
					else
						System.out.print("Too late for resolution ! You have to try again or finish the level!\n");
				}
				if (check_resolution != 0)
					display_game();
				check_resolution++;
			}
			catch (IllegalStateException e)
			{
				start = !start;
			}

		}
		System.out.print("Game finished!\n");
	}

	/**
	* Methode débutant le jeu
	*/

	public void	begin_game()
	{
		System.out.println("Game Start !");
		display_game();
		interactive_game();
	}

	/**
	* Fonction main
	* Renvoi une exception si aucun argument n'est donné au lancement du programme
	*/

	public static void main(String[] args)
	{
		System.out.print("\n\nBonjour, voici une version simplifié du probleme des tours d'Hanoi.\n");
		System.out.print("Pour jouer, il suffit d'ecrire les tours entre lesquelles on veut deplacer les disques.\n");
		System.out.print("'g' pour la tour gauche. 'c' poru la tour centrale et 'd' pour la tour à droite\n");
		System.out.print("Ainsi, pour deplacer un disque de gauche à droite, il suffit d'écrire 'gd'.\n");
		System.out.print("Pour quitter le jeu, il faut ecrire 'quit'\n");
		System.out.print("Si résoudre le probleme est trop difficile, vous pouvez taper 'gg', uniquement au début de la partie, pour voir la solution. Bon jeu !\n");
		try
		{
			Tower.nb_disk_max = Integer.parseInt(args[0]);
			Hanoi game = new Hanoi();
			if (Tower.nb_disk_max != 0)
				game.begin_game();
			else
				System.out.print("Impossible de demarrer avec une capacite maximale de 0\n");
		}
		catch (ArrayIndexOutOfBoundsException e)
		{
			System.out.print("Erreur. Vous devez mettre un nombre en argument pour la capacité maximale des tours\n");			
		}
	} 
}
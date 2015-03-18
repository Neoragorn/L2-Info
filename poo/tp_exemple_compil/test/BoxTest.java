import org.junit.*;
import static org.junit.Assert.*;

import example.util.Box;   

public class BoxTest {	

    @Test
    public void testBoxCreation() {
        Box someBox = new Box(10);
        assertNotNull(someBox);
    }
    
    @Test
    public void donnePoids() {
        Box someBox = new Box(10);
        assertEquals(someBox.getWeight(),10);
    }



    // ---Pour permettre l'exécution des test----------------------
    public static junit.framework.Test suite() {
        return new junit.framework.JUnit4TestAdapter(BoxTest.class);
    }

}

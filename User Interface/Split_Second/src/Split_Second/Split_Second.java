
package Split_Second;

import UIFrames.Login_Menu;
/*import com.mysql.jdbc.Connection;*/

/**
 *
 * @author Ronaldo Vindas
 */
public class Split_Second {

    public static String username = null;
    public static int identification;        
            
   /* private static Connection con;
    private static final String driver="com.mysql.jdbc.Driver";
    private static final String user="root";
    private static final String pass="2296";
    private static final String url="jdbc:mysql://localhost:3306/pr";        
   */
    public static void main(String[] args) {
       Login_Menu menu = new Login_Menu();
       menu.setVisible(true);
    }
    
}

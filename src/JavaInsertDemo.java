import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
public class JavaInsertDemo {
   public static void main(String[] args) {
      Connection conn = null;
      Statement stmt = null;
      try {
       
      
      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ethar_java", "root", "2003");
      System.out.println("Connection is created successfully:");
      stmt = (Statement) conn.createStatement();
      String query1 = "INSERT INTO donors " + "VALUES ('Noo23', 'Now' , 'AbuFoo','N12423')";
      stmt.executeUpdate(query1);
      query1 = "INSERT INTO donors " + "VALUES ('may3', 'may' , 'saud','mi423')";
      stmt.executeUpdate(query1);
      System.out.println("Record is inserted in the table successfully..................");
      } catch (SQLException excep) {
         excep.printStackTrace();
      } catch (Exception excep) {
         excep.printStackTrace();
      } finally {
         try {
            if (stmt != null)
               conn.close();
         } catch (SQLException se) {}
         try {
            if (conn != null)
               conn.close();
         } catch (SQLException se) {
            se.printStackTrace();
         }  
      }
      System.out.println("Please check it in the MySQL Table......... ……..");
   }
}
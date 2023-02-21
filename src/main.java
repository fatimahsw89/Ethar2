import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class main {
     public static void main(String args[]) {
      
        try{ 
            //Get a connection to databace
            Connection myconn = DriverManager.getConnection("jdbc:derby://localhost:1527/ETHARDB2023 ","ETHARDB2023","noor313");
            //create a statment 
            Statement mystmt = myconn.createStatement();
            //execute sql query
            ResultSet myRs = mystmt.executeQuery("select * from DONORS");
            //process the result set
            while(myRs.next()){
            System.out.println(myRs.getString("FNAME")+","+myRs.getString("LNAME"));
         }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
}
}

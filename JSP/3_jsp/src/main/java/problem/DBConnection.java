package problem;

import java.sql.*;

public class DBConnection {

    static Connection conn = null;
    static String url = "jdbc:oracle:thin:@localhost:1521:xe";
    static String id = "system";
    static String pw = "1234";

    public static Connection getConnection() {

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(url,id,pw);
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }catch(SQLException e){
            e.printStackTrace();
        }

        return conn;
        
    }

}

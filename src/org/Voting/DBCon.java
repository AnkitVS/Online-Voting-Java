package org.Voting;
import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 
  
// This class can be used to initialize the database connection 
public class DBCon { 
    public static Connection initializeDatabase() 
        throws SQLException, ClassNotFoundException 
    { 
    	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting", "root", "alohomora"); 
        return connection; 
    } 
} 

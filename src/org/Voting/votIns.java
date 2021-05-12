package org.Voting;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/votIns")
public class votIns extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String sta="";
		try {
			Connection connection = DBCon.initializeDatabase();
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into voter(voterid,electid) values(?,?)");
			preparedStatement.setString(1, (String)request.getParameter("vid"));
			preparedStatement.setString(2, (String)request.getParameter("eid"));
			preparedStatement.executeUpdate();
			preparedStatement = connection
					.prepareStatement("select status from voter where voterid=? and electid=?");
			preparedStatement.setString(1, (String)request.getParameter("vid"));
			preparedStatement.setString(2, (String)request.getParameter("eid"));
			ResultSet rs =preparedStatement.executeQuery();
			while(rs.next()) {
            	sta= rs.getString("status");
			}
			response.setContentType("text/html");
			out.write(sta);
		}catch (ClassNotFoundException |SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
	}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

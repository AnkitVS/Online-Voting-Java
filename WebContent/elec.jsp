<%@ page
	import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException"%>
<%@ page import="org.Voting.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Running Election</title>
<link href="css/elec.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

</head>
<body>
	<header>
		<div class="navbar-logo">
			<a href="land.html">Home</a>
		</div>
		<nav>
			<ul>
				<li><a href="reg.html">Vote</a></li>
			</ul>
		</nav>
	</header>
	<main>

		<div class="container">
			<h1>Running Elections</h1>
			<table>
				<tr>
					<th>Name</th>
					<th>Election Id</th>
					<th>Total Votes</th>
					<th>Voters</th>
					<th>Candidates</th>
					<th>Status</th>
					<th></th>
				</tr>
				<%
					try {
							Connection connection = DBCon.initializeDatabase();

							ResultSet rs = (connection.prepareStatement("select * from election")).executeQuery();
							while (rs.next()) {
				%>

				<tr>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("electionid")%></td>
					<td><%
					PreparedStatement ps = connection.prepareStatement("select count(*) from voter where electionid=?");
					ps.setString(1, rs.getString("electionid"));
					ResultSet prs=ps.executeQuery();
					if (prs.next()) {
					    int voterCount = prs.getInt(1);
					    out.print(voterCount);
					}
					prs.close();
					ps.close();
					%></td>
					<td><%
					ps = connection.prepareStatement("select count(*) from voter where electionid=?");
					ps.setString(1, rs.getString("electionid"));
					prs=ps.executeQuery();
					if (prs.next()) {
					    int voterCount = prs.getInt(1);
					    out.print(voterCount);
					}
					prs.close();
					ps.close();
%></td>
					<td><%
					ps = connection.prepareStatement("select count(*) from candidate where electionid=?");
					ps.setString(1, rs.getString("electionid"));
					prs=ps.executeQuery();
					if (prs.next()) {
					    int voterCount = prs.getInt(1);
					    out.print(voterCount);
					}
					prs.close();
					ps.close();
%></td>
					<td>
						<%
							if (rs.getString("status").equalsIgnoreCase("true"))
							out.print("Running");
						else if (rs.getString("status").equalsIgnoreCase("false"))
							out.print("Declared");
						else
							out.print("Results Pending");
						%>
					</td>
					<td><button type="button" onclick="Check(event)">Check</button> </td>
				</tr>
				<%
					}
				} catch (ClassNotFoundException | SQLException e) {
				out.println(e.getMessage());
				}
				%>
			</table>
		</div>
	</main>
	<footer>
		<div class="container">
			<div class="copy">
				<p>Copyright &copy; Ankit Ved 2020</p>
				<span>
					<ul>
						<li><a href="https://github.com/AnkitVS"><i
								class="fab fa-github-alt"></i></a></li>
						<li><a href="https://www.linkedin.com/in/ankit-ved-ashm/"><i
								class="fab fa-linkedin-in"></i></a></li>
					</ul>
				</span>
			</div>
		</div>
	</footer>
	<script>
	window.onload = function() {
    	var c=document.getElementsByTagName('tr').length;
    	var i;
    	for(i=1;i<c;i++)
    		{
    			var cname= "row"+i;
    			var r= document.getElementsByTagName("tr")[i];
    			r.className = cname;
    		}
    	for(i=1;i<c;i++)
    	{
    		var cname= "row"+i;
    		var b=document.getElementsByClassName(cname)[0];
    		b.getElementsByTagName("td")[1].className = "eid";
    	}
	}
    		
    	function Check(event){
    		const row=event.target.parentNode.parentNode;
    		var eid=row.getElementsByClassName("eid")[0].innerHTML;
    		window.location.href = "editElect.jsp?eid="+eid;
		
	}
	</script>
</body>
</html>
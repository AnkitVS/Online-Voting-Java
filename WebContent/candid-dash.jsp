<%@ page
	import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException"%>
<%@ page import="org.Voting.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/nadash-style.css" type="text/css" rel="stylesheet">
<script src="https://kit.fontawesome.com/588fa32905.js"></script>
<title>Candidate</title>
</head>
<body>
	<header>
		<div class="navbar-logo">
			<a href="land.html">Home</a>
		</div>
		<nav class="nav_links">
			<ul>
				<li><a href="reg.html">Vote</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<div class="container">
			<h1>Running Election</h1>
			<table>
				<tr>
					<th>Name</th>
					<th>Election Id</th>
					<th>Status</th>
				</tr>
				<tr>
					<%
						String cid = (String) session.getAttribute("id");
					request.setAttribute("cid", cid);
					%>
					<p id="cname" style="display:none"><%=cid%></p>
					<%
						try {
						int numberRow = 0;
						String eid;
						PreparedStatement preparedStatement;

						Connection connection = DBCon.initializeDatabase();

						preparedStatement = connection.prepareStatement("select name,electid from election");
						ResultSet rs = preparedStatement.executeQuery();

						while (rs.next()) {

							eid = rs.getString("electid");
					%>
					<td><%=rs.getString("name")%></td>
					<td><%=eid%></td>
					<td>
						<%
							preparedStatement = connection.prepareStatement("select status from candidate where cid=? and electid=?");
						preparedStatement.setString(1, cid);
						preparedStatement.setString(2, eid);
						ResultSet rst = preparedStatement.executeQuery();

						int flag = 0;
						if (!rst.next()) {
						%>
						<button type="button" onclick="Create(event)">Contest</button> <%
 	} else {
 	if (rst.getString("status").equalsIgnoreCase("VP")) {
 %> Pending<%
 	} else if (rst.getString("status").equalsIgnoreCase("V")) {
 %> Verified <%
 	} 
 	}
 %>
 </td>
 </tr>
				<%
					}
				} catch (ClassNotFoundException | SQLException e) {
				out.println(e.getMessage());
				}
				%>
			</table>
		</div>
		<div id="menu-bar">
			<div class="menu-btn">
				<div class="menu-btn__burger"></div>
				<div class="option">
					<ul id="nav">
						<li><a href="profile.jsp"><i class="fas fa-user-alt"></i></a></li>
						<li><a href="#"><i class="fas fa-sign-out-alt"></i></a></li>
					</ul>
				</div>
			</div>
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
	var c=document.getElementsByTagName('table').length;
	for(var i=0;i<c;i++){
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
        	b.getElementsByTagName("td")[2].className ="sta";
        	}
		}
	};

	
	const menuBtn = document.querySelector('.menu-btn');
	let menuOpen = false;
	menuBtn.addEventListener('click', () => {
		if (!menuOpen) {
			menuBtn.classList.add('open');
			menuBtn.parentElement.classList.add('open');
			menuOpen = true;
			} else {
				menuBtn.classList.remove('open');
				menuBtn.parentElement.classList.remove('open');
				menuOpen = false;
				}
		});
		        
function Create(event){
	const row=event.target.parentNode.parentNode;
	var ro,eid,sta;
	const cid=document.getElementById("cname").innerText;
	eid=row.getElementsByClassName("eid")[0].innerHTML;
	sta=row.getElementsByClassName("sta")[0];
	var xhttp = new XMLHttpRequest();
	if (window.XMLHttpRequest) {
		// code for modern browsers
		xmlhttp = new XMLHttpRequest();
		} else {
			// code for old IE browsers
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			} 
	var url="canIns?eid="+eid+"&cid="+cid;
	xhttp.open("GET", url, true);
	xhttp.send();
	
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			if(this.responseText=='VP'){
				sta.innerHTML="Verification Pending";
				}else if(this.responseText=='V'){
					sta.innerHTML="Verified";
				}else
					sta.innerHTML=this.responseText;
			}
	}
}
	</script>
</body>
</html>
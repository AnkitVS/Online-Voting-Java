<%@ page
	import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,org.Voting.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/editElect-style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<title>Election Details</title>
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
		<div class="container"></div>
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
		var vars = {};
		var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
				function(m, key, value) {
					vars[key] = value;
				});
		var eid = vars['eid'];
		var xhttp = new XMLHttpRequest();
		if (window.XMLHttpRequest) {
			// code for modern browsers
			xmlhttp = new XMLHttpRequest();
		} else {
			// code for old IE browsers
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 || this.status == 200) {
				document.getElementsByTagName('main')[0].children[0].innerHTML = this.responseText;

			}
		}
		var url = "editElect?eid=" + eid;
		xhttp.open("GET", url, true);
		xhttp.send();

		function VerifyCandidate(event) {
			const row = event.target.parentNode.parentNode;
			var cid, sta;
			cid = row.getElementsByClassName("cid")[0].innerHTML;
			sta = row.getElementsByClassName("sta")[0];
			var xhttp = new XMLHttpRequest();
			if (window.XMLHttpRequest) {
				// code for modern browsers
				xmlhttp = new XMLHttpRequest();
			} else {
				// code for old IE browsers
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			var url = "verCand?cid=" + cid;
			xhttp.open("POST", url, true);
			xhttp.send();

			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					if (this.responseText == 'V') {
						sta.innerHTML = "Verified";
					} else
						sta.innerHTML = this.responseText;
				}
			}
		}
		
		function VerifyVoter(event) {
			const row = event.target.parentNode.parentNode;
			var vid, sta;
			vid = row.getElementsByClassName("vid")[0].innerHTML;
			sta = row.getElementsByClassName("sta")[0];
			var xhttp = new XMLHttpRequest();
			if (window.XMLHttpRequest) {
				// code for modern browsers
				xmlhttp = new XMLHttpRequest();
			} else {
				// code for old IE browsers
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			var url = "verVot?vid=" + vid;
			xhttp.open("POST", url, true);
			xhttp.send();

			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					if (this.responseText == 'V') {
						sta.innerHTML = "Verified";
					} else
						sta.innerHTML = this.responseText;
				}
			}
		}
	</script>
</body>

</html>
	 
function validate(){
var username = document.getElementById("username").value;
var password = document.getElementById("password").value;
if ( username == "vishal")
{
	if( password == "admin")
	{
window.location.href = "dashboard.html"; // Redirecting to other page.
	}
else{
// Disabling fields after 3 attempts.
alert("You are not Admin !!!");
}	
return false;
}
}

	 


var RE_PASSWORD = /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{6,20})$/;
var RE_NAME = /^[A-Za-z]+ ([A-Za-z]+)+$/;
var RE_MOB = /^[6-9]{1}\d{9,10}$/;
var RE_EMAIL = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

var nflag,mflag,eflag,pflag;
function validation(event) {
	event.preventDefault();
	const firstname = document.getElementById("fname");
	const mobile = document.getElementById("mnum");
	const email = document.getElementById("email");
	const password = document.getElementById("psw");
	const rep_password = document.getElementById("psw-repeat");
	var fval = firstname.value;
	var mval = mobile.value;
	var eval = email.value;
	var pval = password.value;
	var rpval = rep_password.value;

	if (fval === "") {
		setError(firstname, 'Name cannot be blank');
	} else if ((!RE_NAME.test(fval)) && (fval.length > 5)) {
		setError(firstname, "Not a valid Name");
	} else {
		setSuccess(firstname);
		nflag=true;
	}

	if (mval === "") {
		setError(mobile, 'Mobile Number cannot be blank');
	} else if (!RE_MOB.test(mval)) {
		setError(mobile, "Not a valid Mobile number");
	} else {
		setSuccess(mobile);
		mflag=true;
	}

	if (eval == "") {
		setError(email, 'Email cannot be blank');
	} else if (!RE_EMAIL.test(eval)) {
		setError(email, "Not a valid Email");
	} else {
		setSuccess(email);
		eflag=true;
	}

	if (pval == '') {
		setError(password, 'Password cannot be blank');
	} else if (!RE_PASSWORD.test(pval)) {
		setError(password, 'Not a valid Password');
	} else if (pval != rpval) {
		setError(rep_password, 'Password Mismatch');
	} else {
		setSuccess(password);
		setSuccess(rep_password);
		pflag=true;
	}
	
	if(nflag==true && mflag==true && eflag==true && pflag==true){
		document.form.submit();
	}else{
		return false;
	}
	// setSuccess();
}
function setError(inp, message) {
	const inpParent = inp.parentElement;
	const small = inpParent.querySelector('small');
	inpParent.className = 'form-control error';
	small.innerText = message;
}

function setSuccess(inp) {
	const inpParent = inp.parentElement;
	inpParent.className = 'form-control success';
}
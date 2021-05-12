let uflag, pflag;

function validation(event) {
	event.preventDefault();
	const user = document.getElementById("username");
	const pass = document.getElementById("password");
	const uval = user.value.trim();
	const pval = pass.value.trim();
	if (uval === '') {
		setError(user, 'Username cannot be blank');
	} else {
		setSuccess(user);
		uflag=true;
	}

	if (pval === '') {
		setError(pass, 'Password cannot be blank');
	} else {
		setSuccess(pass);
		pflag=true;
	}
	if(pflag===true && uflag===true){
		document.form.submit();
	}else{
		return false;
	}
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

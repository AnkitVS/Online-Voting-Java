function validation(event) {
    event.preventDefault();
    var nval = document.getElementById("elname").value;
    if (nval != "")
        document.form.submit();
    else {
        document.getElementById("msg").innerHTML = "Provide Election Name";
        return false;
    }
}
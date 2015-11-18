$(document).ready(function() {
	
	   
	
	/*if(document.getElementById("firstName").val==""){
		alert("Please fill out this field");
		return false;
		}*/


	$("#SignUpBtn").click(function() {
	
		 var x = document.getElementById("firstName"&&"lastName"&&"gender"&&"userEmail"&&"password"&&"confirmationPassword").value;
		    if (x == null || x == "") {
		        alert("Please fill out this field");
		        return false;
		        
		    } else if($("#password").val() != $("#confirmationPassword").val()){
		        $("#confirmationPassword").val("");
		        alert("Please reenter password");
		    }else{
		
		    
		var signData = {};
		signData.firstName = $("#firstName").val();
		signData.lastName = $("#lastName").val();
		signData.gender = $('input[name="gender"]:checked').val();
		signData.userEmail = $("#userEmail").val();
		signData.password = $("#password").val();

		$.ajax({
			type : "POST",
			url : "users/save",
			data : signData,
			dataType : "json",
			error : function(val) {

			},
			success : function(response) {
				allReset();
				if (response.success) {
					$( ".toggle2" ).hide()
					alert("User added please login to continue");
					
				} else {
					alert(response.message);
					
				}
			}
		});
		    }
	});
	
});



function allReset() {
	
	$('#signupForm')[0].reset();

}

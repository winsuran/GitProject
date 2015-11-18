
$(document).ready(function() {


$.ajax({
	type : "POST",
	url : "users/getUser",
	
	
	error : function(val) {
	},
	success : function(response) {
		
		
			$("#firstName").val(response.Data['firstName']);
			$("#lastName").val(response.Data['lastName']);
			$("#country").val(response.Data['country']);
			$("#gender").val(response.Data['gender']);
			$("#email").val(response.Data['userEmail']);
			$("#currentPassword").val(response.Data['password']);
		
			
		   //var str = "2012-02-01";
			var str = response.Data['birthday'];
			var arr = str.split('-');
			
			var year = arr[0];
			var month = arr[1];
			var day = arr[2];
			
			$("#date").val(day);
			$("#month").val(month);
			$("#year").val(year);
			//alert(year);
		
			
			
			
			
			
	}
});

//Upload photo
$(function(){
    $('#imageSave').change( function(e) {
        
        var img = URL.createObjectURL(e.target.files[0]);
        $('.userImg').attr('src', img);
    });
});




$("#profileUpdateBtn").click(function() {

	var formData = {};
	formData.firstName=$("#firstName").val();
	formData.lastName=$("#lastName").val();
	formData.gender=$("#gender").val();
	formData.country=$("#country").val();
	formData.userEmail=$("#email").val();
	formData.password=$("#currentPassword").val();
	formData.photo=$("#imageSave").val();
	

	
	
	//formData.birthday="2015-10-08";
	formData.birthday=$("#year").val()+"-"+$("#month").val()+"-"+$("#date").val();
	
	$.post("users/update", formData, function(response, textStatus) {
		if (response.success) {
			alert(response.message);
			
		}
		else{
			alert(response.message);
		}
	}, "json").fail(function(data) {
		alert(data.statusText);
	});
});





$("#passwordUpdateBtn").click(function(){
	
	if($("#newPassword").val()== ""){
		alert("No changes");
		
	}
	
	else if ($("#newPassword").val() != $("#confNewPassword").val()) {
        $("#confNewPassword").val("");
        alert("Please enter confirmation password");
        
    } else{
	
	var formData = {};
	formData.firstName=$("#firstName").val();
	formData.lastName=$("#lastName").val();
	formData.gender=$("#gender").val();
	formData.country=$("#country").val();
	formData.photo=$("#imageSave").val();
	formData.userEmail=$("#email").val();
	formData.password=$("#newPassword").val();
	
	formData.birthday=$("#year").val()+"-"+$("#month").val()+"-"+$("#date").val();
	
	
	
	$.post("users/update", formData, function(response, textStatus) {
		
		if (response.success) {
			alert(response.message);
			formData.password=$("#newPassword").val('');
			formData.password=$("#confNewPassword").val('');
		}
		else{
			alert(response.message);
		}
	}, "json").fail(function(data) {
		alert(data.statusText);
	});	
    }
	
});
});









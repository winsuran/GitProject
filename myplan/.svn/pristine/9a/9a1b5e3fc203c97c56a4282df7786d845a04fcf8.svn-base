$(document).ready(function() {
	getAllTerms();
	/*$('.modal').on('hidden.bs.modal', function(e) {
		$(this).removeData();
	});*/

});
$("#termssave").click(function() {
	currentTermID=null;
	
	/*var x = document.getElementById("title"&&"startdate"&&"endDate").value;
    if (x == null || x == "") {
        alert("Please fill out this field");
    }*/
    var empt = document.forms["addTermForm"]["title"].value;  
    if (empt == "")
    {  
    //alert("Please input a Value");
    title.focus();
    return false;  
    }
    var empt = document.forms["addTermForm"]["startDate"].value;  
    if (empt == "")
    {  
    //alert("Please input a Value");
    	startDate.focus();
    return false;  
    }
    var empt = document.forms["addTermForm"]["endDate"].value;  
    if (empt == "")
    {  
    //alert("Please input a Value");
    	endDate.focus();
    return false;  
    } 
	
	var data = $("#addTermForm").serializeArray();
	data.push({
		name : 'userEmail',
		value : activeUserEmai});
	$.post("terms/addTerm", data, function(response, textStatus) {
		//alert(response.message);
		if (response.success) {
			
			allReset();
			getAllTerms();
			$('#newTerm').modal('hide');
			$('#timeSchedule').modal('show');	
			
			data.title = $("#title").val('');
			data.startDate = $("#startDate").val('');
			data.endDate = $("#endDate").val('');
			data.note = $("#note").val('');
		}
		else{
			alert(response.message);
		}
	}, "json").fail(function(data) {
		alert(data.statusText);
	});
});


var editingTermId;
function getTerm(termId) {

	var formData = {};
	$.get("terms/"+termId, formData, function(response, textStatus) {
		if (response.success) {
			$('#newTerm').modal('show');
			$("#termsupdate").removeClass('hidden');
			$("#termsdelete").removeClass('hidden');
			$("#termsEditTitle").removeClass('hidden');
			$("#termssave").addClass('hidden');
			$("#termsAddTitle").addClass('hidden');
			$("#title").val(response.Data['title']);	
			$("#endDate").val(response.Data['endDate']);	
			$("#startDate").val(response.Data['startDate']);	
			$("#note").val(response.Data['note']);	
			editingTermId=response.Data['termId'];
		}
		
	}, "json").fail(function(data) {
		alert(data.statusText);
	});
}

function addTerm() {

			$('#newTerm').modal('show');
			$("#termsupdate").addClass('hidden');
			$("#termsdelete").addClass('hidden');
			$("#termsEditTitle").addClass('hidden');
			$("#termssave").removeClass('hidden');
			$("#termsAddTitle").removeClass('hidden');
			//$("#title").val(response.Data['title']);	
			//$("#endDate").val(response.Data['endDate']);	
			//$("#startDate").val(response.Data['startDate']);	
			//$("#note").val(response.Data['note']);	
			//editingTermId=response.Data['termId'];
}

$("#termsupdate").click(function() {
	var data = $("#addTermForm").serializeArray();
	data.push({
		name : 'userEmail',
		value : activeUserEmai},{
		name : 'termId',
		value : editingTermId});
	$.post("terms/editTerm", data, function(response, textStatus) {
		if (response.success) {
			getAllTerms();
			$('#newTerm').modal('hide');
			//$('#timeSchedule').modal('show');			
		}
		else{
			alert(response.message);
		}
	}, "json").fail(function(data) {
		alert(data.statusText);
	});
});
function getAllTerms() {
	$('#divTermList').html("");
	$.ajax({
		type : "GET",
		url : "terms/getTermsByUser",

		dataType : "json",
		// async : false,
		error : function(val) {

		},
		success : function(text) {		
		
			$.each(text.Data,function(key,val){
			var	termId=val['termId'];
				var Str='<div class="well">';
				Str+='<h1>'+val['title']+'</h1>';
				Str+='<button class="btn btn-primary pull-right" type="button" onclick="manageSubject('+termId+')">Manage Subjects</button>';
				Str+='<a  class="btn btn-primary pull-right editBtnPadding" onclick="getTerm('+termId+')"> <span';
				Str+='class="glyphicon glyphicon-pencil"></span> Edit</a></div>';
				$('#divTermList').append(Str);
				});
			
		
		}

	});
}
function allReset(){
$('#addTermForm')[0].reset();

}

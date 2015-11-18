$(document).ready(function() {

});
	

$("#timeSchedulesave").click(function() {	
	
	if(document.getElementById(('hoursForWeekday'||'minutesForWeekday')&&
			('hoursForWeekend'||'minutesForWeekend')&&
			'hoursForSubject'||'minutesForSubject').selectedIndex == 0)
	{
	alert("Please select schedule hours");
	return false;
	}
	
	
	
	var hoursForWeekday=$("#hoursForWeekday").val();
	var minutesForWeekday=$("#minutesForWeekday").val();
	var hoursForWeekend=$("#hoursForWeekend").val();
	var minutesForWeekend=$("#minutesForWeekend").val();	
	
	var minForWeekday=parseInt(hoursForWeekday)+parseInt(minutesForWeekday);
	var minForWeekend=parseInt(hoursForWeekend)+parseInt(minutesForWeekend);
	var formData = {};
	formData.userEmail = activeUserEmai;
	formData.minutesForWeekday = minForWeekday;
	formData.minutesForWeekend = minForWeekend;

	$.post("terms/updateTermMiniutes", formData, function(response, textStatus) {
		
		if (response.success) {
			allReset();
			$('#timeSchedule').modal('hide');
			$('#filledSubjects').empty();
			$('#subjects').modal('show');
		
			
		}else{
			alert(response.message);
		}

	}, "json").fail(function(data) {
		alert(data.statusText);
	});
});

function allReset() {

	$('#addTimeScheduleForm')[0].reset();

}

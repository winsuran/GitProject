$(document).ready(function() {
	
	  $('.modal').on('hidden.bs.modal', function(e) { $(this).removeData(); });
	 
});
var currentTermID;
function manageSubject(termId) {
	currentTermID = termId;

	var formData = {};
	formData.termId = currentTermID;
	$
			.ajax({
				type : "GET",
				url : "subjects/getSubjectsByTerm",
				data : formData,
				dataType : "json",
				error : function(val) {

				},
				success : function(text) {
					$('#subjects').modal('show');

					$('#filledSubjects').html("");
					$
							.each(
									text.Data,
									function(key, val) {

										var subjectId = val['subjectId'];

										var Str = '<div class="well"  data-target="#subjectInEdit" onclick="getSubject('
												+ subjectId
												+ ')" data-toggle="modal" data-dismiss="modal">';

										Str += '<div class="colorBox" style="background-color: #'
												+ val['color'] + '";></div>';
										Str += '<p>' + val['name'] + '</p>';
										Str += '<span class="fontColorBlue fontBold">Priority</span>';
										Str += '<span class="mrgnLft10"></span>';

										if (val['priorityLevel'] == 100) {
											Str += '<span class="mrgnLft10">Very High</span>';

										} else if (val['priorityLevel'] == 75) {
											Str += '<span class="mrgnLft10">High</span>';

										} else if (val['priorityLevel'] == 50) {
											Str += '<span class="mrgnLft10">Medium</span>';

										} else if (val['priorityLevel'] == 25) {
											Str += '<span class="mrgnLft10">Low</span>';
										} else {
										}

										Str += '</div>';

										$('#filledSubjects').append(Str);
									});

				}

			});
}

$("#subjectSave").click(
		function() {
			var x = document.getElementById("name" || "priorityLevel"
					|| "colorselector").value;
			if (x == null || x == "") {
				alert("Please fill out this field");
				return false;
			}

			var signData = {};
			signData.name = $('#name').val();
			// signData.totalMinutes = '3333';
			signData.totalMinutes = '0';
			signData.completeMinutes = '0';
			signData.color = $('#colorselector').val();
			signData.termId = currentTermID;
			signData.priorityLevel = $('#priorityLevel').val();
			var topcs = [];
			var topicsVOs = {};
			var table = $("#topicsTable tbody");
			table.find('tr').each(function(i) {
				var $tds = $(this).find('td');
				var topicsVOs = {};
				topicsVOs.name = $tds.eq(1).text();
				topcs.push(topicsVOs);
				// alert(style);
			});

			// topicsVOs.topicId=1;
			// topicsVOs.name="aaa";
			// topcs.push(topicsVOs);
			signData.topicsVOs = topcs;
			/* signData.topicsVOs={name:"fdfhjdfh"}; */
			// signData.topicsVOs.name='dsdsdsds';
			$.post("subjects/addSubject", $.wtscustomParam(signData),
					function(response, textStatus) {
						if (response.success) {
							
							subjectReset();
							$("#topicsTable tbody").empty();
							
							manageSubject(currentTermID);

						} else {
							alert(response.message);
						}
					}, "json").fail(function(data) {
				alert(data.statusText);
			});
		});

var editingSubjectId;
function getSubject(subjectId) {
	 
	editingSubjectId=subjectId;
	var formData = {};
	$.get("subjects/" + subjectId, formData, function(response, textStatus) {
		if (response.success) {

			$('#subjectInEdit').modal('show');
			$('#subjects').modal('hide');
			$("#editTopicsTable tbody").empty();

			$("#names").val(response.Data['name']);
			var colur='#'+response.Data['color'];
		//	$("#colorselector1").val(response.Data['color']);
			//$('#colorselector1').colorselector('setColor', '#FF0000');
			$("#colorselector1").next().find("span").css("background-color",colur);
			//Convert Double to Int value
			var dub = response.Data['priorityLevel'];
			$("#priorityLevels").val(parseInt(dub));
			 var hours = Math.floor( (response.Data['totalMinutes'] - response.Data['completeMinutes'])/ 60);
			 var minutes = (response.Data['totalMinutes'] - response.Data['completeMinutes']) % 60;
			 
			 
			 var completePercentage = Math.floor( (response.Data['completeMinutes']  /response.Data['totalMinutes'])*100 );
			
			 
			 $("#hours").text(hours);
			 $("#minutes").text(minutes);
			 $("#progress").empty();
			var Str='<div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"';
			Str+=' aria-valuenow="0 aria-valuemin="0" aria-valuemax="100" style="width:"0"   > '+completePercentage+'% </div>';              
				$('#progress').append(Str);
				 $('.progress-bar').css('width', completePercentage+'%').attr('aria-valuenow', completePercentage);   
	
			$.each(response.Data.topicsVOs,function(key1, val1) {
					//alert(val1['name'])	;
					var Str = '<tr id='+val1['topicId']+'><td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>';
					Str += '<td class="topicNameTd">'+val1['name']+'</td>';
					Str += '</tr>';

					//$('#topicsTable tr:last').after(Str);
					$('#editTopicsTable').find('tbody:last').append(Str);
					});
			
		}

	}, "json").fail(function(data) {
		alert(data.statusText);
	});
}


$("#editSubjectBtn").click(function() {
	var signData = {};
	signData.name = $('#names').val();
	// signData.totalMinutes = '3333';
	signData.totalMinutes = '0';
	signData.completeMinutes = '0';
	signData.color = $('#colorselector1').val();
	signData.termId = currentTermID;
	
	signData.subjectId = editingSubjectId;
	signData.priorityLevel = $('#priorityLevels').val();
	var topcs = [];
	var topicsVOs = {};
	var table = $("#editTopicsTable tbody");
	table.find('tr').each(function(i) {
		
		var $tds = $(this).find('td');
		var topicsVOs = {};
		topicsVOs.name = $tds.eq(1).text();
		topicsVOs.topicId = $(this).attr('id');
		topcs.push(topicsVOs);
		// alert(style);
	});

	// topicsVOs.topicId=1;
	// topicsVOs.name="aaa";
	// topcs.push(topicsVOs);
	signData.topicsVOs = topcs;
	/* signData.topicsVOs={name:"fdfhjdfh"}; */
	// signData.topicsVOs.name='dsdsdsds';
	$.post("subjects/editSubject", $.wtscustomParam(signData),
			function(response, textStatus) {
				if (response.success) {
					
					//subjectReset();
					//$("#topicsTable tbody").empty();
					
					manageSubject(currentTermID);

				} else {
					alert(response.message);
				}
			}, "json").fail(function(data) {
		alert(data.statusText);
	});



		});





function subjectReset() {

	$('#addSubjectForm')[0].reset();

}
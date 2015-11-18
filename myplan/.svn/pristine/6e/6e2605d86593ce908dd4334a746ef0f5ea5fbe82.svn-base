$(document).ready(function() {
	 $('.modal').on('hidden.bs.modal', function(e) { $(this).removeData(); });
});

$('#divTerm').html("");
$.ajax({
			type : "GET",
			url : "terms/getAll",

			dataType : "json",
			// async : false,
			error : function(val) {

			},
			success : function(text) {

				$
						.each(
								text.Data,
								function(key, val) {
									var termId = val['termId'];

									var Str = '<div class="well" data-dismiss="modal"  onclick="selectedTerm('+termId+')">';
									Str += '<p>' + val['title'] + '</p>';
									Str += '</div>';
									$('#divTerm').append(Str);
									
								
									
								});

			}
		});



var currentTermID;
function selectedTerm(termId) {	
	$("#subjectsTable .topicBody").html("");
	$('#dailyUpdate').modal('show');
	currentTermID = termId;
var formData = {};
formData.termId =currentTermID;
$.ajax({
			type : "GET",
			url : "subjects/getSubjectsByTerm",
			dataType : "json",
			data : formData,
			error : function(val) {

			},
			success : function(text) {
				$.each(text.Data,function(key, val) {
			
				var Str = '<tr id=sub-'+ val['subjectId']+'>';
				Str += '<td colspan="2" class="title titleTh"  ><span >' + val['name'] + '</span></td>';
				Str += '<td>';
				Str += '<center>';
				Str += '<input type="checkbox" id="'+val['subjectId']+'-subjectCheck" data-off-label="false" data-on-label="false" data-off-icon-class="glyphicon glyphicon-thumbs-down" data-on-icon-class="glyphicon glyphicon-thumbs-up" onchange="">';
				Str += '</center>';
				Str += '</td>';
				Str += '<td><input class="pull-right time" name="spentHours" id="'+val['subjectId']+'-subjectHrs" type="text" placeholder="hrs"></td>';
			//	Str += '<td><span class="dash">-</span></td>';
				Str += '<td><input class="pull-left time" name="spentMins" id="'+val['subjectId']+'-subjectMin" type="text" placeholder="mins"></td>';
				Str += '</tr>';
				
				Str += '<tr>';
				Str += '<td colspan="6">';
				Str += '<table class="progressTable topicTable" id="'+val['subjectId']+'-TopicsTable" border="0" cellspacing="0" cellpadding="0">';
				
			if (val.topicsVOs !=null) {		
				$.each(val.topicsVOs,function(key1, val1) {
					
				Str += '<tr>';
				Str += '<td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>';
				Str += '<td class="title" id="'+val['subjectId']+'"-"'+val1['topicId']+'title">'+val1['name']+'</td>';
				Str += '<td>';
				Str += '<center>';
				Str += '<input id="Check" type="checkbox" data-off-label="false" data-on-label="false" data-off-icon-class="glyphicon glyphicon-thumbs-down" data-on-icon-class="glyphicon glyphicon-thumbs-up">';
				Str += '</center>';
				Str += '</td>';
				Str += '<td colspan="3">&nbsp;</td>';
				Str += '</tr> ';				
				
				});
			}
				Str += '<tr>';
				Str += '<td colspan="2">';
				Str += '<input type="text" placeholder="new topic" id="'+val['subjectId']+'input" name="newTopic" class="col-lg-9" >';
				Str += '<div class="col-lg-3">';
				Str += '<button class="btn btn-primary pull-left addTopicBtn" type="button" id="addTopicBtn" onclick="addTopic('+val['subjectId']+');">Add</button>';
				Str += '</div>';
				Str += '</td>';
				Str += ' <td></td>';
				Str += ' <td></td>';
				Str += '<td></td>';
				Str += '<td></td>';
				Str += '</tr>';
				Str += ' </table>';
				Str += ' </td>';
				Str += ' </tr>';
				$("#subjectsTable .topicBody").append(Str);
				/*$('#subject'+val['subjectId']+'Check').checkboxpicker();
				$('#topic'+val1['topicId']+'Check').checkboxpicker();*/

				$('#'+val['subjectId']+'-subjectCheck').change(function() {
					if (this.checked) {
						$('#'+val['subjectId']+'-TopicsTable').show();
					} else {
						$('#'+val['subjectId']+'-TopicsTable').hide();
					}
				});
				
						});
				
				 $('input[type="checkbox"]').checkboxpicker();
			}
			
		});

}

function addTopic(subjectId) {
	var tableId=subjectId+"-TopicsTable";
	var inputValue=$('#'+subjectId+"input").val();
	var Str = '<tr>';
	Str += '<td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>';
	Str += '<td class="title" id="new">'+inputValue+'</td>';
	Str += '<td>';
	Str += '<center>';
	Str += '<input id="Check" type="checkbox" data-off-label="false" data-on-label="false" data-off-icon-class="glyphicon glyphicon-thumbs-down" data-on-icon-class="glyphicon glyphicon-thumbs-up">';
	Str += '</center>';
	Str += '</td>';
	Str += '<td colspan="3">&nbsp;</td>';
	Str += '</tr> ';			
	$('#'+tableId+'  tr:first').after(Str);
	 $('input[type="checkbox"]').checkboxpicker();
	 $('#'+subjectId+"input").val("");
}

$("#saveDailyUpdate").click(function() {
	var table = $("#subjectsTable tbody");
	table.find('tr').each(function(i) {
		var signData = {};
		if(typeof $(this).attr("id") !=="undefined"){
		var type=	$(this).attr("id").substr(0, 3);
		var id=$(this).attr("id").substr(4);		
		if(type==="sub"){
		signData.subjectId =id;
		var hours=$('#'+id+"-subjectHrs").val();
		var minutes=$('#'+id+"-subjectMin").val();
		if(hours.length==""){
			hours=0;
		}
		if(minutes.length==""){
			minutes=0;
		}
		signData.completeMinutes=parseInt(hours*60)+parseInt(minutes);
		if(hours.length>0 || minutes.length>0){
			$.ajax({
				type : "POST",
				url : "subjects/updateDaily",
				dataType : "json",
				data : signData,
				success : function(text) {	
					
				},
			});
		}		
	}		
}
	});	
	$('#dailyUpdate').modal('hide');
	$('#terms').modal('show');
	
});



$(document).ready(function() {

});
$("#addTopicsToTable")
		.click(function() {
	var	topicTitle=	$('#newTopic').val();
			if(topicTitle!=""){
					var Str = '<tr><td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>';
					Str += '<td class="topicNameTd">'+topicTitle+'</td>';
					Str += '</tr>';

					//$('#topicsTable tr:last').after(Str);
					$('#topicsTable').find('tbody:last').append(Str);
					$('#newTopic').val("");
			}else{
				alert("Enter topic title");
			}
				});
		

$("#ediTopicToTable")
.click(function() {
var	topicTitle=	$('#newTopic1').val();
	if(topicTitle!=""){
			var Str = '<tr><td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>';
			Str += '<td class="topicNameTd">'+topicTitle+'</td>';
			Str += '</tr>';

			//$('#topicsTable tr:last').after(Str);
			$('#editTopicsTable').find('tbody:last').append(Str);
			$('#newTopic1').val("");
	}else{
		alert("Enter topic title");
	}
		});

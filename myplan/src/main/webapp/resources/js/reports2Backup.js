$(document).ready(function() {
getAllTerms(); 
});

function getAllTerms() {
	$('#termNameList').html("");
	$.ajax({
		type : "GET",
		url : "terms/getAll",
		dataType : "json",
		error : function(val) {

		},
		success : function(text) {		
			
			$.each(text.Data,function(key,val){
			
				var Str='<button id="'+val['termId']+'" class="btn btn-default marginRight10px marginBot10px" onclick="manageSubject('+val['termId']+');"  type="button">'+val['title']+'</button>';
				$('#termNameList').append(Str);
				});
			
			$( "#"+text.Data[0].termId ).click();
		}

	});
	
}
function manageSubject(termId) {
	$('#subjectListOne').empty();
	$('#subjectListTwo').empty();
	$('#subjectListThree').empty();
	var currentTermID = termId;
	var formData = {};
	formData.termId = currentTermID;
	$.ajax({
				type : "GET",
				url : "subjects/getSubjectsByTerm",
				data : formData,
				dataType : "json",
				error : function(val) {
					
				},
				success : function(text) {
					if(text.success){
					$.each(text.Data,function(key, val) {
						
						 $('#subjectListOne').append($('<option/>', { 
						        value: val['subjectId'],
						        text : val['name'] 
						    }));
						 $('#subjectListTwo').append($('<option/>', { 
						        value: val['subjectId'],
						        text : val['name'] 
						    }));
						 $('#subjectListThree').append($('<option/>', { 
						        value: val['subjectId'],
						        text : val['name'] 
						    }));
						
									});
					$( "#subjectListOne" ).change();
					$( "#subjectListTwo" ).change();
					$( "#subjectListThree" ).change();
					}else if(text.Data==="Empty"){
						$('#subjectPieChartOne').empty();
						$('#subjectPieChartTwo').empty();
						$('#subjectPieChartThree').empty();
					}
					
				}
				

			});
	getDailyProgress();
}
$( "#subjectListOne" ).change(function() {
	getSelectedSubject($(this).val(),"subjectPieChartOne");
});
$( "#subjectListTwo" ).change(function() {
	getSelectedSubject($(this).val(),"subjectPieChartTwo");
});
$( "#subjectListThree" ).change(function() {
	getSelectedSubject($(this).val(),"subjectPieChartThree");
});


function getSelectedSubject(subjectId,chartId){
	
	$.get("subjects/" +subjectId , function(response, textStatus) {
		if (response.success) {
			var completed=parseInt(parseInt(response.Data.completeMinutes)/parseInt(response.Data.totalMinutes)*100).toFixed(2);
			var data = new google.visualization.DataTable();
		    data.addColumn('string', 'Total');
		    data.addColumn('number', 'Science');		    
		    data.addRows([
		      ['Completed', parseInt(completed)],
		      ['Remaining', parseInt(100-completed)],
		      
		    ]);
			
			darwPieChartFormSubject(data,chartId);
			
		      
		}
	});
}

function darwPieChartFormSubject(data,chartId) {

    var options = {
            titlePosition: 'none',
            'width': 300,
            'height': 300,
            slices: {
                0: {
                    color: '#007600'
                },
                1: {
                    color: '#939393'
                },
            },
            legend: {
                position: 'none'
            },
            chartArea: {
                top: 10,
                width: "100%"
            },
            hAxis: {
                title: '',
                titleTextStyle: {
                    color: 'red'
                }
            }
        };

    var chart = new google.visualization.PieChart(document.getElementById(chartId));

    chart.draw(data, options);
  }
var data1=null;
function getDailyProgress(){	
	$.get("reports/getRecentProgress"  , function(response, textStatus) {
		data1 = new google.visualization.DataTable();
		data1.addColumn('string', 'Date'); 
		data1.addColumn('number', "Subject1");
		data1.addColumn('number', "Subject2");
		data1.addColumn('number', "Subject3");
		if (response.success) {
			var arrayOfData=['2015-11-11'];
			$.each(response.Data,function(key, val) {
				data1.addColumn('number',val['subjectId'])
				arrayOfData[key+1]=parseInt(val['spendMinutes']);
			});
for (var int = 0; int < 7; int++) {
	data1.addRow(arrayOfData);				
	
	darwBarChart(data1,"chart_div5"); 	
}			
		}
		
	});	
	
}

/*var data1=null;
function getDailyProgress(){	
	var hashtable = {};
	$.get("reports/getRecentProgress"  , function(response, textStatus) {
		if (response.success) {
			$.each(response.Data,function(key, val) {
				//console.log(key);
				if(typeof hashtable[val['spendDates']]==='undefined'){
					hashtable[val['spendDates']]=[];
					hashtable[val['spendDates']].push([val['subjectId'],val['spendMinutes']]);
				}else{			
					hashtable[val['spendDates']].push([val['subjectId'],val['spendMinutes']]);
				}	
				
			});
			data1 = new google.visualization.DataTable();
			data1.addColumn('string', 'Date'); 
			
			data1.addColumn('number', "Subject2");
			data1.addColumn('number', "Subject3");
			
			$.each(hashtable,function(key, val) {
				data1.addColumn('number', val['']);
				data1.addColumn('number', "Subject2");
				var arrayOfData=[];		
				var subjectArray=[];
				subjectArray.push(key);
				subjectArray.push(parseInt(val[0][1]));
				subjectArray.push(parseInt(val[1][1]));
				arrayOfData.push(subjectArray);	
				console.log(val[0][1]);
				$.each(val,function(key1, val1) {
					var subjectArray=[];
					subjectArray.push(key);
					//subjectArray.push(parseInt(val1[0]));
					subjectArray.push(parseInt(val1[1]));
					arrayOfData.push(subjectArray);				
				});
				data1.addRows(arrayOfData);	
				darwBarChart(data1,"chart_div5"); 
			});
			
		}
		
		
	console.log(hashtable);
});
}*/

function darwBarChart(data1,chartId) {

	 var options = {
			    title: 'Student Progress',
			    hAxis: {title: 'Week', titleTextStyle: {color: '#000000'}},
			    vAxis: {title: 'Hours', titleTextStyle: {color: '#000000'}}
			 };

	 var chart = new google.visualization.ColumnChart(document.getElementById(chartId));

    chart.draw(data1, options);
    
   
    
   // chart.draw(data1, options);
    
  }


/*data1.addColumn('string', 'Week');
data1.addColumn('number', 'Maths');	
data1.addColumn('number', 'English');
data1.addColumn('number', 'Science');
data1.addRows([
   ['Monday', 1, 4, 2],
['Tuesday', 1, 4, 2],
['Wednesday', 6, 1, 3],
['Thursday', 2, 4, 3],
['Friday', 1, 5, 3],
['Saturday', 3, 4, 3],
['Sunday', 5, 0, 2]
  
]);	*/

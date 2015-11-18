
<head>
<!--Dashboard CSS-->
<link rel="stylesheet" type="text/css" href="resources/css/dashboard.css" />

<!--  Dashboard JS-->
<script src="resources/js/other/bootstrap-checkbox.min.js">

<script>
	$(document).ready(function() {
		$(".notToday").hide();
		$("#moreSubjects").click(function() {
			// alert( "Handler for .click() called." );
			$(".notToday").toggle();
		});
	});
</script>
</head>
<body>

	
	<div class="outer" id="page-content">
		<section class="col-md-11 padding0">
			<div class="wellMain">
				<h1>Dashboard</h1>
				 <!-- <button class="btn btn-primary pull-right" type="button"
					id="dailyUpdateBtn" data-toggle="modal" data-target="#terms">Daily
					Update</button>  -->
			</div>
	
	<div class="col-md-9 leftmargin">
    <div class="row">
      <div class="col-md-6">
        <div class="col-md-12 thumbnail bg_blue">
          <div class="text-center top_heading">
            <h4><strong>Today - 28th October 2015</strong></h4>
          </div>
          <div class="tb_align top_heading">
            <h5><strong>First Term</strong></h5>
            <p class="txt">Maths - 03hrs Remaining</p>
            <p class="txt">Maths - 03hrs Remaining</p>
          </div>
          <div class="tb_align top_heading">
            <h5><strong>Second Term</strong></h5>
            <p class="txt">Science - 02hrs Remaining</p>
            <p class="txt">History - 03hrs Remaining</p>
          </div>
        </div>
        <div class="col-md-12 thumbnail bg_green">
          <div class="text-center top_heading">
            <h4><strong>Completed</strong></h4>
          </div>
          <div class="tb_align top_heading">
            <h5><strong>First Term</strong></h5>
            <p class="txt">Maths - 03hrs Remaining</p>
          </div>
          <div class="tb_align top_heading">
            <h5><strong>Second Term</strong></h5>
            <p class="txt">Science - 02hrs Remaining</p>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <button id="dailyUpdateBtn" type="button" class="col-md-12 thumbnail bg_pink" data-toggle="modal" data-target="#terms"><span class="text-center top_heading_2"> UPDATE</span><br>
        <span class="text-center top_txt">what you have done... </span> </button>
        <div class="col-md-12 padding0">
          <table class="main_bdr_bot" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="text-center main_bdr_bot">Terms / Courses</td>
            </tr>
            <tbody>
              <tr>
                <td><div class="txt_align"> <span>First Term</span>
                    <div class="div_align">
                      <div class="progress">
                        <div style="width:50%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-danger progress-bar-striped"> 50% Complete</div>
                      </div>
                    </div>
                  </div>
                  <div class="txt_align"> <span>Second Term</span>
                    <div class="div_align">
                      <div class="progress">
                        <div style="width:20%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" role="progressbar" class="progress-bar progress-bar-danger progress-bar-striped"> 20% Complete</div>
                      </div>
                    </div>
                  </div></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

</section>
	
	
			
<!-- Terms Popup Start -->
  <div class="modal fade" id="terms" role="dialog">
    <div class="modal-dialog subjectsDiv">  
      <div class="modal-content">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Select your term</h4>
        </div>
        
       
         <div class="modal-body" id="divTerm">
         
          <div class="col-lg-12 padding0" id="filledTerms">
         <!-- <div class="well" data-dismiss="modal" data-toggle="modal" data-target="#dailyUpdate">
            	<p>First Term</p>
            </div>
            <div class="well" data-dismiss="modal" data-toggle="modal" data-target="#dailyUpdate">
            	<p>Second Term</p>
            </div>-->
          </div>
          </div>
          
        
        <div class="modal-footer">
        </div> 
      
      
    </div>
  </div>
  </div>
  <!-- Terms Popup End -->


<!-- Daily Update Popup Start -->
  <div class="modal fade" id="dailyUpdate" role="dialog">
    <div class="modal-dialog"> 
      
      <!-- Daily Update Popup content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">How was your progress today?</h4>
        </div>
        
        <div class="modal-body" >
          <form>
            <div class="col-lg-12 padding0" id="updateSubjectBody">
            
            <table class="progressTable"  id="subjectsTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                        <tr>
                          <th colspan="2">Subject</th>
                          <th>Done</th>
                          <th colspan="3">Spent Time</th>
                        </tr>
                        <tr>
                          <td colspan="6">&nbsp;</td>
                        </tr>
                        </thead>
                        <tbody class="topicBody">
                        <!-- <tr>
                          <td colspan="2" class="title titleTh"><span id="mathsSubject">Maths</span></td>
                          <td>
                          	<center>
                            <input type="checkbox" id="maths" data-off-label="false" data-on-label="false" data-off-icon-class="glyphicon glyphicon-thumbs-down" data-on-icon-class="glyphicon glyphicon-thumbs-up" onchange="">
                            <script>
							
								$('#maths').checkboxpicker();
								$("#maths").change(function() {
									if(this.checked) {
									  $("#mathsTopicTable").show();
									}
									else {
									  $("#mathsTopicTable").hide();
									}
								});
							</script>
                            </center>
                          </td>
                          <td><input class="pull-right time" name="spentHours" type="text" placeholder="hrs"></td>
                          <td><span class="dash">-</span></td>
                          <td><input class="pull-left time" name="spentMins" type="text" placeholder="mins"></td>
                        </tr>
                        <tr>
                          <td colspan="6">
                            <table class="progressTable topicTable" id="mathsTopicTable" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>
                                <td class="title">Stats Part 01</td>
                                <td>
                                  <center>
                                  <input id="stats01" type="checkbox" data-off-label="false" data-on-label="false" data-off-icon-class="glyphicon glyphicon-thumbs-down" data-on-icon-class="glyphicon glyphicon-thumbs-up">
                                  <script>
                                      $('#stats01').checkboxpicker();
                                  </script>
                                  </center>
                                </td>
                                <td colspan="3">&nbsp;</td>
                              </tr>                            
                              <tr>
                                <td colspan="2">
                                  <input type="text" placeholder="new topic" id="newTopic" name="newTopic" class="col-lg-9">
                                  <div class="col-lg-3">
                                    <button class="btn btn-primary pull-left addTopicBtn" type="button">Add</button>
                                  </div>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                              </tr>
                            </table>
                          </td>
                        </tr> -->
                       
                       
                       
                        </tbody>
                        
                      </table>
            
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" data-target="#terms" data-toggle="modal">Back</button>
          <button type="button" class="btn btn-primary"  id="saveDailyUpdate">Save</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Daily Update Popup End -->
		

</div>
</body>

<script src="resources/js/dashboard.js"></script>


</html>
<link rel="stylesheet" type="text/css" href="resources/css/addTerm.css" >
<link rel="stylesheet" type="text/css" href="resources/css/timeSchedule.css" > 

<script>
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
$(function () {
	//$('#datetimepicker1').datetimepicker();
	$('#datetimepicker1').datetimepicker({
        format: 'YYYY-MM-DD'        
    });
	$('#datetimepicker2').datetimepicker({
        format: 'YYYY-MM-DD'        
    });
});

<!--For_Subject-->
$(function () {
	  $('#emptySubjects').hide()
	  $('#filledSubjects').show()
	  $('#colorselector').show()
	})
	$(function () {
	  $('#addTopicsDiv').hide()
	  $('#topicsDiv').hide()
	  $("#addTopicsBtnShow").click(function(){
		  $("#addTopicsDiv").toggle();
		  $("#topicsDiv").toggle();
	  });
	})
	$(function () {
		  $('.addTopicsDiv').hide()
		  $('.topicsDiv').hide()
		  $("#addTopicsBtnShow1").click(function(){
			  $(".addTopicsDiv").toggle();
			  $(".topicsDiv").toggle();
		});
	})
</script>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		id="slide-nav">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-toggle"> <span class="sr-only">Toggle
						navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a> <a class="navbar-brand" href="#">Study Pro</a>
			</div>
			<div id="slidemenu">
				<div class="logo"></div>
				<ul class="menuItems">
					<li><a class="dashboard" title="Dashboard"
						data-toggle="tooltip" data-placement="right"></a></li>
					<li><a class="calendar" title="Calendar" data-toggle="tooltip"
						data-placement="right"></a></li>
					<li><a class="reports" title="Reports" data-toggle="tooltip"
						data-placement="right"></a></li>
					<li><a class="terms" title="Terms" data-toggle="tooltip"
						data-placement="right"></a></li>
					<li><a class="help" title="Help" data-toggle="tooltip"
						data-placement="right"></a></li>
					<li class="userLi"><a class="user" title="Profile"
						data-toggle="tooltip" data-placement="right"><img
							src="images/user.jpg"></a> <a class="userName">John</a></li>
				</ul>
			</div>
		</div>
	</div>
	 <div class="outer" id="page-content">
		
		<section class="col-md-11 padding0">
			<div class="wellMain">
				<h1>Terms / Courses</h1>
				<button class="btn btn-primary pull-right" type="button"
					onclick="addTerm()">New Term /
					Course</button>
			</div>
			<div id="divTermList">
			<!-- <div class="well">
				<h1>First Term</h1>
				<button class="btn btn-primary pull-right" type="button">Manage
					Subjects</button>
				<a href="#" class="btn btn-primary pull-right editBtnPadding"> <span
					class="glyphicon glyphicon-pencil"></span> Edit
				</a>
				
			</div> -->
			</div>
		</section> 

		<!-- Add Term Popup Start -->
		<div class="modal fade" id="newTerm" role="dialog">
			<div class="modal-dialog">

				<!-- Add Term Popup content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="termsAddTitle">Add Term / Course</h4>
						<h4 class="modal-title hidden" id="termsEditTitle">Edit Term / Course</h4>
					</div>
					<div class="modal-body">
						<form id="addTermForm" method="post">
							<div class="col-lg-12 padding0">
								<div class="form-group">
									<label for="title">Title <span class="fontColorRed">*</span></label>
									<input class="col-lg-12" type="text" name="title" id="title"
										required placeholder="Your term / course title here...">
										
										
								</div>
							</div>
							<div class="col-lg-12 padding0 mrgnTop20">
								<div class="col-sm-6 padding0">
									<div class="form-group">
										<label for="startDate">Start Date <span
											class="fontColorRed">*</span></label>
										<div class="input-group date col-lg-11" id="datetimepicker1">
											<input type="text" class="form-control" required
												name="startDate" id="startDate" /> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
								</div>
								<div class="col-sm-6 padding0">
									<div class="form-group">
										<label for="endDate">End Date <span
											class="fontColorRed">*</span></label>
										<div class="input-group date col-lg-12" id="datetimepicker2">
											<input type="text" class="form-control" required
												name="endDate" id="endDate" /> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 padding0 mrgnTop20">
								<div class="form-group">
									<label for="note">Note</label>
									<textarea class="col-lg-12" type="text" name="note" id="note"
										placeholder="Type a note about your term etc..."></textarea>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<div class="col-lg-4 padding0 hidden" id="termsdelete">
				            <a class="mainDelBtn">Delete</a>
				          </div>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" 
							data-toggle="modal"  id="termssave" name="termssave">Next</button>
						<button type="button" class="btn btn-primary hidden" 
							data-toggle="modal"  id="termsupdate" name="termsupdate">Update</button>
							<!-- //data-target="#timeSchedule" data-dismiss="modal" -->
					</div>
				</div>
			</div>
		</div>
		<!-- Add Term Popup End -->		

		<!-- Time Schedule Popup Start -->
		<div class="modal fade" id="timeSchedule" role="dialog">
			<div class="modal-dialog">

				<!-- Time Schedule Popup content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Daily Time Schedule</h4>
					</div>
					<div class="modal-body">
						<form id="addTimeScheduleForm">
							<div class="col-lg-12 padding0 mrgnTop20">
								<div class="col-sm-6 padding0">
									<div class="form-group">
										<label class="weekTitles">Weekdays</label> <label
											for="hoursForWeekday">Revision hours <span
											class="fontColorRed">*</span></label>
										<div class="col-lg-11 padding0">
											<select class="form-control hourSelect" id="hoursForWeekday"
												name="hoursForWeekday">
												<option value="0">00</option>
												<option value="60">01</option>
												<option value="120">02</option>
												<option value="180">03</option>
												<option value="240">04</option>
												<option value="300">05</option>
												<option value="360">06</option>
												<option value="420">07</option>
											</select> <span>hrs</span> <select
												class="form-control hourSelect marginL20"
												id="minutesForWeekday" name="minutesForWeekday">
												<option>00</option>
												<option>30</option>
											</select> <span>mins</span>
											<button class="btn btn-warning pull-right mrgnTop20" type="button" data-dismiss="modal"
					id="WeekUpdateBtn" data-toggle="modal" data-target="#terms">
												<em>Calculate</em>
											</button>
										</div>
									</div>
								</div>
								<div class="col-sm-6 padding0">
									<div class="form-group">
										<label class="weekTitles">Weekends</label> <label
											for="hoursForWeekend">Revision hours <span
											class="fontColorRed">*</span></label>
										<div class="col-lg-11 padding0">
											<select class="form-control hourSelect" id="hoursForWeekend"
												name="hoursForWeekend">
												<option value="0">00</option>
												<option value="60">01</option>
												<option value="120">02</option>
												<option value="180">03</option>
												<option value="240">04</option>
												<option value="300">05</option>
												<option value="360">06</option>
												<option value="420">07</option>
											</select> <span>hrs</span> <select
												class="form-control hourSelect marginL20"
												id="minutesForWeekend" name="minutesForWeekend">
												<option>00</option>
												<option>30</option>
											</select> <span>mins</span>
											<button class="btn btn-warning pull-right mrgnTop20" data-dismiss="modal" type="button"
					id="WeekEndUpdateBtn" data-toggle="modal" data-target="#terms">
												<em>Calculate</em>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 padding0 mrgnTop20">
								<div class="col-sm-6 padding0">
									<div class="form-group">
										<label for="hoursForSubject">Study hours <span
											class="fontColorRed">*</span></label>
										<div class="col-lg-11 padding0">
											<select class="form-control hourSelect" id="hoursForSubject"
												name="hoursForSubject">
												<option>00</option>
												<option>01</option>
												<option>02</option>
												<option>03</option>
												<option>04</option>
												<option>05</option>
											</select> <span>hrs</span> <select
												class="form-control hourSelect marginL20"
												id="minutesForSubject" name="minutesForSubject">
												<option>00</option>
												<option>30</option>
											</select> <span>mins</span>
										</div>
										<label class="smallNote">(Minimum as you expect per subject)</label>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							data-toggle="modal" data-target="#newTerm">Back</button>
						<button type="button" class="btn btn-primary" id="timeSchedulesave" name="timeSchedulesave">Next</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Time Schedule Popup End -->
		
		<!-- Manage Subjects Popup Start -->
  <div class="modal fade" id="subjects" role="dialog">
    <div class="modal-dialog subjectsDiv"> 
      
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div class="booksImg">&nbsp;</div>
          <h4 class="modal-title">Manage Subjects</h4>
          <h5 class="modal-subtitle">First Term</h5>
        </div>
        <div class="modal-body">
         <div class="col-lg-12" id="emptySubjects">
            <p class="text-center">You haven't added any... <br><a data-dismiss="modal" data-toggle="modal" data-target="#subjectIn">Add a subject?</a></p>
          </div>
          <div class="col-lg-12 padding0" id="filledSubjects">
          <!--   <div class="well" data-dismiss="modal" data-toggle="modal" data-target="#subjectInEdit">
            	<div class="colorBox"></div>
                <p>Maths</p>
                <span class="fontColorBlue fontBold">Priority</span>
                <span class="mrgnLft10">Very High</span>
            </div>
            <div class="well" data-dismiss="modal" data-toggle="modal" data-target="#subjectInEdit">
            	<div class="colorBox"></div>
                <p>English</p>
                <span class="fontColorBlue fontBold">Priority</span>
                <span class="mrgnLft5">Medium</span>
            </div> -->
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#subjectIn">New Subject</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Manage Subjects Popup End -->
  
  <!-- New Subject Popup Start -->
  <div class="modal fade" id="subjectIn" role="dialog">
    <div class="modal-dialog subjectIn"> 
      
      <!-- New Subject Popup content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div class="booksImg">&nbsp;</div>
          <h4 class="modal-title">New Subject</h4>
          <h5 class="modal-subtitle">First Term</h5>
        </div>
        <div class="modal-body">
          <form id="addSubjectForm" method="post">
            <div class="col-lg-7 padding0">
              <div class="form-group">
                <label for="subjectId">Name <span class="fontColorRed">*</span></label>
                <input class="col-lg-12" type="text" name="name" id="name" required placeholder="Subject name...">
              </div>
            </div>
            <div class="col-lg-3 padding0 mrgnLft5">
              <div class="form-group">
                <label for="priorityLevel">Priority Level <span class="fontColorRed">*</span></label>
                <select name="priorityLevel" id="priorityLevel" class="form-control col-lg-12">
                   <option value="100">Very High</option>
                  <option value="75">High</option>
                  <option value="50">Medium</option>
                  <option value="25">Low</option>
                </select>
              </div>
            </div>
            <div class="col-lg-2 padding0 mrgnLft5">
              <div class="form-group">
                <label for="colorselector" class="colorLable">Color</label>
                <select id="colorselector">
                    <option value="771629" data-color="#771629"></option>
                    <option value="a8120e" data-color="#a8120e"></option>
                    <option value="775516" data-color="#775516"></option>
                    <option value="687615" data-color="#687615"></option>
                    <option value="d98316" data-color="#d98316"></option>
                    <option value="d9cc16" data-color="#d9cc16"></option>
                    <option value="264e8c" data-color="#264e8c"></option>
                    <option value="0a7d2d" data-color="#0a7d2d"></option>
                    <option value="1c868d" data-color="#1c868d"></option>
                    <option value="1c868d" data-color="#870a53"></option>
                    <option value="3c1172" data-color="#3c1172"></option>
                    <option value="373e4e" data-color="#373e4e"></option>
                </select>
              </div>
			  <script>
                  $('#colorselector').colorselector();
              </script>
            </div>
            <div class="col-lg-12 padding0 mrgnTop20">
              <label>What is subject?</label>
              <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...</p>
            </div>
            <div class="col-lg-12 padding0">
              <p><a class="addTopics" id="addTopicsBtnShow">Add topics</a></p>
            </div>
            <div class="col-lg-12 padding0" id="addTopicsDiv">
              <div class="col-lg-7 padding0">
                <div class="form-group">
                  <label for="newTopic">Topic Name</label>
                  <input class="col-lg-12" type="text" name="newTopic" id="newTopic" placeholder="Topic name...">
                </div>
              </div>
              <div class="col-lg-3">
                <button type="button" class="btn btn-primary pull-left addTopicBtn" id="addTopicsToTable" name="addTopicsToTable"> Add</button>
              </div>
            </div>
			<div class="col-lg-12 padding0" id="topicsDiv">
              <table id="topicsTable" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody>
                <!-- <tr>
                  <td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>
                  <td class="topicNameTd">Stats Part 01</td>
                </tr> -->
                </tbody>
              </table>
            </div>            
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#subjects">Close</button>
          <button id="subjectSave" type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#subjects">Save</button>
        </div>
      </div>
    </div>
  </div>
  <!-- New Subject Popup End -->
  
  <!-- Edit Subject Popup Start -->
  <div class="modal fade" id="subjectInEdit" role="dialog">
    <div class="modal-dialog subjectIn"> 
      
      <!-- Edit Subject Popup content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div class="booksImg">&nbsp;</div>
          <h4 class="modal-title">Edit Subject</h4>
          <h5 class="modal-subtitle">First Term</h5>
        </div>
        <div class="modal-body">
          <form id="editSubjectForm">
            <div class="col-lg-7 padding0">
              <div class="form-group">
                <label for="names">Name <span class="fontColorRed">*</span></label>
                <input class="col-lg-12" type="text" name="names" id="names" required placeholder="Subject name...">
              </div>
            </div>
            <div class="col-lg-3 padding0 mrgnLft5">
              <div class="form-group">
                <label for="priorityLevels">Priority Level <span class="fontColorRed">*</span></label>
                <select name="priorityLevels" id="priorityLevels" class="form-control col-lg-12">
                  <option value="100">Very High</option>
                  <option value="75">High</option>
                  <option value="50">Medium</option>
                  <option value="25">Low</option>
                </select>
              </div>
            </div>
            <div class="col-lg-2 padding0 mrgnLft5">
              <div class="form-group">
                <label for="colorselector" class="colorLable">Color</label>
                <select id="colorselector1">
                    <option value="771629" data-color="#771629"></option>
                    <option value="a8120e" data-color="#a8120e"></option>
                    <option value="775516" data-color="#775516"></option>
                    <option value="687615" data-color="#687615"></option>
                    <option value="d98316" data-color="#d98316"></option>
                    <option value="d9cc16" data-color="#d9cc16"></option>
                    <option value="264e8c" data-color="#264e8c"></option>
                    <option value="0a7d2d" data-color="#0a7d2d"></option>
                    <option value="1c868d" data-color="#1c868d"></option>
                    <option value="1c868d" data-color="#870a53"></option>
                    <option value="3c1172" data-color="#3c1172"></option>
                    <option value="373e4e" data-color="#373e4e"></option>
                </select>
              </div>
			  <script>
                  $('#colorselector1').colorselector();
              </script>
            </div>
            <div class="col-lg-12 padding0 mrgnTop20">
              <label>What is subject?</label>
              <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...</p>
            </div>
            <div class="col-lg-12 padding0">
              <p><a class="addTopics" id="addTopicsBtnShow1">Topics</a></p>
            </div>
            <div class="col-lg-12 padding0 addTopicsDiv" id="addTopicsDiv">
              <div class="col-lg-7 padding0">
                <div class="form-group">
                  <label for="newTopic1">Topic Name</label>
                  <input class="col-lg-12" type="text" name="newTopic1" id="newTopic1" placeholder="Topic name...">
                </div>
              </div>
              <div class="col-lg-3">
                <button type="button" id="ediTopicToTable" class="btn btn-primary pull-left addTopicBtn">Add</button>
              </div>
            </div>
            
			<div class="col-lg-12 padding0 topicsDiv" id="topicsDiv">
              <!-- <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>
                  <td class="topicNameTd topicNameTdDone">Stats Part 01</td>
                  <td><img src="resources/images/topicDone.jpg"></td>
                  <td class="spentTimeTd">4hrs & 30mins</td>
                </tr>
                <tr>
                  <td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>
                  <td>Stats Part 02</td>
                  <td>&nbsp;</td>
                  <td class="spentTimeTd">&nbsp;</td>
                </tr>
              </table> -->
              
              <table id="editTopicsTable" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody>
                <!-- <tr>
                  <td class="binTd"><a><img src="resources/images/topicDel.jpg"></a></td>
                  <td class="topicNameTd">Stats Part 01</td>
                </tr> -->
                </tbody>
              </table>
            </div>
            <div class="col-lg-12 padding0 mrgnTop20">
              <div class="col-lg-6 padding0">
               <div class="progress" id="progress">
                 <!--  <div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"
                  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
                    40%
                  </div> -->
                </div>
              </div>
              <div class="col-lg-4 padding0 pull-right">
               <div class="remainHrs">
                 <span id="hours" class="hours">148</span>hrs
                 <span id="minutes" class="minutes">30</span>mins
                 <br>
               </div>
               <div class="remainHrs">
                 <span class="normalTxt">Remaining</span>
               </div>
              </div> 
            </div>           
          </form>
        </div>
        <div class="modal-footer">
          <div class="col-lg-4 padding0">
            <a class="mainDelBtn">Delete</a>
          </div>
          <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#subjects">Close</button>
          <button type="button" id="editSubjectBtn" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#subjects">Save</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Edit Subject Popup End -->
  
  <!-- Event calculation -->
  
  <!-- <div class="outer" id="page-content">
		<section class="col-md-11 padding0">
			<div class="wellMain">
				<h1>Daily Schedule</h1>
				<button class="btn btn-primary pull-right" type="button"
					id="WeekUpdateBtn" data-toggle="modal" data-target="#terms">Week</button>
						<button class="btn btn-primary pull-right" type="button"
					id="WeekEndUpdateBtn" data-toggle="modal" data-target="#terms">Week End</button>
			</div> -->
 <div class="modal fade" id=terms role="dialog">
    <div class="modal-dialog hourCal"> 
<div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Hours Calculator</h4>
        </div>
        <div class="modal-body">
          <form>
          <div id="eventlist"></div>
        <div class="col-lg-12 padding0">
            <div class="form-group">
              <div class="col-lg-5 paddingL0">
                <input type="text" placeholder="Add new event" id="newEvent" name="newEvent" class="col-lg-10">
              </div>
              <div class="col-lg-7">
                <div class="col-lg-12 padding0">
                  <select class="form-control hourSelect" id="newHours" name="travelingHoursWeek">
            <option value="0">0</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
                  </select>
                  <span>hrs</span>
                  <select class="form-control hourSelect marginL20" id="newMins" name="travelingMinsWeek">
                    <option value="0">0</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
                  </select>
                  <span>mins</span>
                </div>
              </div>
            </div>
        </div>
        <div class="col-lg-12 padding0">
            <div class="form-group">
              <div class="col-lg-5 paddingL0">
                <button class="btn btn-default pull-left addEventBtn" type="button" id="addEvent" name="addEvent">Add Event</button>
              </div>
            </div>
        </div>
        <div class="col-lg-12 padding0">
            <div class="form-group">
              <div class="col-lg-12 padding0">
                <button id="calculate" class="btn btn-warning pull-right mrgnTop20" type="button"><em>Calculate Now</em></button>
              </div>
            </div>
        </div>
      </form>
        </div>
        <div class="modal-footer">
          <div id="calculated">
            <div class="col-lg-12 padding0">
              <p>You got <span id="freehr" class="fontColorBlue fontBold">0 hours</span> and <span id="freemin" class="fontColorBlue fontBold">0 minutes</span> free per day...</p>
            </div>
            <div class="col-lg-12 padding0 mrgnTop20">
              <p><span class="fontColorRed">Note :</span> We suggest you to spend atleast 4 hours per day for your revisions.</p>
            </div>
          </div>
          <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#timeSchedule">Back</button>
          <button id="done" type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#timeSchedule">Done</button>
        </div>
      </div>
      </div>
    </div>
        <!-- </section> 
      </div>-->
  <!-- End Event calculation -->
		
		<footer> </footer>
		
	</div>
</body>

<script src="resources/js/terms.js"></script>
<script src="resources/js/subjects.js"></script>
<script src="resources/js/timeschedule.js"></script>
<script src="resources/js/topics.js"></script>
<script src="resources/js/eventcalculate.js"></script>

</html>
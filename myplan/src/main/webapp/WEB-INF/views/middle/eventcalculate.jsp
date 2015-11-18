<link rel="stylesheet" type="text/css" href="resources/css/build.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap-colorselector.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/dashboard.css" />

<!--  Dashboard JS-->
<script src="resources/js/other/bootstrap-checkbox.min.js"></script>
<script src="resources/js/eventcalculate.js"></script>
<script>

;
</script>
	<div class="outer" id="page-content">
		<section class="col-md-11 padding0">
			<div class="wellMain">
				<h1>Daily Schedule</h1>
				<button class="btn btn-primary pull-right" type="button"
					id="WeekUpdateBtn" data-toggle="modal" data-target="#terms">Week</button>
						<button class="btn btn-primary pull-right" type="button"
					id="WeekEndUpdateBtn" data-toggle="modal" data-target="#terms">Week End</button>
			</div>
 <div class="modal fade" id=terms role="dialog">
    <div class="modal-dialog subjectsDiv"> 
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
      </section>
      </div>
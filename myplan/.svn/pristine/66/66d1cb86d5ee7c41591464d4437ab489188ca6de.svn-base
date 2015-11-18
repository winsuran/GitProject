</html>
</head>


<link rel="stylesheet" type="text/css" href="resources/css/reports.css" >


<script>
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(document).ready(function () {
    //stick in the fixed 100% height behind the navbar but don't wrap it
    $('#slide-nav.navbar .container').append($('<div id="navbar-height-col"></div>'));
    // Enter your ids or classes
    var toggler = '.navbar-toggle';
    var pagewrapper = '#page-content';
    var navigationwrapper = '.navbar-header';
    var menuwidth = '100%'; // the menu inside the slide menu itself
    var slidewidth = '20%';
    var menuneg = '-100%';
    var slideneg = '-80%';
    $("#slide-nav").on("click", toggler, function (e) {
        var selected = $(this).hasClass('slide-active');
        $('#slidemenu').stop().animate({
            left: selected ? menuneg : '0px'
        });
        $('#navbar-height-col').stop().animate({
            left: selected ? slideneg : '0px'
        });
        $(pagewrapper).stop().animate({
            left: selected ? '0px' : slidewidth
        });
        $(navigationwrapper).stop().animate({
            left: selected ? '0px' : slidewidth
        });
        $(this).toggleClass('slide-active', !selected);
        $('#slidemenu').toggleClass('slide-active');
        $('#page-content, .navbar, body, .navbar-header').toggleClass('slide-active');
    });
    var selected = '#slidemenu, #page-content, body, .navbar, .navbar-header';
    $(window).on("resize", function () {
        if ($(window).width() > 767 && $('.navbar-toggle').is(':hidden')) {
            $(selected).removeClass('slide-active');
        }
    });
});
</script>
<!--[if lt IE 9]><script src="js/respond-1.1.0.min.js"></script><![endif]-->
<!--[if gte IE 9]><style type="text/css">.gradient { filter: none; }</style>
<![endif]-->

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load('visualization', '1', {
    'packages': ['annotatedtimeline', 'corechart']
});

google.load("visualization", "1", {
    packages: ["corechart"]
});




google.load("visualization", "1", {packages:["corechart"]});
/* google.setOnLoadCallback(drawChart4);
function drawChart4() {
  var data = google.visualization.arrayToDataTable([
        ['Week', 'Maths', 'English', 'Science'],
        ['Monday', 1, 4, 2],
        ['Tuesday', 1, 4, 2],
        ['Wednesday', 6, 1, 3],
        ['Thursday', 2, 4, 3],
        ['Friday', 1, 5, 3],
        ['Saturday', 3, 4, 3],
        ['Sunday', 5, 0, 2]
    ]);

  var options = {
    title: 'Student Progress',
    hAxis: {title: 'Week', titleTextStyle: {color: '#000000'}},
    vAxis: {title: 'Hours', titleTextStyle: {color: '#000000'}}
 };

var chart = new google.visualization.ColumnChart(document.getElementById('chart_div5'));
  chart.draw(data, options);
} */

$(window).resize(function(){
 // drawChart4();
});



</script> 
<script type = "text/javascript" >

function toggle_visibility(id) {
    var e = document.getElementById(id);
    if (e.style.display == 'block')
        e.style.display = 'none';
    else
        e.style.display = 'block';
}

function myfunc(div) {
    var className = div.getAttribute("class")
    if (className == "clickUpArrow") {
        div.className = "clickDownArrow"
    } else {
        div.className = "clickUpArrow"
    }
};
</script>
</head>

<body>
<div class="outer" id="page-content">
  <section class="col-md-11 padding0">
    <div class="wellMain">
      <h1>Reports</h1>
    </div>
    <div class="col-lg-12">
    	<p class="reportsP">Please select a term to see the reports...</p>
    	<div id="termNameList">
    	</div>
    	<!-- <button class="btn btn-default btn-primary marginRight10px marginBot10px" type="button">First Term</button>
    	<button class="btn btn-default marginRight10px marginBot10px" type="button">Second Term</button> -->
	</div>
    <div class="col-lg-12 marginTop20px">
		<div class="collapse in" id="collapseExample">
		  <div id="divtxt">
                <div class="col-lg-12 marginBot10px">
                  <div class="pull-right"><div class="aaaa1"></div><label>Remaining</label></div>
                </div>
                <div class="col-lg-4">
                  <select name="subjectListOne" id="subjectListOne" class="col-lg-8 centerAlign">
	                  <option value="100">Maths</option>
	                  <option value="75">English</option>
	                  <option value="50">Science</option>
	              </select>
                  <div id="subjectPieChartOne" class="piechart"></div>
                </div>
                <div class="col-lg-4">
                  <select name="subjectListTwo" id="subjectListTwo" class="col-lg-8 centerAlign">
	                  <option value="100">Maths</option>
	                  <option value="75">English</option>
	                  <option value="50">Science</option>
	              </select>
                  <div id="subjectPieChartTwo" class="piechart"></div>
                </div>
                <div class="col-lg-4">
                  <select name="subjectListThree" id="subjectListThree" class="col-lg-8 centerAlign">
	                  <option value="100">Maths</option>
	                  <option value="75">English</option>
	                  <option value="50">Science</option>
	              </select>
                  <div id="subjectPieChartThree" class="piechart"></div>
                </div>
                <div class="col-lg-12">
                  <div id="chart_div5"></div>
                </div>
              </div>
		</div>
    </div>

  </section>
  <footer> </footer>
</div>
<script src="resources/js/reports.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPlan</title>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-combined.min.css" >
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-datepicker.css" >
<link rel="stylesheet" type="text/css" href="resources/css/font-awesome.css" >
<link rel="stylesheet" type="text/css" href="resources/css/main.css" >


<script src="resources/js/other/jquery-2.1.4.min.js"></script>
<script src="resources/js/common.js"></script>

<script src="resources/js/other/jquery-ui-1.10.4.custom.js"></script>
<script src="resources/js/other/jquery.form-validator.min.js"></script>
<script src="resources/js/other/moment.js"></script>
<script src="resources/js/other/bootstrap-datetimepicker.js"></script>
<script src="resources/js/other/bootstrap.min.js"></script>
<script src="resources/js/other/bootstrap-colorselector.js"></script>
<script type="text/javascript">
var activeUserEmai = "${sessionScope.activeUserEmai}";
if (activeUserEmai.length>0) {
	
}else{
	location.href = "/myplan";	
}
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
$(document).ready(function() {
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
</head>
<body>
	<!-- <div > -->
		 <tiles:insertAttribute name="menubar" />
		<tiles:insertAttribute name="middle" />
	<%-- 	<tiles:insertAttribute name="footer" /> --%>
	<!-- </div> -->
<div id="dvLoadingOverlay"  ></div>
<div id="dvLoading"  ></div>
</body>
</html>

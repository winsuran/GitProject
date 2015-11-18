// JavaScript Document

$(document).ready(function() {
    
    var navListItems = $('ul.setup-panel li a'),
        allWells = $('.setup-content');

    allWells.hide();

    navListItems.click(function(e)
    {
        e.preventDefault();
        var $target = $($(this).attr('href')),
            $item = $(this).closest('li');
        
        if (!$item.hasClass('disabled')) {
          /*  navListItems.closest('li').removeClass('active1');
			navListItems.closest('li').removeClass('active');
			navListItems.closest('li').addClass('disabled');
            $item.addClass('active1');
			   $item.removeClass('disabled');*/
			// $item.addClass('active1');
			$('#step1').addClass('active1');
            allWells.hide();
            $target.show();
        }
    });
    
    $('ul.setup-panel li.active a').trigger('click');
    
    // DEMO ONLY //
    $('#activate-step-2').on('click', function(e) {
        $('ul.setup-panel li:eq(1)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-2"]').trigger('click');
        $(this).remove();
		
		$('#step1').removeClass('active1 active');
		$('#step1').addClass('done');
		
		$('#step2').addClass('active2 active');
		$('#step2').removeClass('disabled');
    })    ;
    $('#activate-step-3').on('click', function(e) {
        $('ul.setup-panel li:eq(2)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-3"]').trigger('click');
        $(this).remove();
		$('#step2').removeClass('active2 active');
		$('#step2').addClass('done');
		$('#step3').addClass('active3 active');
		$('#step3').removeClass('disabled');
    })  ;
	$('#activate-step-4').on('click', function(e) {
        $('ul.setup-panel li:eq(3)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-4"]').trigger('click');
        $(this).remove();
		$('#step3').removeClass('active3 active');
		$('#step3').addClass('done');
		$('#step4').addClass('active4 active');
		$('#step4').removeClass('disabled');
    })  ;
	
	$('#collapseExample').collapse('show');
	
	$('#productinfo').on('click', function(e) {
     $('#productpanel').removeClass('panelEdit');  
	 $('#productpanel').addClass('panelDone');
	 $('#contactpanel').addClass('panelEdit');
	 
	  $(".collapse.in").collapse('hide');
	  $('#collapseExample1').collapse('show')
    }) ; 
	
	$('#editProductInfo').on('click', function(e1) {
	 $('#productpanel').addClass('panelEdit');
	 $('#productpanel').removeClass('panelDone');
	 $('#contactpanel').removeClass('panelDone');
	 $('#contactpanel').removeClass('panelEdit');
	 $('#findpanel').removeClass('panelDone');
	 $('#findpanel').removeClass('panelEdit');
	 $('#settingpanel').removeClass('panelDone');
	 $('#settingpanel').removeClass('panelEdit');
	 $('#paymentpanel').removeClass('panelDone');
	 $('#paymentpanel').removeClass('panelEdit');
	 	 
	  $(".collapse.in").collapse('hide');
	  $('#collapseExample').collapse('show');
	});
	
	$('#contactinfo').on('click', function(e) {
     $('#productpanel').removeClass('panelEdit');
	 $('#contactpanel').removeClass('panelEdit');  
	 $('#productpanel').addClass('panelDone');
	 $('#contactpanel').addClass('panelDone');
	 $('#findpanel').addClass('panelEdit');
	 
	 $(".collapse.in").collapse('hide');
	  $('#collapseExample2').collapse('show');
    }) ;
	
	$('#editContactInfo').on('click', function(e1) {
     $('#contactpanel').addClass('panelEdit');
	 $('#contactpanel').removeClass('panelDone');
	 $('#findpanel').removeClass('panelEdit');
	 $('#findpanel').removeClass('panelDone');
	 $('#settingpanel').removeClass('panelEdit');
	 $('#settingpanel').removeClass('panelDone');
	 $('#paymentpanel').removeClass('panelDone');
	 $('#paymentpanel').removeClass('panelEdit');
	 
	 $(".collapse.in").collapse('hide');
	  $('#collapseExample1').collapse('show');
	});
	
	$('#findProduct').on('click', function(e) {
     $('#productpanel').removeClass('panelEdit');
	 $('#contactpanel').removeClass('panelEdit');  
	 $('#productpanel').addClass('panelDone');
	 $('#contactpanel').addClass('panelDone');
	 $('#findpanel').addClass('panelDone');
	 $('#findpanel').removeClass('panelEdit');
	 $('#paymentpanel').addClass('panelEdit');
	 
	 $(".collapse.in").collapse('hide');
	  $('#collapseExample3').collapse('show');
    }) ;
	
	$('#editFindInfo').on('click', function(e2) {
     $('#findpanel').addClass('panelEdit');
	 $('#findpanel').removeClass('panelDone');
	 $('#paymentpanel').removeClass('panelDone');
	 $('#paymentpanel').removeClass('panelEdit');
	 $('#settingpanel').removeClass('panelEdit');
	 
	 $(".collapse.in").collapse('hide');
	 $('#collapseExample2').collapse('show');
	 $('#collapseExample').collapse('hide');
	});
	
	$('#paymentProduct').on('click', function(e) {
     $('#productpanel').removeClass('panelEdit');
	 $('#contactpanel').removeClass('panelEdit');  
	 $('#productpanel').addClass('panelDone');
	 $('#contactpanel').addClass('panelDone');
	 $('#findpanel').addClass('panelDone');
	 $('#findpanel').removeClass('panelEdit');
	 $('#paymentpanel').addClass('panelDone');
	 $('#paymentpanel').removeClass('panelEdit');
	 $('#settingpanel').addClass('panelEdit');
	 
	 $(".collapse.in").collapse('hide');
	  $('#collapseExample4').collapse('show');
    }) ;
	$('#paymentProduct1').on('click', function(e) {
     $('#productpanel').removeClass('panelEdit');
	 $('#contactpanel').removeClass('panelEdit');  
	 $('#productpanel').addClass('panelDone');
	 $('#contactpanel').addClass('panelDone');
	 $('#findpanel').addClass('panelDone');
	 $('#findpanel').removeClass('panelEdit');
	 $('#paymentpanel').addClass('panelDone');
	 $('#paymentpanel').removeClass('panelEdit');
	 $('#settingpanel').addClass('panelEdit');
	 
	 $(".collapse.in").collapse('hide');
	  $('#collapseExample4').collapse('show');
    }) ;
	
	$('#editPaymentInfo').on('click', function(e2) {
     $('#settingpanel').removeClass('panelEdit');
	 //$('#findpanel').removeClass('panelDone');
	 $('#paymentpanel').removeClass('panelDone');
	 $('#paymentpanel').addClass('panelEdit');
	 
	 $(".collapse.in").collapse('hide');
	 $('#collapseExample3').collapse('show');
	 $('#collapseExample').collapse('hide');
	});
	
	$('#activate-step-2').click();
	$('#activate-step-3').click();
	$('#activate-step-4').click();
	
	//$('#productinfo').click();
	//$('#contactinfo').click();
	//$('#findProduct').click();
	//$('#paymentProduct').click();
	
     

});

$(function () {
  $('[data-toggle="popover"]').popover()  
  $('html').on('mouseup', function(e) {
    if(!$(e.target).closest('.popover').length) {
        $('.popover').each(function(){
            $(this.previousSibling).popover('hide');
        });
    }
  });
})

$(function () {
	//$('#datetimepicker4').datetimepicker();
	
	//$("input[name=status][type=radio][value="++"]").attr("checked",true);
});


$('html').on('mouseup', function(e) {
    if(!$(e.target).closest('.popover').length) {
        $('.popover').each(function(){
            $(this.previousSibling).popover('hide');
        });
    }
});







var type="";
var enventListweek={};
var enventListweekend={};
$(document).ready(function() {
	
	$("#WeekUpdateBtn").click(function(){
		
		type="week";
		$.get("dailyschedule/getAllWeekEvent",{},function(res){
			$.each(res.Data,function(){
				enventListweek[this.eventName]=this;
			});
			addevents(enventListweek);
		});
		
	});
	
	$("#WeekEndUpdateBtn").click(function(){
		
		type="weekend";
		$.get("dailyschedule/getAllWeekEndEvent",{},function(res){
			$.each(res.Data,function(){
				enventListweekend[this.eventName]=this;
			});
			addevents(enventListweekend);
		});
		
	});
	
	$("#addEvent").click(function(){
		var newEvent=$("#newEvent").val();
		var time=parseFloat($("#newHours").val())*60+parseFloat($("#newMins").val());
		if(newEvent==""){
			return ;
		}
		
		var obj;
		if(type=="week"){
			obj={eventName:newEvent,forWeekday:time};
			enventListweek[newEvent]=obj;
			addevents(enventListweek);
		}else{
			obj={eventName:newEvent,forWeekend:time};
			enventListweekend[newEvent]=obj;
			addevents(enventListweekend);
		}
		$("#newEvent").val("");
		$("#newHours").val(0);
		$("#newMins").val(0);
	});
	
	$("#calculate").click(function(){
		calculate();
	});
	
	$("#done").click(function(){

		$.post("dailyschedule/addlist",$.wtscustomParam({dailyScheduleVOs:getEventList()}),function(res){
			alert(res.message);
		});
	});
	
	
});

function addevents(array){
	var html='';
	$.each(array,function(){
		html+='<div class="col-lg-12 padding0">';
		html+='<div class="form-group">';
		html+='<div class="col-lg-5 paddingL0">';
		html+=' <label for="travelingHoursWeek">'+this.eventName+'</label>';
		html+='</div>';
		html+='<div class="col-lg-7">';
		html+=' <div class="col-lg-12 padding0">';
		html+=' <select class="form-control hourSelect" id="'+this.eventName+'HoursWeek" name="travelingHoursWeek">';
	/*	html+=' <option value="0">00</option>';
		html+='<option value="1">01</option>';
		html+='<option value="2">02</option>';
		html+='<option value="3">03</option>';
		html+='<option value="4">04</option>';
		html+=' <option value="5">05</option>';*/
		for(var a=0;a<24;a++){
			html+=' <option value="'+a+'">'+a+'</option>';
		}
		html+=' </select>';
		html+='<span>hrs</span>';
		html+='<select class="form-control hourSelect marginL20" id="'+this.eventName+'MinsWeek" name="travelingMinsWeek">';
/*		html+=' <option value="0">00</option>';
		html+='<option value="1">01</option>';
		html+='<option value="2">02</option>';
		html+='<option value="3">03</option>';
		html+='<option value="4">04</option>';
		html+=' <option value="5">05</option>';*/
		for(var a=0;a<60;a++){
			html+=' <option value="'+a+'">'+a+'</option>';
		}
		html+=' </select>';
		html+=' <span>mins</span>';
		html+='</div>';
		html+='</div>';
		html+='</div>';
		html+='</div>';
		
	});
	$("#eventlist").html("");
	$("#eventlist").append(html);
	
	if(type=="week"){
		$.each(enventListweek,function(){
			var hr=Math.round(parseFloat(this.forWeekday)/60);
			var min=parseFloat(this.forWeekday)%60;
			$("#"+this.eventName+"HoursWeek").val(hr);
			$("#"+this.eventName+"MinsWeek").val(min);
			
		});
	}else{
		$.each(enventListweekend,function(){
			var hr=Math.round(parseFloat(this.forWeekend)/60);
			var min=parseFloat(this.forWeekend)%60;
			$("#"+this.eventName+"HoursWeek").val(hr);
			$("#"+this.eventName+"MinsWeek").val(min);
		});
	}
	
	calculate();

}

function calculate(){
	var toalahr=0;
	var totalmin=0;
	if(type=="week"){
		$.each(getEventList(),function(){
			toalahr +=Math.round(parseFloat(this.forWeekday)/60);
			totalmin +=parseFloat(this.forWeekday)%60;

			
		});
	}else{
		$.each(getEventList(),function(){
			toalahr +=Math.round(parseFloat(this.forWeekend)/60);
			totalmin +=parseFloat(this.forWeekend)%60;
		});
		
	}
	var freemin=60*24-(toalahr*60+totalmin);
	$("#freehr").html(Math.round(parseFloat(freemin)/60)+" hours");
	$("#freemin").html(parseFloat(freemin)%60+" minutes");
	
}

function getEventList(){
	var list=[];
	if(type=="week"){
		$.each(enventListweek,function(){
			var time=parseFloat($("#"+this.eventName+"HoursWeek").val())*60+parseFloat($("#"+this.eventName+"MinsWeek").val());
			var obj={eventName:this.eventName,forWeekday:time};
			list.push(obj);
	
		});
	}else{
		$.each(enventListweekend,function(){
			var time=parseFloat($("#"+this.eventName+"HoursWeek").val())*60+parseFloat($("#"+this.eventName+"MinsWeek").val());
			var obj={eventName:this.eventName,forWeekend:time};
			list.push(obj);
		});
		
	}
	
	return list;
}
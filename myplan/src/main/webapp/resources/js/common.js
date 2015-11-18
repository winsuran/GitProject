$.fn.serializeObject = function() {
        var o = {};
//        var a = this.serializeArray();
        $(this).find('input,input[type="hidden"], input[type="text"], input[type="password"], input[type="checkbox"]:checked, input[type="radio"]:checked, select, textarea').each(function() {
            if ($(this).attr('type') == 'hidden') { //if checkbox is checked do not take the hidden field
                var $parent = $(this).parent();
                var $chb = $parent.find('input[type="checkbox"][name="' + this.name.replace(/\[/g, '\[').replace(/\]/g, '\]') + '"]');
                if ($chb != null) {
                    if ($chb.prop('checked')) return;
                }
            }
            if (this.name === null || this.name === undefined || this.name === '') return;
            var elemValue = null;
            if ($(this).is('select')){
            	elemValue = $(this).find('option:selected').val();
            }else if ($(this).attr("type")=='checkbox'){
            	if ($(this).prop('checked')==true){
            		elemValue = this.value;
            	}else{
            		if($(this).attr('data-falsevalue')){
            			elemValue=$(this).attr('data-falsevalue');
            		}else{
            			elemValue="";
            		}
            		
            	}
            	
            }else{
            	elemValue = this.value;
            }
            
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(elemValue || '');
            } else {
                o[this.name] = elemValue || '';
            }
        });
        return o;
        }

function saveData(formid,controller){
	
	var validate=true;
	$.each($("#"+formid+" input[type=text], #"+formid+" select"),function(){
		if($(this).val()==""){
			$(this).focus();
			validate=false;			
			return false;
		}
	});
	if(validate){
	
		$.post(controller+"/add",$("#"+formid).serializeObject(),function(response,textStatus){
			alert(response.message);
			if(response.success){
				
			
			}

		},"json").fail(function(data){
			alert(data.statusText);
		});
	}else{
		alert("Please fill out all values");
	}
}

function saveUser(formid,controller) {
	
	$.ajax({
		type : "POST",
		url : "users/save",
		data : $("#"+formid).serializeObject(),
		dataType : "json",
		// async : false,
		error : function(val) {

		},
		success : function(text) {
			
		}

	});
}
$(document).ready(function() {
	
	//Add/Edit term pop up close event 
	$('#newTerm').on('hidden.bs.modal', function () {
		$('#addTermForm')[0].reset();
		$("#termsupdate").addClass('hidden');
		$("#termssave").removeClass('hidden');
		});
	
});

(function($) {
	// copy from jquery.js
	var r20 = /%20/g,
	rbracket = /\[\]$/;

	$.extend({
	wtscustomParam: function( a ) {
	  var s = [],
	    add = function( key, value ) {
	      // If value is a function, invoke it and return its value
	      value = jQuery.isFunction( value ) ? value() : value;
	      if(value!=null )//
	    	  s[ s.length ] = encodeURIComponent( key ) + "=" + encodeURIComponent( value );
	    };

	  // If an array was passed in, assume that it is an array of form elements.
	  if ( jQuery.isArray( a ) || ( a.jquery && !jQuery.isPlainObject( a ) ) ) {
	    // Serialize the form elements
	    jQuery.each( a, function() {
	      add( this.name, this.value );
	    });

	  } else {
	    for ( var prefix in a ) {
	      buildParams( prefix, a[ prefix ], add );
	    }
	  }

	  // Return the resulting serialization
	  return s.join( "&" ).replace( r20, "+" );
	}
	});

	/* private method*/
	function buildParams( prefix, obj, add ) {
	if ( jQuery.isArray( obj ) ) {
	// Serialize array item.
	jQuery.each( obj, function( i, v ) {
	  if (rbracket.test( prefix ) ) {
	    // Treat each array item as a scalar.
	    add( prefix, v );

	  } else {
	    buildParams( prefix + "[" + ( typeof v === "object" || jQuery.isArray(v) ? i : "" ) + "]", v, add );
	  }
	});

	} else if (obj != null && typeof obj === "object" ) {
	// Serialize object item.
	for ( var name in obj ) {
	  buildParams( prefix + "." + name, obj[ name ], add );
	}

	} else {
	// Serialize scalar item.
	add( prefix, obj );
	}
	};
	})(jQuery);


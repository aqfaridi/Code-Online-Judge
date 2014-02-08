//
//	jQuery Validate example script
//
//	Prepared by David Cochran
//
//	Free for your use -- No warranties, no guarantees!
//

$(document).ready(function(){
	$('#contact-form').validate({
	    rules: {

             fullname: {
                 minlength: 6,
                required: true

                },

	      username: {
                nospace:true,
	        minlength: 2,
	        required: true
	      },

            passwd:{
                required:true,
                minlength: 6
                },
             password:{
                required:true,
                minlength: 6
                },
             conpasswd:{
                     required:true,
                    equalTo: "#passwd"
                    },

              sem:
                {
                    minlength: 1,
                    required: true
                  
                },

            email: {
                    required: true,
                    email: true
                  },

            number: {
                minlength: 10,
                number:true,
                required: true
            }
              },//rules close here
	  
highlight: function(element) {
        $(element).closest('.control-group').removeClass('success').addClass('error');
},
success: function(element) {
        element
        .text('OK!').addClass('valid')
        .closest('.control-group').removeClass('error').addClass('success');
}
           });//validate function close
           
	
}); // end document.ready

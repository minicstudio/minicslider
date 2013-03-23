jQuery(document).ready(function() {
// Popup functions
	// Open
	$('.open-popup').click(function(e){
		e.preventDefault();
		minic.showPopup($(this));
	});
	// Close
	$('.close-popup').click(function(e){
		e.preventDefault();
		minic.closePopup($(this));
	});

// Container animations
	// Open
	$('.minic-open').click(function(e){
		e.preventDefault();
		$('.minic-container.active').slideUp();
		var container = $(this).attr('href');
		$(container).addClass('active').slideDown(function(){			
			$.scrollTo(container, 500, {offset: {top: -50}});
		});
	});
	// Close
	$('.minic-close').click(function(e){
		e.preventDefault();
		$($(this).attr('href')).slideUp();
	});

// Newsletter
	$('#show-newsletter').click(function(event){
	    event.preventDefault();
	    $('#newsletter').fadeIn();
	})
	$('#sendInfo').click(function(event){
	    minic.closePopup($(this));
	    minic.newsletter();
	});

// FeedBack
	$('#send-feedback').click(function(e){
		e.preventDefault();
		if(!$(this).hasClass('disabled')){
			minic.feedback();
		}
	});

// Bug Report
	$('#send-bug').click(function(e){
		e.preventDefault();
		if(!$(this).hasClass('disabled')){
			minic.bugReport();
		}
	});

// Messages
	// Close
	$('.message .close').live('click', function(){
		$(this).parent().fadeOut();
	});
	
});
var minic = {
	/*
	* Newsletter subscription
	*/
	newsletter: function(){
	    $.getJSON("http://module.minic.ro/minic/process.php?domain={$minic.info.domain}&psversion={$minic.info.psVersion}&version={$minic.info.version}&email="+$('#sendInfoEmail').val()+"&action=install&callback=?");
	},
	/*
	* Feedback
	*/
	messages: {},
	feedback: function(){
		// Data
		var info = {
			name: $('#feedback-name').val(),
			email: $('#feedback-email').val(),
			site: $('#feedback-domain').val(),
			message: $('#feedback-message').val(),
			psversion: $('#info-psversion').text(),
			version: $('#info-version').text(),
			action: 'feedback'
		};

		// Data Checks
		var error = false;
		if(!info.name){
			this.messages.name = 'Name is required';
			error = true;
		}
		if(!info.email){
			this.messages.email = 'E-mail is required.';
			error = true;	
		}
		if(!info.site){
			this.messages.site = 'Site address is required.'
			error = true;
		}
		if(!info.message){
			this.messages.message = 'No message?';
			error = true;
		}
		
		if(error){
			this.showResponse($('#feedback-response'), this.messages, 'error');
			return false;
		}

		// Sending
		$.ajax({
			type: 'GET',
			url: 'http://www.module.minic.ro/slider/process.php',
			async: true,
			cache: false,
			crossDomain: true,
			dataType : "jsonp",
			data: info,
			success: function(jsonData){
				if (jsonData.error == 'true'){
					this.showResponse($('#feedback-response'), 'Sorry but the sending failed! Please try again later.', 'error');
				}else{
					// Disable send button
					$('#send-feedback').addClass('disabled');
					minic.showResponse($('#feedback-response'), 'Message sent successfull! Thank you for your time.', 'conf');
				}
			},
			error: function(XMLHttpRequest) {
				console.log(XMLHttpRequest);
			}
		});
	},
	/*
	* Bug Report
	*/
	bugReport: function(){
		// Data
		var info = {
			name: $('#bug-name').val(),
			email: $('#bug-email').val(),
			site: $('#bug-domain').val(),
			message: $('#bug-message').val(),
			psversion: $('#info-psversion').text(),
			version: $('#info-version').text(),
			server: $('#info-server').text(),
			php: $('#info-php').text(),
			mysql: $('#info-mysql').text(),
			theme: $('#info-theme').text(),
			userinfo: $('#info-browser').text(),
			module: $('#info-module').val(),
			context: $('#info-context').val(),
			action: 'bug'
		};

		// Data Checks
		var error = false;
		if(!info.name){
			this.messages.name = 'Name is required';
			error = true;
		}
		if(!info.email){
			this.messages.email = 'E-mail is required.';
			error = true;	
		}
		if(!info.site){
			this.messages.site = 'Site address is required.'
			error = true;
		}
		if(!info.message){
			this.messages.message = 'No message?';
			error = true;
		}
		
		if(error){
			this.showResponse($('#bug-response'), this.messages, 'error');
			return false;
		}

		// Sending
		$.ajax({
			type: 'GET',
			url: 'http://www.module.minic.ro/slider/process.php',
			async: true,
			cache: false,
			crossDomain: true,
			dataType : "jsonp",
			data: info,
			success: function(jsonData){
				if (jsonData.error == 'true'){
					this.showResponse($('#bug-response'), 'Sorry but the sending failed! Please try again later.', 'error');
				}else{
					// Disable send button
					$('#send-feedback').addClass('disabled');
					minic.showResponse($('#bug-response'), 'Message sent successfull! Thank you for your time.', 'conf');
				}
			},
			error: function(XMLHttpRequest) {
				console.log(XMLHttpRequest);
			}
		});
	},
	/*
	* Show response messages
	*
	* where - the error message container
	* message - the message to show
	* type - error or conf (the class of the message)
	*/
	showResponse: function(where, messages, type){
		var html = '';
		var i = 1;
		if($.isPlainObject(messages)){
			$.each(messages, function(index, value){
				html += '<p><b>'+i+'.</b> '+value+'</p>';
				i++;
			});	
		}else{
			html = messages;
		}
		
		where.hide().children('.content').html(html);
		where.removeClass('conf, error').addClass(type).fadeIn();
		$.scrollTo(where, 500, {offset: {top: -50}});
	},
	/*
	* Show minic Popup
	*
	* popup - the clicked element
	*/
	showPopup: function(popup){
		$(popup.attr('data-popup')).addClass('active').fadeIn();
	},

	/*
	* Close popup
	*
	* popup - the clicked element
	*/
	closePopup: function(popup){
		$(popup.attr('data-popup')).removeClass('active').fadeOut();	
	},
}
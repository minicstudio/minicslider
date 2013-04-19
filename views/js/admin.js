jQuery(document).ready(function() {
/* Slides Navigation */  
	var languages_nbr = $('.slides-holder ul').size();
	$('#slides-navigation a').click(function(event){
		event.preventDefault();
		$('#slides-navigation').find('.active').removeClass('active');
		$(this).addClass('active');
		$('.slides-holder').transition({x : -($(this).index()*100)/languages_nbr+'%'}, 500, 'snap');
	});

/* Slider List open/close */
	$('.slide-header').click(function() {
		var slide_holder = $(this).parent('.slide');
		$(this).slideUp();
		slide_holder.toggleClass('active').children('.slide-body').slideToggle();
		// $.scrollTo('#order_1h1', 500, {offset: {top: -50}});
	});

	$('.slide-body .minic-close').click(function(event){
		event.preventDefault();
		var listElem = $(this).closest('.slide');
		listElem.removeClass('active');
		listElem.children('.slide-header').slideDown();
		listElem.children('.slide-body').slideToggle();
	});

/* Animation Options */
	$('#add').click(function() {
		return !$('#select1 option:selected').remove().appendTo('#select2');
	});

	$('#remove').click(function() {
		return !$('#select2 option:selected').remove().appendTo('#select1');
	});
	
	$('#submitOptions').click(function() {
		$('#options .select').find('option').each(function() {
			$(this).attr("selected", "selected");
		});	
	});

/* ON/OFF Switch */
	$('.switch').click(function(){
		if($(this).hasClass('active')){
			$(this).removeClass('active').addClass('inactive');
			$(this).children('input').val(0);
		}else{
			$(this).removeClass('inactive').addClass('active');
			$(this).children('input').val(1);
		}
	});

/* Tooltip */
	$('.input-holder .tooltip').tipsy({
		fade: true,
		gravity: $.fn.tipsy.autoNS,
		offset: 10,
		trigger: 'focus'
	});
	$('label .tooltip').tipsy({
		fade : true,
		gravity : $.fn.tipsy.autoNS,
		offset : 10,
	});

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
	    minic.newsletter(true);
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
	newsletter: function(email){
		var info = {
	    	module: $('#info-module').text(),
	    	domain: $('#info-domain').text(),
	    	psversion: $('#info-psversion').text(),
	    	version: $('#info-version').text(),
	    	email: (email) ? email = $('#sendInfoEmail').val() : email,
	    };

	    $.ajax({
	    	type: 'GET',
			url: 'http://clients.minic.ro/process/install',
			async: true,
			cache: false,
			crossDomain: true,
			dataType : "jsonp",
			data: info,
	    });
	},
	/*
	* Feedback
	*/
	messages: {},
	feedback: function(){
		// Data
		var info = {
			module: $('#info-module').text(),
			name: $('#feedback-name').val(),
			email: $('#feedback-email').val(),
			domain: $('#feedback-domain').val(),
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
		if(!info.domain){
			this.messages.domain = 'Website domain is required.';
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
			url: 'http://clients.minic.ro/process/feedback',
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
			module: $('#info-module').text(),
			name: $('#bug-name').val(),
			email: $('#bug-email').val(),
			domain: $('#bug-domain').val(),
			message: $('#bug-message').val(),
			version: $('#info-version').text(),
			psversion: $('#info-psversion').text(),
			server: $('#info-server').text(),
			php: $('#info-php').text(),
			mysql: $('#info-mysql').text(),
			theme: $('#info-theme').text(),
			browser: $('#info-browser').text(),
			context: $('#info-context').val(),
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
		if(!info.domain){
			this.messages.domain = 'Website domain is required.';
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
			url: 'http://clients.minic.ro/process/bug',
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
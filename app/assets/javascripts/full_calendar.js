var initialize_calendar;
initialize_calendar = function() {
	$('.calendar').each(function(){
		var calendar = $(this);
		calendar.fullCalendar({
			header: {
				left: 'prev,next today',
				right: 'month,agendaWeek'
			},
			selectable: true,
			allDaySlot: false,
			scrollTime :  "04:00:00",
			selectHelper: true,
			editable: true,
			durationEditable: true,
		    minTime: "04:00:00",
		    maxTime: "23:00:00",
			defaultView: 'agendaWeek',
			eventLimit: true,
			eventSources: [
		      {
		        url: '/meetings'
		      }
		    ],
			eventRender: function eventRender( event, element, view ) {
			  eventColor: event.color;
		      var showSearchTerms = true;
		      var searchTerms = $('#searchTerm').val().toLowerCase();
		      // /* filters */
		      if (searchTerms.length > 0){
		        showSearchTerms = event.description.toLowerCase().indexOf(searchTerms) >= 0;
		      }
			  
						
		      return showSearchTerms;					
		    },
	    eventResize: function(meeting, delta,revertFunc) {
		    
		    event_data = {
					meeting: {
						id: meeting.id,
						start: meeting.start.format("YYYY-MM-DD HH:mm"),
						end: meeting.end.format("YYYY-MM-DD HH:mm")
					}
				};
				$.ajax({
					url: "meetings/"+meeting.id,
					data: event_data,
					type: 'PATCH'
				});
		    },
 
			select: function(start, end) {
				$('#start').val(moment(start).format("YYYY-MM-DD HH:mm") )
				$('#end').val(moment(end).format("YYYY-MM-DD HH:mm") )
				$('#new_meet').modal('show');
				calendar.fullCalendar('unselect');
			},

			eventDrop: function(meeting, delta,revertFunc) {
				event_data = {
					meeting: {
						id: meeting.id,
						start: meeting.start.format("YYYY-MM-DD HH:mm"),
						end: meeting.end.format("YYYY-MM-DD HH:mm")
					}
				};
				$.ajax({
					url: "meetings/"+meeting.id,
					data: event_data,
					type: 'PATCH'
				});
			},

			eventClick: function(meeting, jsEvent, view) {
				$.getScript("meetings/"+meeting.id+"/edit");
			}
		});
	})
};
$(document).on('turbolinks:load', initialize_calendar);
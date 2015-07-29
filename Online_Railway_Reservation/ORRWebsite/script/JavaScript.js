var result = document.querySelector('#result');
			
			navigator.geolocation.getCurrentPosition(geoFunc, errFunc)
			
			function geoFunc(e){
				console.log(e);
				var lati = e.coords.latitude;
				var loti = e.coords.longitude;
				var accu = e.coords.accuracy;
				result.innerHTML += 'Latitude: '+lati+'<br>Longitude: '+loti+'<br>';
				// Google Map
				var mapcanvas = document.createElement('div');
				mapcanvas.id = 'mapcontainer';
				mapcanvas.style.height = '400px';
				mapcanvas.style.width = '600px';
				document.querySelector('#gMap').appendChild(mapcanvas);
				var coords = new google.maps.LatLng(lati,loti);
				var options = {
					zoom: 15,
					center: coords,
					mapTypeControl: true,
					navigationControlOptions: {
						style: google.maps.NavigationControlStyle.SMALL
					},
					mapTypeId: google.maps.MapTypeId.ROADMAP
				};
				var map = new google.maps.Map(document.getElementById("mapcontainer"), options);
				
				var rendererOptions = { map: map };
				directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
        		// Begin route
				var start_point = new google.maps.LatLng (lati,loti);
				var dest_point = new google.maps.LatLng (10.791645,106.702395);
				var request = {
						origin: dest_point,
						destination: start_point,
						travelMode: google.maps.DirectionsTravelMode.DRIVING
						};
				directionsService = new google.maps.DirectionsService();
				directionsService.route(request, function(response, status) {
          console.log(response);
					if (status == google.maps.DirectionsStatus.OK) {
						directionsDisplay.setDirections(response);
						console.log(response);
						var distance = response.routes[0].legs[0].distance.text;
						result.innerHTML += 'Bạn cách tôi: '+distance;
					}else{
						console.log('failed to get directions');
					}
				});
				
			}
			function errFunc(e){
				console.log(e);
				// PERMISSION_DENIED: 1
				// POSITION_UNAVAILABLE: 2
				// TIMEOUT: 3
			}

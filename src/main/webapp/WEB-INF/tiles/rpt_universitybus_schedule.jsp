<script type="text/javascript">
	$(document).ready(function(){

		functionGetUniversityBusSchedule();

		function functionGetUniversityBusSchedule(){
		$.get("view-all-University-bus-schedule", function(data){

			var uniBusScheduleData= '';
			for(var key in data){
				uniBusScheduleData += '<tr><td>' + data[key].busName + '</td><td>'+timeFormat24to12(data[key].startingTime) + '</td><td>'+ data[key].stationFrom +'</td><td>'+ data[key].stationTo +'</td><td>'+ data[key].driverName +'</td><td>'+ data[key].helperName +'</td><td>'+ data[key].helperContact +'</td></tr>';
			}

			$("#tblUniBusSchedule").append(uniBusScheduleData);

		})
	}

	});

	
</script>

<!--for font -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<legend style="padding-left: 10%;">University Bus Schedule</legend>

<!-- <div>
	<input type="button" id="viewuniBusSchedule" name="viewuniBusSchedule" value="Show Report">
</div> -->
<div class="col-md-12 ">
	<div class="col-md-1">
		
	</div>
<div class="col-md-10 custom_shadow">

	<div align="center">
		<img align="middle" height="60" width="70" src="/img/diuicon.png">
		<h2 align="center">Daffodil International University</h2>
		<h5 align="center">102 Sukrabad, Dhanmondi, Dhaka-1207.<h5>
		<h5 align="center">Phone: 01872324351, Email: info@diu.edu.bd<h5>
			<br>
			<br>

			<h4>Bus Schedule For Student & Teacher</h4><br>
	</div>

	<table id="tblUniBusSchedule" class="table table-bordered" align="center">
		<tr>
			<th>Bus Name</th>
			<th>Starting Time</th>
			<th>From Location</th>
			<th>To Location</th>
			<th>Driver Name</th>
			<th>Helper Name</th>
			<th>Helper Contact</th>
		</tr>
		
	</table>

	<a href="#" class="btn btn-default"><span class="glyphicon glyphicon-save"></span> Download</a>
	<a href="#" class="btn btn-default"><span class="fa fa-print"></span> Print</a>
	
</div>
</div>
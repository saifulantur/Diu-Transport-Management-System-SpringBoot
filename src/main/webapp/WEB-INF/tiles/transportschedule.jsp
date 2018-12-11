<script type="text/javascript">
	var allVenue = [];
  var allTransportInformation =[];
  var allTransportType = [];
  var allDriver = [];
  var allHelper = [];


  function getAllTransportInformation(){

    $.post("viewAllTransportInformation",function(data){

      allTransportInformation = data;

    });
  }

   function getAllTransportType(){

    $.post("viewAllTransportType",function(data){

      allTransportType = data;

    });
  }


	$(document).ready(function(){

		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");

        getAllTransportInformation();
        getAllTransportType();
        getAllVenue();
        getDriverName();
        getHelperName();

		funTransportScheduleViewData();


		 $.post("viewAllInstitute", function(data){
			//alert(JSON.stringify(data));
			var fkInstituteComboBox = '<select id="fkInstitute" class="form-control" disabled>';
			for(var key in data)
			{
				fkInstituteComboBox += '<option value="' + data[key].id + '">' +data[key].instituteName+ '</option>';
			}
			fkInstituteComboBox += '</select>';

			$("#divFkInstitute").html(fkInstituteComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
		});
		
		$.post("viewAllTransportType", function(data){
			//alert(JSON.stringify(data));
			var transportTypeComboBox = '<select id="fkTransportType" class="form-control">';
			
			for(var key in data)
			{
				transportTypeComboBox += '<option value="' + data[key].id + '">' +data[key].typeTitle+ '</option>';
			}
			transportTypeComboBox += '</select>';

			$("#divFkTransportType").html(transportTypeComboBox);
			//alert(JSON.stringify(brandmodelComboBox));

			$( "#fkTransportType" ).change(function() {
					viewTransportName( $(this).val() );
					});
			
		});

		function viewTransportName(transportTypeId){//brandId
		
			$.post("viewTransportInformationByFkTransportType",{transportTypeId: transportTypeId}, function(data){
				//alert(JSON.stringify(data));
				var fkTrnsportId = '<select id="fkTransportId" class="form-control">';
				for(var key in data)
				{
					fkTrnsportId += '<option value="' + data[key].id + '">' +data[key].transportName+'</option>';
				}
				fkTrnsportId += '</select>';

				$("#divFkTransportId").html(fkTrnsportId);
				//alert(JSON.stringify(brandmodelComboBox));
			});
		}


    function getDriverName(){
		$.post("viewAllDriver", function(data){

      //for showing driver name instead of id
      allDriver = data;

			var fkDriverId = '<select id="fkDriver" class="form-control">';
			for(var key in data)
			{
				fkDriverId += '<option value="' + data[key].id + '">' +data[key].driverName+" , "+data[key].driverCode+ '</option>';
			}
			fkDriverId += '</select>';

			$("#divfkDriverId").html(fkDriverId);
			//alert(JSON.stringify(brandmodelComboBox));
		});
  }

     function getHelperName(){
		$.post("viewAllHelper", function(data){

			allHelper = data;
			//alert(JSON.stringify(data));
			var fkHelper = '<select id="fkHelper" class="form-control">';
			for(var key in data)
			{
				fkHelper += '<option value="' + data[key].id + '">' +data[key].helperName+" , "+data[key].helperCode+ '</option>';
			}
			fkHelper += '</select>';

			$("#divfkHelperId").html(fkHelper);
			//alert(JSON.stringify(brandmodelComboBox));
		});
  }


		$.post("viewAllVenue", function(data){
			//alert(JSON.stringify(data));
			var transportScheduleComboBox = '<select id="venueName" class="form-control">';
			for(var key in data)
			{
				transportScheduleComboBox += '<option value="' + data[key].id + '">' +data[key].venueName+ '</option>';
			}
			transportScheduleComboBox += '</select>';

			$("#divTransportScheduleFromLocation").html(transportScheduleComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
		});

		$.post("viewAllVenue", function(data){
			//alert(JSON.stringify(data));
			var transportScheduleComboBox = '<select id="venueName1" class="form-control">';
			for(var key in data)
			{
				transportScheduleComboBox += '<option value="' + data[key].id + '">' +data[key].venueName+ '</option>';
			}
			transportScheduleComboBox += '</select>';

			$("#divTransportScheduleToLocation").html(transportScheduleComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
		});

		
		
		function validator(){

            var fkInstitute	= $.trim($("#fkInstitute").val());
            var fkTransportId	= $.trim($("#fkTransportId").val());
            var fkDriver	= $.trim($("#fkDriver").val());
            var fkHelper	= $.trim($("#fkHelper").val());
			var fkFromLocation = $.trim($("#venueName").val());
			var fkToLocation = $.trim($("#venueName1").val());
			var departureTime = $.trim($("#departureTime").val());
			var expectedTravelTime = $.trim($("#expectedTravelTime").val());
			var capacity = $.trim($("#capacity").val());
			
			if(fkInstitute == ""){
                $("#errorMessage").html("Please Select a valid fkInstitute"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 
            else if(fkTransportId == ""){
                $("#errorMessage").html("Please Select a valid fkTransportId"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 
            else if(fkDriver == ""){
                $("#errorMessage").html("Please Select a valid fkDriver"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 
            else if(fkHelper == ""){
                $("#errorMessage").html("Please Select a valid fkHelper"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 
            else if(departureTime == ""){
                $("#errorMessage").html("Please Select a valid departureTime"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 
            else if(fkFromLocation == ""){
                $("#errorMessage").html("Please Select a valid Location"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 

            else if(fkToLocation == ""){
                $("#errorMessage").html("Please Select a valid fkToLocation"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 
            else if(expectedTravelTime == ""){
                $("#errorMessage").html("Please Select a valid expectedTravelTime"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 
            else if(capacity == ""){
                $("#errorMessage").html("Please Select a valid capacity"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 
           else{return true;}
        }//end of validation check

                /* Submitting form to controller*/
        $("#saveTransportSchedule").click(function(event) {

            event.preventDefault();

            if (validator()){

                var transportSchedule = {};

                transportSchedule["fkInstitute"] = $.trim($("#fkInstitute").val());
                transportSchedule["fkTransportId"] = $.trim($("#fkTransportId").val());
                transportSchedule["fkDriver"] = $.trim($("#fkDriver").val());
                transportSchedule["fkHelper"] = $.trim($("#fkHelper").val());
                transportSchedule["fkFromLocation"] = $.trim($("#venueName").val());
                transportSchedule["fkFromLocation"] = $.trim($("#venueName").val());
                transportSchedule["fkToLocation"] = $.trim($("#venueName1").val());
                transportSchedule["departureTime"] = timeFormat12to24($.trim($("#departureTime").val()));
                transportSchedule["expectedTravelTime"] = $.trim($("#expectedTravelTime").val());
                transportSchedule["capacity"] = $.trim($("#capacity").val());

                
               

                //alert(JSON.stringify(brands)); 
                
                //return false;
                $.ajax({
                    type: "POST",
                    url: "saveTransportSchedule",
                    data: JSON.stringify(transportSchedule),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                   
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");

                        funTransportScheduleViewData();

                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#successMessage").addClass("hidden");
                        /*$("#submit").prop("disabled", false); */
                        alert(JSON.stringify(error));
                    }
                });

            } // End of validation
        }); // End of form submission

        function funTransportScheduleViewData(){
        	
        	$.post("viewAllTransportSchedule",function(data){
        		
        		var transportScheduleData = '<table  class="table table-bordered table-hover" id="tblTransportSchedule">' +
    			                    '<thead><tr><th style="display:none;">ID</th><th>Transport Type</th><th>Transport Name</th><th>From Location</th><th>To Location</th><th>Departure Time</th><th>Driver</th><th>Helper</th><th></th><th></th><th></th></tr></thead><tbody>';
    			                    //alert("Yep....!");
    			                    
    			for(var key in data){  
    				
    				//foreign key id to name  mapping
					var fromLocation = allVenue.filter(object => {

						return object.id === data[key].fkFromLocation

						});//end of foreign key id to name  mapping

					//foreign key id to name  mapping
					var toLocation = allVenue.filter(object => {

						return object.id === data[key].fkToLocation

						});//end of foreign key id to name  mapping

          //foreign key id to name  mapping
          var transportInfo = allTransportInformation.filter(object => {

            return object.id === data[key].fkTransportId

            });//end of foreign key id to name  mapping

          //foreign key id to name  mapping
          var fkTransportType = allTransportType.filter(object => {

            return object.id === transportInfo[0].fkTransportType

            });//end of foreign key id to name  mapping
          //foreign key id to name  mapping
          var fkDriverName = allDriver.filter(object => {

            return object.id === data[key].fkDriver

            });//end of foreign key id to name  mapping
          //foreign key id to name  mapping
          var fkHelperName = allHelper.filter(object => {

            return object.id === data[key].fkHelper

            });//end of foreign key id to name  mapping
          //alert(JSON.stringify(oneUser));


    				transportScheduleData += '<tr><td style="display:none;">' + data[key].id + '</td><td>' +  fkTransportType[0].typeTitle + '</td><td>' + transportInfo[0].transportName + '</td><td>' + fromLocation[0].venueName + '</td><td>' + toLocation[0].venueName + '</td><td>' + timeFormat24to12(data[key].departureTime) + '</td><td>'+fkDriverName[0].driverName+ '</td><td>' + fkHelperName[0].helperName+ '</td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
    			}                 
						    			
    			transportScheduleData += '</tbody></table>';
    		
        		
        		$("#divTransportSchedule").html(transportScheduleData);
            $("#tblTransportSchedule").DataTable();
        		
        		
        		
        	});
        }
		


        //Departure Time
		        $(function () {
                $('#departureTime').datetimepicker({
                    format: 'LT'
                    //timeFormat: 'h:mm:ss'
                });
            });
		


	});//end of reday document

   //foreign key id to name  mapping
	function getAllVenue(){
		$.post("viewAllVenue",function(data){

			allVenue = data;

		});
	}
	//end of foreign key id to name  mapping
	
</script>
<!-- <style type="text/css">
	  .affix {
      top: 100;
      width: 100%;
      z-index: 9999 !important;
      display: block;
  }
</style> -->


<div class="col-md-12 ">
  <div class="col-md-1"></div>
  <div class="col-md-10">
  <div>
	   <legend>Existing Transport Schedule</legend>
  </div>
  <h3><a class="label label-primary" href="https://daffodilvarsity.edu.bd/images/diu/DIU-Routemap.jpg" target="_blank">DIU Bus Route</a></h3>
	<div id="divTransportSchedule"></div>
  </div>
	
</div>
<div class ="col-md-12">
  <div class="col-md-2"></div>
  <div class="col-md-8 custom_shadow">
  <form>
    <fieldset>

      <!-- Form Name -->
      <legend>Create New Transport Schedule</legend>

        <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A;color:#fff;"></div>
        <div class="well well-sm" id="errorMessage"style="background-color:red;color:#fff;"></div>

      <div class="form-group col-md-12">
        <label for="divFkInstitute">Institute</label>
          <div id="divFkInstitute"></div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-6">
    				<label for="fkTransportType">Transport Type</label>
    				<div id="divFkTransportType"></div>
    	 </div>

        <div class="form-group col-md-6">
          <label for="divFkTransportId">Transport Name</label>
            <div id="divFkTransportId">
              <select class="form-control input-md"></select>     
            </div>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="divfkDriverId">Driver</label>
          <div id="divfkDriverId"></div>
        </div>

        <div class="form-group col-md-6">
          <label for="divfkHelperId">Helper</label>
          <div id="divfkHelperId"></div>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="selectbasic">From Location</label>
            <div id="divTransportScheduleFromLocation">
              <select class="form-control input-md"></select>
            </div>
        </div>

        <div class="form-group col-md-6">
          <label for="fkToLocation">To Location</label>
            <div id="divTransportScheduleToLocation">
              <select class="form-control input-md"></select>
            </div>
        </div>
      </div>


      <div class="form-row">
        <div class="form-group col-md-4">
          <label for="departureTime">Departure Time</label>
          <input id="departureTime" name="departureTime" placeholder="Departure Time" class="form-control input-md" type="text" >
        </div>
        
        <!-- Text input-->
        <div class="form-group col-md-4">
          <label for="expectedTravelTime">Expected Travel Time</label>
          <input id="expectedTravelTime" name="expectedTravelTime" placeholder="Expected Travel Time in Minutes" class="form-control input-md"type="text">
        </div>

        <!-- Text input-->
        <div class="form-group col-md-4">
          <label for="capacity">Capacity</label>
          <input id="capacity" name="capacity" placeholder="Capacity" class="form-control input-md" type="text">
        </div>
      </div>

      <!-- Button (Double) -->
      <div class="form-group">
        <label class="col-md-4 control-label" for="saveTransportSchedule"></label>
        <div class="col-md-6">
          <button id="saveTransportSchedule" name="saveTransportSchedule"
            class="btn btn-success">Save</button>
          <button id="resestTransportSchedule" name="resestTransportSchedule"
            class="btn btn-warning" type="Reset" value="Reset">Reset</button>
        </div>
      </div>

        

      </fieldset>
  </form>
  </div>
</div>

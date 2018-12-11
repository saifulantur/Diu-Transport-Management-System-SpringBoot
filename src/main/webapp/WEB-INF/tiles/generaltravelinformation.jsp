<script type="text/javascript">


	var allUser = [];
	var allTransportType = [];
	var allVenue = [];
	var allTransportInformation = [];
	var allDriver = [];
	var allGeneralTravelInformation;

	function getAllVenue(){
		$.post("viewAllVenue",function(data){

			allVenue = data;

		});
	}



	$(document).ready(function(){

		$("#divAddGeneralTravelInformation").hide();
		$("#divShowGeneralTravelInformation" ).show();
		
        


		var GeneralTravelInformationCommon = [];

		
		
		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");

		getAllUser();
		getAllTransportInformation();
		getAllTransportType();
		getAllVenue();
		getAllDriver();

		
		funViewGeneralTravelInformationData();
		$("#tmpId").val(0);

		$.post("viewAllVenue", function(data){
			//alert(JSON.stringify(data));
			var FkFromLocationComboBoxForGenreralTravelInfo = '<select id="fkFromLocation" class="form-control">';
			for(var key in data)
			{
				FkFromLocationComboBoxForGenreralTravelInfo += '<option value="' + data[key].id + '">' +data[key].venueName+ '</option>';
			}
			FkFromLocationComboBoxForGenreralTravelInfo += '</select>';

			$("#divFkFromLocation").html(FkFromLocationComboBoxForGenreralTravelInfo);
			
			//alert(JSON.stringify(brandmodelComboBox));
		});

		$.post("viewAllVenue", function(data){
			//alert(JSON.stringify(data));
			var FkToLocationComboBoxForGenreralTravelInfo = '<select id="fkToLocation" class="form-control">';
			for(var key in data)
			{
				FkToLocationComboBoxForGenreralTravelInfo += '<option value="' + data[key].id + '">' +data[key].venueName+ '</option>';
			}
			FkToLocationComboBoxForGenreralTravelInfo += '</select>';

			$("#divFkToLocation").html(FkToLocationComboBoxForGenreralTravelInfo);
			//alert(JSON.stringify(brandmodelComboBox));
		});
		
		function getAllDriver(){

		$.post("viewAllDriver", function(data){

            //for showing driver name instead of id
			allDriver = data;
			//alert(JSON.stringify(data));
			var fkDriverId = '<select id="fkDriverId" class="form-control">';
			for(var key in data)
			{
				fkDriverId += '<option value="' + data[key].id + '">' +data[key].driverName+" , "+data[key].driverCode+ '</option>';
			}
			fkDriverId += '</select>';

			$("#divfkDriverId").html(fkDriverId);
			//alert(JSON.stringify(brandmodelComboBox));
		});
		}
		
		$.post("viewTransportRequisition", function(data){
			//alert(JSON.stringify(data));
			var fkRequisitionComboBox = '<select id="fkRequisitionId" class="form-control">';
			
			for(var key in data)
			{


			//foreign key id to name  mapping
					var oneUser = allUser.filter(object => {

						return object.id === data[key].fkRequestedBy

						});//end of foreign key id to name  mapping

					 //foreign key id to name  mapping
                    var singleTransportType = allTransportType.filter(object => {

                        return object.id === data[key].fkTransportType

                        });//end of foreign key id to name  mapping
					//alert(JSON.stringify(oneUser));


				fkRequisitionComboBox += '<option value="' + data[key].id + '">' + oneUser[0].userName + " , " + data[key].travelDate +  " , " + singleTransportType[0].typeTitle +'</option>';
			}

			fkRequisitionComboBox += '</select>';

			$("#divFkRequestedBy").html(fkRequisitionComboBox);
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
				
				$( "#fkTransportType" ).change(function() {
					viewTransportName( $(this).val() );
					}); 

				
			});//for get data from database to combo box end
	
		function viewTransportName(transportTypeId){//brandId
		
			$.post("viewTransportInformationByFkTransportType",{transportTypeId: transportTypeId}, function(data){
				//alert(JSON.stringify(data));
				var fkTrnsportId = '<select id="fkTrnsportId" class="form-control">';
				for(var key in data)
				{
					fkTrnsportId += '<option value="' + data[key].id + '">' +data[key].transportName+'</option>';
				}
				fkTrnsportId += '</select>';

				$("#divfkTrnsportId").html(fkTrnsportId);
				//alert(JSON.stringify(brandmodelComboBox));
			});
		}
			
			
		//validation
		function validator(){

            
			var fkTrnsportId = $.trim($("#fkTrnsportId").val());
			var fkFromLocation = $.trim($("#fkFromLocation").val());
			var fkToLocation = $.trim($("#fkToLocation").val());
			var departureTime = $.trim($("#departureTime").val());
			var fkDriverId = $.trim($("#fkDriverId").val());
			var fkRequisitionId = $.trim($("#fkRequisitionId").val());
			var travelDate = $.trim($("#travelDate").val());
			var driverCheckInTime = $.trim($("#driverCheckInTime").val());
			var reachedTime = $.trim($("#reachedTime").val());
			var comments = $.trim($("#comments").val());
		
            if(fkTrnsportId == ""){
                $("#errorMessage").html("Please enter a valid fkTrnsportId"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(fkFromLocation == ""){
                $("#errorMessage").html("Please enter a valid fkFromLocation"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(fkToLocation == ""){
                $("#errorMessage").html("Please enter a valid fkToLocation"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(departureTime == ""){
                $("#errorMessage").html("Please enter a valid departureTime"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(fkDriverId == ""){
                $("#errorMessage").html("Please enter a valid fkDriverId"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(fkRequisitionId == ""){
                $("#errorMessage").html("Please enter a valid fkRequisitionId"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(travelDate == ""){
                $("#errorMessage").html("Please enter a valid travelDate"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(driverCheckInTime == ""){
                $("#errorMessage").html("Please enter a valid driverCheckInTime"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(reachedTime == ""){
                $("#errorMessage").html("Please enter a valid reachedTime"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }
            else if(comments == ""){
                $("#errorMessage").html("Please enter a valid comments"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }	
            
            else{return true;}
        }//end of validation

        	//date Time picker
		   $(function(){
			  $('#travelDate').datepicker({
				     dateFormat: "yy-mm-dd",
     				 changeMonth: true,
     				 changeYear: true
    				});
			  });	
           $(function () {
                 $('#departureTime').datetimepicker({
                     format: 'LT'
                    //timeFormat:  "hh:mm:ss"
                }); 
        	   /*$('#departureTime').datetimepicker({
                   sideBySide: true,
                   timeFormat: 'h:mm:ss'
               });*/
            });
          //for date and time calender toghter
           /* $(function () {
                $('#reachedTime').datetimepicker({
                    format: 'LT'
                    //timeFormat: 'h:mm:ss'
                });
            });*///date and time calender toghter

            $(function () {
                $('#reachedTime').datetimepicker({
                    format: 'LT'
                    //timeFormat: 'h:mm:ss'
                });
            });


             $(function () {
                $('#driverCheckInTime').datetimepicker({
                    format: 'LT'
                    //timeFormat: 'h:mm:ss'
                });
            });
             // end of date Time picker


                     /* Submitting form to controller*/
        $("#saveGeneralTravelInformation").click(function(event) {

            event.preventDefault();

            if (validator()){

                var generalTravelInformation = {};

                generalTravelInformation["tmpId"] = $.trim($("#tmpId").val());
                generalTravelInformation["fkTrnsportId"] = $.trim($("#fkTrnsportId").val());
                generalTravelInformation["fkFromLocation"] = $.trim($("#fkFromLocation").val());
                generalTravelInformation["fkToLocation"] = $.trim($("#fkToLocation").val());

                //timeFormat12to24 is a converting method
                generalTravelInformation["departureTime"] = timeFormat12to24($.trim($("#departureTime").val()));
                alert("Departure Time : "+timeFormat12to24($.trim($("#departureTime").val())));
                generalTravelInformation["fkDriverId"] = $.trim($("#fkDriverId").val());
                generalTravelInformation["fkRequisitionId"] = $.trim($("#fkRequisitionId").val());
                generalTravelInformation["travelDate"] = $.trim($("#travelDate").val());

                var ttime = $("#driverCheckInTime").val();
                timeFormat12to24(ttime);
                alert("Driver Check in Time : "+timeFormat12to24(ttime));
                generalTravelInformation["driverCheckInTime"] = timeFormat12to24(ttime);
                generalTravelInformation["reachedTime"] = timeFormat12to24($.trim($("#reachedTime").val()));
                generalTravelInformation["comments"] = $.trim($("#comments").val());
                


                $.ajax({
                    type: "POST",
                    url: "saveGeneralTravelInformation",
                    data: JSON.stringify(generalTravelInformation),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                    	
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewGeneralTravelInformationData();
                        $("#tmpId").val(0);
                        /*$("#saveGeneralTravelInformation").html('Save');*/
                       /* $("#btnDelete").addClass("hidden");*/

                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#successMessage").addClass("hidden");
                        alert(JSON.stringify(error));
                    }
                });

            } // End of validation
        }); // End of form submission


        //Function for viewing existing data
        function funViewGeneralTravelInformationData(){
        	
        	$.post("viewAllGeneralTravelInformation",function(data){
        		
        		var generalTravelInformationData = '<table id="tblGeneralTravelInformation" class="table table-bordered table-hover">' + '<thead><tr><th style="display:none;">ID</th><th>Transport Type</th><th>Transport Name</th><th>From Location</th><th>To Location</th><th>Travel Date</th><th>Departure Time</th><th>Driver</th><th></th><th></th><th></th></tr></thead><tbody>';
    			                    
    			for(var key in data){  

    				var GeneralTravelInformationObject = {"id":[],"fkTrnsportId":[],"fkFromLocation":[],"fkToLocation":[],"departureTime":[],"fkDriverId":[],"fkRequisitionId":[],"travelDate":[],"driverCheckInTime":[],"reachedTime":[],"comments":[]};

    				GeneralTravelInformationObject["id"] = data[key].id;
    				GeneralTravelInformationObject["fkTrnsportId"] = data[key].fkTrnsportId;
    				GeneralTravelInformationObject["fkFromLocation"] = data[key].fkFromLocation;
    				GeneralTravelInformationObject["fkToLocation"] = data[key].fkToLocation;
    				GeneralTravelInformationObject["departureTime"] = data[key].departureTime;
    				GeneralTravelInformationObject["fkDriverId"] = data[key].fkDriverId;
    				GeneralTravelInformationObject["fkRequisitionId"] = data[key].fkRequisitionId;
    				GeneralTravelInformationObject["travelDate"] = data[key].travelDate;
    				GeneralTravelInformationObject["driverCheckInTime"] = data[key].driverCheckInTime;
    				GeneralTravelInformationObject["reachedTime"] = data[key].reachedTime;
    				GeneralTravelInformationObject["comments"] = data[key].comments;


    				GeneralTravelInformationCommon.push(GeneralTravelInformationObject);

    				//alert("all transport info: " + JSON.stringify(allTransportInformation));
    				//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    				var oneTransportInfo = allTransportInformation.filter(object => {
    					return object.id === data[key].fkTrnsportId

    				});
    				//alert("One transportInfo: " + JSON.stringify(oneTransportInfo));

    				
    				//id to name mapping
    				var singleTransportType2 = allTransportType.filter(object => {

                        return object.id === oneTransportInfo[0].fkTransportType

                    });//end of foreign key id to name  mapping

                    //id to name mapping
    				var singleVenue = allVenue.filter(object => {

                        return object.id === data[key].fkFromLocation

                    });//end of foreign key id to name  mapping

                    //id to name mapping
    				var singleVenue1 = allVenue.filter(object => {

                        return object.id === data[key].fkToLocation

                    });//end of foreign key id to name  mapping 

                    var singleDriver = allDriver.filter(object => {

                        return object.id === data[key].fkDriverId

                    });

                    var oneTransportName = allTransportInformation.filter(object => {
    					return object.id === data[key].fkTrnsportId

    				});


    				//alert(JSON.stringify(GeneralTravelInformationCommon));

    				var travelDateFormat = $.datepicker.formatDate('dd-mm-yy', new Date(data[key].travelDate));



    				
    				generalTravelInformationData += '<tr><td style="display:none;">' + data[key].id +  '</td><td>' + singleTransportType2[0].typeTitle + '</td><td>' + oneTransportName[0].transportName + '</td><td>' + singleVenue[0].venueName + '</td><td>' + singleVenue1[0].venueName + '</td><td>' + travelDateFormat + '</td><td>' + timeFormat24to12(data[key].departureTime) + '</td><td>' + singleDriver[0].driverName + '</td><td><a class="btn btn-sm btn-warning" id="btnUpdate_' + data[key].id + '" onclick="allGeneralTravelInformation(' + data[key].id + ')"><span class="glyphicon glyphicon-edit"></span></a></td><td><a href="#" id="updateBillingg" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span></a></td></tr>';
    			}                 
						    			
    			generalTravelInformationData += '</tbody></table>';
    		
        		
        		$("#divGeneralTravelInformation").html(generalTravelInformationData);
        		$("#tblGeneralTravelInformation").DataTable();
        		
        		
        		
        	});
        }// end of Function for viewing existing data


        $( "#addGenTravInfo" ).click(function() {

            $("#divShowGeneralTravelInformation").hide();
            $("#errorMessage").addClass("hidden");
            $("#divAddGeneralTravelInformation" ).show();
            

            
        

  
        });

        $( "#showGenTravInfo" ).click(function() {

            $("#divAddGeneralTravelInformation").hide();
		    $("#divShowGeneralTravelInformation" ).show();
  
        });


   		 allGeneralTravelInformation = function(generalTravelInformationId){

    	$("#divAddGeneralTravelInformation").show();
		$("#divShowGeneralTravelInformation" ).hide();

    	var data = GeneralTravelInformationCommon.filter(object =>{
    		return object.id === generalTravelInformationId;
    	});

    	$("#saveGeneralTravelInformation").html("Update");
	   		
        $("#tmpId").val(data[0].id);
    	$("#fkTrnsportId").val(data[0].fkTrnsportId);
    	$("#fkFromLocation").val(data[0].fkFromLocation);
    	$("#fkToLocation").val(data[0].fkToLocation);

    	$("#departureTime").val(timeFormat24to12(data[0].departureTime));
    	$("#fkDriverId").val(data[0].fkDriverId);
    	$("#fkRequisitionId").val(data[0].fkRequisitionId);

    	var travelDateFormat1 = $.datepicker.formatDate('yy-mm-dd', new Date(data[0].travelDate));
    	$("#travelDate").val(travelDateFormat1);
    	$("#driverCheckInTime").val(timeFormat24to12(data[0].driverCheckInTime));
    	$("#reachedTime").val(timeFormat24to12(data[0].reachedTime));
    	$("#comments").val(data[0].comments);
    }




	


     });  // end of ready document


    function getAllUser(){
		$.post("showAllUser",function(data){
			//alert(JSON.stringify(loction));
			allUser = data;
            alert(JSON.stringify(allUser));
			
		});
		
	}
     
    function getAllTransportType(){
    $.post("viewAllTransportType",function(data){

        allTransportType = data;
    });
  }

  function getAllTransportInformation(){

		$.post("viewAllTransportInformation",function(data){
			allTransportInformation  = data;
			//alert("all transport information:" + JSON.stringify(allTransportInformation));

		});
	}      
        
	
</script>


<div class="col-md-12" id="divShowGeneralTravelInformation">
	<legend style="padding-left:10%;margin-top: 0%;margin-bottom: 3%;">Existing General Travel Information</legend>

	<div class="col-md-12">
		 <div class="col-md-12" style="min-height: 60px;">
                <button id="addGenTravInfo" name="addGenTravInfo" class="btn btn-success" style="float: right; margin-right: 8%;margin-bottom: 3%;">
                    <span class="glyphicon glyphicon-plus"></span> Add General Travel Information
                </button>
        </div>
	<div class="col-md-1"></div>
	<div id="divGeneralTravelInformation" class="col-md-10"></div>
	</div>
</div>

<div class="col-md-12" id="divAddGeneralTravelInformation">
<form>
	<fieldset>

		<!-- Form Name -->
		<legend style="padding-left:16.5%;margin-top: 0%;margin-bottom: 3%;">General Travel Information</legend>

        <div class="col-md-12">
			<button id="showGenTravInfo" name="showGenTravInfo" class="btn btn-success" style="float: right; margin-bottom: 3%; margin-right: 16%;"><span class="glyphicon glyphicon-eye-open"></span> View General Travel Information</button>
	    </div>
		

		<div class="col-md-2"></div>

		<div class="col-md-8 custom_shadow" id="divGeneralTravelInformationInput">
		
		<div class="well well-sm" id="successMessage" style="background-color:#1D9B2A;color:#fff;"></div>
		<div class="well well-sm" id="errorMessage"style="background-color:red;color:#fff;"></div>

		<input type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">
		
		<!-- Select Basic -->
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="fkTransportType">Transport Type</label>
				<div id="divFkTransportType"></div>
			</div>

			<div class="form-group col-md-6">
				<label  for="fkTrnsportId">Transport Name</label>
				<div id="divfkTrnsportId">
					<select class="form-control">
						
					</select>
				</div>
			</div>
			<!-- Select Basic -->
			
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="requisitionId">Requisition</label>
					<div id="divFkRequestedBy"></div>
			</div>


		<!-- Text input-->
		<div class="form-group col-md-6">
			<label for="travelDate">Travel Date</label>
			<input id="travelDate" name="travelDate" placeholder="Enter Travel Date" class="form-control input-md" type="text">

		</div>
			
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="fromLocation">From Locaton</label>
				<div id="divFkFromLocation"></div>
			</div>

		<!-- Select Basic -->
			<div class="form-group col-md-6">
				<label for="toLocation">To Location</label>

					<div id="divFkToLocation"></div>

			</div>

		</div>

		<div class="form-row">


				<!-- Select Basic -->
			<div class="form-group col-md-6">
				<label for="driverId">Driver</label>
					<div id="divfkDriverId">
				</div>
			</div>



		<!-- Time input-->

			<div class="form-group col-md-6">
			<label for="departureTime">Departure Time</label>
			<input id="departureTime" name="departureTime" placeholder="Enter Departure Time" class="form-control input-md" type="text">
			</div>

			</div>

		

		
			<div class="form-row">
				<!-- Text input-->
		<div class="form-group col-md-6">
			<label for="reachedTime">Reached Time</label>
			<input id="reachedTime" name="reachedTime" placeholder="Enter Reached Time" class="form-control input-md" type="text">
		</div>
		<!-- Text input-->
		<div class="form-group col-md-6">
			<label for="driverCheckInTime">Drivers Check in Time</label>
			<input id="driverCheckInTime" name="driverCheckInTime" placeholder="Enter Driver Check in Time" class="form-control input-md" type="text">
		</div>

		</div>



		<!-- Textarea -->
		<div class="form-group col-md-12">
			<label for="comments">Comments</label>
			<textarea class="form-control" id="comments" name="comments"></textarea>
		</div>

		<!-- Button (Double) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="button1id"></label>
			<div class="col-md-8">
				<button id="saveGeneralTravelInformation" name="saveGeneralTravelInformation" class="btn btn-success">Save
					Info</button>
				<button id="resetGeneralTravelInformation"
					name="resetGeneralTravelInformation" class="btn btn-warning" type="reset" value="reset">Reset
					Form</button>
			</div>
		</div>


		</div>


	</fieldset>
</form>
</div>

<script type="text/javascript">

	var populateDataForUpdate;
	
	$(document).ready(function(){
		
		var driverInformationCommon = [];

        $("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");

        $("#divShowDriverInformation" ).show();
        $("#divAddDiverInformation").hide();



        
        funViewDriverData();
        $("#tmpId").val(0);

        function validator(){
        	var  driverName = $.trim($("#driverName").val());
        	var  driverCode = $.trim($("#driverCode").val());
        	var  driverDateOfBirth = $.trim($("#driverDateOfBirth").val());
        	var  drivingLicense = $.trim($("#drivingLicense").val());
        	var  driverNid = $.trim($("#driverNid").val());
        	var  presentAddress = $.trim($("#presentAddress").val());
        	var  parmanentAddress = $.trim($("#parmanentAddress").val());
        	var  driverContact = $.trim($("#driverContact").val());
        	var  driverEmail = $.trim($("#driverEmail").val());
        	var  driverPhoto  = $.trim($("#driverPhoto").val());

        	if (driverName == "") {
        		$("#errorMessage").html("Please enter a valid Driver Name"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}

        	else if (driverCode == "") {
        		$("#errorMessage").html("Please enter a valid Driver Code"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}

        	else if (driverDateOfBirth == "") {
        		$("#errorMessage").html("Please enter a valid driverDateOfBirth"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}

        	else if (drivingLicense == "") {
        		$("#errorMessage").html("Please enter a valid drivingLicense"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}
        	else if (driverNid == "") {
        		$("#errorMessage").html("Please enter a valid driverNid"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}

        	else if (presentAddress == "") {
        		$("#errorMessage").html("Please enter a valid presentAddress"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}

        	else if (parmanentAddress == "") {
        		$("#errorMessage").html("Please enter a valid parmanentAddress"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}

        	else if (driverContact == "") {
        		$("#errorMessage").html("Please enter a valid driverContact"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}

        	else if (driverEmail == "") {
        		$("#errorMessage").html("Please enter a valid driverEmail"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}

        	/*else if (driverPhoto == "") {
        		$("#errorMessage").html("Please enter a valid driverPhoto"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
        	}*/

        	return true;


       

        }//end of validation

                /* Submitting form to controller*/
        $("#saveDriver").click(function(event) {

            event.preventDefault();

            if (validator()){

                var driver = {};

                driver["tmpId"] = $.trim($("#tmpId").val());
                driver["driverName"]         = $.trim($("#driverName").val());
                driver["driverCode"]         = $.trim($("#driverCode").val());
        		driver["driverDateOfBirth"]  = $.trim($("#driverDateOfBirth").val());
        		driver["drivingLicense"] 	 = $.trim($("#drivingLicense").val());
        		driver["licenseExpireDate"]  = $.trim($("#licenseExpireDate").val());
        		driver["driverNid"] 		 = $.trim($("#driverNid").val());
        		driver["presentAddress"]	 = $.trim($("#presentAddress").val());
        		driver["parmanentAddress"] 	 = $.trim($("#parmanentAddress").val());
        		driver["driverContactNO"] 	 = $.trim($("#driverContact").val());
        		driver["driverEmail"] 		 = $.trim($("#driverEmail").val());
        		driver["driverImage"] 		 = $.trim($("#driverPhoto").val());

                //driver["tmpId"] = $.trim($("#tmpId").val());//for update data
                //alert(JSON.stringify(brands)); 
                
                //return false;
                $.ajax({
                    type: "POST",
                    url: "saveDriver",
                    data: JSON.stringify(driver),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                    	//viewData();
                        //alert(successData);
                       
                        //$("#submit").prop("disabled", false);
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewDriverData();
                        $("#tmpId").val(0);
                        /*$("#saveDriver").html('Save');*/
                        
                        

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
        
        
 function funViewDriverData(){
        	
        	$.post("viewAllDriver",function(data){
        		/*table table-striped*/
        		var driverData = '<table id="tblDriver" class="table table-bordered table-hover">' +
    			                    '<thead><tr><th style="display:none;">ID</th><th>Driver Name</th><th>Driver Code</th><th style="display:none;">Date Of Birth</th><th>Driving License</th><th>License Expire Date</th><th style="display:none;">NID No.</th><th style="display:none;">Present Address</th><th style="display:none;">Permanent Address</th><th>Contact No</th><th style="display:none;">Email</th><th style="display:none;">Image</th><th></th><th></th><th></th></tr></thead><tbody>';
    			 
    			for(var key in data){ 
    				
    				var driverObject = {"id":[],"driverName":[],"driverCode":[],"driverDateOfBirth":[],"drivingLicense":[],"licenseExpireDate":[],"driverNid":[],"presentAddress":[],"parmanentAddress":[],"driverContactNO":[],"driverEmail":[],"driverImage":[]};
    				    				    
			        var dateFormat = $.datepicker.formatDate('dd-mm-yy', new Date(data[key].licenseExpireDate));
	                var dateFormat1 = $.datepicker.formatDate('dd-mm-yy', new Date(data[key].driverDateOfBirth));
	                
	                driverObject["id"] = data[key].id;
	                driverObject["driverName"] = data[key].driverName;
	                driverObject["driverCode"] = data[key].driverCode;
	                driverObject["driverDateOfBirth"] = data[key].driverDateOfBirth;
	                driverObject["drivingLicense"] = data[key].drivingLicense;
	                driverObject["licenseExpireDate"] = data[key].licenseExpireDate;
	                driverObject["driverNid"] = data[key].driverNid;
	                driverObject["presentAddress"] = data[key].presentAddress;
	                driverObject["parmanentAddress"] = data[key].parmanentAddress;
	                driverObject["driverContactNO"] = data[key].driverContactNO;
	                driverObject["driverEmail"] = data[key].driverEmail;
	                driverObject["driverImage"] = data[key].driverImage;
      					
      				driverInformationCommon.push(driverObject);
      				
      				//alert(JSON.stringify(driverObject));
			        //alert(dateFormat);
			        //alert(dateFormat);
    				
    				driverData += '<tr><td style="display:none;">' + data[key].id + '</td><td>' + data[key].driverName + '</td><td>'+data[key].driverCode + '</td><td style="display:none;">'+ dateFormat1 + '</td><td>' + data[key].drivingLicense + '</td><td>' + dateFormat + '</td><td style="display:none;">' + data[key].driverNid +'</td><td style="display:none;">'+ data[key].presentAddress +'</td><td style="display:none;">' + data[key].parmanentAddress + '</td><td>' + data[key].driverContactNO + '</td><td style="display:none;">' + data[key].driverEmail + '</td><td style="display:none;">' + data[key].driverImage + '</td><td><a href="#" id="updateBillingg" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> Delete</a></td><td> <a class="btn btn-sm btn-warning" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="glyphicon glyphicon-edit"></span> Edit</a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> View</a></td></tr>';
    			}     
    			
    									    			
    			driverData += '</tbody></table>';
    		
        		
        		$("#divDriverInformation").html(driverData);
        		$("#tblDriver").DataTable();
        		
        		
        		
        	});
        }


        $( "#addBilling" ).click(function() {

            $("#divShowDriverInformation").hide();
            $("#errorMessage").addClass("hidden");
            $("#divAddDiverInformation" ).show();
            

            
        

  
        });

        $( "#ShowBilling" ).click(function() {

            $("#divAddDiverInformation").hide();
            $( "#divShowDriverInformation" ).show();
  
        });


        
       /* function returnDriberList(){
    	   return driverInformationCommon;
       }
        */
       populateDataForUpdate = function(driverId){
        	
        	$("#divShowDriverInformation").hide();
        	$("#divAddDiverInformation").show();
            
   		
	   		var data = driverInformationCommon.filter(obj => {
	   		  return obj.id === driverId
	   		});
	   		
            //alert(JSON.stringify(data));
	   		var dateFormat3 = $.datepicker.formatDate('yy-mm-dd', new Date(data[0].licenseExpireDate));
	   		//alert(data[0].id + ": name= "+ data[0].driverName);

           // alert(dateFormat3);

            $("#saveDriver").html("Update");
	   		
	   		//$("#driverName").val(data[1].driverName);
            $("#tmpId").val(data[0].id);
	   		$("#driverName").val(data[0].driverName);
	   		$("#driverCode").val(data[0].driverCode);
	   		$("#driverDateOfBirth").val(data[0].driverDateOfBirth);
	   		$("#driverNid").val(data[0].driverNid);
	   		$("#drivingLicense").val(data[0].drivingLicense);
	   		///$("#licenseExpireDate").val(data[0].licenseExpireDate);
            $("#licenseExpireDate").val(dateFormat3);
	   		$("#driverContact").val(data[0].driverContactNO);
	   		$("#driverEmail").val(data[0].driverEmail);
	   		$("#driverPhoto").val(data[0].driverPhoto);
	   		$("#presentAddress").val(data[0].presentAddress);
	   		$("#parmanentAddress").val(data[0].parmanentAddress);
	   		//$("#sdfdsf").val(data[0].driverName);
	   		
	   		
	   		
	   		
	   		
   		}    


	});//end of ready document
	
	
	
	

	 /*setTimeout(function() {
                $("#successMessage").addClass("hidden");
                $("#errorMessage").addClass("hidden");
                }, 5000);*/
	


</script>


<!--custom css for datatable design-->
<style type="text/css">
    /*#tblDriver_filter label input{
    width: 75%;
    padding: 5px 20px;
    margin: 8px 2px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    }

    #tblDriver_length label select{
    width: 40%;
    padding: 5px 10px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    }*/
    #saveDriver{
    padding: 6px 50px;
    }

    #divDriverInput{
    border-radius: 5px;
    background-color: #fafafa;
    padding: 20px;
    /*box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);*/
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 3px 10px 0 rgba(0, 0, 0, 0.19);
    }
</style>



<div class="col-md-12" id="divShowDriverInformation">
    
    <legend style="padding-left:9.5%;margin-top: 0%;margin-bottom: 1%;">Existing Driver Data</legend>

    <div class="col-md-12" ">
        <div class="col-md-12" style="min-height: 60px;">
                <button id="addBilling" name="addBilling" class="btn btn-success" style="float: right; margin-right: 8%;margin-bottom: 3%;">
                    <span class="glyphicon glyphicon-plus"></span> Add Driver Information
                </button>
        </div>
        <div class="col-md-1"></div>
            <div class="col-md-10">
                <div id="divDriverInformation"></div>
            </div>
    </div>
    
</div>

<div class="col-md-12" id="divAddDiverInformation">
<form >
    <fieldset>

        <div class="col-md-12">
        <div class="col-md-1"></div>
        <div class="col-md-10">

            <button id="ShowBilling" name="ShowBilling" class="btn btn-success" style="float: right;margin-bottom: 3%;"><span class="glyphicon glyphicon-eye-open"></span> View Driver Information</button>

        </div>
        </div>

        <legend style="padding-left:9.5%;margin-top: 0%; margin-bottom: 1%;">Create New Driver Information</legend>
        <div class="col-md-1"></div>
        <div class="col-md-10" id="divDriverInput">

            <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A; color:#fff;"></div>
            <div class="well well-sm" id="errorMessage" style="background-color:red; color:#fff;"></div>

            <input type="hidden" id="tmpId" name="tmpId" value="0" readonly="readonly">
            <!-- class="hidden" -->
            
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="driverName">Name</label> 
                    <input id="driverName" name="driverName" placeholder="Enter Driver Name" class="form-control input-md" type="text">
                </div>

                <div class="form-group col-md-4">
                    <label for="driverCode">Employee Code</label>
                    <input id="driverCode" name="driverCode" placeholder="Enter Driver Code" class="form-control input-md" type="text">     
                </div>

                <div class="form-group col-md-4">
                    <label for="driverDateOfBirth">Date Of Birth</label>
                    <input id="driverDateOfBirth" name="driverDateOfBirth" placeholder="Enter Date Of Birth" class="form-control input-md" type="date">
              </div>



            </div>




           <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="driverNid">NID(Optional)</label>
                    <input id="driverNid" name="driverNid" placeholder="Enter 17 digit NID" class="form-control input-md" type="text">     
                </div>

                 <div class="form-group col-md-4">
                    <label for="drivingLicense">Driving License</label>
                    <input id="drivingLicense" name="drivingLicense" placeholder="Driving License" class="form-control input-md" type="text">   
                </div>

            
                <div class="form-group col-md-4">
                    <label label" for="licenseExpireDate">License Expire Date</label>
                    <input id="licenseExpireDate" name="licenseExpireDate" placeholder="License Expire Date" class="form-control input-md" type="date">
                </div>

            </div>


            <div class="form-row">

            <div class="form-group col-md-4">
                <label for="driverContact">Contant Number</label>
                <input id="driverContact" name="driverContact" placeholder="Enter Phone No" class="form-control input-md" type="text">
     
            </div>


          
            <div class="form-group col-md-4">
                <label for="driverEmail">Email(Optional)</label>
                <input id="driverEmail" name="driverEmail" placeholder="Email" class="form-control input-md" type="email">   
            </div>

            <div class="form-group col-md-4">
                <label for="driverPhoto">Photo(Optional)</label>
                <input type="file" class="custom-file-input" id="driverPhoto" name="driverPhoto">
                <!--<label class="custom-file-label" for="driverPhoto">Choose file</label>-->
            </div>

            </div>
            
            <div class="form-row">
            <div class="form-group col-md-6">
                <label for="presentAddress">Present Address</label>
                <textarea class="form-control" id="presentAddress" name="presentAddress"></textarea>   
            </div>

            <div class="form-group col-md-6">
                <label  for="parmanentAddress">Parmanent Address</label>
                <textarea class="form-control" id="parmanentAddress" name="parmanentAddress"></textarea>
               
            </div>

            </div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="saveDriver"></label>
                <div class="col-md-7">
                    <button id="saveDriver" name="saveDriver" class="btn btn-primary mb-2">Save</button>
                    <button id="resetDriver" name="resetDriver" class="btn btn-warning" type="reset" value="reset">Reset</button>
                </div>
            </div>
                
       
        </div>

        
        
        </div>
        
    </fieldset>
</form>
</div>

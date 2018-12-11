<script type="text/javascript">

	var transportInformationProcessing;
	var allTransportType = [];
	var allBrandModel = [];
	var allBrand = [];

	$(document).ready(function(){
		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");

        var allTransportInformationData = [];

        getAllBrandModel();
        getAllTransportType();
        getAllBrand();
        
        funViewTransportInformationData();
       // viewModels(brandId);

       $("#tmpId").val(0);
        
       
        
        
		//for get data from database to combo box Start
		//strat
		$.post("viewAllTransportType", function(data){
			//alert(JSON.stringify(data));
			var transportTypeComboBox = '<select id="fkTransportType" class="form-control">';
			
			for(var key in data)
			{
				transportTypeComboBox += '<option value="' + data[key].id + '">' +data[key].typeTitle+ '</option>';
			}
			transportTypeComboBox += '</select>';

			$("#divTransportTypeCombo").html(transportTypeComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
			
		});//for get data from database to combo box end
		
		
		
		
		function validator(){

            //var brandName	= $.trim($("#username").val());

			var fkTransportType = $.trim($("#fkTransportType").val());
			var vinNumber = $.trim($("#vinNumber").val());
			var registrationNumber = $.trim($("#registrationNumber").val());
			var licenseNumber = $.trim($("#licenseNumber").val());
			var transportName = $.trim($("#transportName").val());
			var fkModelNo = $.trim($("#fkModelNo").val());
			var purchaseDate = $.trim($("#purchaseDate").val());
			var purchaseBy = $.trim($("#purchaseBy").val());
			var purchaseReffNo = $.trim($("#purchaseReffNo").val());
			var purchaseFrom = $.trim($("#purchaseFrom").val());
			var price = $.trim($("#price").val());
			var specificaiton = $.trim($("#specificaiton").val());
		
            if(fkTransportType == ""){
                $("#errorMessage").html("Please enter a valid Transport Type"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            } 
            else if(vinNumber==""){
            	$("#errorMessage").html("Please enter a valid vin Number"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            	
            }
            
            else if(registrationNumber==""){
            	$("#errorMessage").html("Please enter a valid registration Number"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            	
            }
            
			else if(licenseNumber == ""){
				$("#errorMessage").html("Please enter a valid license Number"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            	
            }
            
			else if(transportName == ""){
				
				$("#errorMessage").html("Please enter a valid transport Name"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
		
			}
            
			else if(fkModelNo==""){
				
				$("#errorMessage").html("Please enter a valid Model No"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
	
			}
            
			else if(purchaseDate == ""){
				
				$("#errorMessage").html("Please enter a valid purchase Date"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
	
			}
			else if(purchaseBy == ""){
				
				$("#errorMessage").html("Please enter a valid purchase By"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
	
			}
			else if(purchaseReffNo == ""){
				
				$("#errorMessage").html("Please enter a valid purchase Reff No"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
	
			}
			else if(purchaseFrom == ""){
				
				$("#errorMessage").html("Please enter a valid purchase From"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
	
			}
			else if(price == ""){
				
				$("#errorMessage").html("Please enter a valid price"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
	
			}
			else if(specificaiton == ""){
				
				$("#errorMessage").html("Please enter a valid specificaiton"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
	
			}
            // else if(){ // for multiple validation check
            	
            return true;
        }//end of validation function
        
		$("#saveTransportInfo").click(function(event) {

	        event.preventDefault();

	        if (validator()){

	            var transportInformation = {};

	            transportInformation["tmpId"] = $.trim($("#tmpId").val());

	            transportInformation["fkTransportType"] = $.trim($("#fkTransportType").val());
	            transportInformation["vinNumber"] = $.trim($("#vinNumber").val());
	            transportInformation["registrationNumber"] = $.trim($("#registrationNumber").val());
	            transportInformation["licenseNumber"] = $.trim($("#licenseNumber").val());
	            transportInformation["transportName"] = $.trim($("#transportName").val());
	            transportInformation["fkModelNo"] = $.trim($("#fkModelNo").val());
	            transportInformation["purchaseDate"] = $.trim($("#purchaseDate").val());
	            transportInformation["purchaseBy"] = $.trim($("#purchaseBy").val());
	            transportInformation["purchaseReffNo"] = $.trim($("#purchaseReffNo").val());
	            transportInformation["purchaseFrom"] = $.trim($("#purchaseFrom").val());
	            transportInformation["price"] = $.trim($("#price").val());
	            transportInformation["specificaiton"] = $.trim($("#specificaiton").val());
	           

	            //alert(JSON.stringify(brands)); 
	            
	            //return false;
	            $.ajax({
	                type: "POST",
	                url: "saveTransportInformation",
	                data: JSON.stringify(transportInformation),
	                contentType: "application/json; charset=utf-8",
	                success: function (successData) {

	                    $("#successMessage").html(successData);
	                    $("#successMessage").removeClass("hidden");
	                    $("#errorMessage").addClass("hidden");
	                    
	                    funViewTransportInformationData();
	                    $("#tmpId").val(0);

	                },
	                error: function (error) {
	                    $("#errorMessage").html("Error: Record Not Saved");
	                    $("#errorMessage").removeClass("hidden");
	                    $("#successMessage").addClass("hidden");
	                    /*$("#submit").prop("disabled", false); */
	                   alert(JSON.stringify(error));
	                }
	            });

	        }
			
		});
        
        
			function funViewTransportInformationData(){
        	
        	$.post("viewAllTransportInformation",function(data){
        		
        		var viewTransportInformation = '<table id="tblTransportInformation" class="table table-bordered table-hover">' +
    			                    '<thead><tr><th>ID</th><th>Transport Type</th><th style="display:none;">Vin Number</th><th>Transport Name</th><th>Brand</th><th>Model</th><th>Registration Number</th><th>License Number</th><th style="display:none;">Purchase Date</th><th style="display:none;">Purchase By</th><th style="display:none;">Purchase Reff No.</th><th style="display:none;">Purchase From</th><th style="display:none;">Price</th><th style="display:none;">Specification</th><th></th><th></th><th></th></tr></thead>';
    			                    
    			for(var key in data){ 

    				 var transportInformationObject = {"id":[],"fkTransportType":[],"vinNumber":[],"registrationNumber":[],"licenseNumber":[],"transportName":[],"fkModelNo":[],"purchaseDate":[],"purchaseBy":[],"purchaseReffNo":[],"purchaseFrom":[],"price":[],"specificaiton":[]};

                     transportInformationObject["id"] = data[key].id;
                     transportInformationObject["fkTransportType"] = data[key].fkTransportType;
                     transportInformationObject["vinNumber"] = data[key].vinNumber;
                     transportInformationObject["registrationNumber"] = data[key].registrationNumber;
                     transportInformationObject["licenseNumber"] = data[key].licenseNumber;
                     transportInformationObject["transportName"] = data[key].transportName;

                      transportInformationObject["fkModelNo"] = data[key].fkModelNo;
                     transportInformationObject["purchaseDate"] = data[key].purchaseDate;
                      transportInformationObject["purchaseBy"] = data[key].purchaseBy;
                     transportInformationObject["purchaseReffNo"] = data[key].purchaseReffNo;
                     transportInformationObject["purchaseFrom"] = data[key].purchaseFrom;
                      transportInformationObject["price"] = data[key].price;
                     transportInformationObject["specificaiton"] = data[key].specificaiton;

                     allTransportInformationData.push(transportInformationObject);

    				//var brandId = singleBrandModel[0].fkBrand

    				//foreign key id to name  mapping
					var singleTransportType = allTransportType.filter(object => {

						return object.id === data[key].fkTransportType

						});//end of foreign key id to name  mapping
					//alert(JSON.stringify(oneUser));

					//foreign key id to name  mapping
					var singleBrandModel = allBrandModel.filter(object => {

						return object.id === data[key].fkModelNo

						});//end of foreign key id to name  mapping

					//foreign key id to name  mapping
					var singleBrand = allBrand.filter(object => {

						return object.id === singleBrandModel[0].fkBrand

						});//end of foreign key id to name  mapping
					//alert(JSON.stringify(oneUser));
    				
				viewTransportInformation += '<tr><td>' + data[key].id + '</td><td>' + singleTransportType[0].typeTitle  + '</td><td>' + data[key].transportName  + '</td><td>' + singleBrand[0].brandName + '</td><td>' + singleBrandModel[0].modelNo + '</td><td style="display:none;">' + data[key].vinNumber + '</td><td>' + data[key].registrationNumber  + '</td><td>' + data[key].licenseNumber  + '</td><td style="display:none;">' + data[key].purchaseDate  + '</td><td style="display:none;">' + data[key].purchaseBy  + '</td><td style="display:none;">' + data[key].purchaseReffNo  + '</td><td style="display:none;">' + data[key].purchaseFrom  + '</td><td style="display:none;">' + data[key].price + '</td><td style="display:none;">' + data[key].speciifcaiton + '</td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning"id="btnUpdate_' + data[key].id + '" onclick="transportInformationProcessing(' + data[key].id + ')"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
    			}                 
						    			
    			viewTransportInformation += '</table>';
    		
        		
        		$("#divTransportInformation").html(viewTransportInformation);
        		$("#tblTransportInformation").DataTable();
				
			});
				
				
			}
		
		//transportInformationProcessing data processing
     transportInformationProcessing = function(tranportInformationId){
        var data = allTransportInformationData.filter(obj =>{
            return obj.id === tranportInformationId;
        });

        $("#saveTransportInfo").html("Update");

        $("#tmpId").val(data[0].id);
        $("#fkTransportType").val(data[0].fkTransportType);
        $("#registrationNumber").val(data[0].registrationNumber);
        $("#vinNumber").val(data[0].vinNumber);
        $("#licenseNumber").val(data[0].licenseNumber);

		$("#transportName").val(data[0].transportName);
        $("#fkModelNo").val(data[0].fkModelNo);
        $("#purchaseDate").val(data[0].purchaseDate);
        $("#purchaseBy").val(data[0].purchaseBy);

        $("#purchaseReffNo").val(data[0].purchaseReffNo);
        $("#purchaseFrom").val(data[0].purchaseFrom);
        $("#price").val(data[0].price);
        $("#specificaiton").val(data[0].specificaiton);



     }

    ////
    // function tempDiv(){
    //     $("#successMessage").fadeTo(2000, 500).slideUp(500, function(){
    //            $("#successMessage").slideUp(500);
    //             });
    // }
    ////
		
		
	
	}); //end of document ready function 
	
	
	$.post("viewAllBrands", function(data){
		//alert(JSON.stringify(data));
		var brandmodelComboBox = '<select id="fkBrandId" class="form-control">';
		
		for(var key in data)
		{
			brandmodelComboBox += '<option value="' + data[key].id + '">' +data[key].brandName+ '</option>';
		}
		brandmodelComboBox += '</select>';

		$("#divfkBrand").html(brandmodelComboBox);
		
		$( "#fkBrandId" ).change(function() {
		   viewModels( $(this).val() );
		});
		//alert(JSON.stringify(brandmodelComboBox));
	});
	
	
	function viewModels(brandId){//brandId
		
	
		$.post("viewModelByBrands",{brandId: brandId}, function(data){
			//alert(JSON.stringify(data));
			var fkModelNoComboBox = '<select id="fkModelNo" class="form-control">';
			
			for(var key in data)
			{
				fkModelNoComboBox += '<option value="' + data[key].id + '">' + data[key].modelNo + '</option>';
			}
			fkModelNoComboBox += '</select>';

			$("#divfkModelNo").html(fkModelNoComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
			
		});//end of fkModelNo. 
		
	}//end of ready documnet

	//id to Name mapping
	function getAllTransportType(){

		$.post("viewAllTransportType",function(data){

			allTransportType = data;

		});
	}

	function getAllBrandModel(){

		$.post("viewAllBrandmodel",function(data){

			allBrandModel = data;

		});
	}

	function getAllBrand(){

		$.post("viewAllBrands",function(data){

			allBrand = data;

		});
	}////id to Name mapping
	
	
</script>

<div class="col-md-12">
	<form>
		<fieldset>

			<!-- Form Name -->
			<legend>Transport Information</legend>
			<div class="col-md-2"></div>
			<div class="col-md-8 custom_shadow">
			
			<div class="well well-sm" id="successMessage" style="background-color:#1D9B2A;color:#fff;"></div>
			<div class="well well-sm" id="errorMessage"style="background-color:red;color:#fff;"></div>

			<!--  <input type="text" id="tmpId" name="tmpId" value="0" readonly="readonly"> -->
			<input type="hidden" id="tmpId" name="tmpId" value="0">

			<!--Transport Name-->

			<div class="form-group col-md-12">
				<label for="transportName">Transport Name</label>
				<input id="transportName" name="transportName" placeholder="Enter Transport Name" class="form-control input-md" type="text">
			</div>

			<div class="form-row">
   				 <div class="form-group col-md-6">
   				 	<label for="transportType">Transport Type</label>
   				 	<div id="divTransportTypeCombo"></div>
   				 </div>

   				 <div class="form-group col-md-6">
					<label for="licenseNumber">License Number</label>				
					<input id="licenseNumber" name="licenseNumber" placeholder="Enter The License Number" class="form-control input-md" type="text">
				</div>
	
			</div>

			
			<div class="form-row">
			   <div class="form-group col-md-6">
			     <label for="vinNumber">VIN Number</label>
			     <input type="text" class="form-control" id="vinNumber" name="vinNumber" placeholder="VIN number">
			   </div>
			   <div class="form-group col-md-6">
			     <label for="registrationNumber">Registration Number</label>
			     <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" placeholder="Registration Number">
			   </div>
			 </div>
			

			<div class="form-row">

				<div class="form-group col-md-4">
					<label for="selectbasic">Brand</label>	
						<div id="divfkBrand"> </div>			
				</div>
				
				<div class="form-group col-md-4">
					<label for="selectbasic">Model No.</label>	
						<div id="divfkModelNo">
							<select class="form-control">></select>
						 </div>			
				</div>

				<div class="form-group col-md-4">
				<label for="travelDate">Purchase Date</label>
					<input id="purchaseDate" name="purchaseDate" placeholder="Enetr Purchase Date" class="form-control input-md"
						type="date">	
				</div>

			</div>

			

			<!-- Text input-->

			<div class="form-row">

			<div class="form-group col-md-4">
				<label for="textinput">Purchase BY</label>
					<input id="purchaseBy" name="purchaseBy" placeholder=" Enter Purchase BY"
						class="form-control input-md" type="text">
			</div>

			<!-- Text input-->
			<div class="form-group col-md-4">
				<label for="textinput">Purchase From</label>
					<input id="purchaseFrom" name="purchaseFrom" placeholder=" Enter Purchase From"
						class="form-control input-md" type="text">
			</div>

			<div class="form-group col-md-4">
				<label for="textinput">Purchase
					Reference</label>
					<input id="purchaseReffNo" name="purchaseReffNo" placeholder="Enter Purchase Reff. No" class="form-control input-md" type="text">
			</div>

			</div>

			<!-- Text input-->


			<!-- Text input-->
			<div class="form-group col-md-12">
				<label for="textinput">Price</label>
					<input id="price" name="price" placeholder=" Price In Taka" class="form-control input-md" type="text">
			</div>

			<!-- Textarea -->
			<div class="form-group col-md-12">
				<label for="textarea">Specification</label>			
					<textarea class="form-control" id="specificaiton" name="specificaiton"></textarea>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="saveTransportInfo"></label>
				<div class="col-md-6">
					<button id="saveTransportInfo" name="saveTransportInfo"
						class="btn btn-success">Save Transport Info</button>
					<button id="resetTransportInfo" name="resetTransportInfo"
						class="btn btn-warning" type="reset" value="reset">Reset
						Info</button>
				</div>
			</div>
			
		</div>
		</fieldset>
	</form>

</div>



<div class="col-md-12">
	<div class="col-md-1"></div>
	<div class="col-md-10">
 		<legend>Existing Transport Information</legend>
 		<div id="divTransportInformation"></div>
 	</div>

</div>

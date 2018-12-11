<script type="text/javascript">

	var populateDataForBillingUpdate;
	//foreign key id to name  mapping
	var allUser = [];//end of foreign key id to name  mapping
	
	$(document).ready(function(){

		var billingInformationCommon = [];


        //alert("It,s works");
		 getAllUser();
		  funViewBillingData();
		 //alert("UserFound");
		
		$("#tmpId").val(0);

		
		   $( "#divShowBilling" ).show();
			$("#divAddBilling").hide();
			
  
		

		$("#successMessage").addClass("hidden");
        $("#errorMessage").removeClass("hidden");
        
        funViewBillingData();
        
		
		$.post("showAllUser", function(data){
			//alert(JSON.stringify(data));
			var fkBillingReferenceComboBox = '<select id="fkBillingReference" class="form-control">';
			
			for(var key in data)
			{
				fkBillingReferenceComboBox += '<option value="' + data[key].id + '">' +data[key].userName+ '</option>';
			}
			fkBillingReferenceComboBox += '</select>';

			$("#divBillingReference").html(fkBillingReferenceComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
			
		});

		function validator(){

			var billingSector = $.trim($("#billingSector").val());
			var billingAmount = $.trim($("#billingAmount").val());
			var fkBillingReference = $.trim($("#fkBillingReference").val());


			if (billingSector == "") {

				$("#errorMessage").html("Invalid id");
				$("#errorMessage").removeClass("hidden");
				$("#successMessage").addClass("hidden");

				return false;
			}

			else if (billingAmount == "") {

				$("#errorMessage").html("Invalid billingAmount");
				$("#errorMessage").removeClass("hidden");
				$("#successMessage").addClass("hidden");

				return false;
			}

			else if (fkBillingReference == "") {

				$("#errorMessage").html("Invalid fkBillingReference");
				$("#errorMessage").removeClass("hidden");
				$("#successMessage").addClass("hidden");

				return false;
			}

			return true;
		}

		$("#saveBilling").click(function(event){

			event.preventDefault();

			if(validator()){

				var billing= {};

				billing["billingSector"] = $.trim($("#billingSector").val());
				billing["billingAmount"] = $.trim($("#billingAmount").val());
				billing["fkBillingReference"] = $.trim($("#fkBillingReference").val());
				billing["tmpId"] = $.trim($("#tmpId").val());

				$.ajax({

					type : "POST",
					url : "saveBilling",
					data : JSON.stringify(billing),
					contentType : "application/json; charset=utf-8",

					success : function(successData) {
						$("#successMessage").html(successData);
						$("#successMessage").removeClass("hidden");
						$("#errorMessage").addClass("hidden");

						funViewBillingData();
					},

					error : function(error) {
						$("#errorMessage").html("Error: Record Not Saved");
						$("#errorMessage").removeClass("hidden");
						$("#successMessage").addClass("hidden");

					}


				});


			}

		});

		function funViewBillingData(){ 
			$.post("viewAllBilling",function(data){
				/*table table-striped*/
				var billingData = '<table class="table table-bordered table-hover" id = "updateBilling">' + '<thead><tr><th style="display:none;">ID</th><th>#</th><th>Billing Sector</th><th>Billing Amount</th><th>Billing Reference</th><th></th><th></th><th id="updateBillingg"></th></tr></thead><tbody>';
				
				for(var key in data){

					//foreign key id to name  mapping
					var oneUser = allUser.filter(object => {

						return object.id === data[key].fkBillingReference

						});//end of foreign key id to name  mapping
					//alert(JSON.stringify(oneUser));


					var billingObject = {"id":[],"billingSector":[],"billingAmount":[],"fkBillingReference":[]};

					billingObject["id"] = data[key].id;
					billingObject["billingSector"] = data[key].billingSector;
					billingObject["billingAmount"] = data[key].billingAmount;
					billingObject["fkBillingReference"] = data[key].fkBillingReference;

					billingInformationCommon.push(billingObject);

					
					billingData += '<tr><td><input type="checkbox" name="checkboxes" id="checkboxes-1" value="2"></td><td style="display:none;">' + data[key].id + '</td><td>' + data[key].billingSector + '</td><td>' + data[key].billingAmount + '</td><td>' + oneUser[0].userName +'</td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
					//id,name,age is the variable which we used in our student.java class..not in database
				}
				
				billingData += '</tbody></table>';
				
				$("#divViewBilling").html(billingData);

			});
				
				
    }
		

		$( "#addBilling" ).click(function() {

			$("#divShowBilling").hide();
			$("#errorMessage").addClass("hidden");
			$("#divAddBilling" ).show();
			 

  
		});

		$( "#ShowBilling" ).click(function() {

			$("#divAddBilling").hide();
			$( "#divShowBilling" ).show();
  
		});

		//////////////////////////////////////////////
/* $("#updateBillingg").click(function(e){
          e.preventDefault();
            $.ajax({type: "POST",
                url: "viewAllBilling",
                success:function(result){

                	var tableData = result;

                	 $("#billingSector").val(tableData[0]);
        			 $("#billingAmount").val(tableData[1]);

                	$("#divShowBilling").hide();
			$("#errorMessage").addClass("hidden");
			$("#divAddBilling" ).show();
                 alert(JSON.stringify(result));
                },
               error:function(result)
                {
                alert('error');
               }
           });
      }); */
   
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		
		
		
		
	});


   //foreign key id to name  mapping
   function getAllUser(){
		$.post("showAllUser",function(data){
			//alert(JSON.stringify(loction));
			allUser = data;
			
		});
		
	}//end of foreign key id to name  mapping
	
	//alert(JSON.stringify(allUser));



</script>





<div class="col-md-12">
	<legend>Billing Information</legend>
	<div class="col-md-12">
		<a href="#" id="updateBillingg" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a><a href="#" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-edit"></span> </a><a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a>

	</div>


	<div class="col-md-12" id="divShowBilling">

		<div class="col-md-12" style="min-height: 60px;">
			<button id="addBilling" name="addBilling" class="btn btn-success" style="float: right;">
				<span class="glyphicon glyphicon-plus"></span> Add Billing Information
			</button>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div id="divViewBilling"></div>

		</div>
	</div>

<div class="col-md-12"  id="divAddBilling">	
<form>
	<fieldset>	
        <div class="col-md-12">

		<button id="ShowBilling" name="ShowBilling" class="btn btn-success" style="float: right;"><span class="glyphicon glyphicon-eye-open"></span> View Billing Information</button>
		</div>

		<div class="col-md-2"></div>
		<div class="col-md-8 ">

			<div class="well well-sm hidden" id="successMessage" style=" background-color:#1D9B2A;color:#fff;"></div>
			<div class="well well-sm hidden " id="errorMessage"style=" background-color:red;color:#fff;"></div>
			
			<input type="text" class="hidden" id="tmpId" name="tmpId" value="0" readonly="readonly">
			<!--class="hidden"--> 

		<div class="form-group col-md-12">
			<label for="billingSector">Billing Sector</label>
			<select class="form-control" id="billingSector" name="billingSector">
				<option> - </option>
				<option>Fuel</option>
				<option>Driver Sallary</option>
				<option>Vehicle Repair</option>
				<option>Extra</option>
			</select>
		</div>

		<div class="form-group col-md-12">
			<label for="billingAmount">Billing Amount</label>
			<input  type="text" class="form-control" id="billingAmount" name="billingAmount" placeholder="Billing Amount">
			
		</div>

		<div class="form-group col-md-12">
			<label for="billReference">Billing Reference</label>
			<div id="divBillingReference"></div>
			
		</div>


		<div class="col-md-12">
			<button id="saveBilling" name="saveBilling" class="btn btn-success">Save Bill</button>
			<button id="resetBilling" name="resetBilling" class="btn btn-warning" type="reset" value="reset">Reset</button>
		</div>
	</div>
	</fieldset>
</form>
</div>
</div>
<script type="text/javascript">
	var editTransportType;
	$(document).ready(function(){

		var transportTypeCommon = [];

		funViewData();
		$("#tmpId").val(0);

		function validator() {

			//var typeTitle	= $.trim($("#username").val());
			var typeTitle = $.trim($("#typeTitle").val());

			if (typeTitle == "") {
				$("#errorMessage").html("<strong>Warning!</strong> Please enter a valid type Title");
				$("#errorMessage").removeClass("hidden");
				$("#successMessage").addClass("hidden");
				return false;
			}
			else{
				return true;
			}
			
			}


		/* Submitting form to controller*/
		$("#btnTransportSave").click(function(event) {

			event.preventDefault();

			if (validator()) {

				var transportType = {};//json type for 2nd bracket

				transportType["tmpId"] = $.trim($("#tmpId").val());
				transportType["typeTitle"] = $.trim($("#typeTitle").val());

				//alert(JSON.stringify(transportType)); 

				//return false;
				$.ajax({ /*ajax request */
					type : "POST",
					url : "saveTransportType",
					data : JSON.stringify(transportType),
					contentType : "application/json; charset=utf-8",
					
					success : function(successData) {
						
						$("#successMessage").html(successData);
						$("#successMessage").removeClass("hidden");
						$("#errorMessage").addClass("hidden");
						
						funViewData();
						$("#tmpId").val(0);

					},
					error : function(error) {
						$("#errorMessage").html("<strong>Error!</strong> Record Not Saved");
						$("#errorMessage").removeClass("hidden");
						$("#successMessage").addClass("hidden");
						/*$("#submit").prop("disabled", false); */
						//alert(JSON.stringify(error));
															}
					});

				} // End of validation
			}); // End of form submission

						//Function for viewing existing data

			function funViewData() {
				$.post("viewAllTransportType",function(data) {

					var transportTypeData = '<table id="tblTransportType" class="table table-bordered table-hover">'+ '<thead><tr><th>ID</th><th>Transport Type</th><th></th><th></th></tr></thead><tbody>';

						for ( var key in data) {

							var transportTypeObject = {"id":[],"typeTitle":[]};

							transportTypeObject["id"] = data[key].id;
							transportTypeObject["typeTitle"] = data[key].typeTitle;

							transportTypeCommon.push(transportTypeObject);

							transportTypeData += '<tr><td>'+ data[key].id + '</td><td>'+ data[key].typeTitle + '</td><td><a href="#" id="btnDelete" align="center" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning" id="btnUpdate_' + data[key].id + '" onclick="editTransportType(' + data[key].id + ')"><span class="glyphicon glyphicon-edit"></span></a></td></tr>';
												
						}

						transportTypeData += '</tbody></table>';

						$("#divTransportType").html(transportTypeData);
						$("#tblTransportType").DataTable();
					});
			}

			//function delete




	editTransportType = function(transportTypeId){
		var data = transportTypeCommon.filter(object =>{
			return object.id === transportTypeId
		});

		$("#btnTransportSave").html("Update");

		$("#tmpId").val(data[0].id);
		$("#typeTitle").val(data[0].typeTitle);
	}

	/*===========================================*/
	/*window.setTimeout(function() {
    $("#successMessage").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
    }, 4000);*/
    /*==========================================*/

	}); //end of document ready function
					
</script>

<!-- End of J Query -->


<div class="col-md-6">
	<legend> Existing Transport Type</legend>
	<div class="col-md-12">
		<div id="divTransportType" class="col-md-12"></div>


	</div>
</div>

<div class="col-md-6 ">
	<form class="form-horizontal">
		<fieldset>

			<!-- Form Name -->
			<legend>Create New Transport Type</legend>
			<!-- -----------------2nd start  -->

			<!-- 2nd end ------------ -->
			<!-- Text input-->

			<input type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">

			<div id="errorMessage" align="center" class="hidden alert alert-danger"></div>
			<div id="successMessage" align="center" class="hidden alert alert-success"></div>
			
			<div class="form-group">
				<label class="col-md-4 control-label" for="typeTitle">Transport Type</label>
				<div class="col-md-6">
					<input id="typeTitle" name="typeTitle" placeholder="Enter Transport Type" class="form-control input-md" type="text">
					
				</div>


			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="btnTransportSave"></label>
				<div class="col-md-4">
					<button id="btnTransportSave" name="btnTransportSave" class="btn btn-primary">Save</button>
					<button id="btnTransportReset" name="btnTransportReset" class="btn btn-warning" type="reset" value="reset">Reset</button>
						<!-- for refresh a page onclick="document.getElementById('typeTitle').value ='' " -->
				</div>
			</div>

		</fieldset>
	</form>
</div>

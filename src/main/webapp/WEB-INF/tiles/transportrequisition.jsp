<script type="text/javascript">

	var allTransportType = [];
	
	$(document).ready(function(){
		
		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");
        

        getAllTransportType();
        funViewTransportRequisitionData();
/*
        $(function(){
			  $('#travelDate').datepicker({
				     dateFormat: "yy-mm-dd",
				     minDate:0,
     				 changeMonth: true,
     				 changeYear: true
    				});
			  });
*/

        $(function () {
            $('#travelDate').datetimepicker({
            	/*minDate:0,
                   format:'L'
*/
                   format: 'YYYY-MM-DD',
                   /*defaultDate: "11/1/2013",
                   disabledDates: [
                        moment("12/25/2013"),
                        new Date(2013, 11 - 1, 21),
                        "11/22/2013 00:53"
                    ]*/
                  

            });
         });

       
        
            // pickup data to combobox/selector from foreign table
			$.post("viewAllTransportType", function(data){
			//alert(JSON.stringify(data));
			var transportTypeComboBoxForTransportRequisition = '<select id="fkTransportType" class="form-control">';
			
			for(var key in data)
			{
				transportTypeComboBoxForTransportRequisition += '<option value="' + data[key].id + '">' +data[key].typeTitle+ '</option>';
			}
			transportTypeComboBoxForTransportRequisition += '</select>';

			$("#divTransportRequisitionTransportType").html(transportTypeComboBoxForTransportRequisition);
			//alert(JSON.stringify(brandmodelComboBox));
			
		});

		$.post("showAllUser", function(data){
			//alert(JSON.stringify(data));
			var fkRequestedByComboBox = '<select id="fkRequestedBy" class="form-control">';
			
			for(var key in data)
			{
				fkRequestedByComboBox += '<option value="' + data[key].id + '">' +data[key].userName+ '</option>';
			}
			fkRequestedByComboBox += '</select>';

			$("#divFkRequestedBy").html(fkRequestedByComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
			
		});

		$.post("showAllUser", function(data){
			//alert(JSON.stringify(data));
			var fkRequestedByComboBox = '<select id="fkApproveddBy" class="form-control">';
			
			for(var key in data)
			{
				fkRequestedByComboBox += '<option value="' + data[key].id + '">' +data[key].userName+ '</option>';
			}
			fkRequestedByComboBox += '</select>';

			$("#divFkApprovedBy").html(fkRequestedByComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
			
		});
		
		
		//validator
		function validator(){

            //var brandName	= $.trim($("#username").val());
			var brandName = $.trim($("#brandName").val());
		
            if(brandName == ""){
                $("#errorMessage").html("Please enter a valid Brand Name..."); 
                $("#errorMessage").removeClass("hidden");


                $("#successMessage").addClass("hidden");
                return false;
            } /* else if(){ // for multiple validation check
            	
            	
            }*/

            return true;
        }

        function validator(){

        	//var fkRequestedBy = $.trim($("#fkRequestedBy").val());
        	//var requestDate = $.trim($("#requestDate").val());
        	var travelDate = $.trim($("#travelDate").val());
        	alert(travelDate);
        	var fkTransportType = $.trim($("#fkTransportType").val());
        	var purpose = $.trim($("#purpose").val());
        	//var status = $.trim($("#status").val());
        	//var fkApproveddBy = $.trim($("#fkApproveddBy").val());
        	//var approveDate = $.trim($("#approveDate").val());
        	//var comment = $.trim($("#comment").val());

        	/* if(fkRequestedBy == ""){
                $("#errorMessage").html("Please enter a valid fkRequestedBy"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            else */if(travelDate == ""){

            	$("#errorMessage").html("Please enter a valid travelDate"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            else if(fkTransportType == ""){

            	$("#errorMessage").html("Please enter a valid fkTransportType"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            else if(purpose == ""){

            	$("#errorMessage").html("Please enter a valid purpose"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            /*else if(status == ""){

            	$("#errorMessage").html("Please enter a valid status"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }

            else if(fkApproveddBy == ""){

            	$("#errorMessage").html("Please enter a valid fkApproveddBy"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }


            else if(comment == ""){

            	$("#errorMessage").html("Please enter a valid comment"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
            }*/

            return true;


        }//end of validator

        //save to database

        $("#saveTransportRequisition").click(function(event) {

            event.preventDefault();

            if (validator()){

                var transportRequisition = {};

                //transportRequisition["fkRequestedBy"] = $.trim($("#fkRequestedBy").val());
                //var dateFormat = 
        		transportRequisition["travelDate"] = $.trim($("#travelDate").val());
        		transportRequisition["fkTransportType"] = $.trim($("#fkTransportType").val());
        		transportRequisition["purpose"] = $.trim($("#purpose").val());
        		//transportRequisition["status"] = $.trim("P");
        		//transportRequisition["fkApproveBy"] = $.trim($("#fkApproveddBy").val());

        		//transportRequisition["comment"] = $.trim($("#comment").val());

                //alert(JSON.stringify(transportRequisition)); 
                
                $.ajax({
                    type: "POST",
                    url: "saveTransportRequisition",
                    data: JSON.stringify(transportRequisition),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {

                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewTransportRequisitionData();
                       

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
        
        
        
        //view The Database data
        function funViewTransportRequisitionData(){
        	
        	
        	
        	$.post("viewTransportRequisition",function(data){
        		
        		
        		alert(JSON.stringify(data));
        		var transportRequisitionData = '<table id="tblTransportRequisition" class="table table-bordered table-hover">' +
    			                    '<thead><tr><th>ID</th><th>Travel Date</th><th>TransportType</th><th>Purpose</th><th></th><th></th><th></th></tr></thead><tbody>';
    			                    
    			for(var key in data){  
    				

    				//foreign key id to name  mapping
					var singleTransportType = allTransportType.filter(object => {

						return object.id === data[key].fkTransportType

						});//end of foreign key id to name  mapping

    				transportRequisitionData += '<tr><td>' + data[key].id + '</td><td>' + data[key].travelDate + '</td><td>' + singleTransportType[0].typeTitle + '</td><td>' + data[key].purpose +  '</td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
    			}                 
    				    			
    			transportRequisitionData += '</tbody></table>';
    		
        		
        		$("#divTransportRequisition").html(transportRequisitionData);
        		$("#tblTransportRequisition").DataTable();
        		
        		
        		
        	});
        }



	});

   function getAllTransportType(){
   	$.post("viewAllTransportType",function(data){

   		allTransportType = data;

   	});
   }

</script>

<div class="col-md-6">
	<legend>Existing Requisition</legend>
	<div id="divTransportRequisition"></div>
</div>

<div class="col-md-6">
<form class="custom_shadow" style="float: right !important;">
	<fieldset>

		<!-- Form Name -->
		<legend>Create New Transport Requisition</legend>
		
		<div class="well well-sm" id="successMessage" style="background-color:#1D9B2A;color:#fff;"></div>
		<div class="well well-sm" id="errorMessage"style="background-color:red;color:#fff;"></div>

		<!-- Select Basic -->
	<!--	<div class="form-group">
			<label class="col-md-4 control-label" for="selectbasic">Requested
				By</label>
			<div class="col-md-6">
				<div id="divFkRequestedBy">
					
				</div>
				
			</div>
		</div>-->

<!-- 		
		<div class="form-group">
			<label class="col-md-4 control-label" for="requestDate">Request
				Date</label>
			<div class="col-md-6">
				<input id="requestDate" name="requestDate"
					placeholder="Request Date" class="form-control input-md"
					type="text">

			</div>
		</div>
 -->
		<!-- Text input-->
		<div class="form-group col-md-10">
			<label for="travelDate">Travel Date</label>
			<input id="travelDate" name="travelDate" placeholder="Travel Date" class="form-control input-md" type="text">
		</div>

		<!-- Select Basic -->
		<div class="form-group col-md-10">
			<label for="fkTransportType">Transport Type</label>
			<div id="divTransportRequisitionTransportType"></div>
		</div>

		<!-- Textarea -->
		<div class="form-group col-md-10">
			<label for="purpose">Purpose</label>
			<textarea class="form-control" id="purpose" name="purpose"></textarea>
		</div>

		<!-- Text input-->
		<!--<div class="form-group">
			<label class="col-md-4 control-label" for="status">Status</label>
			<div class="col-md-6">
				<input id="status" name="status" placeholder="Status"
					class="form-control input-md" type="text">

			</div>
		</div>-->

		<!--  Select Basic -->
			<!-- div class="form-group">
			  <label class="col-md-4 control-label" for="status">Status</label>
			  <div class="col-md-6">
			    <select id="status" name="status" class="form-control">
			      <option>A</option>
			      <option>P</option>
			      <option>R</option>
			    </select>
			  </div>
			</div> --><!-- 

		Select Basic
		<div class="form-group">
			<label class="col-md-4 control-label" for="fkApproveBy">Approve
				By</label>
			<div class="col-md-6">
				<div id="divFkApprovedBy">
					
				</div>
			</div>
		</div>

	
		<div class="form-group">
			<label class="col-md-4 control-label" for="approveDate">Approve
				Date</label>
			<div class="col-md-6">
				<input id="approveDate" name="approveDate"
					placeholder="Approve Date" class="form-control input-md"
					type="Date">

			</div>
		</div>

		Textarea
		<div class="form-group">
			<label class="col-md-4 control-label" for="comment">Comments</label>
			<div class="col-md-6">
				<textarea class="form-control" id="comment" name="comment"></textarea>
			</div>
		</div> -->

		<!-- Button (Double) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="saveTransportRequisition"></label>
			<div class="col-md-6">
				<button id="saveTransportRequisition" name="saveTransportRequisition" class="btn btn-primary">Save</button>
				<button id="resetTransportRequisition" name="resetTransportRequisition" class="btn btn-warning" type="Reset" value="Reset">Reset</button>
			</div>
		</div>

	</fieldset>
</form>
</div>

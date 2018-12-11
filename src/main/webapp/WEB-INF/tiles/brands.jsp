<script type="text/javascript">


	$(document).ready(function(){
		
		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");
		

		funViewData();
		$("#tmpId").val(0);
		
		
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

		/* $("#btnSave").click(function(){
			
			
		});*/

        /* Submitting form to controller*/
        $("#btnSave").click(function(event) {

            event.preventDefault();

            if (validator()){

                var brands = {};

                brands["brandName"] = $.trim($("#brandName").val());
                brands["tmpId"] = $.trim($("#tmpId").val());//for update data
               

                //alert(JSON.stringify(brands)); 
                
                //return false;
                $.ajax({
                    type: "POST",
                    url: "saveBrands",
                    data: JSON.stringify(brands),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                    	//viewData();
                        //alert(successData);
                       
                        //$("#submit").prop("disabled", false);
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewData();
                        $("#tmpId").val(0);
                        $("#btnSave").html('Save Data');
                        $("#btnDelete").addClass("hidden");

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
        
        
        //Function for viewing existing data
        
        function funViewData(){
        	
        	$.post("viewAllBrands",function(data){
        		
        		var brandsData = '<table id="tblBrand" class="table table-bordered table-hover">' +
    			                    '<thead><tr><th>ID</th><th>Brand Name</th><th></th><th></th><th></th></tr></thead><tbody>';
    			                    
    			for(var key in data){  
    				
    				brandsData += '<tr><td>' + data[key].id + '</td><td>' + data[key].brandName + '</td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
    			}                 
						    			
    			brandsData += '</tbody></table>';
    		
        		
        		$("#divBrands").html(brandsData);
        		$("#tblBrand").DataTable();
        		
        		//updating data start
        		
					$('#tblBrand tbody').on('dblclick', 'tr', function () {
        			
        			var tableData = $(this).children("td").map(function() {
    			        return $(this).html();    			        
    			    }).get();
        			
        			 
        			 //$("#btnSave").prop('value', 'Update Data');
        			 $("#btnSave").html("Update");
        			 $("#btnDelete").removeClass("hidden");
        			        			
        			 $("#tmpId").val(tableData[0]);
        			 $("#brandName").val(tableData[1]);
        			
        		});	//updating data end
        		
        		
        	});
        }
	
	}); //end of document ready function 
	
	function funDeleteBrands(){
		
		 var r = confirm("Are you sure you want to delete this?");
   	    if (r == true) {

                   
   	    	   
	        	$.post("delete-brand", {id: $("#tmpId").val()}, function(data){
	        		$("#successMessage").html(data);
                     funViewData();
	        		 
	        	}); 
	        	
	        	
	        	
   	    } else {
   	    	return false;
   	    }
   	
	}
	
</script>


<div class="col-md-6">
	<form class="form-horizontal">
		<fieldset>
	
			<!-- Form Name -->
			<legend>Create New Brands</legend>
	        
			<div class="well well-sm" id="successMessage" style="background-color:#1D9B2A;color:#fff;"></div>
			<div class="well well-sm" id="errorMessage"style="background-color:red;color:#fff;"></div>
			
			<!-- for edit update-->
			<input type="text" class="hidden" id="tmpId" name="tmpId" value="0" readonly="readonly">
			<!--class="hidden"--> 
			<!--end-->
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="brandName">Brand
					Name</label>
				<div class="col-md-5">
					<input id="brandName" name="brandName"
						placeholder="Enter Brand Name" class="form-control input-md"
						required="" type="text">
	
				</div>
			</div>
	
			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="btnSave"></label>
				<div class="col-md-6">
					<input type="button" id="btnDelete" name="btnDelete" class="btn btn-danger hidden"  onclick="funDeleteBrands()" value="Delete">
					<button id="btnSave" name="btnSave" class="btn btn-primary">Save Brand</button>
					<button id="btnReset"name="btnReset" class="btn btn-warning" type="reset" value="Reset">Reset</button>
				</div>
			</div>
	
		</fieldset>
	</form>
</div>

<div class="col-md-6">
    <legend> Existing Brands </legend>
    <div id="divBrands" class="col-md-12">
        
    
    </div>
</div>
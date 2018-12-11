
<script type="text/javascript">

    var brandmodelProcessing;

	var viewAllBrandmodel = [];

	$(document).ready(function(){

        var allBrandmodelData = [];

		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");
        getAllBrand();
        
        funViewModelData();
        $("#tmpId").val(0);
        
        
        
		
		$.post("viewAllBrands", function(data){
			//alert(JSON.stringify(data));
			var brandmodelComboBox = '<select id="brandName" class="form-control">';
			for(var key in data)
			{
				brandmodelComboBox += '<option value="' + data[key].id + '">' +data[key].brandName+ '</option>';
			}
			brandmodelComboBox += '</select>';

			$("#divTransportTypeCombo").html(brandmodelComboBox);
			//alert(JSON.stringify(brandmodelComboBox));
		});
		
		
		
		function validator(){
        
            //var brandName	= $.trim($("#username").val());
			var brandModelNo = $.trim($("#brandModelNo").val());
			var fkBrandName = $.trim($("#brandName").val());
			
			
			
            if(brandModelNo == ""){
                $("#errorMessage").html("Please Enter Valid Value."); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
                
            } 
            else if(fkBrandName == ""){
            	$("#errorMessage").html("Please Enter Valid Value1"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                return false;
                //alert("fazami korish")
            }/* else if(){ // for multiple validation check
            	
            	
            }*/
            
            return true;
            
        }
		

		/* $("#btnSave").click(function(){	
			
		});*/
			

        /* Submitting form to controller*/
        $("#btnSaveBrandmodel").click(function(event) {
        	
            event.preventDefault();

            if (validator()){

                var brandmodel = {};

                brandmodel["tmpId"] = $.trim($("#tmpId").val());
                brandmodel["modelNo"] = $.trim($("#brandModelNo").val()); 
                brandmodel["fkBrand"]=$.trim($("#brandName").val());
               
                
                //alert(JSON.stringify(brandmodel)); 
                
                //return false;
                $.ajax({
                    type: "POST",
                    url: "saveBrandmodel",
                    data: JSON.stringify(brandmodel),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                    
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                       funViewModelData();
                       $("#tmpId").val(0);
                       tempDiv();
                       $("#btnSaveBrandmodel").html("SAVE");

                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#successMessage").addClass("hidden");
                        tempDiv();
                        /*$("#submit").prop("disabled", false); */
                        alert(JSON.stringify(error));
                    }
                });

            } // End of validation
        }); // End of form submission
        
        
        //Function for viewing existing data
        
       function funViewModelData(){
        	$.post("viewAllBrandmodel",function(data){
                 //alert(JSON.stringify(data));
        		
        		var brandModelData = '<table id="tblBrandModel"  class="table table-bordered table-hover">' +
    			                    '<thead><tr><th>ID</th><th>Brand</th><th>Model</th><th></th><th></th><th></th></tr></thead><tbody>';
    			                    
    			for(var key in data){


                    var brandmodelObject = {"id":[],"fkBrand":[],"modelNo":[]};

                     brandmodelObject["id"] = data[key].id;
                     brandmodelObject["fkBrand"] = data[key].fkBrand;
                     brandmodelObject["modelNo"] = data[key].modelNo;

                     allBrandmodelData.push(brandmodelObject);
                    

    				var singleBrand = viewAllBrandmodel.filter(object => {

						return object.id === data[key].fkBrand

						});
    				
    				brandModelData += '<tr><td>' + data[key].id + '</td><td>' + singleBrand[0].brandName + '</td><td>'+ data[key].modelNo + '</td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning" id="btnUpdate_' + data[key].id + '" onclick="brandmodelProcessing(' + data[key].id + ')"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
    			}                 
						    			
    			brandModelData += '</tbody></table>';
    		
        		
        		$("#divBrandmodel").html(brandModelData);
        		$("#tblBrandModel").DataTable();
        	});
        }//end of viewing function
	

     //brandmodel data processing
     brandmodelProcessing = function(brandmodelId){
        var data = allBrandmodelData.filter(obj =>{
            return obj.id === brandmodelId;
        });

        $("#btnSaveBrandmodel").html("Update");

        $("#tmpId").val(data[0].id);
        $("#brandName").val(data[0].fkBrand);
        $("#brandModelNo").val(data[0].modelNo);
     }

    ////
    function tempDiv(){
        $("#successMessage").fadeTo(2000, 500).slideUp(500, function(){
               $("#successMessage").slideUp(500);
                });
    }
    ////



	}); //end of document ready function 
	

function getAllBrand(){
		$.post("viewAllBrands",function(data){
			//alert(JSON.stringify(loction));
			viewAllBrandmodel = data;
			
		});
		
	}//end of foreign key id to name  mapping
	
</script>

<style type="text/css">
    
  
</style>



<div class="col-md-6">
	<legend>Existing Brand Model</legend>
	<div id="divBrandmodel" class="col-md-12" style="overflow: auto; height: 490px;"></div>

</div>

<div class="col-md-6">
	<form class="form-horizontal well">
		<fieldset>

			<!-- Form Name -->
			<legend>Create New Brand Model</legend>
			<div class="well well-sm" id="successMessage" align="center" style="background-color:#1D9B2A; color:#fff;"></div>
			<div class="well well-sm" id="errorMessage" align="center" style="background-color:red; color:#fff;"></div>

            <input type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">
            <!-- class="hidden" -->

			<!-- Select Transport Type-->
			<div class="form-group">
				<label class="col-md-3 control-label" for="">Brand Name</label>
				<div class="col-md-7">
					<div id="divTransportTypeCombo"></div>	
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-3 control-label" for="textinput">Model No</label>
				<div class="col-md-7">
					<input id="brandModelNo" name="brandModelNo" placeholder="Enter the model no" class="form-control input-md" type="text">
				</div>
			</div>

			<!-- Button (Double) -->
			<div class="form-group">
				<label class="col-md-3 control-label" for="button1id"></label>
				<div class="col-md-8">
					<button id="btnSaveBrandmodel" name="btnSaveBrandmodel" class="btn btn-success">Save</button>
					<button id="btnResetBrandmodel" name="btnResetBrandmodel" class="btn btn-warning" type="reset" value="reset">Reset</button>
				</div>
			</div>

		</fieldset>
	</form>
</div>

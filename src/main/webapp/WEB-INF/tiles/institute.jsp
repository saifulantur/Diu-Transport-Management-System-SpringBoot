
<script type="text/javascript">

    var editInstitute;


	$(document).ready(function(){

        var instituteCommon =[];
		
		$("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");
		

		funViewInstituteData();
		$("#tmpId").val(0);
		
		
		function validator(){

            //var brandName	= $.trim($("#username").val());
			var instituteName = $.trim($("#instituteName").val());
		
            if(instituteName == ""){
                $("#errorMessage").html("Please enter a valid instituteName..."); 
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
        $("#saveInstitute").click(function(event) {

            event.preventDefault();

            if (validator()){

                var institute = {};

                institute["tmpId"] = $.trim($("#tmpId").val());
                institute["instituteName"] = $.trim($("#instituteName").val());
                //institute["tmpId"] = $.trim($("#tmpId").val());//for update data
               

                //alert(JSON.stringify(brands)); 
                
                //return false;
                $.ajax({
                    type: "POST",
                    url: "save-institute",
                    data: JSON.stringify(institute),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {

                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewInstituteData();
                        $("#tmpId").val(0);
                        $("#saveInstitute").html('SAVE');
                        /*$("#btnDelete").addClass("hidden");*/

                    },
                    error: function (error) {
                        $("#errorMessage").html("<strong>Error!</strong> Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#successMessage").addClass("hidden");
                        /*$("#submit").prop("disabled", false); */
                       alert(JSON.stringify(error));
                    }
                });

            } // End of validation
        }); // End of form submission
        
        
        //Function for viewing existing data
        
        function funViewInstituteData(){
        	
        	$.post("viewAllInstitute",function(data){
        		
        		var instituteData = '<table id="tblInstitute" class="table table-bordered table-hover">' +
    			                    '<thead><tr><th>ID</th><th>Institute Name</th><th></th><th></th><th></th></tr></thead><tbody>';
    			                    
    			for(var key in data){ 

                var instituteObject ={"id":[],"instituteName":[]};

                //object of all data
                instituteObject["id"] = data[key].id;
                instituteObject["instituteName"] = data[key].instituteName; 
    			
                //object pushed in to antoher var for next process	
                instituteCommon.push(instituteObject);

    				instituteData += '<tr><td>' + data[key].id + '</td><td>' + data[key].instituteName + '</td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td><td> <a href="#" class="btn btn-sm btn-warning" id="btnUpdate_' + data[key].id + '" onclick="editInstitute(' + data[key].id + ')"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
    			}                 
						    			
    			instituteData += '</tbody></table>';
    		
        		
        		$("#divExistingInstituteData").html(instituteData);
        		$("#tblInstitute").DataTable();
        		
        		
        		
        		
        	});
        }


    editInstitute = function(instituteId){
        var data = instituteCommon.filter(obj =>{
            return obj.id === instituteId
        });

        $("#saveInstitute").html("UPDATE");

        $("#tmpId").val(data[0].id);
        $("#instituteName").val(data[0].instituteName);
    }
	
	}); //end of ready document
	
</script>
<div class="col-md-6">
	<legend>Existing Institute Data</legend>

	<div id="divExistingInstituteData"></div>
	
</div>
<div class="col-md-6">
<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
		<legend>Institute</legend>

        <input type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">

		<div id="errorMessage" align="center" class="hidden alert alert-danger"></div>
        <div id="successMessage" align="center" class="hidden alert alert-success"></div>

		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="instituteName">Institute Name</label>  
		  <div class="col-md-6">
		  <input id="instituteName" name="instituteName" type="text" placeholder="Enter institute Name eg. DIU" class="form-control input-md" required="">
		    
		  </div>
		</div>

		<div class="form-group">
		  <label class="col-md-4 control-label" for="button1id"></label>
		  <div class="col-md-8">
		    <button id="saveInstitute" name="saveInstitute" class="btn btn-primary">SAVE</button>
		    <button id="resetInstitute" name="resetInstitute" class="btn btn-warning" type="reset" value="reset">RESET</button>
		  </div>
		</div>

</fieldset>
</form>
</div>

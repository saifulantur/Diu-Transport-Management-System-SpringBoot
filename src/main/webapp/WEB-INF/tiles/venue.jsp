<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
  
  $(document).ready(function(){

     $("#successMessage").addClass("hidden");
       $("#errorMessage").addClass("hidden");

       $("#divShowDriverInformation" ).show();
        $("#divAddDiverInformation").hide();

       funViewModelData();

       function validator(){

        var VenueName = $.trim($("#venueName").val());
        // var LocationMap = $.trim($("#locationMap").val());

        if(VenueName = ""){
          $("#errorMessage").html("Please Enter VenueName."); 
                $("#errorMessage").removeClass("hidden");
              $("#successMessage").addClass("hidden");
                return false;

         }
        // else if (LocationMap= ""){
        //   $("#errorMessage").html("Please Enter LocationMap."); 
        //         $("#errorMessage").removeClass("hidden");
        //       $("#successMessage").addClass("hidden");
        //         return false;

        // }
        return true;

       }//End of function validator

       $("#btnVenueSave").click(function(event){

        event.preventDefault();

        if (validator()){

          var Venue = {};

          Venue["venueName"]=$.trim($("#venueName").val());
          Venue["locationMap"]=$.trim($("#locationMap").val());


          $.ajax({
                type: "POST",
                url: "saveVenue",
                data: JSON.stringify(Venue),
                contentType: "application/json; charset=utf-8",
                
                success: function (successData) {
                    $("#successMessage").html(successData);
                    $("#successMessage").removeClass("hidden");
                    $("#errorMessage").addClass("hidden");

                    $("#btnVenueSave").html('Save Data');
                    funViewModelData();

                 }, error: function (error) {
                   $("#errorMessage").html("Error: Record Not Saved");
                   $("#errorMessage").removeClass("hidden");
                   $("#successMessage").addClass("hidden");
                   // alert(JSON.stringify(error));
                }
            });//end of ajax


        }
 });//end of btn function

         $( "#addBilling" ).click(function() {

            $("#divShowDriverInformation").hide();
            $("#errorMessage").addClass("hidden");
            $("#divAddDiverInformation" ).show();
            

            
        

  
        });

        $( "#ShowBilling" ).click(function() {

            $("#divAddDiverInformation").hide();
            $( "#divShowDriverInformation" ).show();
  
        });


       function funViewModelData(){
       
          $.post("viewAllVenue",function(data){
          
          var brandModelData = '<table id="tblVenue" class="table">' +
                       '<thead><tr><th>ID</th><th>Venue Name</th></tr></thead><tbody>';
                            
        for(var key in data){  
       
        brandModelData +='<tr><td>'+data[key].id+'</td><td>'+data[key].venueName+'</td></tr>';
        }                 
                      
        brandModelData += '</tbody></table>';
      
          
          $("#divVenue").html(brandModelData);
         



  });//end of function(data)

  }//end of fun view function




  
  });//End of ready function


</script>


<div class="col-md-12" id="divShowDriverInformation">
<!-- List View -->
<legend style="padding-left:9.5%;margin-top: 0%;margin-bottom: 1%;">Existing Venue Data</legend>

    <div class="col-md-12" ">
        <div class="col-md-12" style="min-height: 60px;">
                <button id="addBilling" name="addBilling" class="btn btn-success" style="float: right; margin-right: 8%;margin-bottom: 3%;">
                  <a href="#" class="btn btn-primary btn-success"><span class="glyphicon glyphicon-plus"></span> Add Venue</a>
             <!--        <span class="glyphicon glyphicon-plus"></span> Add Venue -->
                </button>
        </div>
        <div class="col-md-1"></div>
            <div class="col-md-10">
                <div id="divVenue"></div>
            </div>
    </div>
</div>

<div class="col-md-12" id="divAddDiverInformation">
<form >
    <fieldset>

        <div class="col-md-12">
        <div class="col-md-1"></div>
        <div class="col-md-10">

            <button id="ShowBilling" name="ShowBilling" class="btn btn-success" style="float: right;margin-bottom: 3%;"><span class="glyphicon glyphicon-eye-open"></span> View Venue Information</button>

        </div>
        </div>

        <legend style="padding-left:9.5%;margin-top: 0%; margin-bottom: 1%;">Create New Venue Name</legend>
        <div class="col-md-1"></div>
        <div class="col-md-10" id="divDriverInput">

            <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A; color:#fff;"></div>
            <div class="well well-sm" id="errorMessage" style="background-color:red; color:#fff;"></div>

            <input type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">
            <!-- class="hidden" -->
            
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="venueName">Venue Name</label> 
                    <input id="venueName" name="venueName" placeholder="Enter Venue Name" class="form-control input-md" type="text">
                </div>

           </div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="saveDriver"></label>
                <div class="col-md-7">
                    <button id="btnVenueSave" name="btnVenueSave" class="btn btn-primary mb-2">Save</button>
                    <button id="resetDriver" name="resetDriver" class="btn btn-warning" type="reset" value="reset">Reset</button>
                </div>
            </div>
                
       
        </div>

        
        
        </div>
        
    </fieldset>
</form>
</div>




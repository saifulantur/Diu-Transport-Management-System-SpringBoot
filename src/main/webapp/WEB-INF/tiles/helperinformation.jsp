<script type="text/javascript">

    var populateDataForUpdate;
    
    $(document).ready(function(){
        
        var helperInformationCommon = [];

        $("#divShowHelperInformation" ).show();
        $("#divAddHelperInformation").hide();


        $("#successMessage").addClass("hidden");
        $("#errorMessage").addClass("hidden");
        
        funViewHelperData();
        $("#tmpId").val(0);

        function validator(){
            var  helperName = $.trim($("#helperName").val());
            var  helperCode = $.trim($("#helperCode").val());
            var  helperDateOfBirth = $.trim($("#helperDateOfBirth").val());
            var  drivingLicense = $.trim($("#drivingLicense").val());
            var  helperNid = $.trim($("#helperNid").val());
            var  presentAddress = $.trim($("#presentAddress").val());
            var  parmanentAddress = $.trim($("#parmanentAddress").val());
            var  helperContact = $.trim($("#helperContact").val());
            var  helperEmail = $.trim($("#helperEmail").val());
            var  helperPhoto  = $.trim($("#helperPhoto").val());

            if (helperName == "") {
                $("#errorMessage").html("Please enter a valid helper Name"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
            }

            else if (helperCode == "") {
                $("#errorMessage").html("Please enter a valid helper Code"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
            }

            else if (helperDateOfBirth == "") {
                $("#errorMessage").html("Please enter a valid helperDateOfBirth"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
            }

            else if (drivingLicense == "") {
                $("#errorMessage").html("Please enter a valid helperLicense"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
            }
            else if (helperNid == "") {
                $("#errorMessage").html("Please enter a valid helperNid"); 
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

            else if (helperContact == "") {
                $("#errorMessage").html("Please enter a valid helperContact"); 
                $("#errorMessage").removeClass("hidden");
                $("#successMessage").addClass("hidden");
                
                return false;
            }

            else if (helperEmail == "") {
                $("#errorMessage").html("Please enter a valid helperEmail"); 
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
        $("#saveHelper").click(function(event) {

            event.preventDefault();

            if (validator()){

                var helper = {};

                helper["tmpId"] = $.trim($("#tmpId").val());
                helper["helperName"]         = $.trim($("#helperName").val());
                helper["helperCode"]         = $.trim($("#helperCode").val());
                helper["helperDateOfBirth"]  = $.trim($("#helperDateOfBirth").val());
                helper["drivingLicense"]     = $.trim($("#drivingLicense").val());
                helper["licenseExpireDate"]  = $.trim($("#licenseExpireDate").val());
                helper["helperNid"]          = $.trim($("#helperNid").val());
                helper["presentAddress"]     = $.trim($("#presentAddress").val());
                helper["parmanentAddress"]   = $.trim($("#parmanentAddress").val());
                helper["helperContactNO"]    = $.trim($("#helperContact").val());
                helper["helperEmail"]        = $.trim($("#helperEmail").val());
                helper["helperImage"]        = $.trim($("#helperPhoto").val());

                //driver["tmpId"] = $.trim($("#tmpId").val());//for update data
                //alert(JSON.stringify(brands)); 
                
                //return false;
                $.ajax({
                    type: "POST",
                    url: "saveHelper",
                    data: JSON.stringify(helper),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                        //viewData();
                        //alert(successData);
                       
                        //$("#submit").prop("disabled", false);
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewHelperData();
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
        
        
 function funViewHelperData(){
            
            $.post("viewAllHelper",function(data){
                /*table table-striped*/
                var helperData = '<table id="tblHelper" class="table table-bordered table-hover">' +
                                    '<thead><tr><th style="display:none;">ID</th><th>Helper Name</th><th>Employee Code</th><th style="display:none;">Date Of Birth</th><th>Driving License</th><th>License Expire Date</th><th style="display:none;">NID No.</th><th style="display:none;">Present Address</th><th style="display:none;">Permanent Address</th><th>Contact No</th><th style="display:none;">Email</th><th style="display:none;">Image</th><th></th><th></th><th></th></tr></thead><tbody>';
                 
                for(var key in data){ 
                    
                    var helperObject = {"id":[],"helperName":[],"helperCode":[],"helperDateOfBirth":[],"drivingLicense":[],"licenseExpireDate":[],"helperNid":[],"presentAddress":[],"parmanentAddress":[],"helperContactNO":[],"helperEmail":[],"helperImage":[]};
                                            
                    var dateFormat = $.datepicker.formatDate('dd-mm-yy', new Date(data[key].licenseExpireDate));
                    var dateFormat1 = $.datepicker.formatDate('dd-mm-yy', new Date(data[key].helperDateOfBirth));
                    
                    helperObject["id"] = data[key].id;
                    helperObject["helperName"] = data[key].helperName;
                    helperObject["helperCode"] = data[key].helperCode;
                    helperObject["helperDateOfBirth"] = data[key].helperDateOfBirth;
                    helperObject["drivingLicense"] = data[key].drivingLicense;
                    helperObject["licenseExpireDate"] = data[key].licenseExpireDate;
                    helperObject["helperNid"] = data[key].helperNid;
                    helperObject["presentAddress"] = data[key].presentAddress;
                    helperObject["parmanentAddress"] = data[key].parmanentAddress;
                    helperObject["helperContactNO"] = data[key].helperContactNO;
                    helperObject["helperEmail"] = data[key].helperEmail;
                    helperObject["helperImage"] = data[key].helperImage;
                        
                    helperInformationCommon.push(helperObject);
                    
                    //alert(JSON.stringify(driverObject));
                    //alert(dateFormat);
                    //alert(dateFormat);
                    
                    helperData += '<tr><td style="display:none;">' + data[key].id + '</td><td>' + data[key].helperName + '</td><td>'+data[key].helperCode + '</td><td style="display:none;">'+ dateFormat1 + '</td><td>' + data[key].drivingLicense + '</td><td>' + dateFormat + '</td><td style="display:none;">' + data[key].helperNid +'</td><td style="display:none;">'+ data[key].presentAddress +'</td><td style="display:none;">' + data[key].parmanentAddress + '</td><td>' + data[key].helperContactNO + '</td><td style="display:none;">' + data[key].helperEmail + '</td><td style="display:none;">' + data[key].helperImage + '</td><td> <a class="btn btn-sm btn-warning" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="glyphicon glyphicon-edit"></span> Edit</a></td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> Delete</a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> View</a></td></tr>';
                }     
                
                                                        
                helperData += '</tbody></table>';
            
                
                $("#divHelperInformation").html(helperData);
                $("#tblHelper").DataTable();
                
                
                
            });
        }


        $( "#addHelper" ).click(function() {

            $("#divShowHelperInformation").hide();
            $("#errorMessage").addClass("hidden");
            $("#divAddHelperInformation" ).show();
            

            
        

  
        });

        $( "#ShowHelper" ).click(function() {

            $("#divAddHelperInformation").hide();
            $( "#divShowHelperInformation" ).show();
  
        });


        
       /* function returnDriberList(){
           return driverInformationCommon;
       }
        */
       populateDataForUpdate = function(helperId){
            
            $("#divShowHelperInformation").hide();
            $("#divAddHelperInformation").show();
            
        
            var data = helperInformationCommon.filter(obj => {
              return obj.id === helperId
            });
            
            //alert(JSON.stringify(data));
            var dateFormat3 = $.datepicker.formatDate('yy-mm-dd', new Date(data[0].licenseExpireDate));
            var dateFormat4 = $.datepicker.formatDate('yy-mm-dd', new Date(data[0].helperDateOfBirth));
            //alert(data[0].id + ": name= "+ data[0].driverName);

           // alert(dateFormat3);

            $("#saveHelper").html("Update");
            
            //$("#driverName").val(data[1].driverName);
            $("#tmpId").val(data[0].id);
            $("#helperName").val(data[0].helperName);
            $("#helperCode").val(data[0].helperCode);
            $("#helperDateOfBirth").val(dateFormat4);
            $("#helperNid").val(data[0].helperNid);
            $("#drivingLicense").val(data[0].drivingLicense);
            ///$("#licenseExpireDate").val(data[0].licenseExpireDate);
            $("#licenseExpireDate").val(dateFormat3);
            $("#helperContact").val(data[0].helperContactNO);
            $("#helperEmail").val(data[0].helperEmail);
            $("#helperPhoto").val(data[0].helperPhoto);
            $("#presentAddress").val(data[0].presentAddress);
            $("#parmanentAddress").val(data[0].parmanentAddress);
            //$("#sdfdsf").val(data[0].driverName);
            
            
            
            
            
        }    


    });//end of ready document
    
    
    
    

     setTimeout(function() {
                $("#successMessage").addClass("hidden");
                $("#errorMessage").addClass("hidden");
                }, 5000);
    


</script>




<div class="col-md-12" id="divShowHelperInformation">
    
    <legend style="padding-left:9.5%;margin-top: 0%;margin-bottom: 1%;">Existing Helper Data</legend>

    <div class="col-md-12" ">
        <div class="col-md-12" style="min-height: 60px;">
                <button id="addHelper" name="addHelper" class="btn btn-success" style="float: right; margin-right: 8%;margin-bottom: 3%;">
                    <span class="glyphicon glyphicon-plus"></span> Add helper Information
                </button>
            </div>
        <div class="col-md-1"></div>
            <div class="col-md-10">
                <div id="divHelperInformation"></div>
            </div>
        </div>
    
    </div>

<div class="col-md-12" id="divAddHelperInformation">
<form >
    <fieldset>

        <div class="col-md-12">
        <div class="col-md-1"></div>
        <div class="col-md-10">

            <button id="ShowHelper" name="ShowHelper" class="btn btn-success" style="float: right;margin-bottom: 3%;"><span class="glyphicon glyphicon-eye-open"></span> View Helper Information</button>

        </div>
        </div>

        <legend style="padding-left:9.5%;margin-top: 0%; margin-bottom: 1%;">Create New Helper Information</legend>
        <div class="col-md-1"></div>
        <div class="col-md-10 custom_shadow" id="divHelperInput">

            <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A; color:#fff;"></div>
            <div class="well well-sm" id="errorMessage" style="background-color:red; color:#fff;"></div>

            <input type="hidden" id="tmpId" name="tmpId" value="0" readonly="readonly">
            <!-- class="hidden" -->
            
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="helperName">Name</label> 
                    <input id="helperName" name="helperName" placeholder="Enter Helper Full Name" class="form-control input-md" type="text">
                </div>

                <div class="form-group col-md-4">
                    <label for="helperCode">Employee Code</label>
                    <input id="helperCode" name="helperCode" placeholder="Enter Employee Code" class="form-control input-md" type="text">     
                </div>

                <div class="form-group col-md-4">
                    <label for="helperDateOfBirth">Date Of Birth</label>
                    <input id="helperDateOfBirth" name="helperDateOfBirth" placeholder="Enter Date Of Birth" class="form-control input-md" type="date">
              </div>



            </div>




           <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="helperNid">NID(*Optional)</label>
                    <input id="helperNid" name="helperNid" placeholder="Enter 17 digit NID" class="form-control input-md" type="text">     
                </div>

                 <div class="form-group col-md-4">
                    <label for="drivingLicense">Driving License(*Optional)</label>
                    <input id="drivingLicense" name="drivingLicense" placeholder="Driving License" class="form-control input-md" type="text">   
                </div>

            
                <div class="form-group col-md-4">
                    <label label" for="licenseExpireDate">License Expire Date(*Optional)</label>
                    <input id="licenseExpireDate" name="licenseExpireDate" placeholder="License Expire Date" class="form-control input-md" type="date">
                </div>

            </div>


            <div class="form-row">

            <div class="form-group col-md-4">
                <label for="helperContact">Contant Number</label>
                <input id="helperContact" name="helperContact" placeholder="Enter Contact No" class="form-control input-md" type="text">
     
            </div>


          
            <div class="form-group col-md-4">
                <label for="helperEmail">Email(*Optional)</label>
                <input id="helperEmail" name="helperEmail" placeholder="Email" class="form-control input-md" type="email">   
            </div>

            <div class="form-group col-md-4">
                <label for="helperPhoto">Photo(Optional)</label>
                <input type="file" class="custom-file-input" id="helperPhoto" name="helperPhoto">
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
                <label class="col-md-4 control-label" for="saveHelper"></label>
                <div class="col-md-7">
                    <button id="saveHelper" name="saveHelper" class="btn btn-primary mb-2">Save</button>
                    <button id="resetHriver" name="resetHriver" class="btn btn-warning" type="reset" value="reset">Reset</button>
                </div>
            </div>
                
       
        </div>

        
        
        </div>
        
    </fieldset>
</form>
</div>
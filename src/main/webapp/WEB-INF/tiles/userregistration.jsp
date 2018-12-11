
<script type="text/javascript">

    $(document).ready(function(){

		viewData();
		
      function validator(){

            var username	= $.trim($("#username").val());

            if(username == ""){
                $("#errorMessage").html("!! Please enter your email address");
                $("#errorMessage").removeClass("hidden");


                $("#successMessage").addClass("hidden");
                return false;
            }

            return true;
        }


        /* Submitting form to controller*/
        $("#submit").click(function(event) {

            event.preventDefault();

            if (validator()){

                var data = {};

                data["userName"] = $("#username").val();
                data["password"] = $("#password").val();

                alert(JSON.stringify(data));
                //return false;
                $.ajax({
                    type: "POST",
                    url: "saveUser",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {
                    	viewData();
                        alert("User Created Successfully");
                       
                        //$("#submit").prop("disabled", false);
                        //$("#successMessage").html(successData);
                        //$("#successMessage").removeClass("hidden");
                        //$("#errorMessage").addClass("hidden");

                    },
                    error: function (error) {
                        /* $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#submit").prop("disabled", false); */
                       alert(JSON.stringify(error));
                    }
                });

            } // End of validation
        }); // End of form submission


    }); // End of document ready()

    function viewData(){
        $.post("showAllUser", function(data){
            
            var dataTable = '<table class="table"><tr><th>ID</th><th>Name</th><th>Roles</th><th>Enabled</th></tr>';

            for(var key in data){
                dataTable += '<tr><td>' + data[key].id + '</td><td>' + data[key].userName + '</td><td>' + JSON.stringify(data[key].roles) + '</td><td>' + data[key].enabled + '</td></tr>';
            }

            dataTable += '</table>';

            $("#divDataTable").html(dataTable); 
        });
    } 

    function funSearchEmployee(){



        $.post("showUserByName", {userName: $("#empSearch").val()}, function(data){

            $("#divDataTable").html("");
            var dataTable = '<table class="table"><tr><th>ID</th><th>Name</th><th>Roles</th><th>Enabled</th></tr>';



            //dataTable += '<tr><td>' + data["id"] + '</td><td>' + data["name"] + '</td><td>' + data["address"] + '</td></tr>';
            dataTable += '<tr><td>' + data["id"] + '</td><td>' + data["userName"] + '</td><td>' + JSON.stringify(data["roles"]) + '</td><td>' + data["enabled"] + '</td></tr>';
            

            dataTable += '</table>';

            $("#divDataTable").html(dataTable);
        })
    }
</script>

<div class="bootstrap-iso">
    <div class="container-fluid">
        <div class="row">

            <div class="col-xs-12 col-md-6">
                <fieldset>
                    <legend class="h4" style="margin:30px 0 20px 0;" id="selectedEmployeeTitle">Existing Data</legend>

                </fieldset>
                <div class="row alert alert-info" style="margin:20px 0 20px 0;">
                    <div class="col-lg-4" align="right"><h4>Search</h4></div>
                    <div class="col-lg-8">
                        <div class="input-group">
                            <input type="text" id="empSearch" class="form-control" placeholder="Enter Employee Id">
                            <span class="input-group-btn">
				        	<button class="btn btn-info" type="button" onclick="funSearchEmployee()">Go!</button>
				      	</span>
                        </div>
                    </div>
                </div>
                <div id="divDataTable">

                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6">
                <form id="frmEmployee" class="well">
                    <fieldset>
                        <legend>User Registration</legend>

                        <div id="successMessage" align="center" class="hidden alert alert-success"></div>
                        <div id="errorMessage" align="center" class="hidden alert alert-danger"></div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="control-label requiredField" for="username">Email</label>
                            <div class="form-group">
                                <input id="username" name="username" placeholder="Enter your email" class="form-control" type="text" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label requiredField" for="password">Password</label>
                            <div class="form-group">
                                <input id="password" name="password" placeholder="Enter Password" class="form-control" type="password" />
                            </div>
                        </div>

                        <!-- Button -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="submit"></label>
                            <div class="col-md-6">
                                <button id="btnClear" type="reset" name="btnClear" value="Reset" class="btn btn-warning">Reset</button>
                                <button id="submit" name="submit" class="btn btn-primary">Create New User</button>
                            </div>
                        </div>


                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

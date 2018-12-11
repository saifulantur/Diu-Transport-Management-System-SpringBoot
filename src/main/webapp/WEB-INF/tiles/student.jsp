<script type="text/javascript">
	$(document).ready(function() {

		funViewStudentData()

		function validator() {

			var id = $.trim($("#studenId").val());
			var name = $.trim($("#studentName").val());
			var age = $.trim($("#studentAge").val());

			if (id == "") {

				$("#errorMessage").html("Invalid..!");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");

				return false;
			}

			else if (name == "") {

				$("#errorMessage").html("Invalid..!");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");

				return false;
			}

			else if (age == "") {

				$("#errorMessage").html("Invalid..!");
				$("#errorMessage").removeClass("hidden");
				$("#successMessage").addClass("hidden");

				return false;
			}

			return true;
		}

		$("#saveStudent").click(function(event) {

			event.preventDefault();

			if (validator()) {

				var student = {};

				student["id"] = $.trim($("#studenId").val());
				student["name"] = $.trim($("#studentName").val());
				student["age"] = $.trim($("#studentAge").val());

				$.ajax({

					type : "POST",
					url : "saveStudent",
					data : JSON.stringify(student),
					contentType : "application/json; charset=utf-8",
					success : function(successData) {
						$("#successMessage").html(successData);
						$("#successMessage").removeClass("hidden");
						$("#errorMessage").addClass("hidden");

						funViewStudentData()
					},

					error : function(error) {
						$("#errorMessage").html("Error: Record Not Saved");
						$("#errorMessage").removeClass("hidden");
						$("#successMessage").addClass("hidden");

					}

				});

				
			}

		});//end of submission form
		
		function funViewStudentData(){
			$.post("viewAllStudent",function(data){
				
				var studentData = '<table class="table table-striped">' + '<tr><th>ID</th><th>Name</th><th>Age</th><th></th><th></th><th></th></tr>';
				
				for(var key in data){
					
					studentData += '<tr><td>' + data[key].id + '</td><td>' + data[key].name + '</td><td>' + data[key].age + '</td><td><a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> </a></td><td> <a href="#" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-edit"></span> </a></td><td> <a href="#" class="btn btn-sm btn-success"><span class="glyphicon glyphicon-eye-open"></span> </a></td></tr>';
					//id,name,age is the variable which we used in our student.java class..not in database
				}
				
				studentData += '</table>';
				
				$("#divStudent").html(studentData);
				
			});
		}///end of showing form
		

	}); //end of document ready function
	
	//start of search function
	function funSearchStudent(){
		 alert("it's works")
		
           $.post("showStudentById",{id: $("#studentSearch").val()},function(data){
        	  
        
            $("#divStudentDataTable").html("");
            var StudentDataTable = '<table class="table"><tr><th>ID</th><th>Name</th><th>Age</th></tr>';
           
            StudentDataTable += '<tr><td>' + data["id"] + '</td><td>' + data["name"] +'</td><td>' + data["age"] + '</td></tr>';
			
            StudentDataTable += '</table>';
			
            $("#divStudentDataTable").html(StudentDataTable);
        });
    }//end of search function
	
	
	
	
	
</script>


<div class="col-md-6">

	<legend>Existing Student Information</legend>
	
	<!-- search data start -->
	<div class="row alert alert-info" style="margin: 20px 0 20px 0;">
		<div class="col-lg-4" align="right">
			<!--  <h4>Search</h4>-->
		</div>
		<div class="col-lg-12">
			<div class="input-group">
				<input type="text" id="studentSearch" class="form-control"
					placeholder="Enter Student Id"> <span
					class="input-group-btn">
					<button class="btn btn-info" type="button" onclick="funSearchStudent()"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;<!-- Search --></button>
				</span>
			</div>
		</div>
	</div>
	<div id="divStudentDataTable">
	
	
	
	</div>
	<!-- search data end -->
	
	<div id="divStudent" class="col-md-12"></div>

</div>

<div class="col-md-6">
	<form class="form-horizontal">
		<fieldset>

			<!-- Form Name -->
			<legend>Create New Student Information</legend>

			<div id="successMessage" class="hidden"></div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="studenId">ID</label>
				<div class="col-md-8">
					<input id="studenId" name="studenId" placeholder="Enter Your ID"
						class="form-control input-md" type="text">
					<div id="errorMessage" class="hidden"></div>

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="studentName">Name</label>
				<div class="col-md-8">
					<input id="studentName" name="studentName"
						placeholder="Enter Your Name" class="form-control input-md"
						type="text">
					<div id="errorMessage" class="hidden"></div>

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-2 control-label" for="studentAge">Age</label>
				<div class="col-md-8">
					<input id="studentAge" name="studentAge"
						placeholder="Enter Your Age" class="form-control input-md"
						type="text">
					<div id="errorMessage" class="hidden"></div>

				</div>
			</div>

			<!-- Button (Double) -->
			<div class="form-group">
				<label class="col-md-2 control-label" for="button1id"></label>
				<div class="col-md-8">
					<button id="saveStudent" name="saveStudent" class="btn btn-success">Save</button>
					<button id="resetStudent" name="resetStudent"
						class="btn btn-warning">Reset</button>
				</div>
			</div>

		</fieldset>
	</form>
</div>

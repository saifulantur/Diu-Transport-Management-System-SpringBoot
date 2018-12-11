<script type="text/javascript">

    var requisitionDataForUpdate;

    var allTransportType = [];
    var allUser = [];


	$(document).ready(function(){



        var requisitionData = [];

        getAllUser();
        getAllTransportType();
        
        funViewTransportRequisition1();
        funViewTransportRequisitionRejected();
		funViewTransportRequisition();
        //funViewTransportRequisition1();
        //alert("Tanvir: "+JSON.stringify(requisitionApprovalData));
        
        $("#divRequisitionPendingList").show();
        $("#divRequisitionApprovedList").hide();
        $("#divRequisitionRejectedList").hide();


		function funViewTransportRequisition(){

            
        	
        	$.post("viewTransportRequisition",function(data){
        		/*table table-striped*/
        		var requisitionApprovalData = '<table id="tblTransportRequisition" class="table table-bordered table-hover">' + '<thead><tr><th style="display:none;">ID</th><th>Transport Type</th><th>Travel Date</th><th>Requested By</th><th>Purpose</th><th>Approve</th><th>Reject</th></tr></thead><tbody>';


    			                    
    			for(var key in data){

                    var requisitionApprovalObject = {"id":[],"fkRequestedBy":[],"travelDate":[],"fkTransportType":[],"purpose":[],"status":[]};

                    requisitionApprovalObject["id"] = data[key].id;
                    requisitionApprovalObject["fkRequestedBy"] = data[key].fkRequestedBy;
                    requisitionApprovalObject["travelDate"] = data[key].travelDate;
                    requisitionApprovalObject["fkTransportType"] = data[key].fkTransportType;
                    requisitionApprovalObject["purpose"] = data[key].purpose;
                    requisitionApprovalObject["status"] = data[key].status;
                    requisitionApprovalObject["comments"] = data[key].comments;

                    requisitionData.push(requisitionApprovalObject);
                   //alert("Object  : "+JSON.stringify(requisitionData));


                    if(data[key].status == "P"){

                    var oneUser = allUser.filter(object => {

                        return object.id === data[key].fkRequestedBy

                        }); 
                    //alert("One user Check: "+JSON.stringify(oneUser));//error here

    				    //foreign key id to name  mapping
                    var singleTransportType = allTransportType.filter(object => {

                        return object.id === data[key].fkTransportType

                        });//end of foreign key id to name  mapping
    				
                    //foreign key id to name  mapping
                    /*var singleUser = allUserData.filter(object => {

                        return object.id === data[key].fkRequestedBy

                        });*///end of foreign key id to name  mapping
    				
    				requisitionApprovalData += '<tr><td style="display:none;">' +data[key].id + '</td><td>' + singleTransportType[0].typeTitle + '</td><td>' + data[key].travelDate + '</td><td>'+ oneUser[0].userName + '</td><td>'+ data[key].purpose +'</td><td> <a href="#" class="btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="requisitionDataForUpdate(' + data[key].id + ')" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Approve &nbsp;<span class="glyphicon glyphicon-arrow-right"></span></a></td><td> <a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> Reject</a></td></tr>';
    			}//end of if condition
                
                }                 
						    			
    			requisitionApprovalData += '</tbody></table>';
    		
        		
        		$("#transportRequisitionPending").html(requisitionApprovalData);
        		$("#tblTransportRequisition").DataTable();
        		
        		
        	});
        }//end of viewing data


        ///////////////////////////

        function funViewTransportRequisition1(){

            
            
            $.post("viewTransportRequisition",function(data){
                /*table table-striped*/
                var requisitionApprovalData1 = '<table id="tblTransportRequisitionApp" class="table table-bordered table-hover">' + '<thead><tr><th style="display:none;">ID</th><th>Transport Type</th><th>Travel Date</th><th>Requested By</th><th>Purpose</th><th>Approve</th><th>Reject</th></tr></thead><tbody>';
                                    
                for(var key in data){

                    var requisitionApprovalObject = {"id":[],"fkRequestedBy":[],"travelDate":[],"fkTransportType":[],"purpose":[],"status":[]};

                    requisitionApprovalObject["id"] = data[key].id;
                    requisitionApprovalObject["fkRequestedBy"] = data[key].fkRequestedBy;
                    requisitionApprovalObject["travelDate"] = data[key].travelDate;
                    requisitionApprovalObject["fkTransportType"] = data[key].fkTransportType;
                    requisitionApprovalObject["purpose"] = data[key].purpose;
                    requisitionApprovalObject["status"] = data[key].status;
                    requisitionApprovalObject["comments"] = data[key].comments;

                    requisitionData.push(requisitionApprovalObject);
                   //alert("Object  : "+JSON.stringify(requisitionData));


                    if(data[key].status == "A"){

                    var oneUser = allUser.filter(object => {

                        return object.id === data[key].fkRequestedBy

                        }); 
                    //alert("One user Check: "+JSON.stringify(oneUser));//error here

                        //foreign key id to name  mapping
                    var singleTransportType = allTransportType.filter(object => {

                        return object.id === data[key].fkTransportType

                        });//end of foreign key id to name  mapping
                    
                    
                    requisitionApprovalData1 += '<tr><td style="display:none;">'  + data[key].id + '</td><td>'+ singleTransportType[0].typeTitle + '</td><td>' + data[key].travelDate + '</td><td>'+ oneUser[0].userName + '</td><td>'+ data[key].purpose +'</td><td> <a href="#" class="btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="requisitionDataForUpdate(' + data[key].id + ')" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Back to Pending &nbsp;</a></td><td> <a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> Reject</a></td></tr>';
                }//end of if condition
                
                }                 
                                        
                requisitionApprovalData1 += '</tbody></table>';
            
                
                $("#transportRequisitionApproval").html(requisitionApprovalData1);
                $("#tblTransportRequisitionApp").DataTable();
                
                
            });
        }//end of viewing data


         ///////////////////////////

        function funViewTransportRequisitionRejected(){

            
            
            $.post("viewTransportRequisition",function(data){
                /*table table-striped*/
                var requisitionRejectedData = '<table id="tblTransportRequisitionRej" class="table table-bordered table-hover">' + '<thead><tr><th style="display:none;">ID</th><th>Transport Type</th><th>Travel Date</th><th>Requested By</th><th>Purpose</th><th>Approve</th><th>Reject</th></tr></thead><tbody>';
                                    
                for(var key in data){

                    

                    var requisitionApprovalObject = {"id":[],"fkRequestedBy":[],"travelDate":[],"fkTransportType":[],"purpose":[],"status":[]};

                    requisitionApprovalObject["id"] = data[key].id;
                    requisitionApprovalObject["fkRequestedBy"] = data[key].fkRequestedBy;
                    requisitionApprovalObject["travelDate"] = data[key].travelDate;
                    requisitionApprovalObject["fkTransportType"] = data[key].fkTransportType;
                    requisitionApprovalObject["purpose"] = data[key].purpose;
                    requisitionApprovalObject["status"] = data[key].status;
                    requisitionApprovalObject["comments"] = data[key].comments;

                    requisitionData.push(requisitionApprovalObject);
                   //alert("Object  : "+JSON.stringify(requisitionData));


                    if(data[key].status == "R"){

                    var oneUser = allUser.filter(object => {

                        return object.id === data[key].fkRequestedBy

                        }); 
                    //alert("One user Check: "+JSON.stringify(oneUser));//error here

                        //foreign key id to name  mapping
                    var singleTransportType = allTransportType.filter(object => {

                        return object.id === data[key].fkTransportType

                        });//end of foreign key id to name  mapping
                    
                    requisitionRejectedData += '<tr><td style="display:none;">'  + data[key].id + '</td><td>'+ singleTransportType[0].typeTitle + '</td><td>' + data[key].travelDate + '</td><td>'+ oneUser[0].userName + '</td><td>'+ data[key].purpose +'</td><td> <a href="#" class="btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="requisitionDataForUpdate(' + data[key].id + ')" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Pending &nbsp;<span class="glyphicon glyphicon-arrow-right"></span></a></td><td> <a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove"></span> Reject</a></td></tr>';
                }//end of if condition
                
                }                 
                                        
                requisitionRejectedData += '</tbody></table>';
            
                
                $("#transportRequisitionRejected").html(requisitionRejectedData);
                $("#tblTransportRequisitionRej").DataTable();
                
                
            });
        }//end of viewing data

///////////////////////////////////////////////////////////////////////////////////


        /* Submitting form to controller*/
        $("#btnApprove").click(function(event) {

            event.preventDefault();

            //if (validator()){

                var requisitionApproval = {};

                
                requisitionApproval["tmpId"] = $.trim($("#tmpId").val());//for update data
                //requisitionApproval["travelDate"] = $.trim($("#travelDate").val());
                //requisitionApproval["fkTransportType"] = $.trim($("#fkTransportType").val());
                //requisitionApproval["purpose"] = $.trim($("#purpose").val());
                requisitionApproval["status"] = $.trim($("#status").val());
                requisitionApproval["comments"] = $.trim($("#message-text").val());
               

                //alert(JSON.stringify(brands)); 
                
                //return false;
                $.ajax({
                    type: "POST",
                    url: "update-requisition",
                    data: JSON.stringify(requisitionApproval),
                    contentType: "application/json; charset=utf-8",
                    success: function (successData) {

                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("hidden");
                        $("#errorMessage").addClass("hidden");
                        
                        funViewTransportRequisition();
                        funViewTransportRequisition1();
                        funViewTransportRequisitionRejected();
                        $("#tmpId").val(0);
                        

                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("hidden");
                        $("#successMessage").addClass("hidden");
                        /*$("#submit").prop("disabled", false); */
                       alert(JSON.stringify(error));
                    }
                });

            //} // End of validation
        }); // End of form submission



        requisitionDataForUpdate = function(requisitionId){
            var data = requisitionData.filter(obj => {
              return obj.id === requisitionId
            });
            //alert("final"+JSON.stringify(data));

            //var requisitionApproveTable = '<table> <tr><th>Name: </th><td>data[0].id</td></tr>    </table>';          
            //$("divRequisitionDialog").html(requisitionApproveTable);

            $("#tmpId").val(data[0].id);
            $("#travelDate").val(data[0].travelDate);
            $("#fkTransportType").val(data[0].fkTransportType);
            $("#purpose").val(data[0].purpose);
            $("#status").val(data[0].status);
            $("#message-text").val(data[0].comments);







        }// end of requisitionDataForUpdate




        ///show and hide div by jquery

        $( "#btnPendingList" ).click(function() {

            //$("#btnPendingList").addClass('activated');

            $("#divRequisitionPendingList").show();
            $( "#divRequisitionApprovedList").hide();
            $( "#divRequisitionRejectedList").hide();

            funViewTransportRequisition1();
            funViewTransportRequisitionRejected();
            funViewTransportRequisition();


  
        });

        $( "#btnApprovedList" ).click(function() {

            $("#divRequisitionPendingList").hide();
            $( "#divRequisitionApprovedList").show();
            $( "#divRequisitionRejectedList").hide();

            funViewTransportRequisition1();
            funViewTransportRequisitionRejected();
            funViewTransportRequisition();
  
        });

        $( "#btnRejectedList" ).click(function() {

            $("#divRequisitionPendingList").hide();
            $( "#divRequisitionApprovedList").hide();
            $( "#divRequisitionRejectedList").show();

            funViewTransportRequisitionRejected();
            funViewTransportRequisition1();
            funViewTransportRequisition();
  
        });



        //end of show and hide div of jquery



	});//end of ready document


  //pick all data from database for id to name mapping  
  function getAllUser(){
        $.get("showAllUser",function(data){
            //alert(JSON.stringify(loction));
            allUser = data;
            
        });
        
    }

  function getAllTransportType(){
    $.post("viewAllTransportType",function(data){

        allTransportType = data;
    });
  }//end of pick all data from database for id to name mapping 

</script>

<!-- 
heading
 -->

<div class="col-md-12" id="divRequisitionHeading">
<div class="col-md-1"></div>
<div class="col-md-10">
    <legend>Transport Requisitions Approval</legend>
    <div style="margin-bottom: 2%;">
    <a href="#" class="btn btn-info" id ="btnPendingList"> Approval Waiting List</a>
    <a href="#" class="btn btn-info" id ="btnApprovedList"> Approved List</a>
    <a href="#" class="btn btn-info" id ="btnRejectedList"> Approval Rejected List</a>
    <legend></legend>
    </div>
</div>
</div>
<!-- end of heading -->


<!-- pending list div -->
<div class="col-md-12" id="divRequisitionPendingList">
<div class="col-md-1"></div>
<div class="col-md-10">
    <legend class="custom_shadow">Pending List For Approval</legend>
	<div id="transportRequisitionPending"></div>
</div>
</div>
<!-- end of pending list div -->

<!-- Approved  list div -->
<div class="col-md-12" id="divRequisitionApprovedList">
<div class="col-md-1"></div>
<div class="col-md-10">
    <legend>Approved List</legend>
    <div id="transportRequisitionApproval"></div>
</div>
</div>
<!-- end of approved list div -->

<!-- Reject list div -->
<div class="col-md-12" id="divRequisitionRejectedList">
<div class="col-md-1"></div>
<div class="col-md-10">
    <legend>Rejected List</legend>
    <div id="transportRequisitionRejected"></div>
</div>
</div>
<!-- end of Reject list div -->

<!-- ----------------------------------------------------------------------------------------------- -->
<!-- =============================================================================================== -->

<!-- dialog box -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Requision Approval</h4>
      </div>
      <div class="modal-body">
        



 <!-- Hidden div for update -->
<div class="col-md-12">
<form class="form-horizontal">
    <fieldset>

        <!-- Form Name -->
        <legend>Update</legend>

        <input type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">
        <input type="text" id="tmpStatus" name="tmpStatus"readonly="readonly">
        
        <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A;color:#fff;"></div>
        <div class="well well-sm" id="errorMessage"style="background-color:red;color:#fff;"></div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="travelDate">Travel Date</label>
            <div class="col-md-6">
                <input id="travelDate" name="travelDate" placeholder="Travel Date"
                    class="form-control input-md" type="text">

            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="fkTransportType">Transport Type</label>
            <div class="col-md-6">
                <input type="fkTransportType" id="fkTransportType" name="fkTransportType">
            </div>
        </div>

        <!-- Textarea -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="purpose">Purpose</label>
            <div class="col-md-6">
                <textarea class="form-control" id="purpose" name="purpose"></textarea>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="status">Status</label>
            <div class="col-md-6">
                <input id="status" name="status" placeholder="Status"
                    class="form-control input-md" type="text">

            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="comment">Comments</label>
            <div class="col-md-6">
                <textarea class="form-control" id="comment" name="comment"></textarea>
            </div>
        </div>
    </fieldset>
</form>
</div>
<!-- end of Hidden div for update -->




        <form>
          <div class="form-group">
            <label for="message-text" class="control-label">Comment(*Optional):</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <!-- <h5>Are You Sure to Approve This?</h5> -->
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        <button type="button" id="btnApprove" data-dismiss="modal" class="btn btn-primary">Approve</button>
      </div>
    </div>
  </div>
</div>
<!-- end of dialog box-->



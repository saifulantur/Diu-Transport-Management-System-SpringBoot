<script>
	$(document).ready(function(){
		
		$("#viewReport").click(function(){
			funGetAllBrandsWithModel();
		});
		
		
	});
	
	function funGetAllBrandsWithModel(){
		$.get("view-all-brands", function(data){
			
			var reportData = '';
			for(var key in data){
				reportData += '<tr><td style="border: 1px solid #999999;">' + data[key].brandName + '</td><td style="border: 1px solid #999999;">' + data[key].model + '</td></tr>';
			}
			
			$("#tblReport").append(reportData);
		});
	} 
	

</script>


<div>
	<input type="button" id="viewReport" name="viewReport" value="Show Report"> 
</div>
<div class="col-md-8">
	<h1>All Brands With model</h1>
	<table class="table table-bordered table-hover" id="tblReport" style=" width:100%; border: 1px solid #999999;">
		<tr ><th style="border: dotted #999999; ">Brand Name</th><th style="border: dotted #999999;">Models</th></tr>
		
		
	</table>
</div>


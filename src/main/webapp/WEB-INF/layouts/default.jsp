<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title><tiles:insertAttribute name="title" /></title>

   
    <!-- Bootstrap core CSS -->    
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- <link href="/lib/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"> -->

    <!-- Custom styles for this template -->
    <link href="/css/custom.style.css" rel="stylesheet">
    <link href="/css/software-main.css" rel="stylesheet">
    <link href="/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <!-- <link href="/css/jquery.dataTables.min.css" rel="stylesheet"> --><!-- //last commented -->
    <link href="/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="/css/easy-autocomplete.min.css" rel="stylesheet">
    <link href="/css/easy-autocomplete.themes.min.css" rel="stylesheet">
    <link href="/css/jquery-ui.min.css" rel="stylesheet">
    <link href="/css/toastr.css" rel="stylesheet">
    <link href="/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="/css/jquery.ui.timepicker.css" rel="stylesheet">
    <link href="/css/custom.footer.css" rel="stylesheet">
    <!-- <link href="/css/custom.table.css" rel="stylesheet"> -->
    <!-- <link href="/css/custom-css/jquery-confirm.min.css" rel="stylesheet"> -->
    <!-- <link href="/css/font-awesome.min.css" rel="stylesheet"> -->
          
    
    <script src="/js/jquery-3.1.1.min.js"></script>
    <!-- <script src="/js/jquery-3.3.1.js"></script> -->
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/jquery.dataTables.min.js"></script>  
    <!-- <script src="/js/dataTables.bootstrap4.min.js"></script>    -->
    <script src="/js/dataTables.bootstrap.min.js"></script>
    <script src="/js/myCustomJsFunctions.js"></script>
    <script src="/js/bootstrap-select.min.js"></script>
    <script src="/js/jquery.easy-autocomplete.min.js"></script>
    <script src="/js/jquery.form.min.js"></script>
    <script src="/js/canvasjs.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>    
    <script src="/js/jspdf.min.js"></script>
    <script src="/js/from_html.js"></script>
    <script src="/js/split_text_to_size.js"></script>
    <script src="/js/standard_fonts_metrics.js"></script>
    <script src="/js/canvas.js"></script>
    <script src="/js/xdate.js"></script>
    <script src="/js/moment.js"></script>
    <script src="/js/toastr.js"></script>
    <script src="/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/js/jquery.ui.timepicker.js"></script>
    <!-- <script src="/js/custom-js/jquery-confirm.min.js"></script> -->
	<script src="/js/custom-js/time-format-converter.js"></script>
	
</head>
<body>

	<tiles:insertAttribute name="header" />
	<br/>
	<tiles:insertAttribute name="content" />
	<br/>
	<tiles:insertAttribute name="footer" />
    
</body>
</html>
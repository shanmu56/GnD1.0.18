<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html
	class=" js backgroundsize cssanimations csstransitions pointerevents"
	lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<title>G & D</title>
<link href="<c:url value='/resources/css/blazer.css'/>"
	media="screen, projection" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/css/style.css'/>"
	media="screen, projection" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="<c:url value='/resources/js/modernizr-2.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/blazer.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery-ui.css'/>">
<script src="<c:url value='/resources/js/jquery-1.10.2.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/resources/js/jquery.tabletojson.js'/>"></script>

<script src="<c:url value='/resources/js/jquery.alertable.js'/>"></script>
<script src="<c:url value='/resources/js/velocity.min.js'/>"></script>
<script src="<c:url value='/resources/js/velocity.ui.min.js'/>"></script>
<link href="<c:url value='/resources/css/jquery.alertable.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/infragistics.theme.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/infragistics.css'/>"
	rel="stylesheet" />


<!-- Ignite UI Required Combined JavaScript Files -->
<script src="<c:url value='/resources/js/infragistics.core.js'/>"></script>
<script src="<c:url value='/resources/js/infragistics.lob.js'/>"></script>

</head>



<body>
	<%! public static final int Card_Delievered = 21; %>
	<style>
#checkboxSelectCombo, #checkboxSelectCombo:hover {
	/*background-color: #f7f8f8 !important;*/
	border: 1px solid #9db5cd !important;
}

.ui-igcombo-buttonicon, .ui-igcombo-clearicon {
	margin-left: 3px;
	margin-top: -7px;
	position: absolute;
	top: 50%;
}

.ui-icon-triangle-1-s {
	background-position: 0;
}

.ui-icon {
	background-position: 0;
	height: 16px;
	width: 16px;
}

#tableid {
	width: 100%;
	max-width: 100%;
	overflow-x: scroll;
	overflow-y: scroll;
}

.ui-igcombo-clear {
	display: none !important;
}
</style>


	<div class="page-header" style="position: fixed width:100%">
		<div class="page-header-wrapper container">
			<div class="main-logo">Giesecke &amp; Devrient</div>

			<div class="tab-menu dark">
				 <ul>
                    	<li id="icons" ><a href="<c:url value='/loginuser/home'/>">Home</a></li>
                		
                    	<li id="icons"><a href="<c:url value='/search/searchcard'/>">Search</a></li>
                    	
                    	<c:if test='<%=request.isUserInRole("ROLE_HELPDESK")||request.isUserInRole("ROLE_ADMIN")%>' >
						  <li id="icons"><a href="<c:url value='/master/masterdb'/>">Master DB</a></li>
						  
						<!-- <li id="icons"><a href="<c:url value='/master/email'/>">Email</a></li>-->
					  </c:if>  
					  
					  <c:if test='<%=request.isUserInRole("ROLE_WAREHOUSE")||request.isUserInRole("ROLE_HELPDESK")||request.isUserInRole("ROLE_ADMIN")%>' >
						  <li id="prototype" ><a href="/GnD/shopfloor/misImoprt">MIS Import</a>
					  </c:if>
					  
					   <c:if test='<%=request.isUserInRole("ROLE_SHOPFLOOR")||request.isUserInRole("ROLE_ADMIN")%>' >
						  <li id="prototype" ><a href="/GnD/shopfloor/home" method='POST'>Shop floor</a></li>
					    </c:if>  
                    	
                    <c:if test='<%=request.isUserInRole("ROLE_ADMIN")%>' >
                       
                        
<!--                         <li id="styleguide"><a href="#">I/O Config</a></li> -->
<!--                         <li id="screens"><a href="#">Time-Out Config</a></li> -->
						<li id="prototype"><a href="/GnD/notification/notificationview">Notifications</a>
				<!-- <li id="prototype"><a href="/GnD/shopfloor/home">Shop floor</a></li> -->		
						<li id="prototype"><a href="/GnD/signUp/SignUp">Add User</a></li>
<%-- 						 <li id="icons"><a href="<c:url value='/emailcont/editemailTable'/>">Email</a></li> --%>
                                          
					</c:if>					  
					
					   <c:if test='<%=request.isUserInRole("ROLE_WAREHOUSE")||request.isUserInRole("ROLE_ADMIN")%>' >
						  <li id="prototype"  class="selected"><a href="/GnD/shopfloor/warehouse">Warehouse</a></li>
						   </c:if> 
						   
					   <c:if test='<%=request.isUserInRole("ROLE_RTO")||request.isUserInRole("ROLE_ADMIN")%>' >
						  <li id="prototype"  ><a href="/GnD/shopfloor/rto">RTO</a></li>
					  </c:if>
					   <c:if test='<%=request.isUserInRole("ROLE_DATAGEN")||request.isUserInRole("ROLE_ADMIN")%>' >
                    	<li id="icons" ><a href="<c:url value='/qcprocess'/>">QC</a></li>
					</c:if>
					   	<li id="prototype"><a href="/GnD/search/getReport">Reports</a></li>
					      <li id="prototype"><a href="javascript:formSubmit()"> Logout</a>
                    </ul>
			</div>
		</div>
	</div>
	<div class="main" style="">
		<div class="container main-conten">
			<div class="left-content">
				<div class="demo-left-nav" id="left-nav">
					<div class="navigation">
						<ul>
						<c:if test='<%=request.isUserInRole("ROLE_WAREHOUSE")||request.isUserInRole("ROLE_ADMIN")%>' >
										<li id="prototype" class="selected"><a href="/GnD/shopfloor/carddeliverywarehouse">card Delivery</a></li>
										<!--<li id="prototype"><a href="/GnD/shopfloor/cardreturned">card Returned</a></li>-->
										<li id="prototype"><a href="/GnD/shopfloor/cardredispatchwarehouse">card Redispatch</a></li>
<!-- 										<li id="prototype"><a href="/GnD/shopfloor/carddestroy">Card Destroy</a></li> -->
										<li id="prototype"><a href="/GnD/shopfloor/carddeliverbyAWBwarehouse">Card Delivery By AWB</a></li>
<!-- 										<!--<li id="icons"><a href="<c:url value='/master/masterdb'/>">Master DB</a></li>--> 
<!-- 										<li id="prototype"><a href="/GnD/shopfloor/changeAWB">Change AWB</a></li> -->
										
									</c:if>
												</ul>
					</div>
				</div>
			</div>
			 <div class="right-content" >
			 <audio id="audioid" style="display:none;" controls >
 					   		<source src="<c:url value='/resources/audio/failure.mp3'/>" type="audio/mpeg"></source>
  						</audio>
			 
                        <h2 class="blue-text">Card Delivery</h2>
                        <form id="rtocardId" name="carddispatch" action="/GnD/shopfloor/test"  method="post">
                            <div class="row right-con">
                                <div class="col-md-2">
                                    <span class="blue-text">RSN Value</span>
                                    <div class="select-menu select-menu-native select-menu-light">
                                        <input id="rsn" name="text" type="number" class="text-field rsn" autofocus  autocomplete="off" />
										<input id="decisionid" type="hidden" name="decision" value="<%=Card_Delievered%>"/>
										<input type="submit" id="rsnbutton"	value="submit"    class="btn btn-only-img btn-only-img1 btn-s"/>
					</div>
				</div>

			</div>
			
			</form>
			 <div id="wait" style="display:none;width:69px;height:65px;position:absolute;top:50%;left:50%;padding:2px;"><img src='/GnD/resources/img/loading.gif' width="64" height="64" /><br>Loading..</div>
			 <div id="savebutton" class="col-md-2">
             </div>
			<p id="count"></p>
			<table id="rtoscantable" class="table">
		
			</table>
			 <div class="clear"></div>

			</div>
			<c:url value="/j_spring_security_logout" var="logoutUrl" />
						<form action="${logoutUrl}" method="post" id="logoutForm">
							<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
						</form>
		</div>
		<div class="clear"></div>
		<br />
		<div id="footer" class="page-footer">
			<div class="container">
				<div class="footer-columns">
					<div class="footer-left-column">
						<div class="footer-version">
							<strong>Web Tracking Tool</strong> Version 1.0.18
						</div>
						<ul class="footer-links">
							<li><a href="#">Contact</a></li>
							<li><a href="#">Site Terms</a></li>
						</ul>
					</div>
					<div class="footer-right-column">
						<div class="footer-logo"></div>
					</div>
				</div>
			</div>
			
		</div>
		<script>
		var successCount = 0;
		function formSubmit() {
			document.getElementById("logoutForm").submit();
	  }
		var localproducts = [];
	    var frmrto = $('#rtocardId');	    
	    frmrto.submit(function (ev) {
	    	if($('#rsn').val().length === 0){
	    		$.alertable.alert("Field Should not be empty", {
             		  show: function() {
             		    $(this.overlay).velocity('transition.fadeIn');        
             		    $(this.modal).velocity('transition.flipBounceYIn');
             		  },
             		  hide: function() {
             		    $(this.overlay).velocity('transition.fadeOut');
             		    $(this.modal).velocity('transition.perspectiveUpOut');
             		  } 
             		}); 
	    	}else{
            $.ajax({
                url: frmrto.attr('action') ,
                 data: frmrto.serialize(),
                 type:'post',
                 success: function (data) { 
                	 $('#rsn').val('');
                	 if(data.boolRes){
                		 localproducts.push( {'rsn' : data.rsn,
 				 			'cardAWB' : data.cardAWB,
 				 			'shortCode' : data.shortCode,
 				 			'fileName' : data.fileName,
 				 			'information' : data.information
 		 					});
					     var options = '<thead><tr><th>rsn</th><th>cardAWB</th><th>shortCode</th><th>fileName</th><th>information</th></tr></thead>';
                		 successCount+=1;
                		 $('#count').html("Count="+successCount);
                		 options += '<tr><td>' + data.rsn + '</td><td>'+ data.cardAWB + '</td><td>'+ data.shortCode + '</td><td>'+ data.fileName + '</td><td>'+ data.information + '</td></tr>';
                		 $('#rtoscantable').html(options);
                		 $('#rtoscantable').find('tbody').each(function(){
               			    var list = $(this).children('tr');
               			    $(this).html(list.get().reverse())
               			})
                		 $('#savebutton').html('<button id=savefile class="btn btn-l btn-blue ">save to file</button>');
                	 }else{
                		 var declinePerformance = $("#audioid")[0];
                		 declinePerformance.play();
                			$.alertable.alert("card is not in state to Delivery", {
                       		  show: function() {
                       		    $(this.overlay).velocity('transition.fadeIn');        
                       		    $(this.modal).velocity('transition.flipBounceYIn');
                       		  },
                       		  hide: function() {
                       		    $(this.overlay).velocity('transition.fadeOut');
                       		    $(this.modal).velocity('transition.perspectiveUpOut');
                       		  } 
                       		}); 
                	 }               	
                	 
                },
            	error: function(){						
				alert('Error while request..');
			} 
            });
	    	}
            ev.preventDefault();
        });
	    $("#savebutton").click(function() {
	  		  var filepath='';
	 			var r = confirm("Click OK to download the file");
	  			 if(r==true){
	  			 $.ajax({
	  				
	  				 contentType: 'application/json; charset=utf-8',
	  				 dataType: 'json',
	  				 type: 'POST',
	  				data : JSON.stringify(localproducts),
	  				cache : false,
	  				 url: '/GnD/shopfloor/savetoFile?decision='+$('#decisionid').val(),
	  				 success: function(data){
	  					 window.location.href = '/GnD/shopfloor/downloadfile?filepath='+data;
	  				},
	  				  error: function(){						
	  					alert('Error while request..');
	  				} 
	  				 });
	  					 
	  			}else{
	  				alert("you have cancelld a request");
	  			}  
	  		});
	    $(document).ready(function(){
	        $("#crdrtotrk").click(function(){
	            $.ajax({
	            	type:"post",
	            	url: "/GnD/shopfloor/crdrtotrkmis?fromDate="+$('#fromdate').val()+"&toDate="+$('#todate').val(), 
	            	success: function(result){
	            		$.alertable.alert(result, {
                     		  show: function() {
                     		    $(this.overlay).velocity('transition.fadeIn');        
                     		    $(this.modal).velocity('transition.flipBounceYIn');
                     		  },
                     		  hide: function() {
                     		    $(this.overlay).velocity('transition.fadeOut');
                     		    $(this.modal).velocity('transition.perspectiveUpOut');
                     		  } 
                     		});
	            }});
	        });
	    });
	    
	    
	    $(function() {
	        $( "#fromdate" ).datepicker();
	      });
	    $(function() {
	        $( "#todate" ).datepicker();
	      });
	    $(document).ready(function(){
	        $(document).ajaxStart(function(){
	            $("#wait").css("display", "block");
	        });
	        $(document).ajaxComplete(function(){
	            $("#wait").css("display", "none");
	        });
	        $("button").click(function(){
	            $("#txt").load("demo_ajax_load.asp");
	        });
	    });

		</script>
</body>
</html>
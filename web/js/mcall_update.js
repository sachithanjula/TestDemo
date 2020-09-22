function updateCamp(){
	 
	 var mcallNumber= $('#mcall option:selected').text();
	 //split mcall number from - 
	//get status [ACTIVE/INACTIVE]
	 if(mcallNumber.split("-")[1].trim()==='ACTIVE'){
		 alert("Already created campaign is available.");
		


        swal({
            title: 'Are you sure?',
            text: "Do You Want To update the excisting campaign!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes!',
            cancelButtonText: 'No!',
            confirmButtonClass: 'btn btn-success',
            cancelButtonClass: 'btn btn-danger',
            buttonsStyling: false
        }).then(function (result) {

        	 if (result.value) {
		       	 $.ajax({
		    	        url: 'controller/MissedCallController.jsp?action=findCampaign&mcallnumber='+mcallNumber.split("-")[0].trim(),
		    	        contentType: 'application/json',
		    	        context: document.body
		    	    }).done(function (response) {
		    	           obj = JSON.parse(response.trim());
		
		    	           $("#campaignName:text").val(obj.campaignName);
		    	         
    	          /* Set default icons of select message types icons to grey*/
    	         
    	         var default_color_img_path = "assets/images/missed/";
    	        var default_img_path = "assets/images/gray/";
    	         
    	        
    	       $("#msgType:text").val(obj.campaigType);
    	       selectMessageType(obj.campaigType);//set button id to selectedMessageType variable for validation
    	       
    	       $("#stopBtn").prop("disabled", false); //enable stop button for edit campaign
    	       
    	       if(obj.campaigType==='VOICEENG'){
    	    	 
    	    	   //Change selected images
    	    	   document.getElementById("VOICEENG").src = default_color_img_path + 'voiceColor.png';
    	    	   document.getElementById("SMSENG").src = defaultPath + 'ssmsGray.jpg';
    	    	   document.getElementById("divSmsSenderId").style.display = 'none';
    	        	
    	    	 //Change selected bottom text color
    	    	  $("#tagnameb2" ).css("color", "darkcyan");
    	          $("#tagnameb1" ).css("color", "black");
    	          
    	         $("#voiceRow").prop("hidden", false);
                 $("#smsRow").prop("hidden", true);
                
    	        }else if(obj.campaigType==='SMSENG'){
    	        	
    	        	 //Change selected images
    	        	 document.getElementById("SMSENG").src = default_color_img_path + 'ssmsColor.jpg';
    	        	 document.getElementById("VOICEENG").src = defaultPath + 'voiceGray1.png'; 
    	        	 document.getElementById("divSmsSenderId").style.display = 'block'; //display sender id drop down
    	        
    	        	//Change selected bottom text color
    	        	$("#tagnameb1" ).css("color", "darkcyan");
    	        	$("#tagnameb2" ).css("color", "black");
    	        	
    	        	 $("#voiceRow").prop("hidden", true);
    	            $("#smsRow").prop("hidden", false);
    	            
    	        	 $("#messageText").val(obj.messageContent);//set message content
    	        	 
    	        	$("#sendId").val(obj.senderId);//set SMS sender ID
    	        	
    	        }
    	     
    	      $("#updateCampId").val(obj.campaignId);
    	      
    	       if(obj.status==='SCHEDULE'){
    	    	 //document.getElementById("SCHEDULE").checked = true;
    	    	 $("#SCHEDULE").prop("checked", true);
    	    	  $("#DateNTime").val(obj.startTime +" - "+obj.endTime);
    	    	  
    	        }else if(obj.status==='STARTNOW'){
    	        	
    	        	//document.getElementById("STARTNOW").checked = true;
    	          $("#STARTNOW").prop("checked", true);
    	        	$("#ButtonCreationDemoInput").val(obj.endTime);
    	        	
    	        }
    	    });
       	 
        }else{
        	//reset mcall drop down to select option
        	$("#mcall").val("0");
        	//alert("OK");
        }
        });
		 
		 //If active load campaign details
	 }else{
		 alert("Already created campaign is not available.");
	 }
	 
}
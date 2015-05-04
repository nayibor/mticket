/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


var settings={
    
    change_inst:function(site_id,inst_id){
        
        var _this=this;
        var formurl=$("#change_inst_url").val();
        var formdata="site_id="+site_id+"&inst_id="+inst_id;     
        $.ajax({
            url: formurl,
            data:formdata,
            type: 'GET',
            dataType:'json',
            success:function(data) {
               
                if(data.status=="true")          
                {
                    $(".ui-dialog-content").dialog("close");
                    window.location.href=$("#dashboard").val();
                //this is so that the settings can be loaded when editing user data
                 
                }
            },
            error:function(data){
          
            }
        })
    },
    
    check_password:function(){
        if(($("#new_password").val()==$("#repeat_new_password").val())&& $("#new_password").val()!="")
        {
            $("#repeat_password_error").html("Repeated Password correct");
            $("#repeat_password_error").css("color","green");
            $("#repeat_new_password").css("border","solid black 1px");   
            //  $("#new_password").css("border","solid black 1px");       

            $("#repeat_password_error").show();
            console.log("password is correct");
            return true;
        }
        else if(($("#new_password").val()!=$("#repeat_new_password").val())){
            $("#repeat_password_error").css("color","red");
            $("#repeat_new_password").css("border","solid #F44 2px");              
            // $("#new_password").css("border","solid #F44 2px");              

            $("#repeat_password_error").html("Repeated Password InCorrect Or Empty");
            $("#repeat_password_error").show();
            console.log("password is incorrect");
            return false;

        }   
    },
    
    ///have to setup a global ajax functionalty here
    init:function(){
        _this=this;
        
        $(document).bind("ajaxSend",function(){
            $(".ui-dialog-buttonpane button:contains('Save')").attr("disabled",true).addClass("ui-state-disabled");

        }).bind("ajaxSuccess",function(){
            $(".ui-dialog-buttonpane button:contains('Save')").attr("disabled",false).removeClass("ui-state-disabled");

        }).bind("ajaxError",function(){
            $(".ui-dialog-buttonpane button:contains('Save')").attr("disabled",false).removeClass("ui-state-disabled");

             
        });
            
            
        $("#repeat_password_error").hide();
        
        
        
        //this is for loading the instituiton div
        $(".change_inst").live('click',function(e){
            e.preventDefault();
            var title="Change Site"
            var $dialog = $("<div></div>")
            .load($(this).attr('href'),function(rdata){
                
                })
            .dialog({
                autoOpen: false,
                title:title,
                width: 500,
                height: 400,
                position:"center",
                modal:true,
                buttons: {
                    "Save": function() {
                        
                        //alert()
                        
                        
                      
                        $(".site_select").each(function(index,val){
                            var site_id;
                            var inst_id;
                            if($(this).is(":checked")){
                                    
                                if($('#csite').val()==$(this).attr("site_id")) 
                                {
                                    alert("This Site Is Already The Default Site\n\Change Default Site Or Press Close To Exit") ;
                                    return false;
                                }
                                else{
                                    if(confirm("You Are About To Change Your Active Institution And Site\n\Do You Want To Continue ?"))
                                    {
                                        site_id=$(this).attr("site_id");
                                        inst_id=$(this).attr("inst_id");
                                        _this.change_inst(site_id, inst_id); 
                                    }
                                }
                                return false;
                            }
     
                        })
                        
                    },
                    "Close": function() {
                        $( this ).dialog( "close" );
                    }
                }
            });
            $dialog.dialog('open');
            
        })
        
        $(".stn").live('click',function(e) {
            var _this=this;

            e.preventDefault();
            var data="";
            var title="Edit "+$(this).attr("name");
            data="id="+$(this).attr("id")+"&edit_user="+"true";
                
            settings.edit_user_status=true;
            
            var $dialog = $("<div></div>")
            .load($(_this).attr('href'),data,function(rdata){
                })
            .dialog({
                autoOpen: false,
                title:title,
                width: 500,
                height: 300,
                position:"center",
                modal:false,
                buttons: {
                    "Save": function() {
                        settings.checkfields();
                    },
                    "Cancel": function() {
                        $( this ).dialog( "close" );
                    }
                }
            });
            $dialog.dialog('open');
     
        });
       
       
        $("#repeat_new_password").live('keyup',function(e) {
            settings.check_password();
        }) ;
        
        
        $(".change_password").live('click',function(e) {
            var _this=this;

            e.preventDefault();
            var data="";
            var title="Change Password";
                            
            var $dialog = $("<div></div>")
            .load($(_this).attr('href'),data,function(rdata){
                })
            .dialog({
                autoOpen: false,
                title:title,
                width: 500,
                height: 300,
                position:"center",
                modal:false,
                buttons: {
                    "Save": function() {
                        $("#repeat_password_error").hide();
                        settings.check_password_fields();
                    },
                    "Cancel": function() {
                        $(".ui-dialog-content").dialog("close");
                    }
                }
            });
            $dialog.dialog('open');
      
        });
        
    },
    
    
    check_password_fields:function(){
        
        ///check whether old and new passwords are the same
        var counter=0;
        var st;
        $("#change_pass_form input[type=password]").each(function(){
            if($(this).val()=="")
            {
                $(this).css("border","solid #F44 2px");              
                counter++;
            }
                      
            else{
               
                $(this).css("border","solid black 1px");       
            
            } 
        
        });
        
        st=settings.check_password();
        if(counter==0 && st==true)
        {
            settings.save_password();
        }
            
        
    },
    
    checkfields:function(){
        var counter=0;
        var _this=this;
        $("#change_pass_form.cmxform input[type=text]").each(function(){
            if($(this).val()=="")
            {
                $(this).css("border","solid #F44 2px");              
                counter++;
            }
            else{
               
                $(this).css("border","solid black 1px");       
            
            } 
        });
        if(counter==0)
        {
            _this.save_data();
        }
      
      
    },
  
    save_password:function(){
        var change_pass_url=$("#change_password_url").val();    
        var _this=this;
        var formurl=$("#change_password_url").val();
        var formdata=$("#change_pass_form.cmxform").serialize();
        $.ajax({
            url: formurl,
            data:formdata,
            type: 'GET',
            dataType:'json',
            success:function(data) {
                if(data.status=="true")          
                {
                    alert("Password Changed.\n .\nPlease Log In With New Password");
                    $(".ui-dialog-content").dialog("close");
                    ///     alert($("#logout_url").val());
                    window.location.href=$("#logout_url").val();
                //this is so that the settings can be loaded when editing user data
                 
                }
                if(data.status=="false"){
                    $("#repeat_password_error").css("color","red");
                    $("#repeat_password_error").html(data.message);
                    $("#repeat_password_error").show();
                    
                }
            },
            error:function(data){
          
            }
        })
      
        
    },
    save_data:function(settings){
        var _this=this;
        var formurl=$("#add_user_url").val();
        var formdata=$("#add_user_form.cmxform").serialize();      
        $.ajax({
            url: formurl,
            data:formdata,
            type: 'GET',
            dataType:'json',
            success:function(data) {
               
                if(data.status=="true")          
                {
                    $(".ui-dialog-content").dialog("close");
                //this is so that the settings can be loaded when editing user data
                 
                }
            },
            error:function(data){
          
            }
        })
      
    
    }
}

$(document).ready(function(){
    
    settings.init();  

})
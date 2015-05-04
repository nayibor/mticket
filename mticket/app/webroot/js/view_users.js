/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function(){

    add_user.init();
})


var add_user={
    
    edit_user_status:false,

    load_url:$("#user_list").val(),
    start_user_diag:$("#users_diag"),
    
    load_users:function(page_link){
      
        var val = $("#search_user").val();

        $.ajax({
            url: page_link,
            dataType:'html',
            data: val!="" ? "filter="+val : "filter=null",
            success:function(data) {
                //  console.log(data);
                //  alert("data has been loaded");
                $("#table_info").html(data);
            },
            error:function(data){
          
            }
        })
    },
    
    setup_edit:function(id,type,dt){
        var _this=this;

        $.ajax({
            url: $("#user_status_change").val(),
            data:dt,
            type: 'GET',
            dataType:'json',
            success:function(data) {
                alert(type+" Action Successful");
                _this.load_users(_this.load_url);

            },
            error:function(){
                alert(type+" Action Unsuccessful");   
            }
        })
    },
    
    init_users_diag:function(){
        
        
        add_user.start_user_diag.dialog({
            autoOpen: false,
            title: "",
            width: 500,
            height: 300,
            position:"center",
            modal:false,
            open: function(event, ui) {
            //    $("#add_eve.cmxform input[type=text]:first").focus();
            },
         
            buttons: {
                "Save": function() {
                    add_user.checkfields();
                },
                "Close": function() {
                    $(add_user.start_user_diag).html("");

                    $( this ).dialog( "close" );
                }
            }
        });
        add_user.start_user_diag.dialog('close'); 
        
    },
    init:function() 
    {
        var _this=this;
        add_roles.init_role_diag();
        add_user.init_users_diag();
         
        _this.load_users(_this.load_url);
                
        $("a.pglink").live('click',function(e) {
            e.preventDefault();
            var link=$(this).attr('href');
            _this.load_users(link);  
        });
       
        $("#search_user").keyup(function(e) {
            if(e.which==13){
                _this.load_users(_this.load_url); 
                
            }
        })    
             
        
        
      
        $(".unlock").live('click',function(){
            var id=$(this).closest("tr").attr("id");
            var dt="id="+id+"&type=unlock";
            _this.setup_edit(id,"unlock",dt);
 
        })
        $(".lock").live('click',function(){
            var id=$(this).closest("tr").attr("id");
            var dt="id="+id+"&type=lock";
            _this.setup_edit(id,"lock",dt);
        })
        $(".reset_pass").live('click',function(){
            var id=$(this).closest("tr").attr("id");
            var dt="id="+id+"&type=reset_pass";
            _this.setup_edit(id,"reset_pass",dt);

        })

      
        $(".add_role").live('click',function(){
            
            var id=$(this).closest("tr").attr("id");
            var name=$(this).closest("tr").attr("name");
            //var name =$.trim($(this).closest("tr").find("td.name_info").text());
           
            add_roles.init(id, name);
            
        })      
      
        $("#add_user,.edit_user").live('click',function(e) {
            e.preventDefault();
            var data="";
            var title="";
            if($(this).hasClass("edit_user"))
            {
                data="id="+$(this).closest("tr").attr("id")+"&edit_user="+"true";
                
                _this.edit_user_status=true;
                title="Edit "+$(this).closest("tr").attr("name");
            }
            else{
                title="Add New User";
     
            }
            
            add_user.start_user_diag.dialog('option','title',title);
            add_user.start_user_diag.dialog('open')
            //     .load
            //  var $dialog = $("<div></div>")
            .load($("#add_user").attr('href'),data,function(){
                        
                //  add_roles.start_diag.dialog('open');
                })
            
    
        /*
            var $dialog = $("<div></div>")
            .load($("#add_user").attr('href'),data,function(rdata){
                })
            .dialog({
                autoOpen: false,
                title:$(_this).hasClass("edit_user")? title : $(this).attr('title'),
                width: 500,
                height: 300,
                position:"center",
                modal:false,
                buttons: {
                    "Save": function() {
                        _this.checkfields();
                    },
                    "Cancel": function() {
                        $( this ).dialog( "close" );
                    }
                }
            });
            $dialog.dialog('open');**/
     
        });
       
      
        $("#add_user_form.cmxform").live('submit',(function(){
            // _this=this;
            _this.checkfields();
            return false;
        }));
        
        //        $("#submit_event").live('click',(function(){
        //               
        //            add_user.checkfields();
        //            return false;
        //        }));
        
        $("#add_user_form.cmxform input[type=text]").blur(function(){
        
            if($(this).val()=="")
            {
                $(this).css("border","solid #F44 2px");              
            }else{
                $(this).css("background-color","white");              
      
            }
        
        });
        
    },
  
   
    checkfields:function(){
        var counter=0;
        var _this=this;
        $("#add_user_form.cmxform input[type=text],#add_user_form select,#add_user_form radio,#add_user_form input[type=email]").each(function(){
            if($(this).val()=="")
            {
                $(this).css("border","solid #F44 2px");              
                counter++;
            }
            else{
               
                $(this).css("border","solid grey 1px");       
            
            } 
        });
        if(counter==0)
        {
            _this.save_data();
        }
      
      
    },
  
    /*  save_data:function(){
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
                
                    _this.edit_user_status==false;
                    _this.load_users(_this.load_url);
                    
                  
                }
            },
            error:function(data){
          
            }
        })
      
      
      
      
      
    } **/
    save_data:function(){
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
                    
                    alert("New User "+data.name+" created."+
                        "Password Is "+data.new_pass);
                    $(add_user.start_user_diag).html("");

                    $(".ui-dialog-content").dialog("close");
                    //this is so that the settings can be loaded when editing user data
                
                    _this.edit_user_status==false;
                    _this.load_users(_this.load_url);
                    
                  
                }
                else if (data.status=="false" && data.message_code=="UAE")
                {
                   
                    alert(data.message);  
                    $("#add_user_form.cmxform input[type=email]").css("border","solid #F44 2px");              

                }
                else{
                    $(add_user.start_user_diag).html("");
                    $(".ui-dialog-content").dialog("close");
                    _this.load_users(_this.load_url);
     
                }
            },
            error:function(data){
          
            }
        })
      
      
      
      
      
    }
}


var add_roles={
    id:0,
    reset_pass_status: false,
    picklist_status:false,
    name:"",
    start_diag:$("#role_diag"),

    
    init_role_diag:function(){
        add_roles.start_diag.dialog({
            autoOpen: false,
            title: "Edit Roles",
            width: 500,
            height: 300,
            position:"center",
            modal:false,
            open: function(event, ui) {
            //    $("#add_eve.cmxform input[type=text]:first").focus();
            },
         
            buttons: {
                "Save": function() {
                    add_roles.save_roles_user();
                },
                "Close": function() {
                    $(add_roles.start_diag).html("");
                    $( this ).dialog( "close" );
                }
            }
        });
        add_roles.start_diag.dialog('close');
    },
    init :function(id,name){
        var _this=this;
        
        
        _this.id=id;
        _this.name=name;
        console.log("id--"+this.id+"--name"+this.name);
        _this.show_role_dialog(_this.id,"Edit Roles For "+_this.name);
    },
    
    create_picklist:function(){
        var _this=this;
        var el = document.createElement("select");
        el.setAttribute('type', 'text');
        el.setAttribute('name', 'user_roles');
        el.setAttribute('id', 'user_roles');
        el.setAttribute('multiple','multiple');
        $('#role_div').css("visibility","visible");

        $('#role_div').append(el);
        $("#user_roles").pickList();
        $("#user_roles").pickList("insert", {
            value:    5,
            label:    "Football",
            selected: false
        });
        console.log($("#user_roles"));
    },
    destroy_picklist:function(){
        $("#user_roles").pickList().remove();
        $('#user_roles').remove();
  
        
    },
    show_role_dialog:function(id,title){
        var _this=this;
        add_roles.start_diag.dialog('option','title',title);
        add_roles.start_diag.dialog('open')
        //     .load
        //  var $dialog = $("<div></div>")
        .load($("#edit_roles").val()+"/"+id,function(){
            $("#user_roles").pickList({
                afterBuild: function() { 
                    _this.picklist_status=true;
                }
            });             
        //  add_roles.start_diag.dialog('open');
        })
    },
    
    
    save_roles_user:function(){
        var _this=this;      
        var roles = $.map( $('#user_roles option:selected'),
            function(e) {
                return $(e).val();
            } );
        console.log(roles);
        var data="roles="+roles+"&id="+this.id;     
        $.ajax({
            url: $("#save_roles").val(),
            data: data,
            success: function(data){
                $(add_roles.start_diag).html("");

                $(".ui-dialog-content").dialog("close");
                $("#user_roles").pickList("destroy");
                // window.location.href=$("#view_users_url").val();
                _this.load_users(_this.load_url);
                
            },
            type:'GET',
            dataType: 'json'
        })

    },
    remove_role:function(){}
    
    
}
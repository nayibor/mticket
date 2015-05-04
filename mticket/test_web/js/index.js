/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


    http://mobiticketz.com/api/events

    var eventfinder = {
        url:"http://mobiticketz.com/api/events",
        get_data:function(){
            //Set session of selected member id
            $.ajax({
                type: 'GET',
                url: eventfinder.url,
                dataType:'json',
                success: function(response){
                    $("ul.newslist").html("");
                 
                    var li_ele = document.createElement('li');
                    var span_ele = document.createElement('span');
                    var br_ele = document.createElement('br');
                    var strong_ele = document.createElement('strong');
                    $(strong_ele).html("");
                    $(span_ele).attr("class","small");
                    $(span_ele).html("Loading Latest Events ...");
                    $(li_ele).append(span_ele);
                    $(li_ele).append(br_ele);
                    $(li_ele).append(strong_ele);
                    $("ul.newslist").append(li_ele);
                    
                     
                    setTimeout(function(){
                        for (var i=0;i < response.events.length;i++){
                            var li_ele = document.createElement('li');
                            var span_ele = document.createElement('span');
                            var br_ele = document.createElement('br');
                            var br_elesp = document.createElement('br');

                            var span_decrp=document.createElement('span');
                            var strong_ele = document.createElement('strong');
                            console.log(response.events[i].eventName);
                            $(strong_ele).html(response.events[i].eventName.substr(0, 30));
                            $(span_decrp).html(response.events[i].desc);
                            $(span_ele).attr("class","small");
                            $(span_ele).css("margin-right","3px !important");
                            $(span_ele).html(eventfinder.format_timestamp(response.events[i].eventStart));
                            $(li_ele).append(strong_ele);
                            $(li_ele).append(br_elesp);
                            $(li_ele).append(span_ele);
                            $(li_ele).append(br_ele);
                            $(li_ele).append(span_decrp);
                            $("ul.newslist").append(li_ele);

                            if(i==5)
                            {
                                break;
                            }
                        }
                        $("ul.newslist li:first").remove();

                        
                    },2000);

                    console.log(response);
                   
                //    alert("i am here");
                },
                error: function(){
					 
                }
            });
		
        },
        format_timestamp:function(d){
            d = new Date(d);
            if(!(d instanceof Date)) return d;
            function pad(n){
                return n<10 ? '0'+n : n
                }
            return pad(d.getMonth()+1)+'/'
            + pad(d.getDate())+'/'
            + d.getFullYear()+" "
            + pad(d.getHours()) + ":"
            + pad(d.getMinutes()) + ":"
            + pad(d.getSeconds());
        }

        ,
        init:function(){
            setInterval(function(){
                eventfinder.get_data();  
            },10 * 1000);
             
        }
    }
    
// prepare the form when the DOM is ready
$(document).ready(function() {
    eventfinder.init();
});
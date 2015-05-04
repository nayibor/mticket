<table cellspacing='0' summary='' class=''>
<thead>
    <tr>
      
        <th class="sortup">
            Name
        </th>
        <th class="sortup">
            Event
        </th>
      
    
        <th>Total Ticket Number</th>
        <th> Number Created</th>

        <th> Ticket Type</th>

         <th>Creation Status</th>
      <!--   <th>Dl Status</th> -->
              

                </th>
        <th class='last alignRight'>
  
        </th>
    </tr>
</thead>



<tbody>
    <?php
    $row_color = 0;
    foreach ($batches as $val) {
        ?>

        <tr id="<?php echo $val['Batch']['id'] ?>" class='<?php echo ($row_color % 2 == 0) ? "even" : "odd"; ?>'>
         

            <td>
                <?php echo $val['Batch']['batch_name']; ?>

            </td>
            <td>
                <?php echo $val['Event']['event_name']; ?>

            </td>


         <td>

          <?php echo $val['Batch']['batch_ticket_number']; ?>

            </td>
 <td>

          <?php  if(isset($real_number_created[$val['Batch']['id']])){
echo $real_number_created[$val['Batch']['id']]  ;}else{echo 0;} ?>


            </td>
   <td>

          <?php echo $val['TicketType']['type_name']; ?>

            </td>
  
<td>
          <?php 
//0--inprogress,1--done,-1--disabled,2--enabled
if($val['Batch']['batch_status_tickets']=="4"){echo "Disabled";}
if($val['Batch']['batch_status_tickets']=="2"){echo "In Progress";}
else if($val['Batch']['batch_status_tickets']=="3"){echo "Done";}
else if($val['Batch']['batch_status_tickets']=="1"){echo "Enabled";}
?>
            </td>

    <!--    <td>
          <?php echo $val['Batch']['batch_status_email']; ?>
            </td>
      --> 
             
            <td>
                <ul class='rowActions'>
                    <li>
                        <a href='#' class='inlineIcon preferences edit_batch'>Edit</a>
                    </li>
                     <li>
                                <a href='#' class='inlineIcon preferences iconDelete del_batch'>Delete</a>
                            </li> 
                    

                </ul>
            </td>
            <td></td> <td></td> <td></td>
        </tr>
        <?php
        $row_color++;
    }
    ?>

</table>

<div id="page_div">
<?php 

echo $this->Paginator->first('< first ',array('class'=>'pglink'),null,array('class'=>'pglink'));
echo $this->Paginator->prev('<< previous ',array('class'=>'pglink'),null,array('class'=>'pglink'));
echo $this->Paginator->next('next >> ',array('class'=>'pglink'),null,array('class'=>'pglink'));
echo $this->Paginator->last('last > ',array('class'=>'pglink'),null,array('class'=>'pglink'));
?>
</div>
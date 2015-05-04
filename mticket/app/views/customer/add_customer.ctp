<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */



?>
<style>
    div.tableWrapper li {
        width: 150px !important;
    }   
</style>

<form name="add_customer_form" id="add_customer_form" class="cmxform">
    <div class='tableWrapper'>
        <div class='tableHeader' style="border: 0px !important;">
            <ul class='tableActions'>
                <li>
                    <label>  Email </label>       
                </li> 
                <li>
                    <input type="hidden" required name="data[Member][id]" id="data[Member][id]"  value="<?php echo isset($member) ? $member['Member']['id'] : ""; ?>" />      

                    <input type="text" style="width:170px" required name="data[Member][email]" id="data[Member][email]" value="<?php echo isset($member) ? $member['Member']['email'] : ""; ?>" />      
                </li>
            </ul>  
            <ul class='tableActions'>
                <li>
                    <label>  Cell  </label> 
                </li>
                <li>
                    <input type="text" style="width:170px" required name="data[Member][cell_number]" id="data[Member][cell_number]" value="<?php echo isset($member) ? $member['Member']['cell_number'] : ""; ?>" />      
                </li>
            </ul>

            <ul class='tableActions'>
                <li>
                    <label>  Category </label> 
                </li>
                <li>

                    <select required name="data[Member][cat_id]" id="data[Member][cat_id]" >
                        <?php foreach ($categories as $val) { ?>
                            <option
                                <?php if (isset($member) && $member['Member']['cat_id'] == $val['Category']['id']) { ?>  selected="selected"  <?php } ?> 
                                value="<?php echo $val['Category']['id'] ?>"><?php echo $val['Category']['long_name'] ?> </option>

                        <?php } ?>
                    </select>


                </li>
            </ul>


            <ul class='tableActions'>
                <li>
                    <label>  Site </label> 
                </li>
                <li>

                    <select required name="data[Member][site_id]" id="data[Member][site_id]" >
                        <?php foreach ($sites as $val) { ?>
                            <option
                                <?php if (isset($member) && $member['Member']['site_id'] == $val['Site']['id']) { ?>  selected="selected"  <?php } ?> 
                                value="<?php echo $val['Site']['id'] ?>"><?php echo $val['Site']['site_name'] ?> </option>

                        <?php } ?>
                    </select>


                </li>
            </ul>          





        


            <ul class='tableActions'>
                <li>
                </li>
                <li>
                </li>
                <li>

                </li>


            </ul>


            <ul class='tableActions'>
                <li>
                    <label>  </label> 
                </li>
                <li>
                </li>



            </ul>



            <div class='clear'></div>
            <div class='corner left'></div>
            <div class='corner right'></div>
        </div>

    </div>

</form>



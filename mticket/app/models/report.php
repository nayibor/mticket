<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */





class Report extends AppModel{
    
    var $name="Report";
    
     var $hasMany = array(
        'ReportParameter' => array(
            'className' => 'ReportParameter',
            'foreignKey' => 'report_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
          'ReportRole' => array(
            'className' => 'ReportRole',
            'foreignKey' => 'report_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        )
    );
    
    
     function  getreports(){
         $menus=array();
         
         
     
        $menu_array=$this->find("all");
        foreach($menu_array as $val){
            $menus[$val['Report']['category']][]=$val['Report'];
            
        }
         
        return $menus;
     }
    
}
?>

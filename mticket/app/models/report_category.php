<?php

class ReportCategory extends AppModel {
    var $name = 'ReportCategory';
    var $displayField = 'name';
    
    
    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /** 	var $belongsTo = array(
      'ParentChartCategory' => array(
      'className' => 'ChartCategory',
      'foreignKey' => 'parent_id',
      'conditions' => '',
      'fields' => '',
      'order' => ''
      )
      );

      var $hasMany = array(
      'ChildChartCategory' => array(
      'className' => 'ChartCategory',
      'foreignKey' => 'parent_id',
      'dependent' => false,
      'conditions' => '',
      'fields' => '',
      'order' => '',
      'limit' => '',
      'offset' => '',
      'exclusive' => '',
      'finderQuery' => '',
      'counterQuery' => ''
      ),
      ); *
     *  
     */
    var $hasMany = array(
    'Report' => array(
    'className' => 'Report',
    'foreignKey' => 'report_category_id',
    'dependent' => false,
    'conditions' => '',
    'fields' => '',
    'order' => '',
    'limit' => '',
    'offset' => '',
    'exclusive' => '',
    'finderQuery' => '',
    'counterQuery' => ''
    ));
}

?>
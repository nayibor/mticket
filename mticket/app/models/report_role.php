<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class ReportRole extends AppModel {

    var $name = 'ReportRole';
    //The Associations below have been created with all possible keys, those that are not needed can be removed



    var $belongsTo = array(
        'Role' => array(
            'className' => 'Role',
            'foreignKey' => 'role_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'Report' => array(
            'className' => 'Report',
            'foreignKey' => 'report_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        )
    );

}

?>

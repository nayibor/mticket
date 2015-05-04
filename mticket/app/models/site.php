<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Site extends AppModel {

    var $name = 'Site';
    var $hasMany = array(
        'User' => array(
            'className' => 'User',
            'foreignKey' => 'site_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        ),
        'Member' => array(
            'className' => 'Member',
            'foreignKey' => 'site_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        )
        ,
        'TicketType' => array(
            'className' => 'TicketType',
            'foreignKey' => 'site_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        )
    );
    var $belongsTo = array(
        'Institution' => array(
            'className' => 'Institution',
            'foreignKey' => 'site_inst_id',
            'conditions' => '',
            'order' => '',
            'limit' => '',
            'dependent' => true
        )
    );

}

?>

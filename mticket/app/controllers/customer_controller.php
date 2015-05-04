<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class CustomerController extends AppController {

    var $name = 'Customer';
    var $components = array('RequestHandler', 'Session');
    var $uses = array("Member", "Category", 'Site');
    var $layout = 'dashboard_layout';

    function beforeFilter() {
        parent::beforeFilter();
    }

    //this is for viewing customers
    function view_cust() {
        $layout_title = "View Customers";
        $this->set
                (compact('layout_title'));
    }

    //this is for viewing categoriee
    function view_cat() {
        $layout_title = "View Category";
        $this->set
                (compact('layout_title'));
    }

    //this is for viewing customer list
    function customer_list($paginate_link = null) {

        $this->autoLayout = false;

        $filter = isset($_GET['filter']) && $_GET['filter'] != "null" ? $_GET['filter'] : "";

        $conditions_array = array(
            'Site.site_inst_id' => $this->Session->read('inst_id'),
            'OR' => array(
                'Member.email LIKE' => "%" . $filter . "%",
                'Member.cell_number LIKE' => "%" . $filter . "%",
                'Site.site_name LIKE' => "%" . $filter . "%",
                'Category.long_name LIKE' => "%" . $filter . "%"
                ));

        if ($paginate_link != null) {

            $page_array = explode($paginate_link, ":");
            $this->paginate = array(
                'Member' => array(
                    'conditions' => $conditions_array,
                    'contain' => array('Category', 'Site'),
                    'order' => array('Member.id' => 'desc'),
                    'page' => $page_array[1],
                    'limit' => 5));


            $members = $this->paginate('Member');
        } else {
            $this->paginate = array(
                'Member' => array(
                    'conditions' => $conditions_array,
                    'contain' => array('Category', 'Site'),
                    'order' => array('Member.id' => 'desc'),
                    'limit' => 5));
            $members = $this->paginate('Member');
        }


        $this->set(compact('members'));
    }

    //this is for adding customer
    function add_customer() {
        $this->autoLayout = false;

        if (isset($_GET['save_cust'])) {
            $cust_data = $_GET['data']['Member'];
            $this->Member->save($cust_data);
            echo json_encode(array("status" => "1"));
            exit();
        } else if (isset($_GET['edit_cust'])) {
            $id = $_GET['id'];
            $categories = $this->Category->find("all", array('recursive' => '-1', "all", 'conditions' => array('Category.inst_id' => $this->Session->read('inst_id')), "fields" => array("id", "long_name")));
            $sites = $this->Site->find("all", array('recursive' => '-1', 'conditions' => array('Site.site_inst_id' => $this->Session->read('inst_id'))));
            $member = $this->Member->find('first', array('conditions' => array('Member.id' => $id)));
            $this->set(compact('categories', 'sites', 'member'));
        } else {
            $categories = $this->Category->find("all", array("all", 'conditions' => array('Category.inst_id' => $this->Session->read('inst_id')), "fields" => array("id", "long_name")));
            $sites = $this->Site->find("all", array('recursive' => '-1', 'conditions' => array('Site.site_inst_id' => $this->Session->read('inst_id'))));

            $this->set(compact('categories', 'sites'));
        }
    }

    //this is for deleting customers 
    function del_customer() {

        $id = $_GET['id'];
        $conditions = array('Member.id' => $id);
        $this->Member->deleteAll($conditions);
        echo json_encode(array("status" => "1"));
        exit();
    }

    //this is for adding categories
    function add_cat() {
          $this->autoLayout = false;

        if (isset($_GET['save_cat'])) {
            $cat_data = $_GET['data']['Category'];
            $cat_data['inst_id']=$this->Session->read('inst_id');
            $this->Category->save($cat_data);
            echo json_encode(array("status" => "1"));
            exit();
        } else if (isset($_GET['id']) && $_GET['edit_cat'] == 'true') {

            $id = $_GET['id'];
            $cat = $this->Category->find("first", array("conditions" => array("Category.id" => $id)));
            $this->set(compact('cat'));
        } else {
            // echo "Current Site--".Configure::read("inst_id");
        }
    }

    //this is for  viewing the categories list
    function cat_list($paginate_link = null) {

        $this->autoLayout = false;

        $filter = isset($_GET['filter']) && $_GET['filter'] != "null" ? $_GET['filter'] : "";

        $conditions_array = array(
            'Category.inst_id' => $this->Session->read('inst_id'),
            'OR' => array(
                'Category.long_name LIKE' => "%" . $filter . "%"
                ));

        if ($paginate_link != null) {

            $page_array = explode($paginate_link, ":");
            $this->paginate = array(
                'Category' => array(
                    'conditions' => $conditions_array,
                    'order' => array('Category.id' => 'desc'),
                    'page' => $page_array[1],
                    'limit' => 5));


            $cats = $this->paginate('Category');
        } else {
            $this->paginate = array(
                'Category' => array(
                    'conditions' => $conditions_array,
                    'order' => array('Category.id' => 'desc'),
                    'limit' => 5));
            $cats = $this->paginate('Category');
        }


        $this->set(compact('cats'));
    }

}

?>

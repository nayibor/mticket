<?php

/*
  //shortcut for  login
  //have to also work on the site and hte institution lock --later
 * //may have to add some capthca to the login page --later
 */

class DashboardController extends Controller {

    var $name = 'Dashboard';
    var $helpers = array('Html', 'Form', 'javascript', 'ajax', 'Session');
    var $components = array('RequestHandler', 'Session','Cookie');
    var $paginate = array('limit' => 10);
    var $uses = array('User', 'Link', 'UserRole', 'RoleLink');
    var $layout = "default";

    function beforeFilter() {
        $this->checkMainCred();
    }

    //this used for checking the main page to see whether  u have to be redirected to  reception
    function checkMainCred() {


        if ($this->Session->check('memberData') && $this->action != 'logoutUser') {
            $this->redirect(array('controller' => 'Reception', 'action' => 'view_events'));
        }
    }

    //shortcut for  logout
    function logoutUser() {
        $this->Session->delete('memberData');
        $this->Session->delete('role_short_array');
        $this->Session->delete('user_links');
        $this->Session->delete('site_id');
        $this->Session->delete('inst_id');
        $this->redirect(array('controller' => 'Dashboard', 'action' => 'index'));
    }

    function loginUser($user) {

        $this->Session->write('memberData', $user);
        $this->Session->write('site_id', $user['User']['site_id']);
        $this->Session->write('inst_id', $user['Site']['site_inst_id']);

        $this->getLinks($user['User']['id']);
        $this->redirect(array('controller' => 'Reception', 'action' => 'view_events'));
    }

    function getLinks($userid) {

        $roles = $this->UserRole->find('all', array("conditions" => array("UserRole.user_id" => $userid)));
        // print_r($roles);
        //$roles_user = array();
        //$conditions_array = array();
        $links = array();
        $role_short_array = array();
        foreach ($roles as $val) {
            $roles_user[] = $val['Role']['id'];
        }

        // print_r($roles_user) ;

        $condition_array['RoleLink.role_id'] = $roles_user;
        $links = $this->RoleLink->find("all", array("conditions" => $condition_array));
        foreach ($links as $val) {
            if (!in_array($val['Role']['role_short_name'], $role_short_array)) {
                $role_short_array[] = $val['Role']['role_short_name'];
            }
        }


        $this->Session->write('user_links', $links);
        $this->Session->write('role_short_array', $role_short_array);
    }

    //shortcut for checking login for users at login page
    function index() {

        $status_user = "false";
        if (isset($_POST['username']) && isset($_POST['password'])
                && $_POST['username'] != "" && $_POST['password'] != ""
        ) {
            $users = $this->User->checkUser($_POST['username'], $_POST['password']);
            //user account username and pass is available but account may be locked
            if (isset($users['User'])) {

                //will have to check for a  site lock as well as an institution lock here

                if ($users['User']['lock_status'] >= 3) {
                    $user_login = "false";
                    $msg = "Account Is Locked .Please Contact Administrator";
                    $this->set(compact('user_login', 'msg'));
                } else if ($users['User']['lock_status'] < 3) {
                    //login user
                    //
                    //will check if the site hasnt been locked 
                    if ($users['Site']['site_lock'] == '0') {
                        $user_login = "false";
                        $msg = "Please Contact Administrator";
                        $this->set(compact('user_login', 'msg'));
                    } else {

                        $this->User->set(array('id' => $users['User']['id'], 'lock_status' => '0'));
                        $this->User->save();
                        $this->loginUser($users);
                    }
                }
            } else {
                //user wasnt able to login but other stuff is being tested 
                $user = $this->User->find('first', array("conditions" => array("User.user_email" => $_POST['username'])));
                // 
                if (isset($user) && $user['User']['lock_status'] < 3) {
                    // echo "user-statushere" . $user['User']['lock_status'];
                    $new_lock_number = intval($user['User']['lock_status']) + 1;
                    $this->User->set(array(
                        'id' => $user['User']['id'],
                        'lock_status' => $new_lock_number
                    ));
                    $this->User->save();
                    $user_login = "false";
                    $msg = "Please Enter Correct Username and Password To Login";
                } else if (isset($user) && $user['User']['lock_status'] >= 3
                ) {
                    $user_login = "false";
                    $msg = "Account Is Locked .Please Contact Administrator";
                }
                $this->set(compact('user_login', 'msg'));
            }
        } else {
            $user_login = "false";
            $msg = "Please Enter Correct Username and Password To Login";
            $this->set(compact('user_login', 'msg'));
        }
    }

}

?>

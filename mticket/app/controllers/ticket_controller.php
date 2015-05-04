<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class TicketController extends AppController {

    var $name = 'Ticket';
    var $components = array('RequestHandler', 'Session', 'Email', 'TicketGenericEmail', 'QrMod');
    var $uses = array("User", 'Event', 'TicketType', 'Batch', 'Ticket', 'Site', 'Role', 'UserRole', 'Member');
    public $helpers = array('Form', 'Html', 'Js', 'Time', 'Paginator');
    var $time_ticket = '5';

    function beforeFilter() {
//will have to check whether the user logged in is an adminstrator/superadmin
// first before allowing the user to access
        //  parent::beforeFilter();
        if (!$this->Session->check('test')) {
            $this->Session->write('test', 'test');
        }
    }

    function get() {
        phpinfo();
        //echo::read('Session.cookie');
        //  $this->TicketGenericEmail->send('testing server', array('nayibor@gmail.com'), array(), 'title`', $params = NULL);
        //   echo "getting session data" . $this->Session->id();
        //     print_r($_SESSION);
        exit();
    }

    //this is for sending  a batch of tickets provided the ticket batch has been created
    function email_batch($batch_id = null) {
        $this->autoLayout = false;
        $this->autoRender = false;

        $batch_data = $this->Batch->find("first", array('conditions' => array('Batch.batch_status_email' => '2', 'Batch.id' => $batch_id)));
        if (isset($batch_data['Category']['id']) && $batch_data['Category']['id'] != '') {
            $cat_id = $batch_data['Category']['id'];
            $category_members = $this->Member->find('all', array('recursive' => '-1', 'conditions' => array('Member.cat_id' => $cat_id)));
            //at this point i may have to find the category member whom tickets haven been sent 
            //to for that event
            //will then loop through them
            foreach ($category_members as $val) {
                $array_send = array('email' => $val['Member']['email'], 'cell' => trim($val['Member']['cell_number']));
                $this->email_ticket($array_send, $batch_data['Batch']['batch_event_id'], $batch_data['Batch']['id'], $batch_data['Batch']['ticketype']);
            }

            echo "all tickets for this batch have been sent";
        }
    }

    //this is for processing event requests sent by customers
    // text message was sent with email address
    //find out if customer has enough funds for transaction.
    //debit the customers funds 
    //allocate ticket to  customer .  yes/no 
    //two of the above should be a transaction
//send text messsage back to customer about reception of ticket


    function process_request() {


        $cust_info = $_GET['cust_info'];
        //part below may or may not happen depending on wheter there are avialabe tickets
        ///these two things below are transactions .either  both happen or none at all.
        $this->allocate_ticket($type, $cust_info);
        //whether or not info was returned to customer
        exit();
    }

    //function allocate_session_customer
    //this function will decide whether or not there are available tickets
    //adding security functionality
    //same here
    function allocate_session($ticket_type) {
        $this->autoLayout = false;
        $this->autoRender = false;
        $rst = array();
        $customer_session = $this->Session->id();

        //code has to here to find out if same customer has already bought a ticket in the last five minutes
        // prevent him or her from buying ticket for same event
        // echo $customer_session;
        $rst = $this->Ticket->find('first', array('fields' => array('ticket_session_token,ticket_session_start',
                'ticket_event_id,ticket_type,ticket_redeem_status'),
            'conditions' => array('Ticket.ticket_type' => $ticket_type, 'Ticket.ticket_session_token' => $customer_session)));
        if (key_exists('Ticket', is_array($rst) ? $rst : array()) > 0) {
            echo json_encode(array('result' => array('status' => 'ticket_already_allocated')));
            exit;
        } else {
            $query = "UPDATE tickets set "
                    . "ticket_redeem_status='1',"
                    . "ticket_session_token='" . $customer_session . "',"
                    . "ticket_session_start=" . "now()" . ","
                    . "ticket_session_end=(DATE_ADD(NOW(), INTERVAL " . $this->time_ticket . " MINUTE))"
                    . " where ticket_session_token='' and ticket_redeem_status='0'"
                 //   . " and ticket_event_id ='" . $event_id."'"
                    //  . "' and ticket_type='" . $ticket_type . "' limit " . $ticket_number;
                    . "' and ticket_type='" . $ticket_type . "'";


            $result = $this->Ticket->query($query);
            $rst2 = $this->Ticket->find('first', array('fields' => array('ticket_session_token,ticket_session_start',
                    'ticket_event_id,ticket_type,ticket_redeem_status'),
                'conditions' => array('Ticket.ticket_event_id' => $event_id, 'Ticket.ticket_redeem_status' => '1', 'Ticket.ticket_type' => $ticket_type, 'Ticket.ticket_session_token' => $customer_session)));

            echo json_encode(array('result' => array('status' => is_array($rst2) ? "ticket_allocated" : "ticket_not_allocated", "ticket_data" => is_array($rst2) ? $rst2 : array())));
            exit;
        }
    }

    ////payment has to be done b4 this stage is reached
    //allocates a ticket to customer
    //will have to add a time period crap to this whole thi
    //allocation will have to be done first before payment is  made
//payement is also more difficult to control than payment
//if one of those two messages arent sent back to the customer .
// assumption is that ticket wast sent and therefore  everything will be reverted    

    function allocate_ticket($ticket_session_token, $cell = null, $email = null) {
        $this->autoLayout = false;
        $this->autoRender = false;
        $rst = array();
        $customer_session = $ticket_session_token;
        $customer_number = $cell;
        $customer_email = $email;
        $ticket_event = $event_id;
        $ticket_type = $ticket_type;
        $customer_data = array('email' => $email, 'cell' => $cell);
        $query = "update tickets set "
                . "ticket_text_receiver='" . $customer_number
              /*  . "',ticket_email_receiver='" . $customer_email**/
                . "',ticket_redeem_status='2'"
                . " where ticket_session_token='" . $customer_session
                . "' and now() between ticket_session_start and ticket_session_end "
                . " and ticket_redeem_status='1'" ;
            //    . "' and ticket_type='" . $ticket_type . "'";

        $result = $this->Ticket->query($query);
        $rst = $this->Ticket->find('first', array('fields' => array('id', 'ticket_session_token,ticket_session_start',
                'ticket_img', 'ticket_event_id,ticket_type,ticket_redeem_status,ticket_email_receiver,ticket_text_receiver'),
            'contain' => array('Event' => array('fields' => array('event_start', 'event_end', 'event_name', 'event_location')), 'TicketType' => array('fields' => array('type_name', 'type_html'))),
            'conditions' => array('Ticket.ticket_redeem_status' => '2', 'Ticket.ticket_event_id' => $event_id, 'Ticket.ticket_type' => $ticket_type, 'Ticket.ticket_session_token' => $customer_session)));
        if (is_array($rst)) {
         //   $this->email_ticket($customer_data, $rst);
            //check will have to be done here to make sure that ticket was sent 
            // echo 'email has been sent';

            echo json_encode(array('result' => array('status' => 'ticket_allocated', 'ticket_data' => $rst)));
        } else {
            echo json_encode(array('result' => array('status' => 'ticket_couldent_be_sent_session_expired')));
        }
    }

//verify ticket stuff
//basic ticket verification
//later may go with gpgora(encryption),then storing the difffernt pieces of pass 
// in columns in record.actual value isnt stored but checked in application code . 
//to duplicate tickets you will need ,key,appplication code and database access .
//will have private and public key components per institution which will be used for encrytpting/decryption
    function verify_ticket() {
        $this->autoLayout = false;
        $this->autoRender = false;
        $ticket_data = $_POST['ticket_data'];

        $rst = $this->Ticket->find("first", array('conditions' =>
            array('Ticket.ticket_redeem_status' => '2', 'Ticket.ticket_verified_event_status' => '0',
                'Ticket.ticket_value' => $ticket_data)
                ));
        if (key_exists('Ticket', is_array($rst) ? $rst : array()) > 0) {
            $ticket = new Ticket();
            $rst['Ticket'];
            $ticket->set(array('id' => $rst['Ticket']['id'],
                'ticket_verified_event_status' => '1',
                'verified_event_time' => time())
            );
            $ticket->save();
            echo json_encode(array('status' => '1'));
        } else {
            echo json_encode(array('status' => '0'));
        }
    }

    //this is for downloading tickets which have been verifed to the local db 
    //event,batches,tickets at a go
    //rrn will make each ticket unique and if event/batch/ticket 
    // has been downloaded it wont be inserted into the db .
    //only new values will be inserted into the local db  
    function download_tickets($event, $ticket_type = null) {
        $this->autoLayout = false;
        $this->autoRender = false;

        if ($ticket_type != null) {
            $conditions = array('Event.id' => $event);
            $cond_ticket = array('Ticket.ticket_down_status' => '0', 'Ticket.ticket_type' => $ticket_type);
            // $conditions_afterdown = array('Ticket.ticket_type' => $ticket_type, 'Ticket.ticket_email_message_status' => '2', 'Ticket.ticket_redeem_status' => '2', 'Ticket.ticket_event_id' => $event);
        } else {
            $conditions = array('Event.id' => $event);
            $cond_ticket = array();
            // $conditions_afterdown = array('Ticket.ticket_email_message_status' => '1', 'Ticket.ticket_redeem_status' => '2', 'Ticket.ticket_event_id' => $event);
        }
        $result = $this->Event->find('first', array('contain' => array('Ticket' => array('conditions' => $cond_ticket), 'Batch'), 'conditions' => $conditions));
        if (count($result['Ticket']) > 0) {
            $filename = $result['Event']['event_name'] . '_' . date('Y-m-d H:i:s') . '.json';
            header('Content-Type: text/plain');
            header("Content-Disposition:attachment; filename=" . $filename);
            echo json_encode($result);
            //$this->Ticket->updateAll(array('Ticket.ticket_down_status'=>'1'),array($conditions_afterdown));
        } else {
            
        }
    }

//this is for uploading verifed tickets which have been bought back to  the remote db (reporting purposes) 

    function upload_verified_tickets($event) {
        
    }

//if the buying time as been exceeded the status of the ticket will be reverted so others can buy it 
    function deallocate_reservation() {

        $this->autoLayout = false;
        $this->autoRender = false;
        $query = "update tickets set "
                . "ticket_text_receiver=''"
                . ",ticket_session_start=NULL"
                . ",ticket_session_end=NULL"
                . ",ticket_email_receiver=''"
                . ",ticket_redeem_status='0'"
                . ",ticket_session_token=''"
                . "  where now() > ticket_session_end and ticket_redeem_status='1'";

        $result = $this->Ticket->query($query);
        echo "Ticket has been deallocatted";
    }

    //this will be for performing the necessary functions for ticket sending 
    //which was disrputed during hte process of the ticket sending
    // status 0 -eligible for sending
    /// status 1 -- started but not may not have been sent 
    /// status  2 -- ticket has been sent 
    /// if all tickets have a status of 2 for batch safetly assume that all tickets have been sent

    function send_email_suppliments() {
        
    }

    //this is for emailing one particular ticket for an event and batch
    // can be used for event walk in tickets but a walk in batch should have been created

    function email_ticket($customer_data, $ticket) {
        //find an available ticket for that batch
        //send to customer        
        $status = $this->email_ticket_customer($customer_data, $ticket);
        //   if ($status) {
        //  echo "status  of sent email " . --$status;
        $this->update_ticket_status($ticket_data['Ticket']['id'], 'ticket_email_message_status', '1');
        //    } else {
        //  }
        return true;
        ///ticket data will be apppended to show whom the tickt was sent  to 
        //text messagin component will be  used here
    }

    //this is for sending mobile tickets to particular customers
    function email_ticket_customer($customer, $ticket_data) {

        $dataObj = array(
            'attachments' => array(array('inline' => 0, 'name' => 'ticket.png', 'ctype' => 'image/png', 'type' => 'raw', 'data' => stripslashes($ticket_data['Ticket']['ticket_img']))),
            //  'render_element' => '/elements/email/html/email_ticket',
            'keys_replace' => array('{email}' => $customer['email'],
                '{cell}' => $customer['cell'], '{event}' => $ticket_data['Event']['event_name'],
                '{event_start}' => $ticket_data['Event']['event_start'], '{event_end}' => $ticket_data['Event']['event_end'], '{event_location}' => $ticket_data['Event']['event_location'])
        );

        //   $email = 'nuku2001@yahoo.com';
        $email = $customer['email'];
        $title = 'Test Email';
        $body_email = $ticket_data['TicketType']['type_html'];
        $email_status = true;
        $this->TicketGenericEmail->send($body_email, array($email), $dataObj, $title, $params = NULL);
        return $email_status;
    }

    //this is for changing hte status of a ticket as a ticket is being created
    function update_ticket_status($ticket_id, $field, $value) {
        $ticket = new Ticket();
        $ticket->set(array('id' => $ticket_id,
            $field => $value));
        $ticket->save();
    }

    //this is used for getting the image for a ticket and display it 
    //will have to remove it becuase its a security risk
    function getImage($ticket_id) {
        $this->autoRender = false;
        $this->autoLayout = false;
        $ticket_image = $this->Ticket->find("first", array("recursive" => "-1", "fields" => array('ticket_img')));
        header('Content-Type: image/png');
        echo stripslashes($ticket_image['Ticket']['ticket_img']);
    }

    //this is fore resending to those whom weren sent in case theere was  an  issue with the 
    //script timing out or the total number not being sent their emails;
    function email_inprogess_batch($batch_id = null) {
        
    }

    function encrypt_ticket() {
        
    }

    //if a batch of tickets did not finish processing 
    //all the qued batches  have to be done before  the new batch will be completed
    //but if ques arent created in the first place there will be no need for that

    function batch_search($batch_id = null) {
        $this->autoLayout = false;
        $this->autoRender = false;

        //batch creation is first done for the ones which havent been finished first before batch creation 

        $this->batch_inprogress_create();
        //  $this->batch_enabled_create();
    }

    //this finishes up ticket batches which were started but couldent be completed
    //batch creation has already been started so this one wont include the check for events creation allowance
    //if i want to use the que style i will just check the number tickets left for each 
    //batch and print the required number .
    //if will therefore need to write some code that will crash the job
//if there is loss of network connectivity ///below checks are enough for now 
    //2-create tickets
    //1-in progress
    function batch_inprogress_create($batch_id = null) {
        $this->autoLayout = false;
        $this->autoRender = false;
        $conditions = array();
        if ($batch_id != null) {
            $conditions['Batch.id'] = $batch_id;
            $conditions['Batch.batch_status_tickets'] = '2';
        } else {
            $conditions['Batch.batch_status_tickets'] = '2';
        }

        $batches = $this->Batch->find("all", array('recursive' => -1, 'conditions' => $conditions));


        foreach ($batches as $val) {
            echo "creating tickets of batch --" . $val['Batch']['id'];
            $total_created = $this->Ticket->find("count", array("conditions" => array("Ticket.ticket_batch_id" => $val['Batch']['id'])));
            $q_left = $val['Batch']['batch_ticket_number'] - $total_created;
            $val['Batch']['batch_ticket_number'] = $q_left;
            $batch = new Batch();
            $this->update_status($batch, $val['Batch']['id'], 2);
            $this->create_tickets_batch($val);
            $this->update_status($batch, $val['Batch']['id'], 3);
            echo "creation of batch --" . $val['Batch']['id'] . " done";
        }

        echo "TICKET CREATION DONE FOR AVAILABLE BATCHES !!!";
    }

    //this creates tickets for specified batches
    //will have to  look into this part very well
    //Above functionality will be used to replace creating tickets to prevent confusion
    function batch_enabled_create($batch_id = null) {
        
        $this->autoLayout = false;
        $this->autoRender = false;
        $conditions = array();
        if ($batch_id != null) {
            $conditions['Batch.id'] = $batch_id;
            $conditions['Batch.batch_status_tickets'] = '1';
        } else {
            $conditions['Batch.batch_status_tickets'] = '1';
        }

        $batches = $this->Batch->find("all", array('recursive' => -1, 'conditions' => $conditions));

        foreach ($batches as $val) {
            $batch = new Batch();
            $this->update_status($batch, $val['Batch']['id'], 2);
            $this->create_tickets_batch($val);
            $this->update_status($batch, $val['Batch']['id'], 3);
        }

        echo "TICKET CREATION DONE FOR ALL AVAILABLE BATCHES DONE BITCHES  !!!";
    }

    function update_status($batch, $batch_id, $status) {
        $batch->set(array(
            'id' => $batch_id,
            'batch_status_tickets' => $status));
        $batch->save();
    }

    function create_tickets_batch($batch_data = null) {
        $ticket_number = intval($batch_data['Batch']['batch_ticket_number']);
        $batch_id = $batch_data['Batch']['id'];
        $site_id = $batch_data['Batch']['site_id'];
        $event_id = $batch_data['Batch']['batch_event_id'];
        $ticket_type = $batch_data['Batch']['ticketype'];
        $data = array('batch_id' => $batch_id, 'site_id' => $site_id, 'event_id' => $event_id, 'ticket_type' => $ticket_type);

        for ($i = 1; $i <= $ticket_number; $i++) {
            $this->create_ticket($data);
        }
    }

    //this is for creating tickets
    // this will be moved to a componet later.no time now !!
    function create_ticket($data = null) {
        $tick = new Ticket();
        $info_ticket = $this->QrMod->create_ticket_data();
        $md5_ticket_info = md5($info_ticket);
        $ticket_qrcode = $this->QrMod->create_barcode_ticket($info_ticket);
        $tick->set(array(
            'site_id' => $data['site_id'],
            'ticket_event_id' => $data['event_id'],
            'ticket_batch_id' => $data['batch_id'],
            'ticket_md5' => $md5_ticket_info,
            'ticket_value' => $info_ticket,
            'ticket_img' => $ticket_qrcode,
            'unique_id_ticket' => String::uuid(),
            'ticket_type' => $data['ticket_type']
        ));
        $tick->save();
    }

    function load_available_tickets() {
        $this->autoRender = false;
        $tickets_avail_batch = $this->Batch->find("list", array('conditions' => array('Batch.batch_allow_redeem' => '1',
                'Batch.batch_verification_start < now()', 'Batch.batch_verification_end > now()')));

        $tickets_redeemable = $this->Ticket->find('all', array('fields' => array('ticket_batch_id', 'ticket_event_id', 'ticket_verified_status', 'ticket_redeem_status', 'id', 'ticket_verified_status', 'ticket_encrypted_value', 'ticket_value'), 'recursive' => -1, 'conditions' => array('Ticket.ticket_batch_id' => $tickets_avail_batch, 'Ticket.ticket_verified_status' => '0')));
        $data = array('ticket_redeemable' => $tickets_redeemable,
            'batches' => $tickets_avail_batch);

        echo json_encode($data);
    }

}

?>

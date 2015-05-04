<?php
require_once("process/functions.inc.php");
require_once("process/mpower/mpower.php");
$token = $_GET["token"];
MPower_Setup::setMasterKey("399cc8d2-b927-4116-b429-ed9e6eb12bcf");
MPower_Setup::setPublicKey("test_public_AnsRYS3OvXkz_Fg2hPxpWaMEZqU");
MPower_Setup::setPrivateKey("test_private_cfwtuXmXCqzvphujsJfyvgpTQdM");
MPower_Setup::setMode("test");
MPower_Setup::setToken("88df6c39266f35a6b7d6");


MPower_Checkout_Store::setName("mobiTicketz.com");
MPower_Checkout_Store::setTagline("ticketing made simple");
MPower_Checkout_Store::setPhoneNumber("0242182591");
MPower_Checkout_Store::setPostalAddress("Post office Box AN 16574 Accra");
$invoice = new MPower_Checkout_Invoice();
@session_start();
if($invoice->confirm($token))
{
 //send tickets to users....
   $url="http://mobiticketz.com/mticket/Ticket/allocate_ticket/".$_SESSION['id']."/".$_SESSION['type']."/".$_SESSION['session_token']."/".$_SESSION['phoneNum']."/".$_SESSION['email']."/";
   $result=file_get_contents($url);
   //echo $url;

$result=json_decode($result);
//var_dump($result);
//echo $result;
$result=$result->result;
$status=$result->status;
//echo "status ".$result;
//echo $status;
   if($status=="ticket_sent_assigned")
   {
      
      
  
     //add payments to database....
     $descr=$_SESSION['name']." ticket purchase";
     $date=date('d-M-y G:i:s');
     $date=urlencode($date);
      $rs=addPayment($_SESSION['total'],$date,$descr,$_SESSION['id'],$_SESSION['session_token'],$_SESSION['email']);
      //$rs=creditAccount($_POST['id'],$total);
      header("Location:getsocial.php?url=".$invoice->getReceiptUrl()."&type=".$_SESSION['type']."&name=".$_SESSION['name']."&id=".$_SESSION['id']);
      $_SESSION['email']="";
      $_SESSION['phoneNum']="";
      $_SESSION['name']="";
      $_SESSION['id']="";
      $_SESSION['type']="";
      $_SESSION['session_token']="";
      $_SESSION['total']="";
   }else
   {
     //header("Location:status.php?msg=")
   }
}else
{
  header("Location:status.php?msg=".$invoice->response_text);
}

?>
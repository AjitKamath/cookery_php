<?php

$prodarr 					= $_GET["prodarr"];
$pricearr					= $_GET["pricearr"];
$d1arr 						= $_GET["d1arr"];
$d2arr 						= $_GET["d2arr"];
$quantarr 					= $_GET["quantarr"];
$totalsizearr				= $_GET["totalsizearr"];
$amountarr 					= $_GET["amountarr"];
$detail 					= $_GET["detail"];
$date 						= $_GET["date"];
$customer 					= $_GET["customer"];
$userid 					= $_GET["user"];
$customer_type 				= $_GET["customer_type"]; 
$name 						= $_GET["name"];
$mobile 					= $_GET["mobile"];
$email 						= $_GET["email"];
$extra_charge				= $_GET["extracharge"];
$payment_type 				= $_GET["payment_type"];
$advance 					= $_GET["advance"];
$cheque_no 					= $_GET["cheque_no"];
$cheque_amount 				= $_GET["cheque_amount"];
$online_payment 			= $_GET["online_payment"];
$payment_commitment_date 	= $_GET["payment_commitment_date"];
$total_amount				= $_GET["total_amount"];
$discounttype 				= $_GET["discount"];	
$discountamt				= $_GET["discountamt"];
$amount_after_discount		= $_GET["amount_after_discount"];

$product = implode('|',$prodarr);
$price = implode('|',$pricearr);
$dimension1 = implode('|',$d1arr);
$dimension2 = implode('|',$d2arr);
$quantity = implode('|',$quantarr);
$totalsize = implode('|',$totalsizearr);
$amount = implode('|',$amountarr);


include 'config.php';

if($customer_type == "walkin")
{
	$sql = mysqli_query($db,"INSERT INTO walkin_customer (`walkin_customer_id` , `name` , `mobile` , `email` , `user_id`) values (NULL, '$name' , '$mobile' , '$email' , '$userid' ) ");

	$customer = $name;

	$count = mysqli_query($db,"select walkin_customer_id from `walkin_customer` WHERE name='$name' AND mobile='$mobile' ");
   $row = $count->fetch_row();
   $wlk_cust_id = $row[0];
}else{

	$wlk_cust_id = "N/A";
}
if($payment_type == "online")
{
	$advance 		= "N/A";
	$cheque_no 		= "N/A";
	$cheque_amount	= "N/A";
	$balance  		= "N/A";
}
else if($payment_type == "cash")
{
	$cheque_no 		= "N/A";
	$cheque_amount	= "N/A";
	$online_payment = "N/A";	
	$balance =$total_amount - $advance;
}
else if($payment_type == "cheque")
{
	$advance 		= "N/A";
	$online_payment = "N/A";
	$balance  		= "N/A";	
}
else if($payment_type == "fullpay")
{
	$advance 		= "N/A";
	$online_payment = "N/A";
	$balance  		= "N/A";	
}
else if($payment_type == "nopayment")
{
	$advance 		= "N/A";
	$online_payment = "N/A";
	$balance  		= $total_amount;	
}


$count = mysqli_query($db,"select cus_id from `customers` WHERE `cus_name`='$customer' ");
   $row = $count->fetch_row();
   $cid = $row[0];

$sidcount = mysqli_query($db,"select count(*) from `order`");
   $rowval = $sidcount->fetch_row();
   $sid = $rowval[0]+1;

$const = 'SL';
$sale_id = $const.$sid;
$order_status = "Active";

	$sql = "INSERT INTO `order` (
		`order_id`,
		`sale_id`,
		`customer_type`,
		`walkin_customer_id`,
		`customer`,
		`payment_type`,
		`order_date`,
		`payment_commitment_date`,
		`advance`,
		`chequeno`,
		`chequeamt`,
		`online_payment`,
		`product`,
		`price`,
		`dimension1`,
		`dimension2`,
		`quantity`,
		`totalsize`,
		`extracharge`,
		`amount`,
		`balance`,
		`detail`,
		`discounttype`,
		`discountamt`,
		`total_amount`,
		`amount_after_discount`,
		`order_status`,
		`submitted_by`
		) values (
					NULL,
					'$sale_id',
					'$customer_type',
					'$wlk_cust_id',
					'$customer',
					'$payment_type',
					'$date',
					'$payment_commitment_date',
					'$advance',
					'$cheque_no',
					'$cheque_amount',
					'$online_payment',
					'$product',
					'$price',
					'$dimension1',
					'$dimension2',
					'$quantity',
					'$totalsize',
					'$extra_charge',
					'$amount',
					'$balance',
					'$detail',
					'$discounttype',
					'$discountamt',
					'$total_amount',
					'$amount_after_discount',
					'$order_status',
					'$userid'
				)";

//echo $sql;				
//echo "<br>";

$question = mysqli_query($db, $sql);
if(! $question )
{
	printf("Errormessage: %s\n", mysqli_error($question));
//  die('Could not update data: ' . mysqli_error($	));
}
else{
//echo "Data saved successfully";
}

$count = mysqli_query($db,"select order_id from `order` WHERE sale_id='$sale_id' ");
   $row = $count->fetch_row();
   $orderid = $row[0];


// insert in sale table for each new order
	$sql2 = "INSERT INTO `sale` (
		`sale_id`,
		`order_id`,
		`customer`,
		`payment_type`,
		`order_date`,
		`payment_commitment_date`,
		`Advance`,
		`product`,
		`price`,
		`dimension1`,
		`dimension2`,
		`quantity`,
		`total_size`,
		`extracharge`,
		`amount`,
		`order_status`,
		`balance`,
		`refund`,
		`other_detail`,
		`total_amount`,
		`sale_by`,
		`sale_date`	
		) values (
					'$sale_id',
					'$orderid',
					'$customer',
					'$payment_type',
					'$date',
					'$payment_commitment_date',
					'$advance',
					'$product',
					'$price',
					'$dimension1',
					'$dimension2',
					'$quantity',
					'$totalsize',
					'$extra_charge',
					'$amount',
					'$order_status',
					'$balance',
					'N/A',
					'$detail',
					'$total_amount',
					'$userid',
					CURRENT_TIMESTAMP
				)";
 
 //echo $sql2;
$question2 = mysqli_query($db, $sql2);
if(! $question2 )
{
  die('Could not update data: ' . mysqli_error($question2));
}
else{
//echo "Data saved successfully";
$data["data"]=$sale_id;
 	     echo json_encode($data);
}

 ?>
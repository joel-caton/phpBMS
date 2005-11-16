<?php 
/*
 +-------------------------------------------------------------------------+
 | Copyright (c) 2005, Kreotek LLC                                         |
 | All rights reserved.                                                    |
 +-------------------------------------------------------------------------+
 |                                                                         |
 | Redistribution and use in source and binary forms, with or without      |
 | modification, are permitted provided that the following conditions are  |
 | met:                                                                    |
 |                                                                         |
 | - Redistributions of source code must retain the above copyright        |
 |   notice, this list of conditions and the following disclaimer.         |
 |                                                                         |
 | - Redistributions in binary form must reproduce the above copyright     |
 |   notice, this list of conditions and the following disclaimer in the   |
 |   documentation and/or other materials provided with the distribution.  |
 |                                                                         |
 | - Neither the name of Kreotek LLC nor the names of its contributore may |
 |   be used to endorse or promote products derived from this software     |
 |   without specific prior written permission.                            |
 |                                                                         |
 | THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     |
 | "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       |
 | LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A |
 | PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT      |
 | OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   |
 | SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        |
 | LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   |
 | DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   |
 | THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     |
 | (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   |
 | OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    |
 |                                                                         |
 +-------------------------------------------------------------------------+
*/
	include("../../include/session.php");
	include("../../include/common_functions.php");
	include("../../include/fields.php");

	include("include/clients_functions.php");
	include("include/clients_addedit_include.php");
?><?PHP $pageTitle="Client/Prospect"?><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><?php echo $pageTitle ?></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../common/stylesheet/<?php echo $_SESSION["stylesheet"] ?>/base.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="javascript/client.js"></script>
<script language="JavaScript" src="../../common/javascript/common.js"></script>
<script language="JavaScript" src="../../common/javascript/fields.js"></script>
<script language="JavaScript" src="../../common/javascript/choicelist.js"></script>
<script language="JavaScript" src="../../common/javascript/autofill.js"></script>
</head>
<body><?php include("../../menu.php")?>

<form action="<?php echo $_SERVER["REQUEST_URI"]; if(isset($_GET["invoiceid"])) echo "&invoiceid=".$_GET["invoiceid"];  ?>" method="post" name="record" onSubmit="return validateForm(this);"><div style="position:absolute;display:none;"><input type="submit" value=" " onClick="return false;" style="background-color:transparent;border:0;position:absolute;"></div>
<?php client_tabs("General",$therecord["id"]); ?>
<div class="bodyline">
	<div style="float:right;width:200px;">
		<?php showSaveCancel(1); ?>
		<?php if(isset($_GET["invoiceid"])){?>
			<div>
				<input name="gotoinvoice" type="button" value="back to order" onClick="location.href='<?php echo getAddEditFile(3) ?>?id=<?php echo $_GET["invoiceid"] ?>'" style="width:100%" class="Buttons">
			</div>			
		<?php } ?>			
		<fieldset>
			<legend>attributes</legend>
			<label for="id">id<br>
				<input name="id" type="text" value="<?php echo $therecord["id"]; ?>" size="5" maxlength="5" readonly="true" class="uneditable" style="width:98%" tabindex="-1" />
			</label>
			<label for="inactive" class="important" style="text-align:center">
				<?PHP field_checkbox("inactive",$therecord["inactive"],false,Array("tabindex"=>"4"))?>inactive
			</label>
			<label for="type" class="important">type<br>
				<?PHP 
					$disabled="noDisable";
					if($therecord["type"]=="client")
						if(checkForInvoices($therecord["id"]))
							$disabled="disabled";					
					basic_choicelist("type",$therecord["type"],Array(Array("name"=>"prospect","value"=>"prospect"),Array("name"=>"client","value"=>"client")),Array("style"=>"width:180px;","class"=>"important","tabindex"=>5,$disabled=>"true","onChange"=>"changeClientType(this)"));
				?>
			</label>
			<label id="becameclientDiv" for="becameclient" <?php if($therecord["type"]=="prospect") echo "style=\"display:none;\"" ?>>
				became a client<br />
				<input type="text" id="becameclient" name="becameclient" readonly="true" class="uneditable" value="<?php echo $therecord["becameclient"]?>" size="8" style="width:98%">
			</label>
			<label for="category">
				category<br />
				<?PHP choicelist("category",$therecord["category"],"clientcategories",array("style"=>"width:180px","tabindex"=>"5")); ?>
			</label>
			
		</fieldset>
	
		<fieldset>
			<legend>sales</legend>
			<label for="ds-salesmanagerid">sales manager<br>
				<?PHP autofill("salesmanagerid",$therecord["salesmanagerid"],9,"users.id","concat(users.firstname,\" \",users.lastname)","\"\"","users.revoked=0 AND users.id > 1",Array("style"=>"width:98%;","maxlength"=>"64","tabindex"=>"25")) ?>
			</label>
			<label for="leadsource">lead source<br>
				<?PHP choicelist("leadsource",$therecord["leadsource"],"leadsource",Array("tabindex"=>"26","class"=>"small","style"=>"width:170px")); ?>
			</label>
		</fieldset>
				
		<fieldset>
			<legend>default payment</legend>
			<label for="paymentmethod">payment type<br>
				<?PHP choicelist("paymentmethod",$therecord["paymentmethod"],"paymentmethod",Array("style"=>"width:170px;","tabindex"=>"27")); ?>
			</label>
			<label for="ccnumber">credit card number<br>
				<input id="ccnumber" name="ccnumber" type="text" value="<?PHP echo htmlQuotes($therecord["ccnumber"]) ?>" size="22" maxlength="32" style="width:98%" tabindex="28"/>
			</label>
			<label for="ccexpiration">credit card expiration<br>
				<input id="ccexpiration" name="ccexpiration" type="text"  value="<?PHP echo htmlQuotes($therecord["ccexpiration"]) ?>" size="7" maxlength="7" tabindex="29"/>
			</label>
		</fieldset>	
					
		<fieldset>
			<legend><label for="comments">memo</label></legend>
			<div style="padding-top:0px;"><?php 
					$rows=15;
					if(isset($_GET["invoiceid"])) $rows-=3;
					if($therecord["type"]=="client") $rows-=3;
				
				?><textarea name="comments" cols="20" rows="<?php  echo $rows?>" id="comments" style="width:98%" tabindex="30"><?php echo $therecord["comments"]?></textarea>
			</div>
		</fieldset>
	</div>
		
	<div style="margin-right:204px;">
		<h1><?php echo $pageTitle ?></h1>
		<fieldset>
			<legend>name / company</legend>
			<table border="0" cellpadding="0" cellspacing="0" class="recordtable">
				<tr>
					<td nowrap>
						<label for="firstname" class="important">first name<br>
							<input name="firstname" id="firstname" type="text" value="<?php echo htmlQuotes($therecord["firstname"])?>" size="32" maxlength="65" class="important" style="font-weight:bold;" tabindex=1;/>
							<script language="javascript">var thefirstname=getObjectFromID("firstname");thefirstname.focus()</script>
						</label>
					 </td>			
					 <td nowrap>
						<label for="lastname" class="important">last name<br>
							<input id="lastname" name="lastname" type="text" value="<?php echo htmlQuotes($therecord["lastname"])?>" size="32" maxlength="65" class="important" style="font-weight:bold;"i tabindex=2 />
						</label>
					</td>
				</tr>
			</table>
			<label for="company" class="important">company<br>
				<input name="company" type="text" id="company" value="<?php echo htmlQuotes($therecord["company"])?>" size="71" maxlength="128" class="important" tabindex=3 />
			</label>
		</fieldset>	
							
		<fieldset>					
			<legend>contact</legend>
			<table border="0" cellpadding="0" cellspacing="0" class="recordtable">
				<tr>
					<td nowrap>
						<label for="workphone">work phone<br>
							<?PHP field_text("workphone",$therecord["workphone"],0,"Work phone must be in valid format.<br /><em>(example: 505-994-6388)</em>","phone",Array("tabindex"=>"6","size"=>"25","maxlength"=>"32")); ?>
						</label>
					</td>
					<td nowrap>
						<label for="homephone">home phone<br>
							<?PHP field_text("homephone",$therecord["homephone"],0,"Home phone must be in valid format.<br /><em>(example: 505-994-6388)</em>)","phone",Array("tabindex"=>"7","size"=>"25","maxlength"=>"32")); ?>
						</label>
					</td>
				</tr><tr>
					<td nowrap>
						<label for="mobilephone">mobile phone<br>
							<?PHP field_text("mobilephone",$therecord["mobilephone"],0,"Mobile phone must be in valid format.<br /><em>(example: 505-994-6388)</em>","phone",Array("tabindex"=>"8","size"=>"25","maxlength"=>"32")); ?>
						</label>
					</td>
					<td>
						<label for="fax">fax number <br>
							<?PHP field_text("fax",$therecord["fax"],0,"Fax number must be in valid format.<br /><em>(example: 505-994-6388)</em>","phone",Array("tabindex"=>"9","size"=>"25","maxlength"=>"32")); ?>
						</label>
					</td>
				</tr>
			</table>
			<label for="otherphone">other phone<br>
				<?PHP field_text("otherphone",$therecord["otherphone"],0,"Other phone must be in valid format.<br /><em>(example: 505-994-6388)</em>","phone",Array("tabindex"=>"10","size"=>"25","maxlength"=>"32")); ?>
			</label>
			<label for="email" style="margin-top:10px;">e-mail address <br>
				<?PHP field_email("email",$therecord["email"],Array("tabindex"=>"11","size"=>"68","maxlength"=>"128")); ?>
			</label>
			<label for="webaddress">web address<br>
				<?PHP field_web("webaddress",$therecord["webaddress"],Array("tabindex"=>"12","size"=>"68","maxlength"=>"128")); ?>
			</label>
		</fieldset>
		
		<fieldset>
			<legend><label for="address1">billing / main address</label></legend>
			<div>
				<input id="address1" name="address1" type="text" size="71" maxlength="128" value="<?PHP echo htmlQuotes($therecord["address1"])?>" tabindex="13"/><br />
				<input id="address2" name="address2" type="text" size="71" maxlength="128" style="margin-top:2px;" value="<?PHP echo htmlQuotes($therecord["address2"])?>" tabindex="14"/>
			</div>		
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td nowrap>
						<label for="city">city<br>
							<input name="city" type="text" id="city" value="<?php echo htmlQuotes($therecord["city"])?>" size="35" maxlength="64" tabindex="15"/>
						</label>
					</td>
					<td nowrap >
						<label for="state">state/province<br>
							<input name="state" type="text" id="state" value="<?php echo htmlQuotes($therecord["state"])?>" size="2" maxlength="2" tabindex="16" />
						</label>
					</td>
					<td nowrap>
						<label for="postalcode">zip/postal code<br>
							<input name="postalcode" type="text" id="postalcode" value="<?php echo htmlQuotes($therecord["postalcode"])?>" size="12" maxlength="15" tabindex="17"/>
						</label>
					</td>
				</tr>
			</table>
			<label for="country" >country<br>
				<input id="country" name="country" type="text" value="<?PHP echo htmlQuotes($therecord["country"])?>" size="44" maxlength="128" tabindex="18"/>
			</label>
		</fieldset>
		
		<fieldset>
			<legend><label for="shiptoaddress1">shipping address</label></legend>
			<div class="small">(if different from billing/main address)</div>
			<div>
				<input id="shiptoaddress1" name="shiptoaddress1" type="text" size="71" maxlength="128" value="<?PHP echo htmlQuotes($therecord["shiptoaddress1"])?>" tabindex="19" /><br>
				<input id="shiptoaddress2" name="shiptoaddress2" type="text" size="71" maxlength="128" style="margin-top:2px;" value="<?PHP echo htmlQuotes($therecord["shiptoaddress2"])?>" tabindex="20"/>
			</div>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td nowrap>
						<label for="shiptocity">city<br>
							<input id="shiptocity" name="shiptocity" type="text" value="<?php echo htmlQuotes($therecord["shiptocity"])?>" size="35" maxlength="64" tabindex="21"/>
						</label>
					</td><td nowrap >
						<label for="shiptostate">state/province<br>
							<input id="shiptostate" name="shiptostate" type="text" value="<?php echo htmlQuotes($therecord["shiptostate"])?>" size="2" maxlength="2" tabindex="22"/>
						</label>
					</td><td nowrap>
						<label for="shiptopostalcode">zip/postal code<br>
							<input id="shiptopostalcode" name="shiptopostalcode" type="text" value="<?php echo htmlQuotes($therecord["shiptopostalcode"])?>" size="12" maxlength="15" tabindex="23"/>
						</label>
					</td>
				</tr>
			</table>
			<label for="shiptocountry">country<br>
				<input id="shiptocountry" name="shiptocountry" type="text" value="<?PHP echo htmlQuotes($therecord["shiptocountry"])?>" size="44" maxlength="128" tabindex="24"/>
			</label>
		</fieldset>
	</div><?php include("../../include/createmodifiedby.php"); ?>
	</div>
	<?php include("../../footer.php")?>
</form>
</body>
</html>

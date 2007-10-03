<?php 
	
	include("../../include/session.php");	
	
	class receiptARItemAjax{
	
		function receiptARItemAjax($db){
			
			$this->db = $db;
			
		}//end method
	
		
		function getItemsByClient($clientid){
		
			$querystatement = "
				SELECT
					id,
					relatedid,
					itemdate,
					`type`,
					amount,
					paid
				FROM
					aritems
				WHERE
					`status` = 'open'
					AND clientid = ".((int) $clientid)."
					AND posted = 1
				ORDER BY
					itemdate";
					
			return $this->db->query($querystatement);
		
		}//end method


		function getItemByID($aritemid){
		
			$querystatement = "
				SELECT
					id,
					relatedid,
					itemdate,
					`type`,
					amount,
					paid
				FROM
					aritems
				WHERE
					id = ".((int) $aritemid)."
				ORDER BY
					itemdate";
					
			return $this->db->query($querystatement);
		
		}//end method
		
		
		function outputItemsJSON($queryresult){
		
			$jsonOutput = "{\n";
			$count = 1;
			
			while($therecord = $this->db->fetchArray($queryresult)){
				
				$jsonOutput .= "\titem".$count.": {\n";
				
				foreach($therecord as $key=>$value){

					$jsonOutput .= "\t\t".$key.":";

					switch($key){
					
						case "itemdate":
						case "type":
							$jsonOutput .= "'".$value."',\n";
							break;
							
						default:
							$jsonOutput .= $value.",\n";
					
					}//endswitch
					
				}//endforeach

				$jsonOutput = substr($jsonOutput, 0, strlen($jsonOutput)-2);
				
				$jsonOutput .= "\n\t},\n";
			
				$count++;
				
			}//endwhile
			
			if(strlen($jsonOutput) > 2)
				$jsonOutput = substr($jsonOutput, 0, strlen($jsonOutput)-2);
			
			$jsonOutput .= "\n}";
			
			return $jsonOutput;
		
		}//end method


		function _showOpenARSelect($clientid, $type){
			
			$querystatement = "
				SELECT
					id,
					amount,
					paid,
					relatedid,
					itemdate
				FROM
					aritems
				WHERE
					`status` = 'open'
					AND clientid = ".((int) $clientid)."
					AND `type` = '".$type."'
					AND posted = 1
				ORDER BY					
					";
				
				if($type == "deposit")
					$querystatement .= "itemdate";
				else
					$querystatement .= "relatedid";
								
			$queryresult = $this->db->query($querystatement);
			
			if($this->db->numRows($queryresult)){
				?><select id="newItem<?php echo str_replace(" ","",ucwords($type)) ?>ARID">
					<?php 

					while($therecord = $this->db->fetchArray($queryresult)){
					
						?><option value="<?php echo $therecord["id"]?>"><?php 
							
							if($therecord["relatedid"])
								echo $therecord["relatedid"].": ";
								
							echo formatFromSQLDate($therecord["itemdate"])." ";
							echo formatVariable($therecord["amount"], "currency");
							
							if($therecord["paid"] != 0)
								echo " (".formatVariable(((real) $therecord["amount"]) - ((real) $therecord["paid"]), "currency").")";								
							
						?></option><?php 
						
					}//endwhile 

					?>
				</select><?php
			} else {
			
				?><p class="disabledtext">No existing open <?php echo $type ?> AR items found for client.</p><?php
				
			} // endif
			
		}//end method
		

		function getAddNewDialog($clientid){
			
			include("include/fields.php");			
			
			
			?>
			<fieldset>
				<legend>type</legend>

				<p> 
					<select id="newItemType">
						<option value="deposit">deposit</option>
						<option value="invoice">invoice</option>
						<option value="service charge">service charge</option>
					</select>
				</p>

			</fieldset>
			
			<fieldset id="newItemDepositFieldset">
				<legend>Deposits</legend>
				
				<p id="newItemDepositNewP">
					<input type="radio" class="radiochecks" name="newItemDepositType" id="newItemDepositNew" checked="checked"/>
					<label for="newItemDepositNew">new</label>
				</p>
				
				<p id="newItemDepositExistingP">
					<input type="radio" class="radiochecks" name="newItemDepositType" id="newItemDepositExisting"/>
					<label for="newItemDepositExisting">existing deposit</label>
				</p>

				<p id="newItemExisingListP">
					<?php $this->_showOpenARSelect($clientid, "deposit"); ?>
				</p>
			</fieldset>
			
			<fieldset id="newItemInvoiceFieldset">
				<legend>Invoice AR Items</legend>
				<p>
					<?php $this->_showOpenARSelect($clientid, "invoice"); ?>
				</p>
			</fieldset>
			
			<fieldset id="newItemServiceChargeFieldset">
				<legend>Service Charges</legend>
				<p>
					<?php $this->_showOpenARSelect($clientid, "service charge"); ?>
				</p>
			</fieldset>
			
			<p class="standout" id="newItemMessage">&nbsp;</p>

			<p align="right">
				<button type="button" id="newItemLoadButton" class="Buttons">add</button>
				<button type="button" id="newItemCancelButton" class="Buttons">cancel</button>
			</p>
			<?php
			
		}
	}//end class

	
//PROCESSOR
//=============================================================================	
	if(isset($_GET["cm"])){
		
		$processor = new receiptARItemAjax($db);
		if(!isset($_GET["cid"]))
			$_GET["cid"] =0;
			
		switch($_GET["cm"]){
		
			case "getAllOpen":

				$result = $processor->getItemsByClient($_GET["cid"]);
				echo $processor->outputItemsJSON($result);
				break;
				
			case "getAddNewDialog":

				$processor->getAddNewDialog($_GET["cid"]);				
				break;
				
			case "getARItem":
			
				if(!isset($_GET["arid"]))
					$_GET["arid"] = 0;

				$result = $processor->getItemByID($_GET["arid"]);
				echo $processor->outputItemsJSON($result);
				break;
					
		}//endswitch
				
	}//end if
?>
<?php
/*
 $Rev: 346 $ | $LastChangedBy: brieb $
 $LastChangedDate: 2007-10-20 13:44:04 -0600 (Sat, 20 Oct 2007) $
 +-------------------------------------------------------------------------+
 | Copyright (c) 2004 - 2010, Kreotek LLC                                  |
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
	require_once("../../include/search_class.php");
	include("include/clients_addresses.php");

	if(isset($_GET["refid"])) $_GET["id"]=$_GET["refid"];
	if(!isset($_GET["id"])) $error = new appError(300,"Passed variable not set (id)");

	$clientAddress = new clientAddress($db, $_GET["id"]);

	$pageTitle = $clientAddress->getPageTitle();

	// clients table definition uuid
	$reftableid = "tbld:6d290174-8b73-e199-fe6c-bcf3d4b61083";

  	$whereclause = "
		tabledefid = '".$reftableid."'
		AND recordid = '".$clientAddress->clientuuid."'";

	$backurl="../bms/clients_addresses.php";
	$base="../../";

	$displayTable= new displaySearchTable($db);
	$displayTable->base = $base;
	$displayTable->initialize("tbld:e3ce122f-7c43-cfca-fd32-11c663567a2a");
	$displayTable->querywhereclause = $whereclause;

	if(isset($_POST["deleteCommand"]))
		if($_POST["deleteCommand"]) $_POST["command"] = $_POST["deleteCommand"];

	if(!isset($_POST["othercommands"])) $_POST["othercommands"]="";
		if($_POST["othercommands"]) $_POST["command"]="other";

	if(isset($_POST["command"])){

		switch($_POST["command"]){

			case "delete":
				//=====================================================================================================

				$_POST["othercommands"] = -1;

			case "other":
				$displayTable->recordoffset=0;
				// process table specific commands (passed by settings)
				//=====================================================================================================
				$theids=explode(",",$_POST["theids"]);

				include_once("modules/bms/include/addresstorecord.php");

				//next, see if the searchclass exists
				if(class_exists($displayTable->thetabledef["maintable"]."SearchFunctions")){
					$classname = $displayTable->thetabledef["maintable"]."SearchFunctions";
					$searchFunctions = new $classname($db,$displayTable->thetabledef["uuid"],$theids);
				} else
					$searchFunctions = new searchFunctions($db,$displayTable->thetabledef["uuid"],$theids);

				//grab the method name
				if(((int) $_POST["othercommands"]) === -1)
					$functionname = "delete_record";
				else {
					$querystatement = "SELECT name FROM tableoptions WHERE id=".((int) $_POST["othercommands"]);
					$queryresult = $db->query($querystatement);
					$therecord = $db->fetchArray($queryresult);
					$functionname = $therecord["name"];
				}

				if(method_exists($searchFunctions,$functionname))
					$statusmessage = $searchFunctions->$functionname();
				else
					$statusmessage = "Function ".$functionname." not defined";

			break;

			case "omit":
				// omit selected from current query
				//=====================================================================================================
				$displayTable->recordoffset=0;
				$tempwhere="";
				$theids=explode(",",$_POST["theids"]);
				foreach($theids as $theid){
					$tempwhere.=" or ".$displayTable->thetabledef["maintable"].".id=".$theid;
				}
				$tempwhere=substr($tempwhere,3);
				$displayTable->querywhereclause="(".$displayTable->querywhereclause.") and not (".$tempwhere.")";
			break;

			case "keep":
				// keep only those ids
				//=====================================================================================================
				$displayTable->recordoffset=0;
				$tempwhere="";
				$theids=explode(",",$_POST["theids"]);
				foreach($theids as $theid){
					$tempwhere.=" or ".$displayTable->thetabledef["maintable"].".id=".$theid;
				}
				$tempwhere=substr($tempwhere,3);
				$displayTable->querywhereclause=$tempwhere;
			break;

		}//end switch

	}//endif

	//on the fly sorting... this needs to be done after command processing or the querystatement will not work.
	if(!isset($_POST["newsort"])) $_POST["newsort"]="";
	if(!isset($_POST["desc"])) $_POST["desc"]="";

	if($_POST["newsort"]!="") {
		//$displayTable->setSort($_POST["newsort"]);
		foreach ($displayTable->thecolumns as $therow){
			if ($_POST["newsort"]==$therow["name"]) $therow["sortorder"]? $displayTable->querysortorder=$therow["sortorder"] : $displayTable->querysortorder=$therow["column"];
		}
		$_POST["startnum"]=1;
	} elseif($_POST["desc"]!="")  $displayTable->querysortorder.=" DESC";

	if($displayTable->querytype!="new" and $displayTable->querytype!="edit") {

		//record offset?
		if(isset($_POST["offset"])) if($_POST["offset"]!="") $displayTable->recordoffset=$_POST["offset"];

		$displayTable->issueQuery();

		$phpbms->cssIncludes[] = "pages/search.css";
		$phpbms->cssIncludes[] = "pages/bms/clientaddresses.css";
		$phpbms->jsIncludes[] = "common/javascript/queryfunctions.js";
		$phpbms->topJS[] = 'xtraParamaters="backurl="+encodeURIComponent("'.$backurl.'")+String.fromCharCode(38)+"tabledefid="+encodeURIComponent("'.$reftableid.'")+String.fromCharCode(38)+"refid="+encodeURIComponent("'.$clientAddress->clientid.'");';

		include("header.php");

		$phpbms->showTabs("clients entry", "tab:625192d0-00e6-ae2c-5b8c-f433bbf6e546", ((int) $_GET["id"]));?><div class="bodyline">

			<h1 id="h1Title"><?php echo $pageTitle?></h1>

			<form name="search" id="search" action="<?php echo htmlentities($_SERVER["REQUEST_URI"])?>" method="post" onsubmit="setSelIDs(this);return true;">
			<input name="command" id="reset" type="submit"/>
			<input name="theids" id="theids" type="hidden"  />
			<?php
				$displayTable->displayQueryButtons();

				$displayTable->displayResultTable();
			?>
			</form>

		</div>
	<?php include("footer.php"); }//end if -> querytype?>

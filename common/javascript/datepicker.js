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

function showDP(base,dateFieldID){
	var dateField= getObjectFromID(dateFieldID);
	
	//check to see if a nother box is already showing
	var alreadybox=getObjectFromID("DPCancel");
	if(alreadybox) closeDPBox();

	//get positioning
	var thetop=getTop(dateField)+dateField.offsetHeight;
	var theleft=getLeft(dateField);
	if (theleft+140 > window.innerWidth)
		theleft= theleft-140+dateField.offsetWidth-15;

	showDP.box=document.createElement("div");
	showDP.box.className="bodyline";
	showDP.box.style.siplay="block";
	showDP.box.style.position="absolute";
	showDP.box.style.top=thetop + "px";
	showDP.box.style.left=theleft + "px";
	
	showDP.datefieldID=dateFieldID;
	
	if(dateField.value){
		selDate=stringToDate(dateField.value);
		year=selDate.getFullYear();
		month=selDate.getMonth()+1;
	} else{		
		selDate=null;
		tdate=new Date();
		year=tdate.getFullYear();
		month=tdate.getMonth()+1;
	}
	loadMonth(base,month,year,dateField.value);
	hideSelectBoxes();
	document.body.appendChild(showDP.box);
}

function loadMonth(base,month,year,selectedDate){
	var content="<div align=\"center\"><img src=\""+base+"common/image/spinner.gif\" alt=\"0\" width=\"16\" height=\"16\" align=\"absmiddle\"> <strong>Loading...</strong></div>";	
	showDP.box.innerHTML=content;
	var theURL=base+"datepicker.php?cm=shw";
	theURL+="&m="+encodeURIComponent(month);
	theURL+="&y="+encodeURIComponent(year);
	if (selectedDate){
		tempdate=stringToDate(selectedDate);
		theURL+="&sd="+encodeURIComponent(tempdate.getFullYear()+"-"+(tempdate.getMonth()+1)+"-"+tempdate.getDate());
	}
	loadXMLDoc(theURL,null,false);
	showDP.box.innerHTML=req.responseText;	
}


function closeDPBox(){
	document.body.removeChild(showDP.box);
	displaySelectBoxes();
	showDP.box=null;	
	showDP.datefieldID=null;	
}

function dpClickDay(year,month,day){
	var thefield=getObjectFromID(showDP.datefieldID);
	var thedate=new Date(parseInt(year),parseInt(month)-1,parseInt(day));
	thefield.value=dateToString(thedate);
	if(thefield.onchange) thefield.onchange.call(thefield);
	closeDPBox();
}

function dpHighlightDay(year,month,day){
	var displayinfo=getObjectFromID("dpExp");
	var months=Array("January","February","March","April","May","June","July","August","September","October","November","December");
	displayinfo.innerHTML=months[month-1]+" "+day+", "+year;
}

function dpUnhighlightDay(){
	var displayinfo=getObjectFromID("dpExp");
	displayinfo.innerHTML=displayLongDate;
}

function stringToDate(sDate){
	var sep="/";
	var month=sDate.substring(0,sDate.indexOf(sep))
	var day=sDate.substring(sDate.indexOf(sep)+1,sDate.indexOf(sep,sDate.indexOf(sep)+1))
	var year=sDate.substring(sDate.lastIndexOf(sep)+1);
	year=parseInt(year);
	if(year<100) year+=2000;
	return new Date(year,parseInt(month,10)-1,parseInt(day,10));
}

function mysqlstringToDate(sDate){
	var sep="-";
	var year=sDate.substring(0,sDate.indexOf(sep))
	var month=sDate.substring(sDate.indexOf(sep)+1,sDate.indexOf(sep,sDate.indexOf(sep)+1))
	var day=sDate.substring(sDate.lastIndexOf(sep)+1);
	
	return Date(year,month,day);
}

function dateToString(thedate){
	var sep="/";
	return (thedate.getMonth()+1)+sep+thedate.getDate()+sep+thedate.getFullYear();
}

function formatDateField(thefield){
	if(validateDate(thefield.value)){
		thefield.value=thefield.value.replace(/\-/g,"/");
		var thedate=stringToDate(thefield.value);
		thefield.value=dateToString(thedate);
	} else
	thefield.value="";
}
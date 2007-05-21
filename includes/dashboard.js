//AUTHOR: 		LUIS MAJANO
//DESCRIPTION: 	MAIN JS FILE FOR THE DASHBOARD.
//


//********************************************************************************
//AJAX LOADER JS
//********************************************************************************
function lon(){
	try{
		$("#myloader").fadeIn("slow");
	}
	catch(err){null;}
}
function loff(){
	try{
		$("#myloader").fadeOut("slow");
	}
	catch(err){null;}
}

//********************************************************************************
//DIV EFFECTS
//********************************************************************************
function divon(divid){
	$("#"+divid).fadeIn("slow");
}
function divoff(divid){
	$("#"+divid).fadeOut("slow");
}
function cleardiv(id) {
	$("#"+id).empty();
}
function rollover(img){
	$("#"+img).attr("src", $("#"+img).attr('srcon') );
}
function rollout(img){
	$("#"+img).attr("src", $("#"+img).attr('srcoff') );
}
function helpToggle(){
	$("#helpbox").slideToggle("slow");
}
//********************************************************************************
//AJAX INTERACTION
//********************************************************************************
function doFormEvent (e, targetID, frm) {
	var params = {};
	for(i=0;i<frm.length;i++) {
		if(!(frm[i].type=="radio" && !frm[i].checked) && frm[i].value != undefined)  {
			params[frm[i].name] = frm[i].value;
		}
	}
	doEvent(e, targetID, params, "POST");
}

function doEvent (e, targetID, params, methodType, onComplete ) {
	//set event
	var pars = "event=" + e + "&";
	//Try to turn top frame.
	try{parent.topframe.lon();} catch(err){null;}
	//Check for Method.
	var methodType = (methodType == null) ? "GET" : methodType;
	//onComplete
	var onComplete = (onComplete == null) ? h_onComplete : onComplete;
	//parse params
	for(p in params) pars = pars + p + "=" + escape(params[p]) + "&";
	//BlockUI
	blockui();
	//do Ajax Updater
	$.ajax( {type: methodType, 
		     url:"index.cfm",
		     dataType:"html",
		     data: pars,
		     error: h_callError,
		     complete: h_onComplete,
		     success: function(req){
		     	$("#"+targetID).html(req)}
	});
}

function doEventNOUI(e, targetID, params, methodType, onComplete){
	//set event
	var pars = "event=" + e + "&";
	//Try to turn top frame.
	try{parent.topframe.lon();} catch(err){null;}
	//Check for Method.
	var methodType = (methodType == null) ? "GET" : methodType;
	//onComplete
	var onComplete = (onComplete == null) ? h_onCompleteNOUI : onComplete;
	//parse params
	for(p in params) pars = pars + p + "=" + escape(params[p]) + "&";
	//do Ajax Updater
	$.ajax( {type: methodType, 
		     url:"index.cfm",
		     dataType:"html",
		     data: pars,
		     error: h_callError,
		     complete: h_onComplete,
		     success: function(req){
		     	$("#"+targetID).html(req)}
	});
}

function blockui(){
	//BlockUI
	$.extend($.blockUI.defaults.overlayCSS, { backgroundColor: '#000000'});
	$.blockUI.defaults.pageMessage = "<h3>Please wait...</h3>";
	$.blockUI( { backgroundColor: '#000000', color: '#fff', border:'1px outset #eaeaea'} );
}
function h_onComplete(){
	try{ parent.topframe.loff();}
	catch(err){null;}
	//unblockUI
	$.unblockUI();
}
function h_onCompleteNOUI(){
	try{ parent.topframe.loff();}
	catch(err){null;}
}
function h_callError(request) {
	alert('Sorry. An error ocurred while calling a server side component. Please try again.');
}


//********************************************************************************
//INTERACTION
//********************************************************************************
function validateLogout(){
	if ( confirm("Do your really want to exit the ColdBox Dashboard?") ){
		parent.topframe.lon();
		blockui();
		return true;
	}
	return false;
}
function framebuster(){
	if ( top != self )
		top.location=self.location;	
}
function resetHint(){
	$("#sidemenu_help").html("Help tips will be shown here. Just rollover certain areas or links and you will get some quick tips.");
}
function confirmit(){
	if ( confirm ("Do you want to commit these changes to the framework.") )
		return true;
	else
		return false;
}
function doUpdater(){
	$("#button_check").attr("disabled",true);
	$('#checkloader').fadeIn();
}
function showReadme(divid){
	//cbReadme
	$("#"+divid).jqm({
		modal:false,
		onShow: function(h) {h.w.fadeIn("fast");},
        onHide: function(h) {h.w.fadeOut("fast");h.o.remove();}
        }).jqDrag('.updatertext_header');
    $('#'+divid).jqm().jqmShow();
}
function closeReadme(divid){
	$("#"+divid).jqm().jqmHide()
}


//********************************************************************************
//FILE BROWSER JS
var selectDirectoryHistoryID = "";
function openServerBrowser( vEvent, vCallbackInput ){
	//Render Server Browser
	doEventNOUI(vEvent,'server_browser',{callBackItem:vCallbackInput},"POST", openBrowserDialog() );
}
function openBrowserDialog(){
	 $(".server_browser").jqm({
		modal: true,
		onShow: function(h) {h.w.fadeIn();},
        onHide: function(h) {h.w.fadeOut();h.o.remove();}
        });
    //Open Server Browser.
	$(".server_browser").jqm().jqmShow();
}
function closeBrowser(){
	$(".server_browser").jqm().jqmHide();
}
function selectdirectory( vdir , vFullUrl){
	var selectedDir = vdir;
	
	$("#selecteddir").val(vFullUrl);
	$("#span_selectedfolder").html(selectedDir);
	$("#sb_selectdir_btn").attr("disabled",false);
	
	//Color Pattern
	if ( selectDirectoryHistoryID != ""){
		try{$("#"+selectDirectoryHistoryID).css("backgroundColor", '#ffffff');}
		catch(err){null;}
		$("#"+vdir).css("backgroundColor", '#b3cbff');
		selectDirectoryHistoryID = vdir;
	}
	else{
		$("#"+vdir).css("backgroundColor", '#b3cbff');
		selectDirectoryHistoryID = vdir;
	}
}
function newFolder( vEvent, vcurrentRoot ){
	var vNewFolder = prompt("Please enter the name of the folder to create:");
	if (vNewFolder == ""){ 
		alert("Please enter a valid name");
	}
	else if (vNewFolder){
		doEventNOUI(vEvent,'server_browser',{dir:vcurrentRoot,newfolder:vNewFolder});
	}
}
function chooseFolder( vcallbackItem ){
	$("#"+vcallbackItem).val( $("#selecteddir").val() );
	closeBrowser();
}


//********************************************************************************
//APP GENERATOR
//********************************************************************************
function toggleBugReportEmails(){
	if ( $("#enablebugreports").val() == 'true' )
		$('#tr_bugreportEmails').show();
	else
		$('#tr_bugreportEmails').hide();
}
function toggleLogsLocation(){
	if ( $("#coldboxlogging").val() == 'true' )
		$('#tr_coldboxlogslocation').show();
	else
		$('#tr_coldboxlogslocation').hide();
}
function addemail(){
	var vemail = $("#bugemailadd").val();
	var oBugEmails = document.getElementById('bugemails');
	var oldLength = oBugEmails.options.length;
	
	if ( vemail == "") alert("Please enter a valid email");
	else{
		if ( oldLength == 0 ){
			newLength = 0;
		}
		oBugEmails.options.length = oldLength + 1;
		oBugEmails.options[oldLength] = new Option(vemail,vemail);
		$("#bugemailadd").val('');
	}
}

function removeemail(){
	var oBugEmails = document.getElementById('bugemails');
	var lgth = oBugEmails.options.length - 1;
	var sel = oBugEmails.selectedIndex;
	 
	if ( sel < 0 )
		alert ("Please select a valid email to remove");
	else{
	 	oBugEmails.options[sel] = null;
		oBugEmails.options.length = lgth;
	}
}

function addDevURL(){
	var vurl = $("#devurladd").val();
	var odevurls = document.getElementById('devurls');
	var oldLength = odevurls.options.length;
	
	if ( vurl == "") 
		alert("Please enter a valid dev url snippet");
	else{
		odevurls.options.length = oldLength + 1;
		odevurls.options[oldLength] = new Option(vurl,vurl);
		$("#devurladd").val('');
	}
}

function removeDevURL(){
	var odevurls = document.getElementById('devurls');
	var lgth = odevurls.options.length - 1;
	var sel = odevurls.selectedIndex;
 
 	if ( sel < 0 )
 		alert ("Please select a valid dev url to remove");
 	else{
 		odevurls.options[sel] = null;
 		odevurls.options.length = lgth;
 	}
}

function validateGeneration(vEvent){
	var errors = false;
	$(".required").each(function(i){
		if ( this.value == '' ){
			errors = true;
		}
	});
	
	if ( errors ){
		alert("Please fill out all the necessary fields");
	}
	else{
		//select all of devurls
		alert($("#devurls").val());
		myForm = document.getElementById("updateform");
		doFormEvent(vEvent,'content', myForm);
	}
}


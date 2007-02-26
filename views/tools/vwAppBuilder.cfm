<cfoutput><!--- HELPBOX ---><div id="helpbox" class="helpbox" style="display: none">	<div class="helpbox_header">	  <div class="helpbox_header_title"><img src="images/icons/icon_guide_help.gif" align="absmiddle"> Help Tip</div>	</div>		<div class="helpbox_message" >	  <ul>	  	<li>You will be asked all the necessary information to build a new ColdBox application skeleton.  You can	  	then continue building your application without worrying about the main layout and the setup of the config	  	file.</li>	  	<li>Make sure that the destination directory is write enabled and you have access to it.</li>	  	<li>Look at the rollover help for useful tips on the sections.</li>	  	<li>Some entries are already filled out for you. This is done with the intention of creating a standard on	  	some of the layouts.</li>	  	<li>Just fill out each section and continue, until you finish all the wizard sections. You will then	  	be able to generate the application skeleton.</li>	  	<li><strong>Event Handlers:</strong> The generator will create one event handler for you (Main Event Handler)	  	where you will have your default event method, onApplicationStart, onRequestStart, onRequestEnd and onException methods, if you decided to generate them.	  	You can then continue to add methods to your event handler or decide to create more.</li>	  </ul>	</div>	<div align="right" style="margin-right:5px;">	<input type="button" value="Close" onClick="helpoff()" style="font-size:9px">	</div></div><!--- FileBrowser Content ---><div id="FileBrowserContainer" style="position:absolute;background-color: ##ddd;width:580px;height:360px;margin-left:auto;margin-right:auto;display:none;border:2px outset ##999"></div><!--- /END OF FILEBROWSER ---><form name="updateform" id="udpateform" action="javascript:doFormEvent('#requestContext.getValue("xehGenerate")#','content',document.updateform)" onSubmit="return validateGeneration()" method="post"><div class="maincontentbox">		<!--- MESSAGEBOX --->	#getPlugin("messagebox").renderit()#		<!--- HEADER TITLE --->	<div class="contentboxes_header">		<div class="contentboxes_title"><img src="images/icons/appbuilder_icon.gif" align="absmiddle" />&nbsp; ColdBox Application Builder</div>	</div>		<!--- CONTENT --->	<div class="contentboxes">	<p>Welcome to the ColdBox Application Builder. You will be able to generate a working application in 6 easy steps. 	Please fill out all the necessary fields in all the sections that will be displayed below.</p>		<!--- STEP MENU --->	<div class="menu_appgenerator">		<div class="menu_appgenerator_step_on" 	id="step_basic_set">^Step 1</div>		<div class="menu_appgenerator_step" 	id="step_applicationloggin_set">Step 2</div>		<div class="menu_appgenerator_step" 	id="step_development_set">Step 3</div>		<div class="menu_appgenerator_step" 	id="step_webservices_set">Step 4</div>		<div class="menu_appgenerator_step" 	id="step_eventhandler_set">Step 5</div>		<div class="menu_appgenerator_step" 	id="step_generation_set">Step 6</div>						</div>	<br><br><br>		<!--- ************************************************************* --->	<!--- STEP 1: BASIC CONFIGURATIONS SET --->	<!--- ************************************************************* --->	#renderView("tools/vwAppBuilder_step1")#    <!--- ************************************************************* --->           <!--- ************************************************************* --->    <!--- STEP 2: APPLICATION LOGGING SET --->    <!--- ************************************************************* --->       #renderView("tools/vwAppBuilder_step2")#             <!--- ************************************************************* --->    <!--- STEP 3: DEVELOPMENT SET --->    <!--- ************************************************************* --->    #renderView("tools/vwAppBuilder_step3")#                 <!--- ************************************************************* --->        <!--- STEP 4: WEBSERVICES SET --->        <!--- ************************************************************* --->        <div  id="webservices_set"  style="display: none">        <fieldset >        <Br>	    <legend><strong>Web Services</strong></legend>	    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="tablelisting">		 		  <tr>	     <td colspan="2"><hr size="1">	     Please enter any web services that you might you for this application. Else leave blank and continue.	     </td>	     </tr>	     		  <tr bgcolor="##ffffff" onMouseOver="getHint('wsname')" onMouseOut="resetHint()">	     	<td align="right" width="40%"  style="border-right:1px solid ##ddd">	     	<strong>Web Service Name </strong><br />(A name you will use to call this web service)	     	</td>	     	<td>	     	<input type="text" name="wsname" id="wsname" value="" size="20">	     	</td>	     </tr>	     	     <tr onMouseOver="getHint('wsdlpro')" onMouseOut="resetHint()">	     	<td align="right"  style="border-right:1px solid ##ddd">	     	<strong>WSDL URL:</strong><br />(Production URL)	     	</td>	     	<td>	     	<input type="text" name="wsdlpro" id="wsdlpro" value="" size="40">	     	</td>	     </tr>		      	     <tr bgcolor="##ffffff" onMouseOver="getHint('wsdldev')" onMouseOut="resetHint()">	     	<td align="right"  style="border-right:1px solid ##ddd">	     	<strong>Development WDSL URL</strong><br />(Leave blank if same as above.)	     	</td>	     	<td>	     	<input type="text" name="wsdldev" id="wsdldev" value="" size="40">	     	</td>	     </tr>	     	     <tr>	     	<td colspan="2" align="center">	     	 <input type="button" name="removews_btn" value="Remove" onclick="removeWebservice()" />&nbsp;	     	 <input type="button" name="wsadd_btn" value="Add Web Service" onClick="addWebservice()">	     	</td>	     </tr>	 	     	     <tr bgcolor="##ffffff">	     	<td align="right"  style="border-right:1px solid ##ddd">	     	<strong>Web Services Defined</strong>	     	</td>	     	<td>	     	  <select name="webservices" size="5" id="webservices" style="width: 250px">			  </select>			 	     	</td>	     </tr>	     	             </table>         <!--- Required Fields --->        <div class="redtext">* Required Fields</div>         <!--- Navigation --->        <div align="right">        <input type="button" name="next_btn" value="<< Previous" onClick="stepper('webservices_set','development_set','backward')" > &nbsp;        <input type="button" name="next_btn" value="Next >>" onClick="stepper('webservices_set','eventhandler_set','forward')">        </div>        </fieldset>        </div>        <!--- ************************************************************* --->                <!--- ************************************************************* --->        <!--- STEP 5: EVENT HANDLER SET --->        <!--- ************************************************************* --->        <div  id="eventhandler_set" style="display: none">        <fieldset>         <Br>	    <legend><strong>Event Handler Declarations</strong></legend>	    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="tablelisting">		 		 <tr>	     	<td colspan="2">	     	Please fill out the name of the main event handler. This is the name of the component. Then fill out the name of the	     	default event in event handler syntax.<br />	     	<strong>Syntax: eh{Name}.(dsp|do|on){method}</strong>	     	</td>	     		     </tr>		     		 <tr onMouseOver="getHint('maineventhandler')"  onMouseOut="resetHint()" title="">	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">	     	<strong>Main Event Handler<span class="redtext">*</span></strong><br />(This event handler will be generated for you.)	     	</td>	     	<td>	     	<input type="text" name="maineventhandler" id="maineventhandler" value="ehGeneral" size="20" onKeyup="changeallHandlers()">	     	</td>	     </tr>		     	      	     <tr bgcolor="##ffffff" onMouseOver="getHint('defaultevent')" onMouseOut="resetHint()">	     	<td align="right"  style="border-right:1px solid ##ddd">	     	<strong>Default Event <span class="redtext">*</span></strong><br />(Event fired as default: dspHome,doStart)	     	</td>	     	<td>	     	<span id="defaultevent_handler" style="font-weight:bold;">ehGeneral.</span>&nbsp;<input type="text" name="defaultevent" id="defaultevent" value="dspHome" size="20">	     		     	</td>	     </tr>	     	     <tr>	     <td colspan="2"><hr size="1">	     If you will not be using some of the handlers below, just leave them unchecked. Once you click on a checkbox, the name	     of the method will be displayed on the box and generated on your main event handler.	     </td>	     </tr>	     	     <tr onMouseOver="getHint('onapplicationstart')" onMouseOut="resetHint()">	     	<td align="right"  style="border-right:1px solid ##ddd" >	     	<strong>On Application Start Event</strong><br />(Leave unchecked if not used.)                                     	     	</td>	     	<td>	     	<input type="checkbox" name="onapplicationstart_cb" id="onapplicationstart_cb" onclick="toggleHandlers(this.checked,'onapplicationstart','onApplicationStart')">Yes	     	<input type="text" name="onapplicationstart" id="onapplicationstart" value="" size="25" readonly="true">	     	</td>	     </tr>	 	     	     <tr bgcolor="##ffffff" onMouseOver="getHint('onrequeststart')" onMouseOut="resetHint()">	     	<td align="right"  style="border-right:1px solid ##ddd">	     	<strong>On Request Start Event</strong><br /><br />(Leave unchecked if not used.)   	     	</td>	     	<td>	     	<input type="checkbox" name="onrequeststart_cb" id="onrequeststart_cb" onclick="toggleHandlers(this.checked,'onrequeststart','onRequestStart')">Yes	     	<input type="text" name="onrequeststart" id="onrequeststart" value="" size="25" readonly="true">	     	</td>	     </tr>	     	     <tr onMouseOver="getHint('onrequestend')" onMouseOut="resetHint()">	     	<td align="right"  style="border-right:1px solid ##ddd" >	     	<strong>On Request End Start</strong><br />(Leave unchecked if not used.)                                  	     	</td>	     	<td>	     	<input type="checkbox" name="onrequestend_cb" id="onrequestend_cb" onclick="toggleHandlers(this.checked,'onrequestend','onRequestEnd')">Yes	     	<input type="text" name="onrequestend" id="onrequestend" value="" size="25" readonly="true">	     	</td>	     </tr>	 	     	     <tr bgcolor="##ffffff" onMouseOver="getHint('onexception')" onMouseOut="resetHint()">	     	<td align="right"  style="border-right:1px solid ##ddd">	     	<strong>On Exception Event </strong><br /><br />(Leave unchecked if not used.)   	     	</td>	     	<td>	     	<input type="checkbox" name="onexception_cb" id="onexception_cb" onclick="toggleHandlers(this.checked,'onexception','onException')">Yes	     	<input type="text" name="onexception" id="onexception" value="" size="25" readonly="true">	     	</td>	     </tr>	             </table>         <!--- Required Fields --->        <div class="redtext">* Required Fields</div>        <!--- Navigation --->        <div align="right" style="margin-right:5px;margin-bottom: 10px">        <input type="button" name="next_btn" value="<< Previous" onClick="stepper('eventhandler_set','webservices_set','backward')"> &nbsp;		<input type="button" name="next_btn" value="Next >>" onClick="return validate_eventhandlers()" >		</div>        </fieldset>        </div>                 <!--- ************************************************************* --->        <!--- STEP 6: GENERATION STEP --->        <!--- ************************************************************* --->        <div  id="generation_set" style="display: none">        <fieldset>         <Br>	    <legend><strong>Application Generation Settings</strong></legend>	    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="tablelisting">		 		 <tr>	     	<td colspan="2">	     	Please fill out the name of the skeleton that will be saved and the location of where to place the 	     	generated application.	     	</td>	     		     </tr>		     	     <tr bgcolor="##ffffff">	     	<td align="right"  style="border-right:1px solid ##ddd">	     	<strong>Your Name <span class="redtext">*</span></strong><br> (Author of the Generation)	     	</td>	     	<td>	     	<input type="text" name="authorname" id="authorname" value="" size="20">	     	</td>	     </tr>	     		 <tr onMouseOver="getHint('skeleton_name')"  onMouseOut="resetHint()" title="">	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">	     	<strong>Skeleton Name<span class="redtext">*</span></strong>	     	</td>	     	<td>	     	<input type="text" name="skeleton_name" id="skeleton_name" value="" size="20" >	     	</td>	     </tr>		     	      	     <tr bgcolor="##ffffff" onMouseOver="getHint('generation_target')" onMouseOut="resetHint()">	     	<td align="right"  style="border-right:1px solid ##ddd">	     	<strong>Generation Target <span class="redtext">*</span></strong>	     	</td>	     	<td>	     	<input type="text" name="generation_target" id="generation_target" value="" size="40">	     	<a href="javascript:openBrowser('#requestContext.getValue("xehFileBrowser")#','generation_target')" title="Select from web root"><img id="generation_target_img" src="images/icons/folder.png" border="0" align="absmiddle"></a>	     	</td>	     </tr>	             </table>         <!--- Required Fields --->        <div class="redtext">* Required Fields</div>        <!--- Navigation --->        <div align="right" style="margin-right:5px;margin-bottom: 10px">        <input type="button" name="next_btn" value="<< Previous" onClick="stepper('generation_set','eventhandler_set','backward')"> &nbsp;		<input type="submit" value="Generate Application Skeleton" onClick="return validateGeneration()" >		</div>        </fieldset>        </div>                <!--- PLEASE WAIT DIV --->        <div id="pleasewait_div" align="center" style="margin:50px;display:none;" class="redtext">Please wait while generating application...</div>                		</div>	</div>		</div></form></cfoutput>
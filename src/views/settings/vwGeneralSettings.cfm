<cfoutput><!--- HELPBOX --->#renderView("tags/help")#<form name="updateform" id="updateform" action="javascript:doFormEvent('#Event.getValue("xehDoSave")#','content',document.updateform)" onSubmit="return confirmit()" method="post"><div class="maincontentbox">	<div class="contentboxes_header">		<div class="contentboxes_title"><img src="includes/images/icons/fileencoding_icon.gif" align="absmiddle" />&nbsp; General Settings</div>	</div>		<!--- Messagebox --->	#getPlugin("messagebox").renderit()#		<div class="contentboxes">	<p>Below are the ColdBox's general settings that you can change. Be very careful when changing the Coldspring bean factory	path, since this setting can affect any IoC application.	</p>	<br>		<div style="margin: 5px">	    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="tablelisting">	      	      <tr>			<th>Setting</th>			<th>Value</th>		  </tr>				 <tr bgcolor="##f5f5f5">	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">	     	<strong>Event Name</strong>	     	</td>	     	<td>	     	<input type="text" name="EventName" value="#rc.fwSettings.eventName#" size="20" maxlength="20">	     	</td>	     </tr>	     	     <tr>	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">	     	<strong>File Character Set</strong>	     	</td>	     	<td>	     	<select name="DefaultFileCharacterSet" style="width:100px">	     		<cfloop from="1" to="#listlen(rc.fwSettings.AvailableCFCharacterSets)#" index="counter">				<option value="#listgetat(rc.fwSettings.AvailableCFCharacterSets,counter)#"				<cfif listgetat(rc.fwSettings.AvailableCFCharacterSets,counter) eq rc.fwSettings.DefaultFileCharacterSet>selected</cfif>>#listgetat(rc.fwSettings.AvailableCFCharacterSets,counter)#</option>	     		</cfloop>	     	</select>			(Used by the Utilities plugin)	     	</td>	     </tr>	     <tr >	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">	     	<strong>Flash URL Persist Storage Scope</strong>	     	</td>	     	<td>	     	<select name="FlashURLPersistScope" style="width:100px">	     		<option value="session" <cfif rc.fwSettings.FlashURLPersistScope eq "session">selected</cfif>>Session</option>	     		<option value="client"  <cfif rc.fwSettings.FlashURLPersistScope eq "client">selected</cfif>>Client</option>	     	</select>	     	</td>	     </tr>     	     <tr bgcolor="##f5f5f5">	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">	     	<strong>Coldspring Bean Factory Path:</strong>	     	</td>	     	<td>	     	<input type="text" name="ColdspringBeanFactory" value="#rc.fwSettings.ColdspringBeanFactory#" size="50" maxlength="50">	     	</td>	     </tr>	     	      <tr >	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">	     	<strong>LightWire Bean Factory Path:</strong>	     	</td>	     	<td>	     	<input type="text" name="LightWireBeanFactory" value="#rc.fwSettings.LightWireBeanFactory#" size="50" maxlength="50">	     	</td>	     </tr>        </table>		</div>		<div align="center" style="margin-top:30px">			<a class="action" href="javascript:document.updateform.submit()" title="Submit Changes">				<span>Submit Changes</span>			</a>		</div>	</div></div></form></cfoutput>
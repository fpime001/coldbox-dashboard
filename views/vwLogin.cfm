<cfoutput><!--- Messagebox --->#getPlugin("messagebox").renderit()#<form id="loginform" name="loginform" method="post" action="index.cfm" onSubmit="lon()"><input type="hidden" name="event" value="#requestContext.getValue("xehLogin")#" /><div class="loginbox">	<div class="contentboxes_header">		<div class="contentboxes_title"><img src="images/icons/password_icon.gif" align="absbottom" />&nbsp; Dashboard Login</div>	</div>		<div class="contentboxes">	  <table width="550" border="0" align="center" cellpadding="3" cellspacing="0">		<tr>		  <td colspan="2">		  <p><strong>ColdBox Dashboard Version: #getSetting("version")#</strong>.&nbsp;<br><br>		  Please enter your administrator password below in order to log in. If you have no business here, then LEAVE.<br /><br />		  </p>	        <br />	      		  </td>	    </tr>		<tr>		  <td width="174" align="right"><strong>Password:</strong></td>		  <td width="306">			<input name="password" type="password" id="password" size="20" maxlength="30" tabindex="1" />		  </td>		</tr>		<tr>		 <td colspan="2">		  <br /><br /><br />		  <div class="copyright" align="center">ColdBox Framework &copy; Copyright #dateFormat(now(),"YYYY")# (<a href="http://www.coldboxframework.com">www.coldboxframework.com</a>)</div>		  <hr size="1"  />		 </td>		</tr>	  </table>		</div>		<div class="contentboxes_footer">	 <div style="margin-right:15px;">	 <input type="submit" name="submit" value="Log In" />	 </div>	</div></div></form><script language="javascript">$("password").focus();</script></cfoutput>
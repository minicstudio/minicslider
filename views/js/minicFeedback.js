/*
* Copyright (C) 2012  S.C Minic Studio S.R.L.
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation; either version 2
* of the License, or (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*
* @author  	  S.C Minic Studio S.R.L.
* @copyright  Copyright S.C Minic Studio S.R.L. 2012. All rights reserved.
* @license 	  GPLv2 License http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
* @version 	  v3.0.0
*
*/

// function showResponse(a,b){$(".active_response").hide().removeClass("active_response");a.addClass("active_response");a.children("p").html(b);a.show().delay(1e4).fadeOut(function(){$(this).removeClass("active_response")})}$(document).ready(function(a){var b;var c;var d;var e=a("#fixed_conf");var f=a("#fixed_error");var g="";a("#submitBug").click(function(g){g.preventDefault();b=a("#bug");c=b.find(".conf").text();if(a("#bugName").val()==""||a("#bugMessage").val()==""){c=b.find(".empty").text();showResponse(f,c);return false}a.getJSON("http://www.module.minic.ro/slider/process.php?"+"name="+a("#bugName").val()+"&email="+a("#bugEmail").val()+"&site="+a("#bugSite").val()+"&message="+a("#bugMessage").val()+"&psversion="+a("#bugPsVersion").val()+"&version="+a("#bugVersion").val()+"&server="+a("#bugServer").val()+"&php="+a("#bugPhp").val()+"&mysql="+a("#bugMysql").val()+"&theme="+a("#bugTheme").val()+"&userinfo="+a("#bugUserInfo").val()+"&action=bug&callback=?",function(a){}).success(function(a){d=a;if(d.error=="true"){c=b.find(".error").text();showResponse(f,c);return false}}).error(function(){c=b.find(".error").text();showResponse(f,c)}).complete(function(){showResponse(e,c)})});a("#submitFeedback").click(function(h){h.preventDefault();b=a("#feedback");c=b.find(".conf").text();if(a("#feedbackMessage").val()==""||a("#feedbackName").val()==""){c=b.find(".empty").text();showResponse(f,c);return false}if(a("#feedbackEmailAgree").is(":checked")){g=a("#feedbackEmail").val()}a.getJSON("http://www.module.minic.ro/slider/process.php?"+"name="+a("#feedbackName").val()+"&email="+g+"&site="+a("#feedbackDomain").val()+"&message="+a("#feedbackMessage").val()+"&psversion="+a("#feedbackPsVersion").val()+"&version="+a("#feedbackVersion").val()+"&action=feedback&callback=?",function(a){}).success(function(a){d=a;if(d.error=="true"){c=b.find(".error").text();showResponse(f,c)}else{showResponse(e,c)}}).error(function(){}).complete(function(){})});a(".response .close").click(function(){a(this).parent(".response").hide().removeClass("active_response")})})
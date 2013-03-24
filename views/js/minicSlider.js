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
 
// function GetBrowser(){$.browser.chrome=/chrome/.test(navigator.userAgent.toLowerCase());if($.browser.chrome)return"chrome";if($.browser.mozilla)return"mozilla";if($.browser.opera)return"opera";if($.browser.safari)return"safari";if($.browser.msie)return"ie"}jQuery(document).ready(function(a){a("#donate").click(function(b){b.preventDefault();a("#paypal").submit()});a(".ghost-text").ghostText();a(".tooltip").tipsy({fade:true,gravity:"w",offset:20});a(".slider_navigation a.menu").click(function(b){b.preventDefault();a(a(this).attr("href")).slideToggle()});a(".hidden-div legend").click(function(){a(this).parent("fieldset").slideToggle()});a(".slides_holder").width((900+15)*a(".languages").size());a(".slides_holder").animate({"margin-left":(-900-15)*a(".navigation.active").index()+"px"});a(".slide_header").click(function(){a(this).toggleClass("active").parent().children(".slide_body").slideToggle();a(this).children(".arrow").toggleClass("down")});a("a.navigation").click(function(b){b.preventDefault();a(".navigation.active").removeClass("active");a(this).addClass("active");var c=a(this).attr("href");var d=a(c).index();a(".slides_holder").animate({"margin-left":(-900-15)*d+"px"})});a(".cb-enable").click(function(){a(this).parent().children(".selected").removeClass("selected");a(this).addClass("selected");a(this).parent().children("input").attr("checked",true).val(1)});a(".cb-disable").click(function(){a(this).parent().children(".selected").removeClass("selected");a(this).addClass("selected");a(this).parent().children("input").attr("checked",true).val(0)});a("#add").click(function(){return!a("#select1 option:selected").remove().appendTo("#select2")});a("#remove").click(function(){return!a("#select2 option:selected").remove().appendTo("#select1")});a("#submitOptions").click(function(){a("#slider_options").find("option").each(function(){a(this).attr("selected","selected")})});a("input#delete-slide").click(function(b){if(a(this).hasClass("disabled")){b.preventDefault();a(this).removeClass("disabled");a("#deleteWindow").fadeIn(200)}});a("a.confirm-delete").click(function(b){b.preventDefault();a("input#delete-slide").trigger("click")});a("a.deny-delete").click(function(b){b.preventDefault();a("input#delete-slide").addClass("disabled");a(".confirmation_window").fadeOut(300)});var b=GetBrowser();if(b=="chrome"){a(".image-chooser").addClass("chrome")}else{a(".image-chooser").addClass("not-chrome")}})
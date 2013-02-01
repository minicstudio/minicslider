{*
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
* @author     S.C Minic Studio S.R.L.
* @copyright  Copyright S.C Minic Studio S.R.L. 2012. All rights reserved.
* @license    GPLv2 License http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
* @version    v3.0.0
*}

<script type="text/javascript">
    $(document).ready(function() {
        // News Feed
        var version = $('#feedbackVersion').val();
        $.getJSON('http://module.minic.ro/slider/process.php?domain={$slider.info.domain}&psversion={$slider.info.psVersion}&version={$slider.info.version}&action=feed&callback=?',function(feed){
            if(feed.update.version != version){
              $('#sliderBanner').empty().html(feed.update.content);
            }else if(feed.news.news == 'true'){
              $('#sliderBanner').empty().html(feed.news.content);
            }else{
              return false;
            }
        });

        // First start
        {if $slider.firstStart}
            $('#sendInfoWindow').fadeIn();
        {/if}
        $('#newsletter').click(function(event){
            event.preventDefault();
            $('#sendInfoWindow').fadeIn();
        })
        $('#sendInfo').click(function(event){
            $('#sendInfoWindow').fadeOut();
            $.getJSON("http://module.minic.ro/slider/process.php?domain={$slider.info.domain}&psversion={$slider.info.psVersion}&version={$slider.info.version}&email="+$('#sendInfoEmail').val()+"&action=install&callback=?");
        });

        // Sortable
        $("ul.languages").sortable({
            opacity: 0.6,
            cursor: "move",
            update: function(event, ui) {
                var list = $(this);
                var number;
                var response;
                $.getJSON(
                    "{$slider.sortUrl}", 
                    {ldelim}slides: $(this).sortable("serialize"){rdelim}, 
                    function(response){
                        if(response.success == "true"){
                            showResponse($("#fixed_conf"), "{l s='Saved successfull'}");
                            var i = 1;
                            list.children("li").each(function(){
                                number = i;
                                if(i < 10){ 
                                    number = "0"+i; 
                                }
                                $(this).find(".order").text(number);
                                i++;
                            });
                        }else{
                            showResponse($("#fixed_error"), "{l s='Something went wrong, please refresh the page and try again'}"); 
                        }
                  }
                );
            }
        });         
    });
</script>

{if $error}<div class="error">{$error}</div>{/if}
{if $confirmation}<div class="conf">{$confirmation}</div>{/if}
<div id="fixed_conf" class="conf response" style="display:none;"><p></p><span class="close">x</span></div>
<div id="fixed_error" class="error response" style="display:none;"><p></p><span class="close">x</span></div>

<div class="slider_admin">
    <div id="slider_header">
        <div id="feedback_navigation" class="slider_navigation">
            <a href="#" id="newsletter">{l s='Newsletter'}</a>
            <a href="#bug" class="menu">{l s='Bug Report'}</a>
            <a href="#feedback" class="menu">{l s='Feedback'}</a>
        </div>
        <div id="sliderBanner">
            <a href="#" id="donate">
                <img src="{$module_template_dir}img/donate.jpg">
            </a>
        </div>
        <div id="slider_navigation" class="slider_navigation">
            <a href="#newSlide" id="addNew-button" class="menu">{l s='Add New'}</a>
            <a href="#option" id="options-button" class="menu">{l s='Options'}</a>
        </div>
    </div>
    {include file="{$slider.tpl.options}"}
    {include file="{$slider.tpl.new}"}
    {include file="{$slider.tpl.feedback}"}
    {include file="{$slider.tpl.bug}"}
    {include file="{$slider.tpl.slides}"}
    <div id="donations">
      <form id="paypal" target="_blank" action="https://www.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_s-xclick">
            <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
              ">
            <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
            <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
        </form>
    </div>      
    <div id="deleteWindow" class="confirmation_window">
        <div class="conf_header">
            <a href="#" class="close_confirm deny-delete">x</a>
            <h3>{l s='Confirmation'}</h3>
        </div>
        <div class="confirmation_content">
            <span class="warning_img"></span>
            <p>{l s='Are you sure? If so than you have to know that the image and all of its data will be deleted! I suggest to use the active state switch, and turn it off.'}</p>
        </div>
        <div class="button_box">
            <div class="confirm-b">
                <a href="#" class="confirm-delete">{l s='Yes'}</a>
            </div>
            <div class="deny-b">
                <a href="#" class="deny-delete">{l s='No'}</a>
            </div>
        </div>
    </div>    
    <div id="sendInfoWindow" class="confirmation_window">
        <div class="conf_header">
            <a href="#" class="close_confirm deny-delete">x</a>
            <h3>{l s='Help Us!'}</h3>
        </div>
        <div class="confirmation_content">
            <p>{l s='By clicking to the YES button, you agree to send some basic information to us. This mean we can keep tracking how much active module we have.'}</p>
            <p><b>{l s='Don`t worry we`ll be discrete with this information'}:</b></p>
            <ul>
                <li>{l s='Domain'}: <b>{$slider.info.domain}</b></li>
                <li>{l s='Version'}: <b>{$slider.info.version}</b></li>
                <li>{l s='PS Version'}: <b>{$slider.info.psVersion}</b></li>
            </ul>
            <form>
                <p>{l s='If you wish to riecive news about our updates, new modules (there will be...) than please fill this out.'}</p>
                <div>
                    <label>{l s='Email'}:</label>
                    <input type="text" id="sendInfoEmail" name="infoEmail" />
                </div>  
            </form>
            <h3>{l s='Thank you for your help!'}</h3>
        </div>
        <div class="button_box">
            <div class="confirm-b">
                <a href="#" id="sendInfo" class="confirm-delete">{l s='Yes'}</a>
            </div>
            <div class="deny-b">
                <a href="#" class="deny-delete">{l s='No'}</a>
            </div>
        </div>
    </div>  
</div>			
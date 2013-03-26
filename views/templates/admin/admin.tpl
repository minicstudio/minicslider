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
        // var version = $('#feedbackVersion').val();
        // $.getJSON('http://module.minic.ro/slider/process.php?domain={$minic.info.domain}&psversion={$minic.info.psVersion}&version={$minic.info.version}&action=feed&callback=?',function(feed){
        //     if(feed.update.version != version){
        //       $('#sliderBanner').empty().html(feed.update.content);
        //     }else if(feed.news.news == 'true'){
        //       $('#sliderBanner').empty().html(feed.news.content);
        //     }else{
        //       return false;
        //     }
        // });

        // // First start
        // {if $slider.firstStart}
        //     $('#sendInfoWindow').fadeIn();
        // {/if}
        // $('#newsletter').click(function(event){
        //     event.preventDefault();
        //     $('#sendInfoWindow').fadeIn();
        // })
        // $('#sendInfo').click(function(event){
        //     $('#sendInfoWindow').fadeOut();
        //     $.getJSON("http://module.minic.ro/slider/process.php?domain={$minic.info.domain}&psversion={$minic.info.psVersion}&version={$minic.info.version}&email="+$('#sendInfoEmail').val()+"&action=install&callback=?");
        // });

        // Sortable
        $("ul.languages").sortable({
            opacity: 0.6,
            cursor: 'move',
            handle: '.orderer',
            update: function(event, ui) {
                var list = $(this);
                var number;
                var response;
                $.getJSON(
                    "{$slider.sortUrl}", 
                    {ldelim}slides: $(this).sortable("serialize"){rdelim}, 
                    function(response){
                        if(response.success == "true"){
                            showResponse($("#sortable"), "{l s='Saved successfull'}", 'conf');
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
                            showResponse($("#sortable"), "{l s='Something went wrong, please refresh the page and try again'}", 'error'); 
                        }
                  }
                );
            }
        });         
    });
</script>
		
{include file="{$minic.admin_tpl_path}javascript.tpl"}
<div id="minic">
    {if $error}
        {include file="{$minic.admin_tpl_path}messages.tpl" id="main" text=$error class='error'}
    {/if}
    {if $confirmation}
        {include file="{$minic.admin_tpl_path}messages.tpl" id="main" text=$confirmation class='conf'}
    {/if}
    <div class="header">
        <div id="menu-top">
            <a href="https://github.com/minicstudio" class="social" title="Minic studio Github page" target="_blank"><i class="icon-github"></i></a>
            <a href="https://twitter.com/minicstudio" class="social" title="Minic studio Twitter page" target="_blank"><i class="icon-twitter"></i></a>
            <a href="https://www.facebook.com/minicmodule" class="social" title="Minic studio Facebook page" target="_blank"><i class="icon-facebook"></i></a>
            <div id="more-module">
                <span>{l s='More Module' mod='minicskeletonpro'}</span>
                <ul id="module-list"></ul>
            </div>
            <a href="#newsletter" class="open-popup" data-popup="#newsletter">{l s='Newsletter'}</a>
            <a href="#bug" class="minic-open">{l s='Bug Report'}</a>
            <a href="#feedback" class="minic-open">{l s='Feedback'}</a>
        </div>
        <div id="banner"></div>
        <div id="navigation">
            <a href="#new" id="new-button" class="minic-open">{l s='Add New'}</a>
            <a href="#options" id="options-button" class="minic-open">{l s='Options'}</a>
        </div>
    </div>
    <!-- feedback -->
    {include file="{$minic.admin_tpl_path}feedback.tpl"}
    <!-- bug report -->
    {include file="{$minic.admin_tpl_path}bug.tpl"}
    <!-- Options -->
    {include file="{$minic.admin_tpl_path}options.tpl"}
    <!-- New -->
    {include file="{$minic.admin_tpl_path}new.tpl"}
    <!-- Slides -->
    {include file="{$minic.admin_tpl_path}slides.tpl"}
    <!-- newsletter popup -->
    {include file="{$minic.admin_tpl_path}popup.tpl" newsletter='1'}
</div>
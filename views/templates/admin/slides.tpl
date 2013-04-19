{include file="{$minic.admin_tpl_path}messages.tpl" id='sortable'}
<div id="slides-list">
    <div id="slides-navigation">
        {if $slider.options.single == 0}
            <a href="#{$slider.lang.default.iso_code}_slides" class="navigation active">
                <img src="{$slider.lang.lang_dir}{$slider.lang.default.id_lang}.jpg" />
                {$slider.lang.default.name}
            </a>
        {else}
            {foreach from=$slider.lang.all item=lang}
                <a href="#{$lang.iso_code}_slides" class="navigation {if $lang.iso_code == $slider.lang.default.iso_code}active{/if}">
                    <img src="{$slider.lang.lang_dir}{$lang.id_lang}.jpg" />
                    {$lang.name}
                </a>
            {/foreach}    
        {/if}
    </div>
    <div class="slides-holder" style="width: {$slider.slides|count}00%;">
        {foreach name=languages from=$slider.slides key=iso item=lang}
            <ul id="{$iso}_slides" class="languages" style="width: {100/{$slider.slides|count}}%;">
                {foreach name=slides from=$lang item=slide}
                    <li id="order_{$slide.id_slide}h{$slide.id_order}" class="slide" >
                        <div class="slide-header {if $slide.active != 1}inactive{/if}">
                            <i class="orderer icon-align-justify"></i>
                            <span class="order">{if $slide.id_order le 9}0{/if}{$slide.id_order}</span>
                            <span class="title">{if $slide.title}{$slide.title}{else}{l s='Untitled slide' mod='minicslider'}{/if}</span>
                            <span class="{if $slide.active == 1}active{else}deactivated{/if}"></span>
                            <span class="arrow"></span>
                        </div>
                        <div id="{$iso}_{$slide.id_order}" class="slide-body minic-container">
                            <form method="post" action="{$slider.postAction}" enctype="multipart/form-data">
                                <div class="minic-top">
                                    <h3>{l s='Editing slide' mod='minicslider'}
                                        <a href="http://module.minic.ro/minic-slider-news/using-the-feedback-and-bug-report/" target="_blank" class="help">{l s='help & tips' mod='minicslider'}</a>
                                    </h3>
                                    <div class="title input-holder">
                                        <input type="text" name="title" class="tooltip" placeholder="{l s='The title of the slide'}" value="{$slide.title}" title="{l s='This will be the title on the slide.' mod='minicslider'}" /> 
                                    </div>
                                    <div class="switch-holder">
                                        <div class="switch large {if $slide.active}active{else}inactive{/if}">
                                            <input type="radio" class="" name="isActive"  value="{$slide.active}" checked="true" />
                                        </div>
                                    </div>
                                    <a href="#{$iso}_{$slide.id_order}" class="minic-close">x</a>
                                </div>
                                <div class="minic-content">
                                    <div class="image-holder input-holder">
                                        <label>{l s='Image' mod='minicslider' mod='minicslider'}</label>
                                        <img src="{$module_dir}uploads/{$slide.image}" />
                                        <input type="file" name="newImage" class="file"/>
                                    </div>
                                    <div class="url input-holder">
                                      	<label>{l s='Url' mod='minicslider'}: </label>
                                      	<input type="text" name="url" class="tooltip" placeholder="{l s='Link of the slide'}" value="{$slide.url}" title="{l s='ex. http://myshop.com/promotions' mod='minicslider'}" />  
                                        <span>{l s='Blank target' mod='minicslider'}: </span>
                                        <input type="checkbox" name="target" class="tooltip" value="1" {if $slide.target == 1}checked="true"{/if} title="{l s='Check this if you want to open the link in new window.' mod='minicslider'}" />         
                                    </div>
                                    <div class="alt input-holder">
                                        <label>{l s='Image alt' mod='minicslider'}: </label>
                                        <input type="text" name="alt" class="tooltip" placeholder="{l s='An alternate text for the image'}" value="{$slide.alt}" title="{l s='The image alt, alternate text for the image' mod='minicslider'}" />
                                    </div>
                                    <div class="caption input-holder"> 
                                      	<label>{l s='Caption' mod='minicslider'}: </label>
                                    	<textarea type="text" name="caption" class="tooltip" cols="40" rows="6" title="{l s='Be carefull, too long text isnt good and HTML is not allowed.'}" placeholder="{l s='The slide text' mod='minicslider'}">{$slide.caption}</textarea>
                                    </div>   
                                </div>  
                                <div class="minic-bottom">
                                    <input type="hidden" name="slideId" value="{$slide.id_slide}" />
                                    <input type="hidden" name="orderId" value="{$slide.id_order}" />
                                    <input type="hidden" name="slideIso" value="{$slide.lang_iso}" />
                                    <input type="hidden" name="oldImage" value="{$slide.image}" />    
                                    <input type="submit" name="deleteSlide" value="{l s='Delete' mod='minicslider'}" id="delete-slide" class="button-large red disabled" />   
                                    <input type="submit" name="editSlide" value="{l s='Update' mod='minicslider'}" id="update-slide" class="button-large green" />       
                                    <a href="#{$iso}_{$slide.id_order}" class="button-large grey minic-close">{l s='Close' mod='minicslider'}</a>
                                </div>    
                            </form>
                        </div>  
                    </li>                 
              {/foreach}    
          </ul>               
      {/foreach}
    </div>  
</div>
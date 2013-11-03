<div id="options" class="minic-container">
    <form id="form-option" class="" method="post" action="{$slider.postAction}">
        <div class="minic-top">
            <h3>{l s='Options' mod='minicslider'}
                <a href="#" target="_blank" class="help">{l s='help & tips' mod='minicslider' mod='minicslider'}</a>
            </h3>
            <a href="#options" class="minic-close">x</a>
        </div>
        <div class="minic-content">
            <!-- Animation type -->
            <h3 style="width:100%;">{l s='Animation type' mod='minicslider'}</h3>  
            <div class="select">      
                <div class="used">
                    <label><i class="icon-info-sign tooltip" title="{l s='These are the animation effects, choose one or more and click to the Add button.'}"></i>{l s='Unused effects' mod='minicslider'}</label>
                    <select multiple="multiple" id="select1" name="nivo_effect[]" >
                        {foreach from=$slider.options.effect item=effect}
                            <option>{$effect}</option>
                        {/foreach}
                    </select>   
                    <input name="left2right" value="{l s='Add'}" type="button" id="add" class="button-small green tooltip" title="{l s='Click to add effect' mod='minicslider'}">
                </div> 
                <div class="unused">
                    <label><i class="icon-info-sign tooltip" title="{l s='These are the used animation effects, you can select and remove them, if its empty then all will be used ( random ).'}"></i>{l s='Used effects' mod='minicslider'}</label>
                    <select multiple="multiple" id="select2" name="nivo_current[]" >
                        {foreach from=$slider.options.current item=current}
                            <option>{$current}</option>
                        {/foreach}
                    </select>   
                    <input name="right2left" value="{l s='Remove'}" type="button" id="remove" class="button-small grey tooltip" title="{l s='Click to remove effect' mod='minicslider'}">
                </div> 
            </div>    
            <!-- Slice and Box animation -->
            <h3>{l s='Slice and Box animation configuration' mod='minicslider'}</h3>
            <div class="input-holder">
                <label>{l s='Slices' mod='minicslider'}: </label>
                <input type="text" name="slices" value="{$slider.options.slices}" class="tooltip" title="{l s='The number of Slices for Slice animation' mod='minicslider'}">
            </div>
            <div class="input-holder">
                <label>{l s='BoxCols' mod='minicslider'}: </label>
                <input type="text" name="cols" value="{$slider.options.cols}" class="tooltip" title="{l s='The number of Cols for Box animations' mod='minicslider'}">
            </div>
            <div class="input-holder">
                <label>{l s='BoxRows' mod='minicslider'}: </label>
                <input type="text" name="rows" value="{$slider.options.rows}" class="tooltip" title="{l s='The number of Rows for Box animations' mod='minicslider'}">
            </div>
            <!-- Animation configuration -->
            <h3>{l s='Animation configuration' mod='minicslider'}</h3>
            <div class="input-holder">
                <label>{l s='Speed' mod='minicslider'}: </label>
                <input type="text" name="speed" value="{$slider.options.speed}" class="tooltip" title="{l s='Slide transition speed in miliseconds (default is 0.5 sec)' mod='minicslider'}">                    
            </div>    
            <div class="input-holder">
                <label>{l s='Pause Time' mod='minicslider'}: </label>
                <input type="text" name="pause" value="{$slider.options.pause}" class="tooltip" title="{l s='How long each slide will be shown in miliseconds (default is 3 sec)' mod='minicslider'}">
            </div>
            <div class="input-holder">
                <label>{l s='Starting slide' mod='minicslider'}: </label>
                <input type="text" name="startSlide" value="{$slider.options.startSlide}" class="tooltip" title="{l s='The starting slide, begining with 0. So if you have 5 slides and you want to start with the last slide than you write 4.' mod='minicslider'}">
            </div>
            <h3>{l s='Width and Height configuration' mod='minicslider'}</h3>
            <div class="input-holder">
                <label>{l s='Slider min width' mod='minicslider'}: </label>
                <input type="text" name="min_width" value="{$slider.options.min_width}" class="tooltip" title="{l s='Minimum width of the slider. For example: 500px or 20%' mod='minicslider'}">
            </div>
            <div class="input-holder">
                <label>{l s='Slider max width' mod='minicslider'}: </label>
                <input type="text" name="max_width" value="{$slider.options.max_width}" class="tooltip" title="{l s='Maximum width of the slider. For example: 1800px or 80%' mod='minicslider'}">
            </div>
            <div class="input-holder">
                <label>{l s='Slider max height' mod='minicslider'}: </label>
                <input type="text" name="max_height" value="{$slider.options.max_height}" class="tooltip" title="{l s='Maximum height of the slider. For example: 500px or 50%' mod='minicslider'}">
            </div>
            <div class="right">
                <h3>{l s='Other options' mod='minicslider'}</h3>
                <div class="switch-holder">
                    <label><i class="icon-info-sign tooltip" title="{l s='Pause the slider on mouse hover.'}"></i>{l s='Pause on Mouse Hover' mod='minicslider'}: </label>
                    <div class="switch small {if $slider.options.hover}active{else}inactive{/if}">
                        <input type="radio" id="r-hover" class="" name="hover"  value="{$slider.options.hover}" checked="true" />
                    </div>
                </div>
                <div class="switch-holder">
                    <label><i class="icon-info-sign tooltip" title="{l s='Turn it ON if you dont want the slider to auto slide.'}"></i>{l s='Manual slide' mod='minicslider'}: </label>
                    <div class="switch small {if $slider.options.manual}active{else}inactive{/if}">
                        <input type="radio" id="r-manual" class="" name="manual"  value="{$slider.options.manual}" checked="true" />
                    </div>
                </div>
                <div class="switch-holder">
                    <label><i class="icon-info-sign tooltip" title="{l s='If you want previous and next buttons on the two side of the slider, then turn this on.'}"></i>{l s='Prev/Next button' mod='minicslider'}: </label>
                    <div class="switch small {if $slider.options.buttons}active{else}inactive{/if}">
                        <input type="radio" id="r-buttons" class="" name="buttons"  value="{$slider.options.buttons}" checked="true" />
                    </div>
                </div>
                <div class="switch-holder">
                    <label><i class="icon-info-sign tooltip" title="{l s='This controls the navigation, by default these are the litle dots under the slider.'}"></i>{l s='Control' mod='minicslider'}: </label>
                    <div class="switch small {if $slider.options.control}active{else}inactive{/if}">
                        <input type="radio" id="r-control" class="" name="control"  value="{$slider.options.control}" checked="true" />
                    </div>
                </div>
                <div class="switch-holder">
                    <label><i class="icon-info-sign tooltip" title="{l s='Turn it on if you want thumbnails in the place of the ( control ) litle dots.'}"></i>{l s='Thumbnails' mod='minicslider'}: </label>
                    <div class="switch small {if $slider.options.thumbnail}active{else}inactive{/if}">
                        <input type="radio" id="r-thumbnail" class="" name="thumbnail"  value="{$slider.options.thumbnail}" checked="true" />
                    </div>
                </div>
                <div class="switch-holder">
                    <label><i class="icon-info-sign tooltip" title="{l s='Turn it ON if you want the slider to start with a random slide.'}"></i>{l s='Random slide' mod='minicslider'}: </label>
                    <div class="switch small {if $slider.options.random}active{else}inactive{/if}">
                        <input type="radio" id="r-random" class="" name="random"  value="{$slider.options.random}" checked="true" />
                    </div>
                </div>
                <div class="switch-holder">
                    <label><i class="icon-info-sign tooltip" title="{l s='Turn on if you want to use different slides for different languages, otherwise the default language slides will be used for all the languages.'}"></i>{l s='I need multilanguage' mod='minicslider'}: </label>
                    <div class="switch small {if $slider.options.single}active{else}inactive{/if}">
                        <input type="radio" id="r-single" class="" name="single"  value="{$slider.options.single}" checked="true" />
                    </div>
                </div>
                <div class="switch-holder">
                    <label><i class="icon-info-sign tooltip" title="{l s='Turn on if you want to use the Minic Slider only on the home page.'}"></i>{l s='Home only' mod='minicslider'}: </label>
                    <div class="switch small {if $slider.options.front}active{else}inactive{/if}">
                        <input type="radio" id="r-front" class="" name="front"  value="{$slider.options.front}" checked="true" />
                    </div>
                </div> 
            </div> 
        </div>
        <div class="minic-bottom">
            <input type="submit" name="submitMinicOptions" value="{l s='Save' mod='minicslider'}" id="submitOptions" class="button-large green" />
            <a href="#options" class="minic-close button-large lgrey">{l s='Close' mod='minicslider'}</a>
        </div>
    </form>
</div>
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

<fieldset id="newSlide" class="hidden-div">
    <legend>{l s='Add New Slide'}</legend> 
    <form method="post" action="{$slider.postAction}" enctype="multipart/form-data">        
        <div id="new">
            <div class="title input">
                <label>{l s='Title'}</label>
                <input type="text" name="title" size="41" class="ghost-text tooltip" value="{l s='The title of the slide'}" title="{l s='This will be the title on the slide.'}" /> 
            </div>
            <div class="url input">
                <label>{l s='Url'}</label>
                <input type="text" name="url" size="41" class="ghost-text tooltip" value="{l s='Link of the slide'}" title="{l s='ex. http://myshop.com/promotions'}" />           
            </div>
            <div class="target">
                <label>{l s='Blank target'}</label>
                <input type="checkbox" name="target" class="tooltip" value="1" title="{l s='Check this if you want to open the link in new window.'}" />
            </div>
            <div class="image input">
                <label>{l s='Image'}</label>
                <input type="file" name="image" size="29" id="image-chooser" class="tooltip" title="{l s='Choose an image, only .jpg, .png, .gif are allowed.'}" />
            </div>
            <div class="imageName input">
                <label>{l s='Image name'}</label>
                <input type="text" name="imageName" size="41" class="ghost-text tooltip" value="{l s='Image name'}" title="{l s='Optional! The name of the uploaded image without extension. The white spaces will be replaces with underscore ( _ )'}" />           
            </div>
            {if $slider.options.single == 1}
                <div class="language">
                    <label>{l s='Language'}</label>
                    <select name="language" class="tooltip" title="{l s='The language of the slide.'}">
                        {foreach from=$slider.lang.all item=lang}
                            <option value="{$lang.id_lang}" {if $lang.id_lang == $slider.lang.default.id_lang}selected="selected"{/if}>{$lang.name}</option>
                        {/foreach}
                    </select>
                </div>
            {/if}
            <div class="alt input">
                <label>{l s='Image alt'}</label>
                <input type="text" name="alt" size="41" class="ghost-text tooltip" value="{l s='An alternate text for the image'}" title="{l s='The image alt, alternate text for the image'}" />
            </div>
            <div class="caption"> 
                <label>{l s='Caption'}</label>
                <textarea type="text" name="caption" cols=40 rows=6 class="ghost-text tooltip" title="{l s='Be carefull, too long text isnt good and FULL HTML is allowed.'}">{l s='The slide text'}</textarea>                      
            </div>
            <div class="button_cont">
                <input type="submit" name="submitNewSlide" value="{l s='Add Slide'}" class="green large" />
                {if $slider.options.single == 0}
                    <input type="hidden" name="language" value="{$slider.lang.default.id_lang}" />
                {/if}
            </div> 
        </div> 
        <div class="comments"> 
            <h3>{l s="Few important notes"}</h3>
            <p>{l s='The Nivo Slider is now'} <b><a href="http://nivo.dev7studios.com/2012/05/30/the-nivo-slider-is-responsive/" target="_blank">{l s='responsive'}</a></b>!</p>
            <p>{l s='If you dont want title and/or captions text than leave empty those fields.'}</p>
            <p>{l s='The images wont be resized automatically to the same size, you need to resize them manually!'}</p>
            <p>{l s='You can upload different sized images for different language.'}</p>
            <p>{l s='If you want you can upload the same image to different language. They will be renamed but its better if you give them a normal name.'}</p>
            <p>{l s='More than 8 image looks ugly if you use thumbnails in center column.'}</p>
        </div>
    </form>
</fieldset>
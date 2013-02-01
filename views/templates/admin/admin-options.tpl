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

<fieldset id="option" class="hidden-div">
	<legend>{l s='Options'}</legend>
	<form id="slider_options" method="post" action="{$slider.postAction}">
		<div id="options" class="container">
            <div class="animation">
                <h3>{l s='Animation'}</h3>  
                <div class="select">      
                    <div class="first_select">
                        <label>{l s='Unused effects'}<span class="info_ico tooltip" title="{l s='These are the animation effects, choose one or more and click to the Add button.'}"></span>  </label>
                        <select multiple="multiple" id="select1" name="nivo_effect[]" >
						    {foreach from=$slider.options.effect item=effect}
							    <option>{$effect}</option>
						    {/foreach}
				        </select>	
                        <input name="left2right" value="{l s='Add'}" type="button" id="add" class="green tooltip" title="{l s='Click to add effect'}">
					    
                    </div>
                    <div class="second_select">
                        <label>{l s='Used effects'}<span class="info_ico tooltip" title="{l s='These are the used animation effects, you can select and remove them, if its empty then all will be used ( random ).'}"></span></label>
                        <select multiple="multiple" id="select2" name="nivo_current[]" >
						    {foreach from=$slider.options.current item=current}
							    <option>{$current}</option>
						    {/foreach}
					    </select>	
                        <input name="right2left" value="{l s='Remove'}" type="button" id="remove" class="green tooltip" title="{l s='Click to remove effect'}">
                    </div>                   
                </div>    
            </div>
            <div class="slice">
                <h3>{l s='Configure Slice and Box animation'}</h3>
                <div>
                    <label>{l s='Slices'}: </label>
				    <input type="text" name="slices" value="{$slider.options.slices}" class="tooltip" title="{l s='The number of Slices for Slice animation'}">
				</div>
                <div>
                    <label>{l s='BoxCols'}: </label>
				    <input type="text" name="cols" value="{$slider.options.cols}" class="tooltip" title="{l s='The number of Cols for Box animations'}">
			    </div>
                <div>
                	<label>{l s='BoxRows'}: </label>
			        <input type="text" name="rows" value="{$slider.options.rows}" class="tooltip" title="{l s='The number of Rows for Box animations'}">
			    </div>
            </div>
            <div class="configuration">
                <h3>{l s='Animation Configuration'}</h3>
                <div>
                    <label>{l s='Speed'}: </label>
					<input type="text" name="speed" value="{$slider.options.speed}" class="tooltip" title="{l s='Slide transition speed in miliseconds (default is 0.5 sec)'}">                    
                </div>    
                <div>
                    <label>{l s='Pause Time'}: </label>
					<input type="text" name="pause" value="{$slider.options.pause}" class="tooltip" title="{l s='How long each slide will be shown in miliseconds (default is 3 sec)'}">
                </div>
                <div class="switch">
                    <label>{l s='Pause on Mouse Hover'}: </label>
					<div class="field switch">
						<input type="radio" id="r-hover" class="" name="hover"  value="{$slider.options.hover}" checked="true" />
						<label for="r-hover" class="cb-enable {if $slider.options.hover == 1}selected{/if}" ><span>ON</span></label>
						<label for="r-hover" class="cb-disable {if $slider.options.hover == 0}selected{/if}" ><span>OFF</span></label>
					</div>
					<span class="info_ico tooltip" title="{l s='Pause the slider on mouse hover.'}"></span>
                </div>
                <div class="switch">
                    <label>{l s='Manual slide'}: </label>
					<div class="field switch">
						<input type="radio" id="r-manual" class="" name="manual"  value="{$slider.options.manual}" checked="true" />
						<label for="r-manual" class="cb-enable {if $slider.options.manual == 1}selected{/if}" ><span>ON</span></label>
						<label for="r-manual" class="cb-disable {if $slider.options.manual == 0}selected{/if}" ><span>OFF</span></label>
					</div>
					<span class="info_ico tooltip" title="{l s='Turn it ON if you dont want the slider to auto slide.'}"></span>
                </div>                    
            </div>
            <div class="navigation">
                <h3>{l s='Navigation'}</h3>
                <div class="switch">
                    <label>{l s='Prev/Next button'}: </label>
					<div class="field switch">
						<input type="radio" id="r-buttons" class="" name="buttons"  value="{$slider.options.buttons}" checked="true" />
						<label for="r-buttons" class="cb-enable {if $slider.options.buttons == 1}selected{/if}" ><span>ON</span></label>
						<label for="r-buttons" class="cb-disable {if $slider.options.buttons == 0}selected{/if}" ><span>OFF</span></label>
					</div>
					<span class="info_ico tooltip" title="{l s='If you want previous and next buttons on the two side of the slider, then turn this on.'}"></span>
                </div>
                <div class="switch">
                    <label>{l s='Control'}: </label>
					<div class="field switch">
						<input type="radio" id="r-control" class="" name="control"  value="{$slider.options.control}" checked="true" />
						<label for="r-control" class="cb-enable {if $slider.options.control == 1}selected{/if}" ><span>ON</span></label>
						<label for="r-control" class="cb-disable {if $slider.options.control == 0}selected{/if}" ><span>OFF</span></label>
					</div>
					<span class="info_ico tooltip" title="{l s='This controls the navigation, by default these are the litle dots under the slider.'}"></span>
                </div>
                <div class="switch">
                    <label>{l s='Thumbnails'}: </label>
					<div class="field switch">
						<input type="radio" id="r-thumbnail" class="" name="thumbnail"  value="{$slider.options.thumbnail}" checked="true" />
						<label for="r-thumbnail" class="cb-enable {if $slider.options.thumbnail == 1}selected{/if}" ><span>ON</span></label>
						<label for="r-thumbnail" class="cb-disable {if $slider.options.thumbnail == 0}selected{/if}" ><span>OFF</span></label>
					</div>
					<span class="info_ico tooltip" title="{l s='Turn it on if you want thumbnails in the place of the ( control ) litle dots.'}"></span>
                </div>   
            </div>
            <div class="other">
                <h3>{l s='Other'}</h3>
                <div class="switch">
                    <label>{l s='Random slide'}: </label>
					<div class="field switch">
						<input type="radio" id="r-random" class="" name="random"  value="{$slider.options.random}" checked="true" />
						<label for="r-random" class="cb-enable {if $slider.options.random == 1}selected{/if}" ><span>ON</span></label>
						<label for="r-random" class="cb-disable {if $slider.options.random == 0}selected{/if}" ><span>OFF</span></label>
					</div>
					<span class="info_ico tooltip" title="{l s='Turn it ON if you want the slider to start with a random slide.'}"></span>
                </div>
                <div>
                    <label>{l s='Starting slide'}: </label>
					<input type="text" name="startSlide" value="{$slider.options.startSlide}" class="tooltip" title="{l s='The starting slide, begining with 0. So if you have 5 slides and you want to start with the last slide than you write 4.'}">
                </div> 
                <div class="switch">
                    <label>{l s='I need multilanguage'}: </label>
					<div class="field switch">
						<input type="radio" id="r-single" class="" name="single"  value="{$slider.options.single}" checked="true" />
						<label for="r-single" class="cb-enable {if $slider.options.single == 1}selected{/if}" ><span>ON</span></label>
						<label for="r-single" class="cb-disable {if $slider.options.single == 0}selected{/if}" ><span>OFF</span></label>
					</div>
					<span class="info_ico tooltip" title="{l s='Turn on if you want to use different slides for different languages, otherwise the default language slides will be used for all the languages.'}"></span>
                </div>       
                <div>
                	<label>{l s='Slider width'}: </label>
					<input type="text" name="width" value="{$slider.options.width}" class="tooltip" title="{l s='If you want to fix the width of the slider than fill this out.'}">
				</div>
				<div>
					<label>{l s='Slider height'}: </label>
					<input type="text" name="height" value="{$slider.options.height}" class="tooltip" title="{l s='If you want to fix the height of the slider than fill this out.'}">
                </div>               
                <div class="switch">
                    <label>{l s='Home only'}: </label>
					<div class="field switch">
						<input type="radio" id="r-front" class="" name="front"  value="{$slider.options.front}" checked="true" />
						<label for="r-front" class="cb-enable {if $slider.options.front == 1}selected{/if}" ><span>ON</span></label>
						<label for="r-front" class="cb-disable {if $slider.options.front == 0}selected{/if}" ><span>OFF</span></label>
					</div>
					<span class="info_ico tooltip" title="{l s='Turn on if you want to use the Minic Slider only on the home page.'}"></span>
                </div>   
            </div>
            <div class="button_cont">
				<input type="submit" name="submitOptions" value="{l s='Update'}" id="submitOptions" class="green large" />
			</div>
		</div>
	</form>
</fieldset>
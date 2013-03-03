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

{if $minicSlider.position == 'top'}
</div>  
    </div>
{/if}

<div id="minic_slider" class="theme-default{if $minicSlider.options.thumbnail == 1 and $minicSlider.options.control != 0} controlnav-thumbs{/if}">
    {foreach from=$slides key=iso item=slide}
        {if $iso == $lang_iso and $iso|@count != 0}
            <div id="slider" class="nivoSlider" style="{if $minicSlider.options.width}width:{$minicSlider.options.width}px;{/if}{if $minicSlider.options.height}height:{$minicSlider.options.height}px{/if}{if $minicSlider.options.control != 1}margin-bottom:0;{/if}{if $minicSlider.position == 'top'}display:inline-block;{/if}">
                {foreach from=$slide item=image name=images}
                    {if $image.url != ''}<a href="{$image.url}">{/if}
                        <img src="{$minicSlider.path.images}{$image.image}" class="slider_image" alt="{$image.alt}" 
                            {if $image.title != '' or $image.caption != ''}title="#htmlcaption_{$image.id_slide}"{/if} 
                            {if $minicSlider.options.thumbnail == 1}data-thumb="{$minicSlider.path.thumbs}{$image.image}"{/if}/>
                    {if $image.url != ''}</a>{/if}
                {/foreach}
            </div>
            {foreach from=$slide item=caption name=captions}
                {if $caption.title != '' or $caption.caption != ''}
                    <div id="htmlcaption_{$caption.id_slide}" class="nivo-html-caption">
                        <h3>{$caption.title}</h3>
                        <p>{$caption.caption}</p>
                    </div>
                {/if}
            {/foreach}
        {/if}
    {/foreach}
</div>

{if $minicSlider.position == 'top'}
<div style="display:none;">
    <div>
{/if} 
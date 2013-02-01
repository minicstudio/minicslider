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

{if $slides.$lang_iso|@count != 0}
    {if $minicSlider.options.front == 1}
        {if $page_name == 'index'}
            <!-- MINIC SLIDER -->
            {include file="{$minicSlider.tpl}"}
        {/if}
    {else}
        <!-- MINIC SLIDER -->
        {include file="{$minicSlider.tpl}"}
    {/if} 

    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider({
            effect: '{if $minicSlider.options.current != ''}{$minicSlider.options.current}{else}random{/if}', 
            slices: {if $minicSlider.options.slices != ''}{$minicSlider.options.slices}{else}15{/if}, 
            boxCols: {if $minicSlider.options.slices != ''}{$minicSlider.options.cols}{else}8{/if}, 
            boxRows: {if $minicSlider.options.rows != ''}{$minicSlider.options.rows}{else}4{/if}, 
            animSpeed: {if $minicSlider.options.speed != ''}{$minicSlider.options.speed}{else}500{/if}, 
            pauseTime: {if $minicSlider.options.pause != ''}{$minicSlider.options.pause}{else}3000{/if}, 
            startSlide: {if $minicSlider.options.startSlide != ''}{$minicSlider.options.startSlide}{else}0{/if},
            directionNav: {if $minicSlider.options.buttons == 1}true{else}false{/if}, 
            controlNav: {if $minicSlider.options.control == 1}true{else}false{/if}, 
            controlNavThumbs: {if $minicSlider.options.thumbnail == 1}true{else}false{/if},
            pauseOnHover: {if $minicSlider.options.hover == 1}true{else}false{/if}, 
            manualAdvance: {if $minicSlider.options.manual == 1}true{else}false{/if}, 
            prevText: '{l s='Prev'}', 
            nextText: '{l s='Next'}', 
            randomStart: {if $minicSlider.options.random == 1}true{else}false{/if}
        });
    });
    </script>   
{/if}
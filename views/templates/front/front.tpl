{if $slides|@count != 0}
    {if $minicSlider.options.front == 1 && $page_name != 'index'}
        <!-- Minic Slider -->
    {else}
        {if $minicSlider.position == 'top'}
        </div>  
            </div>
        {/if}
        <div id="minic_slider" class="theme-default{if $minicSlider.options.thumbnail == 1 and $minicSlider.options.control != 0} controlnav-thumbs{/if}">   
            <div id="slider" class="nivoSlider" style="{if $minicSlider.options.min_width}min-width:{$minicSlider.options.min_width};{/if}{if $minicSlider.options.max_width}max-width:{$minicSlider.options.max_width};{/if}{if $minicSlider.options.max_height}max-height:{$minicSlider.options.max_height};{else}min-height:{$minicSlider.min_height}px;{/if}{if $minicSlider.options.control != 1}margin-bottom:0;{/if}">
                {foreach from=$slides item=image name=singleimage}
                    {if $image.url != ''}<a href="{$image.url}" {if $image.target == 1}target="_blank"{/if}>{/if}
                        <img src="{$minicSlider.path.images}{$image.image}" class="slider_image" 
                            {if $image.alt}alt="{$image.alt}"{/if}
                            {if $image.title != '' or $image.caption != ''}title="#htmlcaption_{$image.id_slide}"{/if} 
                            {if $minicSlider.options.thumbnail == 1}data-thumb="{$minicSlider.path.thumbs}{$image.image}"{/if}/>
                    {if $image.url != ''}</a>{/if}
                {/foreach}
            </div>
            {foreach from=$slides item=caption name=singlecaption}
                {if $caption.title != '' or $caption.caption != ''}
                    <div id="htmlcaption_{$caption.id_slide}" class="nivo-html-caption">
                        <h3>{$caption.title}</h3>
                        <p>{$caption.caption}</p>
                    </div>
                {/if}
            {/foreach}
        </div> 
          
        {if $minicSlider.position == 'top'}
        <div>
            <div>
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
                prevText: '{l s='Prev' mod='minicslider'}', 
                nextText: '{l s='Next' mod='minicslider'}', 
                randomStart: {if $minicSlider.options.random == 1}true{else}false{/if},
                {literal}
                afterLoad: function(){
                    $('#slider').css({'min-height' : '1px'});
                }
                {/literal}
            });
        });
        </script>   
    {/if}
{/if}
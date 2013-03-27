{if $minicSlider.position == 'top'}
</div>  
    </div>
{/if}

<div id="minic_slider" class="theme-default{if $minicSlider.options.thumbnail == 1 and $minicSlider.options.control != 0} controlnav-thumbs{/if}">   
    <div id="slider" class="nivoSlider" style="{if $minicSlider.options.width}width:{$minicSlider.options.width}px;{/if}{if $minicSlider.options.height}height:{$minicSlider.options.height}px{/if}{if $minicSlider.options.control != 1}margin-bottom:0;{/if}{if $minicSlider.position == 'top'}display:inline-block;{/if}">
        {foreach from=$slides.$lang_iso item=image name=singleimage}
            {if $image.url != ''}<a href="{$image.url}" {if $image.target == 1}target="_blank"{/if}>{/if}
                <img src="{$minicSlider.path.images}{$image.image}" class="slider_image" 
                    {if $image.alt}alt="{$image.alt}"{/if}
                    {if $image.title != '' or $image.caption != ''}title="#htmlcaption_{$image.id_slide}"{/if} 
                    {if $minicSlider.options.thumbnail == 1}data-thumb="{$minicSlider.path.thumbs}{$image.image}"{/if}/>
            {if $image.url != ''}</a>{/if}
        {/foreach}
    </div>
    {foreach from=$slides.$lang_iso item=caption name=singlecaption}
        {if $caption.title != '' or $caption.caption != ''}
            <div id="htmlcaption_{$caption.id_slide}" class="nivo-html-caption">
                <h3>{$caption.title}</h3>
                <p>{$caption.caption}</p>
            </div>
        {/if}
    {/foreach}
</div> 
  
{if $minicSlider.position == 'top'}
<div style="display:none;">
    <div>
{/if}   
<div id="new" class="minic-container">
    <form id="form-new" class="" method="post" action="{$slider.postAction}" enctype="multipart/form-data">
        <div class="minic-top">
            <h3>{l s='New slide' mod='minicslider'}
                <a href="http://module.minic.ro/minic-slider-news/using-the-feedback-and-bug-report/" target="_blank" class="help">{l s='help & tips' mod='minicslider'}</a>
            </h3>
            <a href="#new" class="minic-close">x</a>
        </div>
        <div class="minic-content">
            <div class="title input-holder">
                <label>{l s='Title'}</label>
                <input type="text" name="title" class="tooltip" placeholder="{l s='The title of the slide'}" title="{l s='This will be the title on the slide.'}" /> 
            </div>
            <div class="url input-holder">
                <label>{l s='Url'}</label>
                <input type="text" name="url" class="tooltip" placeholder="{l s='Link of the slide'}" title="{l s='ex. http://myshop.com/promotions'}" />  
                <span>{l s='Blank target'}</span>
                <input type="checkbox" name="target" class="tooltip" placeholder="1" title="{l s='Check this if you want to open the link in new window.'}" />         
            </div>
            <div class="image input-holder">
                <label>{l s='Image'}</label>
                <input type="file" name="image" id="image-chooser" class="tooltip" title="{l s='Choose an image, only .jpg, .png, .gif are allowed.'}" />
            </div>
            <div class="imageName input-holder">
                <label>{l s='Image name'}</label>
                <input type="text" name="imageName" class="tooltip" placeholder="{l s='Image name'}" title="{l s='Optional! The name of the uploaded image without extension. The white spaces will be replaces with underscore ( _ )'}" />           
            </div>
            {if $slider.options.single == 1}
            <div class="input-holder language">
                <label>{l s='Language'}</label>
                <select name="language" class="" title="{l s='The language of the slide.'}">
                    {foreach from=$slider.lang.all item=lang}
                        <option value="{$lang.id_lang}" {if $lang.id_lang == $slider.lang.default.id_lang}selected="selected"{/if}>{$lang.name}</option>
                    {/foreach}
                </select>
            </div>
            {/if}
            <div class="alt input-holder">
                <label>{l s='Image alt'}</label>
                <input type="text" name="alt" class="tooltip" placeholder="{l s='An alternate text for the image'}" title="{l s='The image alt, alternate text for the image'}" />
            </div>
            <div class="caption input-holder"> 
                <label>{l s='Caption'}</label>
                <textarea type="text" name="caption" cols=40 rows=6 class="tooltip" title="{l s='Be carefull, too long text isnt good and FULL HTML is allowed.'}" placeholder="{l s='The slide text'}"></textarea>                      
            </div>
            <div class="minic-comments"> 
                <h3>{l s="Few important notes"}</h3>
                <p>{l s='The Nivo Slider is now'} <b><a href="http://nivo.dev7studios.com/2012/05/30/the-nivo-slider-is-responsive/" target="_blank">{l s='responsive'}</a></b>!</p>
                <p>{l s='If you dont want title and/or captions text than leave empty those fields.'}</p>
                <p>{l s='The images wont be resized automatically to the same size, you need to resize them manually!'}</p>
                <p>{l s='You can upload different sized images for different language.'}</p>
                <p>{l s='If you want you can upload the same image to different language. They will be renamed but its better if you give them a normal name.'}</p>
                <p>{l s='More than 8 image looks ugly if you use thumbnails in center column.'}</p>
            </div>
        </div>
        <div class="minic-bottom">
            <input type="submit" name="submitNewSlide" value="{l s='Add Slide'}" class="green button-large" />
            {if $slider.options.single == 0}
                <input type="hidden" name="language" value="{$slider.lang.default.id_lang}" />
            {/if}
            <a href="#new" class="minic-close button-large lgrey">{l s='Close' mod='miicslider'}</a>
        </div>
    </form>
</div>

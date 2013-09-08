<script type="text/javascript">
    $(document).ready(function() {

        // Sortable

        $("ul.languages").sortable({
            opacity: 0.6,
            cursor: 'move',
            handle: '.orderer',
            update: function(event, ui) {
                var list = $(this);
                var number;
                var response;
                $.ajax({
                    type: 'GET',
                    url: '{$slider.sortUrl}',
                    cache: false,
                    dataType : "json",
                    data: $(this).sortable("serialize"),
                    success: function(response){
                        if(response.success == "true"){
                            minic.showResponse($("#main-response"), "{l s='Saved successfull' mod='minicslider'}", 'conf');
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
                            minic.showResponse($("#main-response"), "{l s='Something went wrong, please refresh the page and try again' mod='minicslider'}", 'error'); 
                        }
                    },
                    error: function(XMLHttpRequest) {
                        minic.showResponse($("#main-response"), "{l s='Something went wrong, please refresh the page and try again' mod='minicslider'}", 'error'); 
                        console.log(XMLHttpRequest);
                    }
                });
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
            <a href="http://module.minic.ro" id="minic-studio" class="social" title="Minic studio module site" target="_blank">minic studio</a>
            <a href="https://plus.google.com/114549918965076938738" class="social" title="Minic studio Google+ page" target="_blank"><i class="icon-googleplus"></i></a>
            <a href="https://github.com/minicstudio" class="social" title="Minic studio Github page" target="_blank"><i class="icon-github"></i></a>
            <a href="https://twitter.com/minicstudio" class="social" title="Minic studio Twitter page" target="_blank"><i class="icon-twitter"></i></a>
            <a href="https://www.facebook.com/minicmodule" class="social" title="Minic studio Facebook page" target="_blank"><i class="icon-facebook"></i></a>
            <div id="more-module">
                <span>Top Modules</span>
                <ul id="module-list">
                    <li>{l s='No data available' mod='minicslider' mod='minicslider'}</li>
                </ul>
            </div>
            <a href="#newsletter" id="open-newsletter" class="open-popup" data-popup="#newsletter">{l s='Newsletter' mod='minicslider'}</a>
            <a href="#bug" id="open-bug" class="minic-open">{l s='Bug Report' mod='minicslider'}</a>
            <a href="#feedback" id="open-feedback" class="minic-open">{l s='Feedback' mod='minicslider'}</a>
        </div>
        <div id="banner"></div>
        <div id="navigation">
            <a href="#new" id="new-button" class="minic-open">{l s='Add New' mod='minicslider'}</a>
            <a href="#options" id="options-button" class="minic-open">{l s='Options' mod='minicslider'}</a>
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
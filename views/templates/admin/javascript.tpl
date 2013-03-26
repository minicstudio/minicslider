<script type="text/javascript">
jQuery(window).load(function(){
    {if $minic.first_start}
    // First start
    $('#newsletter').fadeIn();
    minic.newsletter(false);
    {/if}
});
jQuery(document).ready(function($) {
    // News Feed
    $.getJSON('http://192.168.100.250/laravel/public/process/feed?callback=?',function(feed){
        var version = '{$minic.info.version}';
        var name = '{$minic.info.module}';
        
        // Banner
        if(feed['modules'][name]['version'] != version){
            $('#banner').empty().html(feed['modules'][name]['update']);
        }else if(feed['modules'][name]['news']){
            $('#banner').empty().html(feed['modules'][name]['news']);
        }else{
            $('#banner').empty().html(feed['news']);
        }

        // Module list
        var list = "<li>{l s='No data available' mod='minicskepetonpro'}</li>";
        if(feed.modules){
            list = '';
            $.each(feed.modules, function() {
                
                list += '<li>';
                list += '<a href="'+ this.link +'" target="_blank" title="{l s='Click for more details' mod='minicskepetonpro'}">';
                list += '<img src="'+ this.logo +'">';
                list += '<p>';
                list += '<span class="title">'+ this.name +'</span>';
                list += '<span class="description">'+ this.description +'</span>';
                list += '<span class="price">'+ this.price +'</span>';
                list += '</p>';
                list += '</a>';
                list += '</li>';
            });
            
        }
        $('ul#module-list').append(list);
        
    });
});
</script>
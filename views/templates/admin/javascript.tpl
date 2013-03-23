<script type="text/javascript">
jQuery(window).load(function(){
    {if $minic.first_start}
    // First start
    $('#newsletter').fadeIn();
    {/if}
});
jQuery(document).ready(function($) {
    // News Feed
    $.getJSON('http://module.minic.ro/slider/process.php?domain={$minic.info.domain}&psversion={$minic.info.psVersion}&version={$minic.info.version}',function(feed){
        var version = '{$minic.info.version}';
        var name = 'minicskeletonpro';
        
        if(feed['modules'][name]['version'] != version){
            $('#banner').empty().html(feed['modules'][name]['update']);
        }else if(feed['modules'][name]['news']){
            $('#banner').empty().html(feed['modules'][name]['news']);
        }else{
            $('#banner').empty().html(feed['news']);
        }
    });
});
</script>
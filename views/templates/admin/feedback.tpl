<div id="feedback" class="minic-container">
	<form id="form-feed" class="" method="post">
        <div class="minic-top">
            <h3>{l s='Feedback' mod='minicskeletonpro'}
                <a href="http://module.minic.ro/minic-slider-news/using-the-feedback-and-bug-report/" target="_blank" class="help">{l s='help & tips' mod='minicskeletonpro'}</a>
            </h3>
            <a href="#feedback" class="minic-close">x</a>
        </div>
        <div class="minic-content">
            <!-- Response -->
            {include file="{$minic.admin_tpl_path}messages.tpl" id='feedback'}
    		<div class="input-holder">
    			<label>{l s='Your name' mod='minicskeletonpro'}:</label>
    			<input id="feedback-name" class="name" type="text" name="name" value="{$minic.info.name}" size="50" />
    		</div>
    		<div class="input-holder">
    			<label>{l s='Your email' mod='minicskeletonpro'}:</label>
    			<input id="feedback-email" class="" type="text" name="email" value="{$minic.info.email}" size="50" />
    		</div>
    		<div class="input-holder">
    			<label>{l s='Site address' mod='minicskeletonpro'}:</label>
    			<input id="feedback-domain" class="" type="text" name="domain" value="{$minic.info.domain}" size="50" />
    		</div>
            <div class="input-holder">
                <label>{l s='Message' mod='minicskeletonpro'}:</label>
                <textarea id="feedback-message" class="" name="message" rows="10" cols="49"></textarea>
            </div>
            <div class="minic-comments"> 
                <h3>{l s='Notes' mod='minicskeletonpro'}</h3>
                <p>{l s='Feel free to give us a feedback about our work (we really like to hear few good words) or write down your idea / request and if we think its good we`ll concider to implement into future versions.' mod='minicskeletonpro'}</p>
                <h3>{l s='Important!' mod='minicskeletonpro'}</h3>
                <p>{l s='By clicking to the "Send" button you agree that we will get some basic information. If you do not wish to send your e-mail address uncheck the checkbox.' mod='minicskeletonpro'}</p>
                <ul>
                    <li>{l s='Your shop`s name' mod='minicskeletonpro'}: <span>{$minic.info.name}</span></li>
                    <li>{l s='By default this is the shop email address, feel free to modify.'}: <span>{$minic.info.email}</span></li>
                    <li>{l s='Your shops domain' mod='minicskeletonpro'}: <span>{$minic.info.domain}</span></li>
                    <li>{l s='Prestashop version' mod='minicskeletonpro'}: <span>{$minic.info.psVersion}</span></li>
                    <li>{l s='Module version' mod='minicskeletonpro'}: <span>{$minic.info.version}</span></li>
                </ul>
            </div>
        </div>
        <div class="minic-bottom">
            <a href="#feedback" id="send-feedback" class="button-large green">{l s='Send' mod='minicskeletonpro'}</a>
            <a href="#feedback" class="minic-close button-large lgrey">{l s='Close' mod='minicskeletonpro'}</a>
        </div>
	</form>
</div>
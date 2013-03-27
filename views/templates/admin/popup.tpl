{if $newsletter}
<div id="newsletter" class="popup">
	<div class="inner">
	    <div class="header">
	        <h4>{l s='Help Us!' mod='minicskeletonpro'}</h4> <!-- Title -->
	        <span class="close-popup" data-popup="#newsletter">x</span> <!-- Close Button -->
	    </div>
	    <div class="popup-content"> <!-- Content -->
	        <div class="container"> <!-- Container -->
	            <p>{l s='By clicking to the YES button you agree to share some basic information with us.' mod='minicskeletonpro'}</p>
	            <p><b>{l s='Don`t worry we`ll be discrete with this information' mod='minicskeletonpro'}:</b></p>
	            <ul>
	                <li>{l s='Domain' mod='minicskeletonpro'}: <b>{$minic.info.domain}</b></li>
	                <li>{l s='Version' mod='minicskeletonpro'}: <b>{$minic.info.version}</b></li>
	                <li>{l s='PS Version' mod='minicskeletonpro'}: <b>{$minic.info.psVersion}</b></li>
	            </ul>
	            <form>
	                <p>{l s='If you want to riecive news about our updates, new modules, give us your e-mail address.' mod='minicskeletonpro'}</p>
	                <div>
	                    <label>{l s='Email' mod='minicskeletonpro'}:</label>
	                    <input type="text" id="sendInfoEmail" name="infoEmail" />
	                </div>  
	            </form>
	            <h3>{l s='Thank you for your help!' mod='minicskeletonpro'}</h3>
	        </div> <!-- /END Container -->
	        <div class="buttons"> <!-- Buttons Holder -->
	            <a href="#" id="sendInfo" class="submit-popup button-small green" data-popup="#newsletter">{l s='Yes' mod='minicskeletonpro'}</a>  <!-- Action Button -->
	            <a href="#" id="cancelInfo" class="close-popup button-small grey" data-popup="#newsletter">{l s='No' mod='minicskeletonpro'}</a>  <!-- Close Button -->
	        </div> <!-- /END Buttons Holder -->
	    </div> <!-- /END Content -->
	</div>
</div>
{/if}
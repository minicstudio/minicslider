<div id="bug" class="minic-container">
    <form id="form-bug" class="" method="post">
        <div class="minic-top">
            <h3>{l s='Bug report' mod='minicslider'}
                <a href="http://module.minic.ro/how-to-use-feedback-and-bug-report-in-our-modules/" target="_blank" class="help">{l s='help & tips' mod='minicslider'}</a>
            </h3>
            <a href="#bug" class="minic-close">x</a>
        </div>
        <div class="minic-content">
            <!-- Response -->
            {include file="{$minic.admin_tpl_path}messages.tpl" id='bug'}
            <div class="input-holder">
                <label>{l s='Your name' mod='minicslider'}:</label>
                <input id="bug-name" class="name" type="text" name="name" placeholder="John Doe" value="" />
            </div>
            <div class="input-holder">
                <label>{l s='Your email' mod='minicslider'}:</label>
                <input id="bug-email" class="" type="text" name="email" placeholder="example@example.com" value="{$minic.info.email}" />
            </div>
            <div class="input-holder">
                <label>{l s='Site address' mod='minicslider'}:</label>
                <input id="bug-domain" class="" type="text" name="domain" placeholder="mydomain.com" value="{$minic.info.domain}" />
            </div>
            <div class="input-holder">
                <label>{l s='Message' mod='minicslider'}:</label>
                <textarea id="bug-message" class="" name="message" placeholder="Your message, request, suggestion, etc." rows="10" cols="49"></textarea>
            </div>
            <div class="minic-comments"> 
                <h3>{l s='Notes' mod='minicslider'}</h3>
                <p>{l s='Please describe the bug with as much detail as it`s possible, so we can understand the problem easier.' mod='minicslider'}</p>
                <h3>{l s='Important!' mod='minicslider'}</h3>
                <p>{l s='By clicking to the "Send" button you agree that we will get some basic information. If you do not wish to send your e-mail address uncheck the checkbox.' mod='minicslider'}</p>
                <ul>
                    <li>{l s='The module name' mod='minicslider'}: <span id="info-module">{$minic.info.module}</span></li>
                    <li>{l s='By default this is the shop email address, feel free to modify.' mod='minicslider'}: <span id="info-email">{$minic.info.email}</span></li>
                    <li>{l s='Your shops domain' mod='minicslider'}: <span id="info-domain">{$minic.info.domain}</span></li>
                    <li>{l s='Prestashop version' mod='minicslider'}: <span id="info-psversion">{$minic.info.psVersion}</span></li>
                    <li>{l s='Module version' mod='minicslider'}: <span id="info-version">{$minic.info.version}</span></li>
                    <li>{l s='Server version' mod='minicslider'}: <span id="info-server">{$minic.info.server}</span></li>
                    <li>{l s='Php version' mod='minicslider'}: <span id="info-php">{$minic.info.php}</span></li>
                    <li>{l s='Mysql version' mod='minicslider'}: <span id="info-mysql">{$minic.info.mysql}</span></li>
                    <li>{l s='Theme name' mod='minicslider'}: <span id="info-theme">{$minic.info.theme}</span></li>
                    <li>{l s='Browser version' mod='minicslider'}: <span id="info-browser">{$minic.info.userInfo}</span></li>
                </ul>
            </div>
        </div>
        <div class="minic-bottom">
            <a href="#bug" id="send-bug" class="button-large green">{l s='Send' mod='minicslider'}</a>
            <a href="#bug" class="minic-close button-large lgrey">{l s='Close' mod='minicslider'}</a>
            <input id="info-module" type="hidden" name="module" value="{$minic.info.module}" />
            <input id="info-context" type="hidden" value="{$minic.info.context}" name="context" />
        </div>
    </form>
</div>
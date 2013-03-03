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

<fieldset id="feedback" class="hidden-div">
    <legend>{l s='Feedback'}</legend>
	<form id="formFeed" class="" method="post">
        <div id="feedInfoCont" class="container">
    		<div>
    			<label>{l s='Your name'}:</label>
    			<input id="feedbackName" class="name ghost-text" type="text" name="name" value="{$slider.info.name}" size="50" />
    		</div>
    		<div>
    			<label>{l s='Your email'}:</label>
    			<input id="feedbackEmail" class="ghost-text" type="text" name="email" value="{$slider.info.email}" size="50" />
                <input id="feedbackEmailAgree" type="checkbox" checked="checked" value="1" />
    		</div>
    		<div>
    			<label>{l s='Site address'}:</label>
    			<input id="feedbackDomain" class="ghost-text" type="text" name="domain" value="http://{$slider.info.domain}" size="50" />
    		</div>
            <div>
                <label>{l s='Message'}:</label>
                <textarea id="feedbackMessage" class="message" name="feedbackMessage" rows="10" cols="49"></textarea>
            </div>
            <div class="button_cont">
                <input id="submitFeedback" type="submit" name="submitFeedback" value="Send" class="button green large" />
                <input id="feedbackPsVersion" type="hidden" value="{$slider.info.psVersion}" name="psversion" />
                <input id="feedbackVersion" type="hidden" value="{$slider.info.version}" name="version" />
            </div>
        </div>
        <div class="comments"> 
            <h3>{l s='Notes'}</h3>
            <p>{l s='Feel free to give us a feedback about our work (we really like to hear few good words) or write down your idea / request and if we think its good we`ll concider to implement into future versions.'}</p>
            <h3>{l s='Important!'}</h3>
            <p>{l s='By clicking to the "Send" button you agree that we will get some basic information. If you do not wish to send your e-mail address uncheck the checkbox.'}</p>
            <ul>
                <li>{l s='Your shop`s name'}: <b>{$slider.info.name}</b></li>
                <li>{l s='Your shops e-mail address. IMPORTANT: we just need in case of communicaton!'}: <b>{$slider.info.email}</b></li>
                <li>{l s='Your shops domain'}: <b>{$slider.info.domain}</b></li>
                <li>{l s='prestashop version'}: <b>{$slider.info.psVersion}</b></li>
                <li>{l s='module version'}: <b>{$slider.info.version}</b></li>
            </ul>
        </div>
	</form>
    <div class="response" style="display:none;">
        <span class="conf">{l s='Message sent successfull! Thank you for your time.'}</span>
        <span class="error">{l s='Something went wrong, please try again later.'}</span>
        <span class="empty">{l s='Name and Message is required!'}</span>
    </div>
</fieldset>
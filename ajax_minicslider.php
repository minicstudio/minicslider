<?php
/*
* minicslider - a module template for Prestashop v1.5+
* Copyright (C) 2013 S.C. Minic Studio S.R.L.
* 
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

include_once('../../config/config.inc.php');
include_once('../../init.php');
include_once('minicslider.php');

$minicSlider = new MinicSlider();

if (!Tools::isSubmit('secure_key') || Tools::getValue('secure_key') != $minicSlider->secure_key || !Tools::getValue('action'))
	die(1);

$success = false;

if (Tools::getValue('action') == 'updateOrder' && Tools::getValue('order')){  
	$i = 0; 	
	foreach (Tools::getValue('order') as $key => $slide){		
		$i++;		
		$id = explode('h', $slide);			

		if(Db::getInstance()->Execute('UPDATE `'._DB_PREFIX_.'minic_slider` SET id_order = '.$i.' WHERE id_slide = '.$id[0])){     
			$success = true;    
		}else{     
			$success = false;    
		}	
	}
}
if($success){
	echo '{"success" : "true"}';
}else{  
	echo '{"success" : "false"}';
}

?>
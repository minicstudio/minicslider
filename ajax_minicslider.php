<?php
/*
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
* @author  	  S.C Minic Studio S.R.L.
* @copyright  Copyright S.C Minic Studio S.R.L. 2012. All rights reserved.
* @license 	  GPLv2 License http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
* @version 	  v3.0.0
*
*/

include_once('../../config/config.inc.php');
include_once('../../init.php');
include_once('minicslider.php');

$minicSlider = new MinicSlider();

if (!Tools::isSubmit('secure_key') || Tools::getValue('secure_key') != $minicSlider->secure_key || !Tools::getValue('action'))
	die(1);

$success = false;

if (Tools::getValue('action') == 'updateOrder' && Tools::getValue('slides')){  
	parse_str(Tools::getValue('slides'), $slides);	
	$i = 0; 	

	foreach ($slides['order'] as $key => $slide){		
		$i++;		
		$id = split('h', $slide);			

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
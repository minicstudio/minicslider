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

if (!defined('_PS_VERSION_'))
  exit;

class MinicSlider extends Module
{
	protected $maxImageSize = 1048576;

	public function __construct()
	    {
		    $this->name = 'minicslider';
		    $this->tab = 'advertising_marketing';
		    $this->version = '4.1.11';
		    $this->author = 'minic studio';
		    $this->need_instance = 1;
			$this->secure_key = Tools::encrypt($this->name);
	
		    parent::__construct();
	
		    $this->displayName = $this->l('minic slider');
		    $this->description = $this->l('Powerfull image slider for advertising.');

		    // Paths
			$this->module_path 		= _PS_MODULE_DIR_.$this->name.'/';
			$this->admin_tpl_path 	= _PS_MODULE_DIR_.$this->name.'/views/templates/admin/';
			$this->front_tpl_path	= _PS_MODULE_DIR_.$this->name.'/views/templates/front/';
			$this->hooks_tpl_path	= _PS_MODULE_DIR_.$this->name.'/views/templates/hooks/';
	    }
	
	private function installDB()
		{
	
			Db::getInstance()->Execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'minic_slider`');
    		Db::getInstance()->Execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'minic_options`');
	
			if (!Db::getInstance()->Execute('
				CREATE TABLE `'._DB_PREFIX_.'minic_slider` (
					`id_slide` int(10) unsigned NOT NULL AUTO_INCREMENT,
					`id_shop` int(10) unsigned NOT NULL,
					`id_lang` int(10) unsigned NOT NULL,
					`id_order` int(10) unsigned NOT NULL,
					`lang_iso` VARCHAR(5),
					`title` VARCHAR(100),
					`url` VARCHAR(500),
					`target` tinyint(1) unsigned NOT NULL DEFAULT \'0\',
					`image` VARCHAR(100),
					`alt` VARCHAR(100),
					`caption` VARCHAR(300),
					`active` tinyint(1) unsigned NOT NULL DEFAULT \'1\',
					PRIMARY KEY (`id_slide`, `id_shop`)
			    ) ENGINE = '._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;'))
				return false;
	
			if (!Db::getInstance()->Execute('
				CREATE TABLE `'._DB_PREFIX_.'minic_options` (
					`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
					`id_shop` int(10) unsigned NOT NULL,
					`effect` VARCHAR(300),
					`current` VARCHAR(300),
					`slices` int(3) NOT NULL DEFAULT \'15\',
					`cols` int(3) NOT NULL DEFAULT \'8\',
					`rows` int(3) NOT NULL DEFAULT \'4\',
					`speed` int(4) NOT NULL DEFAULT \'500\',
					`pause` int(4) NOT NULL DEFAULT \'3000\',
					`manual` tinyint(1) unsigned NOT NULL DEFAULT \'0\',
					`hover` tinyint(1) unsigned NOT NULL DEFAULT \'1\',
					`buttons` tinyint(1) unsigned NOT NULL DEFAULT \'1\',
					`control` tinyint(1) unsigned NOT NULL DEFAULT \'1\',
					`thumbnail` tinyint(1) unsigned NOT NULL DEFAULT \'0\',
					`random` tinyint(1) unsigned NOT NULL DEFAULT \'0\',
					`start_slide` int(2) unsigned NOT NULL DEFAULT 0,
					`single` tinyint(1) unsigned NOT NULL DEFAULT \'0\',
					`min_width` varchar(10),
					`max_width` varchar(10),
					`max_height` varchar(10),
					`front` tinyint(1) unsigned NOT NULL DEFAULT \'0\',
					PRIMARY KEY (`id`, `id_shop`)
		        ) ENGINE = '._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;'))
				return false;	
			return true;
		}
	
	private function insertOptions()
		{
			if (!Db::getInstance()->Execute('
				INSERT INTO `'._DB_PREFIX_.'minic_options` (
					`id_shop`, `effect`
				) VALUES (
					1,
					"sliceDown,sliceDownLeft,sliceUp,sliceUpLeft,sliceUpDown,sliceUpDownLeft,fold,slideInRight,slideInLeft,boxRandom,boxRain,boxRainReverse,boxRainGrow,boxRainGrowReverse,fade");'))
				return false;
			return true;
		}
	
	public function install()
	    {
			if (parent::install() && 
				$this->installDB() && 
				$this->insertOptions() && 
				$this->registerHook('displayTop') && 
				$this->registerHook('displayHeader') && 
				$this->registerHook('displayAdminHomeQuickLinks') &&
				$this->registerHook('displayBackOfficeHeader') && 
				Configuration::updateValue('PS_MINIC_SLIDER_FIRST', '1')){
				return true;
			}else{
				$this->uninstall();
				return false;
			}
		}
	
	public function uninstall()
		{
			$image = Db::getInstance()->ExecuteS('SELECT image FROM `'._DB_PREFIX_.'minic_slider`');
	
			foreach($image as $img){
				$this->_deleteImages($img['image']);
			}
	
			if (!Db::getInstance()->Execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'minic_slider`') OR
	    		!Db::getInstance()->Execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'minic_options`') OR
	    		!Configuration::deleteByName('PS_MINIC_SLIDER_FIRST') OR
				!parent::uninstall())
				return false;
			return true;	
		}		
	
	public function getContent()
		{
			$this->context->smarty->assign('error', 0);
			$this->context->smarty->assign('confirmation', 0);

			if (Tools::isSubmit('submitMinicOptions')){
				$this->_handleOptions();
			} elseif (Tools::isSubmit('submitNewSlide')){
				$this->_handleNewSlide();
			} elseif (Tools::isSubmit('editSlide')){
				$this->_handleEditSlide();
			} elseif (Tools::isSubmit('deleteSlide')){
				$this->_handleDeleteSlide();
			} elseif (Tools::isSubmit('updateModule')){
				$this->upgradeModule();
			}
			return $this->_displayForm();
		}

	private function _displayForm()
		{	
			$defaultLanguage = Language::getLanguage(Configuration::get('PS_LANG_DEFAULT'));
			$activeLanguages = Language::getLanguages(true);
			$allLanguages = Language::getLanguages(false);
			$id_shop = (int)$this->context->shop->id;
			$options = Db::getInstance()->getRow('SELECT * FROM `'._DB_PREFIX_.'minic_options`');
			$slides = array();
	
			foreach($activeLanguages as $lang){
				$slides[$lang['iso_code']] = Db::getInstance()->ExecuteS('SELECT * FROM `'._DB_PREFIX_.'minic_slider` WHERE id_lang ='.$lang['id_lang'].' AND id_shop = '.$id_shop.' ORDER BY id_order ASC');
			}
	
			$this->context->smarty->assign('slider', array(
				'options' => array(
					'effect' => (!empty($options['effect'])) ? explode(',', $options['effect']) : NULL,
					'current' => (!empty($options['current'])) ? explode(',', $options['current']) : NULL,
					'slices' => $options['slices'],
					'cols' => $options['cols'],
					'rows' => $options['rows'],
					'speed' => $options['speed'],
					'pause' => $options['pause'],
					'manual' => $options['manual'],
					'hover' => $options['hover'],
					'buttons' => $options['buttons'],
					'control' => $options['control'],
					'thumbnail' => $options['thumbnail'],
					'random' => $options['random'],
					'startSlide' => $options['start_slide'],
					'single' => $options['single'],
					'min_width' => $options['min_width'],
					'max_width' => $options['max_width'],
					'max_height' => $options['max_height'],
					'front' => $options['front']
				),
				'slides' => $slides,
				'lang' => array(
					'default' => $defaultLanguage,
					'default_iso' => $defaultLanguage,
					'default_name' => $defaultLanguage,
					'all' => $activeLanguages,
					'lang_dir' => _THEME_LANG_DIR_,
					'user' => $this->context->language->id
				),				
				'tpl' => array(
                	'options' => _PS_MODULE_DIR_.'minicslider/views/templates/admin/admin-options.tpl',
                	'new' => _PS_MODULE_DIR_.'minicslider/views/templates/admin/admin-new.tpl',
                	'slides' => _PS_MODULE_DIR_.'minicslider/views/templates/admin/admin-slides.tpl',
                	'feedback' => _PS_MODULE_DIR_.'minicslider/views/templates/admin/admin-feedback.tpl',
                	'bug' => _PS_MODULE_DIR_.'minicslider/views/templates/admin/admin-bug.tpl'
            	),
				'postAction' => 'index.php?tab=AdminModules&configure='.$this->name.'&token='.Tools::getAdminTokenLite('AdminModules').'&tab_module=advertising_marketing&module_name='.$this->name.'',
				'sortUrl' => _PS_BASE_URL_.__PS_BASE_URI__.'modules/'.$this->name.'/ajax_'.$this->name.'.php?action=updateOrder&secure_key='.$this->secure_key,
				'firstStart' => Configuration::get('PS_MINIC_SLIDER_FIRST'),
				'id_shop' => (int)$this->context->shop->id
			));	

			$this->smarty->assign('minic', array(
				'first_start' 	 => Configuration::get('PS_MINIC_SLIDER_FIRST'),//Configuration::get(strtoupper($this->name).'_START'),

				'admin_tpl_path' => $this->admin_tpl_path,
				'front_tpl_path' => $this->front_tpl_path,
				'hooks_tpl_path' => $this->hooks_tpl_path,

				'info' => array(
					'module'	=> $this->name,
	            	'name'      => Configuration::get('PS_SHOP_NAME'),
	        		'domain'    => Configuration::get('PS_SHOP_DOMAIN'),
	        		'email'     => Configuration::get('PS_SHOP_EMAIL'),
	        		'version'   => $this->version,
	            	'psVersion' => _PS_VERSION_,
	        		'server'    => $_SERVER['SERVER_SOFTWARE'],
	        		'php'       => phpversion(),
	        		'mysql' 	=> Db::getInstance()->getVersion(),
	        		'theme' 	=> _THEME_NAME_,
	        		'userInfo'  => $_SERVER['HTTP_USER_AGENT'],
	        		'today' 	=> date('Y-m-d'),
	        		'module'	=> $this->name,
	        		'context'	=> (Configuration::get('PS_MULTISHOP_FEATURE_ACTIVE') == 0) ? 1 : ($this->context->shop->getTotalShops() != 1) ? $this->context->shop->getContext() : 1,
				)
			));

			if(Configuration::get('PS_MINIC_SLIDER_FIRST') == 1)
				Configuration::updateValue('PS_MINIC_SLIDER_FIRST', '0');

			return $this->display(__FILE__, 'views/templates/admin/admin.tpl');
		}


	public function upgradeModule()
		{
			/**
			* TODO: kell/kellenek az uj verziok (gondolom a lehujabbat kell meagdni es akkor addig updateli)
			* TODO: a fajlokat le kell tolteni (talan az osszes verzio fajljat le lehetne tolteni, ugyis csak azt hasznalja ameiket kell)
			*/
			$module = new MinicSlider();
			$module->installed = 1;
            $module->version = '4.2'; // Amire updatelni kell (ha tobb verzioval el van maradva akkor wtf van?)
            $module->database_version = $this->version;
            $module->registered_version = $this->version;

            if (!class_exists($module->name))
			{
				if (!file_exists(_PS_MODULE_DIR_.$module->name.'/'.$module->name.'.php'))
					continue;
				require_once(_PS_MODULE_DIR_.$module->name.'/'.$module->name.'.php');
			}
			if ($object = new $module->name())
			{
				$object->initUpgradeModule($module);
				$object->loadUpgradeVersionList($module->name, $module->version, $module->database_version);
				$object->runUpgradeModule();

				// Ez azt hiszem feleslegsen van itt, illetve kell egy sajat visszajelzes
				if ((count($errors_module_list = $object->getErrors())))
					$module_errors[] = array('name' => $module->name, 'message' => $errors_module_list);
				else if ((count($conf_module_list = $object->getConfirmations())))
					$module_success[] = array('name' => $module->name, 'message' => $conf_module_list);
				unset($object);
			}
		}

	private function _handleOptions()
		{		
			$id_shop = (int)$this->context->shop->id;
			$effect = implode(',', Tools::getValue('nivo_effect'));
			$current = '';
			if(Tools::getValue('nivo_current') != '')
				$current = implode(',', Tools::getValue('nivo_current'));
		
			if(!Db::getInstance()->Execute('
				UPDATE `'._DB_PREFIX_.'minic_options` SET 
					effect = "'.$effect.'",
					current = "'.$current.'",
					slices = "'.(int)Tools::getValue('slices').'",
					cols = "'.(int)Tools::getValue('cols').'",
					rows = "'.(int)Tools::getValue('rows').'",
					speed = "'.(int)Tools::getValue('speed').'",
					pause = "'.(int)Tools::getValue('pause').'",
					manual = "'.(int)Tools::getValue('manual').'",
					hover = "'.(int)Tools::getValue('hover').'",
					buttons = "'.(int)Tools::getValue('buttons').'",
					control = "'.(int)Tools::getValue('control').'",
					thumbnail = "'.(int)Tools::getValue('thumbnail').'",					
					random = "'.(int)Tools::getValue('random').'",
					start_slide = "'.(int)Tools::getValue('startSlide').'",
					single = "'.(int)Tools::getValue('single').'",
					min_width = "'.Tools::getValue('min_width').'",
					max_width = "'.Tools::getValue('max_width').'",
					max_height = "'.Tools::getValue('max_height').'",
					front = "'.(int)Tools::getValue('front').'" 
				WHERE id = 1
					')){
				$this->context->smarty->assign('error', $this->l('An error occurred while saving data. I`m sure this is a DataBase error.'));
				return false;
			}

			$this->context->smarty->assign('confirmation', $this->l('Saved successfull.'));		
			return true;
		}
	
	private function _handleNewSlide()
		{
			$languages = Language::getLanguages(false);		
			$id_lang = (int)Tools::getValue('language');
			$lang = Language::getLanguage($id_lang);
			$id_shop = (int)$this->context->shop->id;
			$lastSlideID = Db::getInstance()->ExecuteS('SELECT id_slide, id_order FROM `'._DB_PREFIX_.'minic_slider` WHERE id_lang = '.$id_lang.' AND id_shop = '.$id_shop.' ORDER BY id_slide DESC LIMIT 1');
			$currentSlideID = ($lastSlideID) ? $lastSlideID[0]['id_slide']+1 : 1;
			$currentOrderID = ($lastSlideID) ? $lastSlideID[0]['id_order']+1 : 1 ;
		
			if(empty($_FILES['image']['name'])){
				$this->context->smarty->assign('error', $this->l('Image needed, please choose one.'));
				return false;
			}
			
			$image = $this->_resizer($_FILES['image'], Tools::getValue('imageName'));
		
			if(!$image)
				return false;
		
			$insert = Db::getInstance()->Execute('
				INSERT INTO `'._DB_PREFIX_.'minic_slider` ( 
					id_shop, id_lang, id_order, lang_iso, title, url, target, image, alt, caption 
				) VALUES ( 
					"'.$id_shop.'",
					"'.(int)Tools::getValue('language').'",
					"'.$currentOrderID.'",
					"'.$lang['iso_code'].'",
					"'.Tools::getValue('title').'",
					"'.Tools::getValue('url').'",
					"'.(int)Tools::getValue('target').'",
					"'.$image.'",
					"'.Tools::getValue('alt').'",
					"'.pSQL(Tools::getValue('caption'), true).'")
				');

			if(!$insert){
				$this->_deleteImages($image);
				$this->context->smarty->assign('error', $this->l('An error occured while saving data.'));	
				return false;	
			}	
		
			$this->context->smarty->assign('confirmation', $this->l('New slide added successfull.'));
		}
	private function _handleEditSlide()
		{	
			$langIso = Tools::getValue('slideIso');
			$newImage = '';
		
			if(!empty($_FILES['newImage']['name'])){
				$image = $this->_resizer($_FILES['newImage']);
				if(empty($image))
					return false;
				$newImage = 'image = "'.$image.'",';
			}
		
			$update = Db::getInstance()->Execute('
				UPDATE `'._DB_PREFIX_.'minic_slider` SET 
					title = "'.Tools::getValue('title').'",
					url = "'.Tools::getValue('url').'",
					target = "'.(int)Tools::getValue('target').'",
					'.$newImage.'
					alt = "'.Tools::getValue('alt').'",
					caption = "'.pSQL(Tools::getValue('caption'), true).'",
					active = "'.(int)Tools::getValue('isActive').'"
				WHERE id_slide = '.(int)Tools::getValue('slideId'));
		
			if(!$update){
				$this->_deleteImages(Tools::getValue('image'));			
				$this->context->smarty->assign('error', $this->l('An error occured while saving data.'));	
				return false;			
			}
		
			if(!empty($_FILES['newImage']['name'])){
				$this->_deleteImages(Tools::getValue('oldImage'));
			}
		
			$this->context->smarty->assign('confirmation', $this->l('Saved succsessfull.'));
		}
	
	public function _handleDeleteSlide()
		{
			$id_shop = (int)$this->context->shop->id;
			Db::getInstance()->delete(_DB_PREFIX_.'minic_slider', 'id_slide = '.(int)Tools::getValue('slideId'));
		
			if(Db::getInstance()->Affected_Rows() == 1){
				Db::getInstance()->Execute('
					UPDATE `'._DB_PREFIX_.'minic_slider` 
					SET id_order = id_order-1 
					WHERE (
						id_order > '.Tools::getValue('orderId').' AND 
						lang_iso = "'.Tools::getValue('slideIso').'" AND 
						id_shop = '.$id_shop.')
				');
		
				$this->_deleteImages(Tools::getValue('oldImage'));
				$this->context->smarty->assign('confirmation', $this->l('Deleted succsessfull.'));
			}else{
				$this->context->smarty->assign('error', $this->l('Cant delete slide data from database.'));
			}
		}
	
	private function _resizer($image, $newName = NULL)
		{
			$path = $this->module_path.'/uploads/';
			$pathThumb = $this->module_path.'/uploads/thumbs/';

			// Check if thumb dir is exists and create if not
			if(!file_exists($pathThumb) && !is_dir($pathThumb))
				mkdir($pathThumb);

			// Replace whitesapce
			$imageName = explode('.', str_replace(' ', '_', $image['name']));
			$name = $imageName[0].'.'.$imageName[1];
			// Replace unwanted chars
			if($newName){
				$unwanted_chars = array(
					'Š'=>'S', 'š'=>'s', 'Ž'=>'Z', 'ž'=>'z', 'À'=>'A', 'Á'=>'A', 'Â'=>'A', 'Ã'=>'A', 'Ä'=>'A', 'Å'=>'A', 'Æ'=>'A', 'Ç'=>'C', 'È'=>'E', 'É'=>'E',
                    'Ê'=>'E', 'Ë'=>'E', 'Ì'=>'I', 'Í'=>'I', 'Î'=>'I', 'Ï'=>'I', 'Ñ'=>'N', 'Ò'=>'O', 'Ó'=>'O', 'Ô'=>'O', 'Õ'=>'O', 'Ö'=>'O', 'Ø'=>'O', 'Ù'=>'U',
                    'Ú'=>'U', 'Û'=>'U', 'Ü'=>'U', 'Ý'=>'Y', 'Þ'=>'B', 'ß'=>'Ss', 'à'=>'a', 'á'=>'a', 'â'=>'a', 'ã'=>'a', 'ä'=>'a', 'å'=>'a', 'æ'=>'a', 'ç'=>'c',
                    'è'=>'e', 'é'=>'e', 'ê'=>'e', 'ë'=>'e', 'ì'=>'i', 'í'=>'i', 'î'=>'i', 'ï'=>'i', 'ð'=>'o', 'ñ'=>'n', 'ò'=>'o', 'ó'=>'o', 'ô'=>'o', 'õ'=>'o',
                    'ö'=>'o', 'ø'=>'o', 'ù'=>'u', 'ú'=>'u', 'û'=>'u', 'ý'=>'y', 'ý'=>'y', 'þ'=>'b', 'ÿ'=>'y', 'Ğ'=>'G', 'İ'=>'I', 'Ş'=>'S', 'ğ'=>'g', 'ı'=>'i', 
                    'ş'=>'s', 'ü'=>'u',
                );
				$nameB = strtr( $newName, $unwanted_chars );
				$name = str_replace(' ', '_', $nameB).'.'.$imageName[1];
			}

			// if new name is empty and picture is exists create a new name
			if(file_exists($path.$name) && $newName == NULL){
				$name = $imageName[0].date('-i-s').'.'.$imageName[1];
			}

			// Check image size and format
			if($error = ImageManager::validateUpload($image, $this->maxImageSize)){
				$this->context->smarty->assign('error', $error);
				return;
			}

			// Move image
			if(!ImageManager::resize($image['tmp_name'], dirname(__FILE__).'/uploads/'.$name)){
				$this->context->smarty->assign('error', $this->l('An error occured during the upload, please check the permissions.'));
				unlink($tmpName);
				return;
			}			

			// Create thumbnail for slider
			$imgSize = getimagesize($path.$name);
			if($imgSize[0] >= $imgSize[1]){
				// Resize based on width
				$imgWidth = 50;
				$imgHeight = ($imgSize[1]/100)*(5000/$imgSize[0]);
			}else{
				// Resize based on height
				$imgHeight = 50;
				$imgWidth = ($imgSize[0]/100)*(5000/$imgSize[1]);
			}

			// Actual resize
			if(!ImageManager::resize($path.$name, $pathThumb.$name, (int)$imgWidth, (int)$imgHeight)){
				$this->context->smarty->assign('error', $this->l('An error occurred during the image upload. Please check the upload directory permission in the module folder.'));
				return;
			}

			return $name;
		}	
	
	private function _deleteImages($image)
		{
			$path = $_SERVER['DOCUMENT_ROOT'].$this->_path.'/uploads/';
			$pathThumb = $_SERVER['DOCUMENT_ROOT'].$this->_path.'/uploads/thumbs/';		
			
			if(file_exists($path.$image)){
				if(!unlink($path.$image) || !unlink($pathThumb.$image))
					$this->context->smarty->assign('error', $this->l('Cant delete images, please check permissions!'));			
			}else{
				$this->context->smarty->assign('error', $this->l('Image doesn`t exists!'));
			}
		}

	/**
	 * Hook for back office dashboard
	 */
	public function hookDisplayAdminHomeQuickLinks()
	{	
		$this->context->smarty->assign('minicslider', $this->name);
	    return $this->display(__FILE__, 'views/templates/hooks/quick_links.tpl');    
	}
	
	public function hookDisplayBackOfficeHeader()
	{
		// Check if module is loaded
		if (Tools::getValue('configure') != $this->name)
			return false;

		// CSS
		$this->context->controller->addCSS($this->_path.'views/css/elusive-icons/elusive-webfont.css');
		$this->context->controller->addCSS($this->_path.'views/js/plugins/tipsy/tipsy.css');
		$this->context->controller->addCSS($this->_path.'views/css/style.css');
		$this->context->controller->addCSS($this->_path.'views/css/admin.css');
		// JS
		$this->context->controller->addJquery();
		$this->context->controller->addJS($this->_path.'views/js/plugins/jquery.transit/jquery.transit-0.9.9.min.js');
		$this->context->controller->addJS($this->_path.'views/js/plugins/tipsy/jquery.tipsy.js');
		$this->context->controller->addJS($this->_path.'views/js/jquery-ui-1.9.0.custom.min.js');
		$this->context->controller->addJS($this->_path.'views/js/admin.js');

	}

	public function hookDisplayHeader()
		{
			$this->context->controller->addCSS($this->_path.'views/js/plugins/nivo-slider/nivo-slider.css');
			$this->context->controller->addJS($this->_path.'views/js/plugins/nivo-slider/jquery.nivo.slider.pack.js');
		}
 	
 	public function hookHome($position = '')
	 	{
			$id_lang = (int)Configuration::get('PS_LANG_DEFAULT');
			$id_shop = $this->context->shop->id;

			$options = Db::getInstance()->getRow('SELECT * FROM `'._DB_PREFIX_.'minic_options`');

			if($options['single'] == 1)
				$id_lang = $this->context->language->id;
			$slides = Db::getInstance()->ExecuteS('SELECT * FROM `'._DB_PREFIX_.'minic_slider` WHERE (id_lang ='.$id_lang.' AND id_shop = '.$id_shop.' AND active = 1) ORDER BY id_order ASC');					
			
			$first_image_height = ($slides) ? getimagesize($this->module_path.'/uploads/'.$slides[0]['image']) : 0;

			$this->context->smarty->assign('slides', $slides);		
			$this->context->smarty->assign('minicSlider', array(
				'options' => array(
					'current' => $options['current'],
					'slices' => $options['slices'],
					'cols' => $options['cols'],
					'rows' => $options['rows'],
					'speed' => $options['speed'],
					'pause' => $options['pause'],
					'manual' => $options['manual'],
					'hover' => $options['hover'],
					'buttons' => $options['buttons'],
					'control' => $options['control'],
					'thumbnail' => $options['thumbnail'],
					'random' => $options['random'],
					'startSlide' => $options['start_slide'],
					'single' => $options['single'],
					'min_width' => $options['min_width'],
					'max_width' => $options['max_width'],
					'max_height' => $options['max_height'],
					'front' => $options['front']
				),
				'path' => array(
					'images' => $this->_path.'uploads/',
					'thumbs' => $this->_path.'uploads/thumbs/'
				),
				'position' => $position,
				'min_height' => ($first_image_height) ? $first_image_height[1] : 0,
			));
	 	
	 		return $this->display(__FILE__, 'views/templates/front/front.tpl');
		}
	
	public function hookLeftColumn()
		{
			return $this->hookHome('left');
		}
	
	public function hookRightColumn()
		{
			return $this->hookHome('right');
		}		

	public function hookDisplayTop()
		{
			return $this->hookHome('top');
		}
}
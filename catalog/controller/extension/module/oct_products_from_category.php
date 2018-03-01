<?php  
class ControllerExtensionModuleOctProductsFromCategory extends Controller {
	public function index($setting) {
		$languageId = $this->config->get('config_language_id');

		$data['titlelink'] = $setting['oct_pfc_module'][0]['titlelink'];
		$data['heading_title'] = $this->language->get('heading_title');
		$data['title'] = $setting['oct_pfc_module'][0]['title'][$languageId];
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$this->load->language('octemplates/oct_luxury');
		$data['button_popup_view'] = $this->language->get('button_popup_view');  
		$this->load->model('catalog/oct_products_from_category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$data['position'] = $setting['position'];
		$data['products'] = array();
		$data['latest'] = (isset($setting['latest'])) ? (int) $setting['latest'] : 0;
		$data['specials'] = (isset($setting['specials'])) ? (int) $setting['specials'] : 0;
		$data['grid'] = (isset($setting['view'])) ? ((int) $setting['view'] > 0): false;
		$data['oct_popup_view_data'] = $this->config->get('oct_popup_view_data');
		$data['quick_module_id'] = time();

    $limitcat = (isset($setting['limitcategory'])) ? $setting['limitcategory'] : '';		
    $limitprm = (isset($setting['limitproduct_manufacturer'])) ? $setting['limitproduct_manufacturer'] : '';		
    $limitprc = (isset($setting['limitproduct_category'])) ? $setting['limitproduct_category'] : '';		
    $limitman = (isset($setting['limitmanufacturer'])) ? $setting['limitmanufacturer'] : '';		
    $filter = false;
		$ok = true;

		if ($filter=='category' and is_array($limitcat) and count($limitcat)>0 and isset($this->request->get['path'])) {
			$path = explode("_",$this->request->get['path']);
			$curr_cat = $path[count($path)-1];
			$ok = ($ok and array_search($curr_cat,$limitcat)!==false);
		}		
		 
		if ($filter=='manufacturer' and is_array($limitman) and count($limitman)>0 and isset($this->request->get['manufacturer_id'])) {
			$curr_man = (int) $this->request->get['manufacturer_id'];
			$ok = ($ok and array_search($curr_man,$limitman)!==false);
		}		
		 
		if ($filter=='product' and ((is_array($limitprm) and count($limitprm)>0) or (is_array($limitprc) and count($limitprc)>0)) and isset($this->request->get['product_id'])) {
			$curr_pro = (int) $this->request->get['product_id'];
			$myProduct = $this->model_catalog_product->getProduct($curr_pro);
			
			if ($ok and is_array($limitprm) and count($limitprm)>0)
				$ok = ($ok and array_search($myProduct['manufacturer_id'],$limitprm)!==false);
				
			if ($ok and is_array($limitprc) and count($limitprc)>0) {
				$rc = $this->model_catalog_product->getCategories($curr_pro);

				// If ANY of product's category exists in filter  
				foreach($rc as $c) {
					$ok = ($ok OR array_search($c['category_id'],$limitprc)!==false);
				} 

				// If EXACT of product's categories exists in filter  
				//foreach($rc as $c) {
				//	$ok = ($ok AND array_search($c['category_id'],$limitprc)!==false);
				//} 
			}
		}
		
		$outofperiod = false;
 
    $data['setting'] = $setting['oct_pfc_module'][0];
    
    $data['autoplay'] = $setting['autoplay'];
    
    if($data['autoplay'] == 0) {
      $data['play'] = "false";
    } else {
      $data['play'] = "true"; 
    }
    
    if (isset($setting['oct_pfc_module'][0]['image']) && $setting['oct_pfc_module'][0]['image'] != "") {
      $data['setting']['module_image'] = $this->model_tool_image->resize($setting['oct_pfc_module'][0]['image'], 246, 359);
    } else {
      $data['setting']['module_image'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);
    }
        
    $data['setting']['id'] = rand(0, 20000);   
        
    if (isset($setting['oct_pfc_module'][0]['products_list']) && $setting['oct_pfc_module'][0]['products_list'] != "") {
      $products = $setting['oct_pfc_module'][0]['products_list'];
    } else {
      $products = array();
    }

		if ((!$filter or $ok) and !$outofperiod) {
			$category = (isset($setting['oct_pfc_module'][0]['category'])) ? $setting['oct_pfc_module'][0]['category'] : array(); 

			$products = $this->model_catalog_oct_products_from_category->getProductsID(
				array(
					'category'=>$category, 
					'products'=>$products, 
					'latest'=>$setting['oct_pfc_module'][0]['latest'],
					'specials'=>$setting['oct_pfc_module'][0]['specials'],
					'order'=>(isset($setting['oct_pfc_module'][0]['sortorder']) ? $setting['oct_pfc_module'][0]['sortorder'] : '') 
				) 
			);
               
      if (isset($setting['limit']) && $setting['limit'] !=0) {
     		$limit = $setting['limit'];  
      } else {
        $limit = 50; 
      }

      if (count($products)<$limit) {
        $results = array_keys($products);
      } else  {
  			$results = ($limit>1) ? array_rand($products,$limit) : array( rand(0,count($products)-1) );
      }

			foreach ($results as $pid) {
				$result = (isset($products[$pid]) and $products[$pid]) ? $this->model_catalog_product->getProduct($products[$pid]) : false;

				if ($result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], 200, 200);
					} else {
						$image = false;
					}
								
					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}
							
					if ((float)$result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$special = false;
					}
					
					if ($this->config->get('config_review_status')) {
						$rating = $result['rating'];
					} else {
						$rating = false;
					}
					
					$oct_product_stickers_data = $this->config->get('oct_product_stickers_data');
	        $oct_product_stickers = array();
	
	        if (isset($oct_product_stickers_data['status']) && $oct_product_stickers_data['status']) {
	          $this->load->model('catalog/oct_product_stickers');
	
	          if (isset($result['oct_product_stickers']) && $result['oct_product_stickers']) {
	            $stickers = unserialize($result['oct_product_stickers']);
	          } else {
	            $stickers = array();
	          }
	
	          foreach ($stickers as $product_sticker_id) {
	            $sticker_info = $this->model_catalog_oct_product_stickers->getProductSticker($product_sticker_id);
	            
	            if ($sticker_info) {
	              $oct_product_stickers[] = array(
	                'text' => $sticker_info['text'],
	                'color' => $sticker_info['color'],
	                'background' => $sticker_info['background']
	              );
	            }
	          }
	
	          $sticker_sort_order = array();
	
	          foreach ($stickers as $key => $product_sticker_id) {
	            $sticker_info = $this->model_catalog_oct_product_stickers->getProductSticker($product_sticker_id);
	            
	            if ($sticker_info) {
	              $sticker_sort_order[$key] = $sticker_info['sort_order'];
	            }
	          }
	          
	          array_multisort($sticker_sort_order, SORT_ASC, $oct_product_stickers);
	        }
					
					$oct_product_preorder_text = $this->config->get('oct_product_preorder_text');
					$oct_product_preorder_data = $this->config->get('oct_product_preorder_data');
					$oct_product_preorder_language = $this->load->language('extension/module/oct_product_preorder');

					$stockbutton = '';

					if (isset($oct_product_preorder_data['status']) && $oct_product_preorder_data['status'] && isset($oct_product_preorder_data['stock_statuses']) && isset($result['oct_stock_status_id']) && in_array($result['oct_stock_status_id'], $oct_product_preorder_data['stock_statuses'])) {
						$product_preorder_text = $oct_product_preorder_text[$this->session->data['language']]['call_button'];
						$product_preorder_status = 1;
					} else {
						$product_preorder_text = $oct_product_preorder_language['text_out_of_stock'];
						$product_preorder_status = 2;
					}
					
					$data['products'][] = array(
						'oct_product_stickers' => $oct_product_stickers,
						'product_id' => $result['product_id'],
						'thumb'   	 => $image,
						'name'    	 => $result['name'],
						'quantity'       => $result['quantity'], 
						'product_preorder_text' => $product_preorder_text,
						'product_preorder_status' => $product_preorder_status,
						'price'   	 => $price,
						'special' 	 => $special,
						'rating'     => $rating,
						'description'=> $result['description'],
						'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
						'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					);
				}
			}
		} else {
			$data['products'] = array();
		}  

		return $this->load->view('extension/module/oct_products_from_category', $data);
	}
}
?>
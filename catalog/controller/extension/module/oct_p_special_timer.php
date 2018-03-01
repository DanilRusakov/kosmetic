<?php
class ControllerExtensionModuleOctPSpecialTimer extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/oct_p_special_timer');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart_time'] = $this->language->get('button_cart_time');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('octemplates/p_special_timer');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'ps.date_end',
      'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_octemplates_p_special_timer->getProducts($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
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

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
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

				$data['products'][] = array(
					'oct_product_stickers' => $oct_product_stickers,
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'date_start'  => $result['date_start'],
					'date_end'    => $result['date_end'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			return $this->load->view('extension/module/oct_p_special_timer', $data);
		}
	}
}
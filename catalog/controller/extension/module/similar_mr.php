<?php

class ControllerExtensionModuleSimilarMr extends Controller {

	public function index($setting) {

		if (!file_exists(dirname(DIR_APPLICATION) . '/catalog/model/catalog/search_mr.php')) {
			return false;
		}

		if (!isset($this->request->get['product_id'])) {
			return false;
		} else {
			$product_id = (int) $this->request->get['product_id'];
		}

		$this->load->language('extension/module/similar_mr');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$data['position'] = $setting['position'];

		$this->load->model('catalog/search_mr');

		$this->load->model('tool/image');

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if (!$product_info) {
			return false;
		}

		$data['products'] = array();

		$filter_data = array(
			'filter_name' => $product_info['name'],
			'start' => 0,
			'limit' => $setting['limit'] + 1
		);

		$results = $this->model_catalog_search_mr->getProducts($filter_data);

		if ($results) {

			// delete current product or last product if current product is not in the results
			if (isset($results[$product_id])) {
				unset($results[$product_id]);
			} else {
				array_pop($results);
			}

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
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

				$data['products'][] = array(
					'product_id' => $result['product_id'],
					'thumb' => $image,
					'name' => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price' => $price,
					'special' => $special,
					'tax' => $tax,
					'rating' => $rating,
					'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			return $this->load->view('extension/module/similar_mr', $data);
		}
	}

}

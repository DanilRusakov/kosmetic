<?php
class ControllerOctemplatesBlogArticle extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('octemplates/blog_article');
		$this->load->language('octemplates/oct_luxury');
		
		$data['oct_home_text'] = $this->language->get('oct_home_text'); 

		$oct_blog_setting_data = $this->config->get('oct_blog_setting_data');
		$oct_data = $this->config->get('oct_luxury_data');
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('octemplates/blog_category');

		if (isset($this->request->get['cpath'])) {

			$category_info = $this->model_octemplates_blog_category->getCategory($this->request->get['cpath']);

			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('octemplates/blog_category', 'cpath=' . $this->request->get['cpath'] . $url)
				);
			}
		}

		if (isset($this->request->get['oct_blog_article_id'])) {
			$oct_blog_article_id = (int)$this->request->get['oct_blog_article_id'];
		} else {
			$oct_blog_article_id = 0;
		}

		$this->load->model('octemplates/blog_article');

		$article_info = $this->model_octemplates_blog_article->getArticle($oct_blog_article_id);

		if ($article_info) {
			$url = '';

			if (isset($this->request->get['cpath'])) {
				$url .= '&cpath=' . $this->request->get['cpath'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $article_info['name'],
				'href' => $this->url->link('octemplates/blog_article', $url . '&oct_blog_article_id=' . $this->request->get['oct_blog_article_id'])
			);

      $this->document->setTitle($article_info['meta_title']);
      $this->document->setDescription($article_info['meta_description']);
      $this->document->setKeywords($article_info['meta_keyword']);
      $this->document->addLink($this->url->link('octemplates/blog_article', 'oct_blog_article_id=' . $this->request->get['oct_blog_article_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

			$data['heading_title'] = $article_info['name'];
			$data['text_select'] = $this->language->get('text_select');
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related_products'] = $this->language->get('text_related_products');
			$data['text_related_articles'] = $this->language->get('text_related_articles');
			$data['text_loading'] = $this->language->get('text_loading');
			$data['text_comments'] = $this->language->get('text_comments');
			$data['text_viewed'] = $this->language->get('text_viewed');
			$data['text_date_added'] = $this->language->get('text_date_added');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_rating'] = $this->language->get('text_rating');
			$this->load->language('octemplates/oct_luxury');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_comment'] = $this->language->get('entry_comment');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_cart'] = $this->language->get('button_cart');
			
			//$data['description'] = html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8');
			$data['description'] = str_replace("<img", "<img class=\"img-responsive\"",  html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8'));

			$this->load->model('tool/image');

			if ($article_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($article_info['image'], $oct_blog_setting_data['main_image_popup_width'], $oct_blog_setting_data['main_image_popup_height']);
			} else {
				$data['popup'] = '';
			}

			if ($article_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($article_info['image'], $oct_blog_setting_data['main_image_width'], $oct_blog_setting_data['main_image_height']);
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_octemplates_blog_article->getArticleImages($this->request->get['oct_blog_article_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $oct_blog_setting_data['main_image_popup_width'], $oct_blog_setting_data['main_image_popup_height']),
					'thumb' => $this->model_tool_image->resize($result['image'], $oct_blog_setting_data['sub_image_width'], $oct_blog_setting_data['sub_image_height'])
				);
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$data['oct_blog_article_id'] = (int)$article_info['oct_blog_article_id'];
			$data['comments'] = (int)$article_info['comments'];
			$data['viewed'] = (int)$article_info['viewed'];
			$data['date_added'] = $article_info['date_added'];

			if (isset($oct_blog_setting_data['comment_show']) && $oct_blog_setting_data['comment_show'] == 1) {
				$data['comment_show'] = true;
			} else {
				$data['comment_show'] = false;
			}

			if (isset($oct_blog_setting_data['comment_write']) && $oct_blog_setting_data['comment_write'] == 1) {
				$data['comment_write'] = true;
			} else {
				$data['comment_write'] = false;
			}

      // Captcha
      if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
        $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
      } else {
        $data['captcha'] = '';
      }

			$oct_luxury_data = $this->config->get('oct_luxury_data');

			if (isset($oct_luxury_data['terms']) && $oct_luxury_data['terms']) {
			  $this->load->model('catalog/information');
			    
			  $information_info = $this->model_catalog_information->getInformation($oct_luxury_data['terms']);
			    
			  if ($information_info) {
			    $data['text_terms'] = sprintf($this->language->get('text_oct_terms'), $this->url->link('information/information', 'information_id=' . $oct_luxury_data['terms'], 'SSL'), $information_info['title'], $information_info['title']);
			  } else {
			    $data['text_terms'] = '';
			  }
			} else {
			  $data['text_terms'] = '';
			}

			$data['tags'] = array();

			if ($article_info['tag']) {
				$tags = explode(',', $article_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('octemplates/blog_search', 'tag=' . trim($tag))
					);
				}
			}

			$data['products'] = array();

			$products = $this->model_octemplates_blog_article->getArticleProductsRelated($this->request->get['oct_blog_article_id']);

			if ($products) {
				foreach ($products as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $oct_blog_setting_data['r_p_image_width'], $oct_blog_setting_data['r_p_image_height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $oct_blog_setting_data['r_p_image_width'], $oct_blog_setting_data['r_p_image_height']);
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
						$rating = (int)$result['rating'];
					} else {
						$rating = false;
					}

					$oct_product_preorder_text = $this->config->get('oct_product_preorder_text');
					$oct_product_preorder_data = $this->config->get('oct_product_preorder_data');
					$oct_product_preorder_language = $this->load->language('extension/module/oct_product_preorder');
				
					if (isset($oct_product_preorder_data['status']) && $oct_product_preorder_data['status'] && isset($oct_product_preorder_data['stock_statuses']) && in_array($result['oct_stock_status_id'], $oct_product_preorder_data['stock_statuses'])) {
						$product_preorder_text = $oct_product_preorder_text[$this->session->data['language']]['call_button'];
						$product_preorder_status = 1;
					} else {
						$product_preorder_text = $oct_product_preorder_language['text_out_of_stock'];
						$product_preorder_status = 2;
					}

					$data['products'][] = array(
						'product_id'              => $result['product_id'],
						'thumb'                   => $image,
						'name'                    => $result['name'],
						'description'             => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'                   => $price,
						'quantity'                => $result['quantity'], 
						'product_preorder_text'   => $product_preorder_text,
						'product_preorder_status' => $product_preorder_status,
						'special'                 => $special,
						'tax'                     => $tax,
						'minimum'                 => $result['minimum'] > 0 ? $result['minimum'] : 1,
						'rating'                  => $rating,
						'href'                    => $this->url->link('product/product', 'product_id=' . $result['product_id'])
					);
				}
			}

			$data['articles'] = array();

			$articles = $this->model_octemplates_blog_article->getArticleArticlesRelated($this->request->get['oct_blog_article_id']);

			if ($articles) { 
				foreach ($articles as $article_related_id) {
					$articlet_info = $this->model_octemplates_blog_article->getArticle($article_related_id);

					if ($articlet_info) {
						if ($articlet_info['image']) {
							$image = $this->model_tool_image->resize($articlet_info['image'], $oct_blog_setting_data['r_a_image_width'], $oct_blog_setting_data['r_a_image_height']);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $oct_blog_setting_data['r_a_image_width'], $oct_blog_setting_data['r_a_image_height']);
						}

						if ($this->config->get('config_review_status')) {
							$rating = (int)$articlet_info['rating'];
						} else {
							$rating = false;
						}

						$data['articles'][] = array(
							'oct_blog_article_id'  => $articlet_info['oct_blog_article_id'],
							'thumb'                => $image,
							'name'                 => $articlet_info['name'],
							'date_added'           => $articlet_info['date_added'],
							'comments'             => $articlet_info['comments'] ? $articlet_info['comments'] : 0,
							'viewed'               => $articlet_info['viewed'],
							'description'          => utf8_substr(strip_tags(html_entity_decode($articlet_info['description'], ENT_QUOTES, 'UTF-8')), 0, $oct_blog_setting_data['desc_limit']) . '..',
							'rating'               => $rating,
							'href'                 => $this->url->link('octemplates/blog_article', '&oct_blog_article_id=' . $articlet_info['oct_blog_article_id'])
						);
					}
				}
			}

			$this->model_octemplates_blog_article->updateViewed($this->request->get['oct_blog_article_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('octemplates/blog_article', $data));
		} else {
			$url = '';

			if (isset($this->request->get['cpath'])) {
				$url .= '&cpath=' . $this->request->get['cpath'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('octemplates/blog_article', $url . '&oct_blog_article_id=' . $oct_blog_article_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function comments() {
		$this->load->language('octemplates/blog_article');

		$this->load->model('octemplates/blog_comments');

		$data['text_no_comments'] = $this->language->get('text_no_comments');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['comments'] = array();

		$comments_total = $this->model_octemplates_blog_comments->getTotalCommentsByArticleId($this->request->get['oct_blog_article_id']);

		$results = $this->model_octemplates_blog_comments->getCommentsByArticleId($this->request->get['oct_blog_article_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['comments'][] = array(
				'oct_blog_comment_id' => $result['oct_blog_comment_id'],
				'author'     => $result['author'],
				'plus'       => $result['plus'],
				'minus'      => $result['minus'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $comments_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('octemplates/blog_article/comments', 'oct_blog_article_id=' . $this->request->get['oct_blog_article_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($comments_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($comments_total - 5)) ? $comments_total : ((($page - 1) * 5) + 5), $comments_total, ceil($comments_total / 5));

		$this->response->setOutput($this->load->view('octemplates/blog_comments', $data));
	}

	public function write() {
		$this->load->language('octemplates/blog_article');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('comments', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			$oct_luxury_data = $this->config->get('oct_luxury_data');

			if (isset($oct_luxury_data['terms']) && $oct_luxury_data['terms']) {
			  if (!isset($this->request->post['terms'])) {
			    $this->load->model('catalog/information');
			    
			    $information_info = $this->model_catalog_information->getInformation($oct_luxury_data['terms']);

			    $json['error'] = sprintf($this->language->get('error_oct_terms'), $information_info['title']);
			  }
			}

			if (!isset($json['error'])) {
				$this->load->model('octemplates/blog_comments');

				$this->model_octemplates_blog_comments->addComment($this->request->get['oct_blog_article_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function comment_plus() {
		$this->load->language('octemplates/blog_article');
		$this->load->model('octemplates/blog_comments');

		$json = array();

		$filter_data = array(
			'customer_ip' => $this->request->server['REMOTE_ADDR'],
			'customer_id' => (int)$this->customer->getId()
		);

		$check_like = $this->model_octemplates_blog_comments->checkLike($this->request->request['oct_blog_comment_id'], $this->request->request['oct_blog_article_id'], $filter_data);

		if ($check_like) {
			$json['error'] = $this->language->get('error_already_voted');
		}
			
		if (!isset($json['error'])) {
			$this->model_octemplates_blog_comments->updateLike($this->request->request['oct_blog_comment_id'], $this->request->request['oct_blog_article_id'], 'plus');

			$this->model_octemplates_blog_comments->addCommentLike($this->request->request['oct_blog_comment_id'], $this->request->request['oct_blog_article_id'], $filter_data);

			$json['value'] = $this->model_octemplates_blog_comments->getLikeCount($this->request->request['oct_blog_comment_id'], $this->request->request['oct_blog_article_id'], 'c.plus');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function comment_minus() {
		$this->load->language('octemplates/blog_article');
		$this->load->model('octemplates/blog_comments');

		$json = array();

		$filter_data = array(
			'customer_ip' => $this->request->server['REMOTE_ADDR'],
			'customer_id' => (int)$this->customer->getId()
		);

		$check_like = $this->model_octemplates_blog_comments->checkLike($this->request->request['oct_blog_comment_id'], $this->request->request['oct_blog_article_id'], $filter_data);

		if ($check_like) {
			$json['error'] = $this->language->get('error_already_voted');
		}
			
		if (!isset($json['error'])) {
			$this->model_octemplates_blog_comments->updateLike($this->request->request['oct_blog_comment_id'], $this->request->request['oct_blog_article_id'], 'minus');

			$this->model_octemplates_blog_comments->addCommentLike($this->request->request['oct_blog_comment_id'], $this->request->request['oct_blog_article_id'], $filter_data);

			$json['value'] = $this->model_octemplates_blog_comments->getLikeCount($this->request->request['oct_blog_comment_id'], $this->request->request['oct_blog_article_id'], 'c.minus');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}

<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
		    <?php foreach ($breadcrumbs as $count => $breadcrumb) { ?>
			    <?php if($count == 0) { ?>
				  <li>
					<a href="<?php echo $breadcrumb['href']; ?>" title="<?php echo $oct_home_text; ?>">
					  <?php echo $breadcrumb['text']; ?>
					</a>
				  </li>
		        <?php } elseif($count+1<count($breadcrumbs)) { ?>
		        	<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
					<a itemscope itemtype="https://schema.org/Thing" itemprop="item" href="<?php echo $breadcrumb['href']; ?>" title="<?php echo $breadcrumb['text']; ?>">
					  <span itemprop="name" class="breadcrumbsitem"><?php echo $breadcrumb['text']; ?></span>
					  <?php echo $breadcrumb['text']; ?>
					</a>
					<meta itemprop="position" content="<?php echo $count; ?>" />
					</li>
		        <?php } else { ?>
		        	<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
		        	<span itemscope itemtype="https://schema.org/Thing" itemprop="item">
					  <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
					</span>
					<meta itemprop="position" content="<?php echo $count; ?>" />
		        	</li>
		        <?php } ?>
			<?php } ?>
	  </ul></div>
<?php echo $content_top; ?>
<div class="container" <?php if($oct_luxury_pr_micro == "on") { ?>itemscope itemtype="http://schema.org/Product"<?php } ?>>
  <?php if($oct_luxury_pr_micro == "on") { ?><span class="micro-name" itemprop="name"><?php echo $heading_title; ?></span><?php } ?>
  <div class="row">
    <h1 class="col-sm-10 item-header"><?php echo $heading_title; ?></h1>
    <div class="col-sm-2">
      <?php if ($review_status) { ?>
      <?php $rating_data = preg_replace("/[^0-9]/", '', $reviews); ?>
        <div class="rating item-rating"<?php if($oct_luxury_pr_micro == "on" && $rating_data>0) { ?> itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating"<?php } ?>>
        <?php if($rating_data>0) { ?>
        <?php if($oct_luxury_pr_micro == "on") { ?><meta itemprop="reviewCount" content="<?php echo $rating_data; ?>"><?php } ?>
        <?php if($oct_luxury_pr_micro == "on") { ?><meta itemprop="ratingValue" content="<?php echo $rating; ?>"><?php } ?>
        <?php if($oct_luxury_pr_micro == "on") { ?><meta itemprop="bestRating" content="5" /><?php } } ?>
          <p>
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($rating < $i) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } ?>
            <?php } ?>
            <br/>
            <p class="count-reviews"><a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); $('html, body').animate({scrollTop: $('.scrolled').offset().top-80}, 1800);return false;"><?php echo $reviews; ?></a></p>
        </div>
      <?php } ?>
    </div>
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <div class="row">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-7'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> left-info">
          <?php $check_zoom = isset($oct_images_by_options_data['allow_zoom']) ? $oct_images_by_options_data['allow_zoom']: '0'; ?>
          <?php if ($thumb || $images) { ?>
          <?php if ($oct_product_stickers || $special) { ?>
          <ul>
            <?php if ($oct_product_stickers) { ?>
              <li class="product-sticker-box">
                <?php foreach ($oct_product_stickers as $product_sticker) { ?>
                  <div style="color: <?php echo $product_sticker['color']; ?>; background: <?php echo $product_sticker['background']; ?>;">
                    <?php echo $product_sticker['text']; ?>
                  </div>
                <?php } ?>
              </li>
            <?php } ?>
            <?php if ($special) { ?>
            <li id="main-product-you-save">-<?php echo $economy; ?>%</li>
            <?php } ?>
            </ul>
            <?php } ?>
                <?php if ($images) { ?>
                    <?php if ($thumb) { ?>
                        <?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
																<div class="image thumbnails-one all-carousel">
															<?php } else { ?>
																<div class="image thumbnails-one">
															<?php } ?>
																										<?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
																<a href="<?php echo $popup; ?>" class="dataitem">
															<?php } else { ?>
																<a href="<?php echo $popup; ?>">
															<?php } ?>
                                <img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                            </a>
                        </div>
                    <?php } ?>
                    <?php if (count($images) > 1) { ?>
                        <?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
																	<div class="image-additional" id="image-additional">
																<?php } else { ?>
																	<div class="image-additional">
																<?php } ?>
																											<?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
																	<div id="owl-thumbnails" class="image-additional-carousel thumbnails all-carousel owl-carousel"> 
																<?php } else { ?>
																	<div class="image-additional-carousel thumbnails all-carousel">
																<?php } ?>
                                <?php 
                                $data_index = 0;
                                foreach ($images as $image) { 
                                $data_index++;
                                ?>
                                    <div>
                                       <?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
                                          <a href="<?php echo $image['popup']; ?>" data-main-img="<?php echo $image['main_img']; ?>" data-main-popup="<?php echo $image['main_popup']; ?>" class="dataitem" title="<?php echo $heading_title; ?>">
                                        <?php } else { ?>
                                          <a href="<?php echo $image['popup']; ?>" class="dataitem" title="<?php echo $heading_title; ?>">
                                        <?php } ?>
                                            <img src="<?php echo $image['thumb']; ?>" data-index="<?php echo $data_index; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                        </a>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
          <?php } ?>
          
            <script>
                $(document).ready(function() {
					$("#owl-thumbnails").owlCarousel({
					    items: 6,
						itemsDesktop : [1199,5],
						itemsDesktopSmall : [979,4],
						itemsTablet : [768,4],
						itemsMobile : [479,3],
						autoPlay: false,
						navigation: true,
				        navigationText: ['<i class="fa fa-angle-left fa-5x" aria-hidden="true"></i>', '<i class="fa fa-angle-right fa-5x" aria-hidden="true"></i>'],
				        loop: true,
				        pagination: true
					});
				});
            </script>
        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-5'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> right-info">
          <?php if ($manufacturer_info && $oct_luxury_pr_logoman =='on') { ?>
            <div class="manufacturer-logo">
              <a href="<?php echo $manufacturer_info['href']; ?>"><img src="<?php echo $manufacturer_info['image']; ?>" alt="<?php echo $manufacturer_info['name']; ?>" /></a>
            </div>
          <?php } ?>
          <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>" class="manufacturers"><span <?php if($oct_luxury_pr_micro == "on") { ?>itemprop="brand"<?php } ?>><?php echo $manufacturer; ?></span></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <span class="gold"<?php if($oct_luxury_pr_micro == "on") { ?> itemprop="model"<?php } ?>><?php echo $model; ?></span></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <span class="gold"><?php echo $reward; ?></span></li>
            <?php } ?>
            <li class="stock<?php if(isset($quantity) && $quantity <= 0) { echo " minus"; } ?>"><i class="fa fa-circle" aria-hidden="true"></i> <?php echo $stock; ?></li>
            <?php if($oct_luxury_pr_shortdesc =='on' && $description !='') { ?>
              <li class="short-desc"><?php echo utf8_substr(strip_tags(html_entity_decode($description, ENT_QUOTES, 'UTF-8')), 0, 120) . '..'; ?></li>
            <?php } ?>
            <?php if ($product_sizes_table && $show_product_sizes_table_status) { ?>
              <li id="size-popup" class="white-popup mfp-with-anim mfp-hide">
                <ul class="nav nav-tabs">
                  <?php $sect_id = 0; foreach ($product_sizes_table as $section) { ?>
                    <?php if (isset($section['categories']) && in_array($section_category_id, $section['categories'])) { ?>
                    <li>
                    <a href="#tab-size<?php echo $sect_id; ?>" data-toggle="tab"><?php echo $section['title'][$lang_code]; ?></a>
                    </li>
                    <?php } ?>  
                  <?php $sect_id++; } ?>  
                </ul> 
                <div class="tab-content">   
                  <?php $sect_id = 0; foreach ($product_sizes_table as $section) { ?>
                    <?php if (isset($section['categories']) && in_array($section_category_id, $section['categories'])) { ?>
                    <div class="tab-pane" id="tab-size<?php echo $sect_id ?>">
                      <?php $block_content = str_replace("img", "img class='img-responsive'", $section['block'][$lang_code]); echo html_entity_decode($block_content); ?>
                    </div>  
                    <?php } ?>  
                  <?php $sect_id++; } ?> 
                </div>  
              </li>
              <script>
                $(function(){
                  $('#size-popup').find('.nav-tabs li:eq(0)').addClass('active');
                  $('#size-popup').find('.tab-content div:eq(0)').addClass('active');
                });
              </script>
              <li class="size-table"><a href="#size-popup" class="popup-with-zoom-anim"><?php echo $text_show_product_sizes_table; ?></a></li>
            <?php } ?>
          </ul>
          <div id="product">
            <?php if ($options) { ?>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						<h4><label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label></h4>
              <?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
              <select onchange="oct_update_prices_opt();" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
              <?php } else { ?>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
              <?php } ?>
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>" <?php if (!$option_value['quantity_status']) { ?>disabled="disabled"<?php } ?>><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
									<?php if ($option_value['image']) { ?>
									<div class="radio">
                    <?php if ($option_value['quantity_status']) { ?>
										  <label data-toggle="tooltip" data-trigger="hover" title="<?php echo $option['name']; ?> <?php echo $option_value['name']." "; if ($option_value['price']) { ?><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?><?php } ?>" class="not-selected-img opmtid-<?php echo $option['option_id'];?>">
                    <?php } else { ?>
                      <label data-toggle="tooltip" data-trigger="hover" title="<?php echo $text_oct_option_disable; ?>" class="not-selected-img opmtid-<?php echo $option['option_id'];?>" style="opacity:0.5;cursor:default;">
                    <?php } ?>  
											<?php if ($option_value['quantity_status']) { ?>
                        <?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
  											<input onchange="oct_update_prices_opt();" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" class="none" />
  											<?php } else { ?>
  											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" class="none" />
  											<?php } ?>
  											<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                      <?php } else { ?>
                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" class="none" disabled="disabled" />
                        <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                      <?php } ?>
										</label>
									</div>
									<?php } else { ?>
										<div class="radio">
                      <?php if ($option_value['quantity_status']) { ?>
                        <label data-toggle="tooltip" data-trigger="hover" title="<?php echo $option['name']; ?> <?php echo $option_value['name']." "; if ($option_value['price']) { ?><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?><?php } ?>" class="not-selected optid-<?php echo $option['option_id'];?>" <?php if (!$option_value['quantity_status']) { ?>style="opacity:0.5;cursor:default;"<?php } ?>>
                      <?php } else { ?>
											  <label data-toggle="tooltip" data-trigger="hover" title="<?php echo $text_oct_option_disable; ?>" class="not-selected optid-<?php echo $option['option_id'];?>" style="opacity:0.5;cursor:default;">
                      <?php } ?>  
												<?php if ($option_value['quantity_status']) { ?>
                          <?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
  												<input onchange="oct_update_prices_opt();" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" class="none" />
  												<?php } else { ?>
  												<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" class="none" />
  												<?php } ?>
                        <?php } else { ?>
                          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" class="none" disabled="disabled" />
                        <?php } ?>
												<?php echo $option_value['name']; ?>
											</label>
										</div>
									<?php } ?>
                <?php } ?>
                <div class="clearfix"></div>
              </div>
            </div>
							<script>
								$(document).ready(function() {
									 $('label.opmtid-<?php echo $option['option_id'];?>').click(function(){
										 if ($(this).find('input[type=radio]').is('input:disabled')) {
											$('label.selected-img').removeClass('selected-img').addClass('not-selected-img');
											$(this).css({
												'opacity': 0.5,
												'cursor': 'default'
											});
										 } else {
											$('label.opmtid-<?php echo $option['option_id'];?>').removeClass('selected-img').addClass('not-selected-img');
											$(this).removeClass('not-selected-img').addClass('selected-img');
										 }
									 }); 
								});    
							</script>
							<script>
								$(document).ready(function() {
									 $('label.optid-<?php echo $option['option_id'];?>').click(function(){
										 if ($(this).find('input[type=radio]').is('input:disabled')) {
											$('label.selected').removeClass('selected').addClass('not-selected');
											$(this).css({
												'opacity': 0.5,
												'cursor': 'default'
											});
										 } else {
											$('label.optid-<?php echo $option['option_id'];?>').removeClass('selected').addClass('not-selected');
											$(this).removeClass('not-selected').addClass('selected');
										 }
									 }); 
								});    
							</script>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <h4><label class="control-label"><?php echo $option['name']; ?></label></h4>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label <?php if (!$option_value['quantity_status']) { ?>style="opacity:0.5;cursor:default;" title="<?php echo $text_oct_option_disable; ?>"<?php } ?>>
                    <?php if ($option_value['quantity_status']) { ?>  
                      <?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
                      <input onchange="oct_update_prices_opt();" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php } else { ?>
                      <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php } ?>
                    <?php } else { ?>
                      <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" disabled="disabled" />
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <?php if ($price) { ?>
            <ul class="list-unstyled price-ul"<?php if($oct_luxury_pr_micro == "on") { ?> itemprop="offers" itemscope itemtype="http://schema.org/Offer"<?php } ?>>
            <?php if($oct_luxury_pr_micro == "on") {  ?>
            <li class="micro-availability">
                <span itemprop="availability" class="micro-availability" content="http://schema.org/InStock"><?php echo $stock."\r\n"; ?></span>
            <meta itemprop="priceCurrency" content="<?php echo $oct_luxury_currency_code_data; ?>" />
              <span class="micro-price" itemprop="price" content="<?php if (!$special) { echo preg_replace('/[^0-9,.]+/','',rtrim($price, "."));}else{echo preg_replace('/[^0-9,.]+/','',rtrim($special, "."));} ?>"><?php if (!$special) { echo preg_replace('/[^0-9,.]+/','',rtrim($price, "."));}else{echo preg_replace('/[^0-9,.]+/','',rtrim($special, "."));} ?></span>
              </li>
             <?php } ?>
              <?php if (!$special) { ?>
              <li class="row">
                <h2 class="price col-sm-12" id="main-product-price"><?php echo $price; ?></h2>
              </li>
              <?php } else { ?>
              <li class="row">
                <h2 class="price col-sm-6" id="main-product-special"><?php echo $special; ?></h2>
                  <p class="col-sm-6 price-old" style="text-decoration: line-through;" id="main-product-price"><?php echo $price; ?></p>
              </li>
              <?php } ?>
              <li class="row">
                <?php if (isset($oct_popup_found_cheaper_data['status']) && $oct_popup_found_cheaper_data['status']) { ?>
                <p class="col-sm-6 found-cheaper"><a data-effect="mfp-zoom-out" onclick="get_oct_popup_found_cheaper('<?php echo $product_id; ?>');"><?php echo $text_oct_popup_found_cheaper; ?></a></p>
                <?php } ?>
              <?php if ($tax) { ?>
              <p class="col-sm-6 product-tax-box"><?php echo $text_tax; ?> <span id="main-product-tax"><?php echo $tax; ?></span></p>
              <?php } ?>
              </li>
              <?php if ($points) { ?>
              <li class="row">
                <p class="col-sm-12"><?php echo $text_points; ?> <?php echo $points; ?></p>
              </li>
              <?php } ?>
              <?php if ($discounts) { ?>
              <?php foreach ($discounts as $discount) { ?>
              <li class="row">
                <p class="col-sm-12"><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></p>
              </li>
              <?php } ?>
              <?php } ?>
            </ul>
          <?php } ?>
            <div class="form-group buy-box">
              <hr>
              <?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
                <div class="number">
                  <input name="product_id" value="<?php echo $product_id; ?>" style="display: none;" type="hidden">
                  <div class="frame-change-count">
                    <div class="btn-plus">
                      <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1); oct_update_product_quantity('<?php echo $product_id; ?>');" class="main-color1">
                        <span class="icon-plus"><i class="fa fa-plus"></i></span>
                      </button>
                    </div>
                    <div class="btn-minus">
                      <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1); oct_update_product_quantity('<?php echo $product_id; ?>');" class="main-color1">
                        <span class="icon-minus"><i class="fa fa-minus"></i></span>
                      </button>
                    </div>
                  </div>
                  <input type="text" name="quantity" value="<?php echo $minimum; ?>" maxlength="5" class="plus-minus" onchange="oct_update_prices_opt(); return validate(this);" onkeyup="oct_update_prices_opt(); return validate(this);">
                </div>
              <?php } else { ?>
                <div class="number">
                  <input name="product_id" value="<?php echo $product_id; ?>" style="display: none;" type="hidden">
                  <div class="frame-change-count">
                    <div class="btn-plus">
                      <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1);" class="main-color1">
                        <span class="icon-plus"><i class="fa fa-plus"></i></span>
                      </button>
                    </div>
                    <div class="btn-minus">
                      <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1);" class="main-color1">
                        <span class="icon-minus"><i class="fa fa-minus"></i></span>
                      </button>
                    </div>
                  </div>
                  <input type="text" name="quantity" value="1" maxlength="4" class="plus-minus" onchange="return validate(this);" onkeyup="return validate(this);">
                </div>
              <?php } ?>
							<?php if ($disable_buy == 0) { ?>
              	<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-lg button-cart"><i class="fa fa-shopping-basket" aria-hidden="true"></i> <?php echo $button_cart; ?></button>
							<?php } elseif ($disable_buy == 2) { ?>
								<button type="button" href="javascript: void(0);"  class="btn btn-lg button-cart"><?php echo $stockbutton; ?></button>
								<style>
							  	.number, .wishlist-btn, .compare-btn {display:none !important;}
							  </style>
							<?php } else { ?>
							  <button type="button" onclick="get_oct_product_preorder('<?php echo $product_id; ?>'); return false" class="btn btn-lg button-cart"><?php echo $stockbutton; ?></button>
								<style>
							  	.number, .wishlist-btn, .compare-btn {display:none !important;}
							  </style>
							<?php } ?>
							<button type="button" data-toggle="tooltip" class="btn wishlist-btn" title="<?php echo $button_wishlist; ?>" data-effect="mfp-zoom-out" onclick="get_oct_popup_add_to_wishlist('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" class="btn compare-btn" title="<?php echo $button_compare; ?>" data-effect="mfp-zoom-out" onclick="get_oct_popup_add_to_compare('<?php echo $product_id; ?>');"><i class="fa fa-sliders" aria-hidden="true"></i></button>
              <br/>
              <?php if (isset($oct_popup_purchase_data['status']) && $oct_popup_purchase_data['status'] && $disable_buy == 0) { ?>
              <div class="buy-in-click"><i class="fa fa-hand-pointer-o" aria-hidden="true"></i> <a data-effect="mfp-zoom-out" onclick="get_oct_popup_purchase('<?php echo $product_id; ?>');"><?php echo $text_oct_popup_purchase; ?></a></div>
              <?php } ?>
              <hr>
            </div>

            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
						<input type="hidden" id="minimumval" value="<?php echo $minimum; ?>">
            <?php } ?>
      
      			<?php if($oct_luxury_pr_garantedtext != "") { echo $oct_luxury_pr_garantedtext; } ?>
            </div>          
        </div>
      </div>
      <div class="row tabs-row">
        <div class="col-sm-12">
          <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
              <?php if ($attribute_groups) { ?>
              <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
              <?php } ?>
              <?php if ($review_status) { ?>
              <li><a href="#tab-review" class="scrolled" data-toggle="tab"><?php echo $tab_review; ?></a></li>
              <?php } ?>
              <?php if ($oct_product_extra_tabs) { ?>
              <?php $tab_i=0; foreach ($oct_product_extra_tabs as $product_extra_tab) { ?>
                <li><a href="#tab-extra-<?php echo $tab_i; ?>" data-toggle="tab"><?php echo $product_extra_tab['title']; ?></a></li>
              <?php $tab_i++; } ?>
            <?php } ?>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab-description"><?php if($oct_luxury_pr_micro == "on") { ?><div itemprop="description"><?php } ?><?php echo  $description; ?><?php if($oct_luxury_pr_micro == "on") { ?></div><?php } ?></div>
              <?php if ($oct_product_extra_tabs) { ?>
                <?php $tab_i=0; foreach ($oct_product_extra_tabs as $product_extra_tab) { ?>
                  <div class="tab-pane" id="tab-extra-<?php echo $tab_i; ?>"><?php echo $product_extra_tab['text']; ?></div>
                <?php $tab_i++; } ?>
              <?php } ?>
              <?php if ($attribute_groups) { ?>
              <div class="tab-pane" id="tab-specification">
                <table class="table table-bordered">
                  <?php foreach ($attribute_groups as $attribute_group) { ?>
                  <thead>
                    <tr>
                      <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                    <tr>
                      <td><?php echo $attribute['name']; ?></td>
                      <td><?php echo $attribute['text']; ?></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                  <?php } ?>
                </table>
              </div>
              <?php } ?>
              <?php if ($review_status) { ?>
              <div class="tab-pane" id="tab-review">
                <form class="form-horizontal" id="form-review">
                  <div id="review"></div>
                  <h2><?php echo $text_write; ?></h2>
                  <?php if ($review_guest) { ?>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                      <input type="text" name="name" value="" id="input-name" class="form-control" />
                    </div>
                  </div>
                  <?php if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) { ?>
                  <div class="form-group">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-positive_text"><?php echo $entry_positive_text; ?></label>
                      <textarea name="positive_text" rows="4" id="input-positive_text" class="form-control"></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-negative_text"><?php echo $entry_negative_text; ?></label>
                      <textarea name="negative_text" rows="4" id="input-negative_text" class="form-control"></textarea>
                    </div>
                  </div>
                  <input type="hidden" name="where_bought" value="1" />
                  <?php } ?>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                      <textarea name="text" rows="10" id="input-review" class="form-control"></textarea>
                      <div class="help-block"><?php echo $text_note; ?></div>
                    </div>
                  </div>
                 <div class="form-group reviewfield">
                <label class="col-sm-1"><?php echo $entry_rating; ?></label>
                <div class="col-sm-11">
            <select id="ratingme" name="rating">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
            <script>
               $(function() {
                  $('#ratingme').barrating({
                    theme: 'fontawesome-stars'
                  });
               });
            </script>
                </div>
            <div class="clearfix"></div>        
            </div>
                  <?php if (isset($captcha)) { ?>
                  <div class="reviewfield">
                    <?php echo $captcha; ?>
                  <div class="clearfix"></div>
                  </div>
                  <?php } ?>
                  <?php if ($text_terms) { ?>
                    <div class="reviewfield">
                      <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width:auto;height:auto;display:inline-block;margin: 0;" />
                    </div>
                    <br/><br/>
                  <?php } ?>
                  <div class="buttons clearfix">
                    <div class="pull-left">
                      <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                    </div>
                  </div>
                  <?php } else { ?>
                  <?php echo $text_login; ?>
                  <?php } ?>
                </form>
              </div>
              <?php } ?>
            </div>
        </div>
      </div>
      
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      
      </div>
    <?php echo $column_right; ?></div>
</div>

<?php if (isset($oct_images_by_options_data['status']) && $oct_images_by_options_data['status']) { ?>
<script>
  $(function() {
    <?php if ($minimum > 1) { ?>
      oct_update_prices_opt();
    <?php } ?>
  });

  function oct_update_product_quantity(product_id) {
    var input_val = $('#product').find('input[name=quantity]').val();
    var quantity = parseInt(input_val);

    <?php if ($minimum > 1) { ?>
      if (quantity < <?php echo $minimum; ?>) {
        quantity = $('#product').find('input[name=quantity]').val(<?php echo $minimum; ?>);
        return;
      }
    <?php } else { ?>
      if (quantity == 0) {
        quantity = $('#product').find('input[name=quantity]').val(1);
        return;
      }
    <?php } ?>

    $.ajax({
      url: 'index.php?route=product/product/update_prices&product_id=' + product_id + '&quantity=' + quantity,
      type: 'post',
      dataType: 'json',
      data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
      success: function(json) {
        $('#main-product-price').html(json['price']);
        $('#main-product-special').html(json['special']);
        $('#main-product-tax').html(json['tax']);
        $('#main-product-you-save').html(json['you_save']);
      } 
    });
  }

  function oct_update_prices_opt() { 
		var input_val = $('#product').find('input[name=quantity]').val();
    var quantity = parseInt(input_val);
		var minimumval = $('#minimumval').val();

		if (quantity < minimumval) {
			$('.plus-minus').val(minimumval);  
		}
		
    $.ajax({
      type: 'post',
      url:  'index.php?route=product/product/update_prices',
      data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select'),
      dataType: 'json',
      success: function(json) {
        $('#main-product-price').html(json['price']);
        $('#main-product-special').html(json['special']);
        $('#main-product-tax').html(json['tax']);
        $('#main-product-you-save').html(json['you_save']);
      } 
    });
  }
//--></script>

<script>
$(document).on('change', '#product input[type=\'radio\'], #product input[type=\'checkbox\'], #product select', function() {

            $.ajax({
              url: 'index.php?route=product/product/getPImages&product_id=<?php echo $product_id; ?>',
              type: 'post',
              data: $('#product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select'),
              dataType: 'json',
              success: function(json) {
                var items2 = [];
                if (json['images']) {
                  var patterns  = '<div class="image-additional-carousel thumbnails all-carousel owl-carousel owl-theme owl-loaded owl-responsive-1000">';
                  $.each(json['images'], function(i,val) {
                    patterns += '   <a href="'+val['popup']+'" class="dataitem" title="<?php echo $heading_title; ?>">';
                    patterns += '     <img src="'+val['thumb']+'" data-index="'+i+'"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />';
                    patterns += '   </a>';

                    var magItem = {
                      src: val['popup'],
                    };

                    items2.push(magItem);

                    if (i==0) {
                      $('.left-info .thumbnails-one').find('a').attr('href', val['main_popup']);
                      $('.left-info .thumbnails-one a').find('img').attr('src', val['main_img']);
                    }
                  
                  });
                  patterns += '</div>';
                }

                $('.left-info #image-additional').html(patterns);

                if (json['images'].length > 4) {
                  $('.left-info .image-additional-carousel').owlCarousel({
                    items: 6,
						itemsDesktop : [1199,5],
						itemsDesktopSmall : [979,4],
						itemsTablet : [768,4],
						itemsMobile : [479,3],
						autoPlay: false,
						navigation: true,
				        navigationText: ['<i class="fa fa-angle-left fa-5x" aria-hidden="true"></i>', '<i class="fa fa-angle-right fa-5x" aria-hidden="true"></i>'],
				        loop: true,
				        pagination: true
                  });
                } else {
                  $('.left-info .image-additional-carousel').owlCarousel({
                    items: 6,
						itemsDesktop : [1199,5],
						itemsDesktopSmall : [979,4],
						itemsTablet : [768,4],
						itemsMobile : [479,3],
						autoPlay: false,
						navigation: true,
				        navigationText: ['<i class="fa fa-angle-left fa-5x" aria-hidden="true"></i>', '<i class="fa fa-angle-right fa-5x" aria-hidden="true"></i>'],
				        loop: true,
				        pagination: true
                  });
                }              

                $('.left-info .image-additional-carousel .dataitem').magnificPopup({
                  mainClass: 'mfp-fade',
                  items: items2,
                  gallery: {
                    enabled:true
                  },
                  type: 'image',
                  callbacks : {
                    open: function() {
                      this.goTo(Number($(this.st.el).find('img').attr('data-index')));
                      $('.magnify-lens').hide();
                    }
                  }
                });

                $('.left-info .thumbnails-one').magnificPopup({
                  mainClass: 'mfp-fade',
                  items: items2,
                  gallery: {
                    enabled:true
                  },
                  callbacks : {
                    open: function() {
                      $('.magnify-lens').hide();
                    }
                  },
                  type: 'image'
                });
                <?php 
                $check_zoom = isset($oct_images_by_options_data['allow_zoom']) ? $oct_images_by_options_data['allow_zoom']: '0';
                if ($check_zoom) { ?>  
                 if ($(window).width() > 700) {
                  $('.left-info .thumbnails-one a img').magnify({
                    speed: 200,
                    src: $('.left-info .thumbnails-one a').attr('href')
                  });
               }
                <?php } ?>
              }
            });
          });

          <?php if ($check_zoom) { ?>  
          $(document).ready(function() {
            if ($(window).width() > 700) {
              $('.thumbnails-one a img').magnify({
                speed: 200,
                src: $('.thumbnails-one a').attr('href')
              });
            }
          });
          $(window).resize(function() {
            if ($(window).width() > 700) {
              $('.thumbnails-one a img').magnify({
                speed: 200,
                src: $('.thumbnails-one a').attr('href')
              });
            }
          });
            $('.left-info .thumbnails-one').on('mouseleave', function() {
    $('.magnify-lens').hide();
  });
          <?php } ?>
        </script> 
<?php } ?>
<script> 
<?php if(count($images) > 4) { ?>

  $(document).ready(function(){
    $('.image-additional-carousel').owlCarousel({
    items: 6,
						itemsDesktop : [1199,5],
						itemsDesktopSmall : [979,4],
						itemsTablet : [768,4],
						itemsMobile : [479,3],
						autoPlay: false,
						navigation: true,
				        navigationText: ['<i class="fa fa-angle-left fa-5x" aria-hidden="true"></i>', '<i class="fa fa-angle-right fa-5x" aria-hidden="true"></i>'],
				        loop: true,
				        pagination: true
       
  });
        
});

<?php } else { ?>

  $(document).ready(function(){
    $('.image-additional-carousel').owlCarousel({
    items: 6,
						itemsDesktop : [1199,5],
						itemsDesktopSmall : [979,4],
						itemsTablet : [768,4],
						itemsMobile : [479,3],
						autoPlay: false,
						navigation: true,
				        navigationText: ['<i class="fa fa-angle-left fa-5x" aria-hidden="true"></i>', '<i class="fa fa-angle-right fa-5x" aria-hidden="true"></i>'],
				        loop: true,
				        pagination: true       
  });
        
});
  
<?php } ?> 

$('.thumbnails').each(function() {
  var $container = $(this);
  var $imageLinks = $container.find('.dataitem');
 
  var items = [
       <?php 
       $aka = 1;
       foreach ($images as $image) {
        
        $zap = ",";
       
        if($aka  == count($images)) {$zap = "";}
        ?>
       
       {
        src: '<?php echo $image['popup']; ?>'
      }<?php 
      
      $aka++;
      echo $zap; 
      } ?>];
      
 
 
  $imageLinks.magnificPopup({
    mainClass: 'mfp-fade',
    items: items,
    gallery:{
        enabled:true
    },
    type: 'image',
    callbacks: {
      beforeOpen: function() {
        var index = $imageLinks.index(this.st.el);
        if (-1 !== index) {
          this.goTo(index);
        }
      }
    }
  });
});


$(document).ready(function() {
  
  
  $('.thumbnails-one').magnificPopup({
    
        
  items: [
       <?php 
           $aka = 1;
           foreach ($images as $image) {
            
            $zap = ",";
           
            if($aka  == count($images)) {$zap = "";}
            ?>
           
           {
            src: '<?php echo $image['popup']; ?>'
          }<?php 
          
              $aka++;
              echo $zap; 
          } ?>
      ],
    
  type:'image',
  callbacks: {
      open: function() {
        $('.magnify-lens').hide();
      }
    },
  gallery: {
    enabled:true
  }
      
});
  
  
});


</script> 

<script><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
  $.ajax({
    url: 'index.php?route=product/product/getRecurringDescription',
    type: 'post',
    data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
    dataType: 'json',
    beforeSend: function() {
      $('#recurring-description').html('');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();

      if (json['success']) {
        $('#recurring-description').html(json['success']);
      }
    }
  });
});
//--></script>
<script><!--
$('#button-cart').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }

        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }

        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }

      if (json['success']) {
        $.magnificPopup.open({
          tLoading: '<img src="catalog/view/theme/luxury/image/ring-alt.svg" />',
          items: {
            src: 'index.php?route=extension/module/oct_popup_add_to_cart&product_id=<?php echo $product_id; ?>',
            type: 'ajax'
          },
          midClick: true, 
          removalDelay: 200
        });

        $('#cart-total').html(json['total']);

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
//--></script>
<script><!--
$('.date').datetimepicker({
  pickTime: false
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});

$('.time').datetimepicker({
  pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
  var node = this;

  $('#form-upload').remove();

  $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  $('#form-upload input[name=\'file\']').trigger('click');

  if (typeof timer != 'undefined') {
      clearInterval(timer);
  }

  timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
      clearInterval(timer);

      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($('#form-upload')[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $('.text-danger').remove();

          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }

          if (json['success']) {
            alert(json['success']);

            $(node).parent().find('input').attr('value', json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
  }, 500);
});
//--></script>
<script><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
  $.ajax({
    url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
    type: 'post',
    dataType: 'json',
    data: $("#form-review").serialize(),
    beforeSend: function() {
      $('#button-review').button('loading');
    },
    complete: function() {
      $('#button-review').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('#button-review').parent().parent().after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $('#button-review').parent().parent().after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').prop('checked', false);
        $('input[name=\'terms\']:checked').prop('checked', false);
      }
    }
  });
});
//--></script>
<?php if ($products) { ?>
<!-- ********** Related ********** -->
<div class="container carousel-module-container">
  <div class="row carousel-module-row">
    <div class="carousel-module-row-header"><?php echo $text_related; ?></div>
    <div id="owl-carousel-module-related" class="owl-carousel owl-theme">
    <?php foreach ($products as $product) { ?>            
        <div class="item">
          <?php if ($product['oct_product_stickers']) { ?>
            <div class="cat-sticker-box">
              <?php foreach ($product['oct_product_stickers'] as $product_sticker) { ?>
                <div style="color: <?php echo $product_sticker['color']; ?>; background: <?php echo $product_sticker['background']; ?>;">
                  <?php echo $product_sticker['text']; ?>
                </div>
              <?php } ?>
            </div>
          <?php } ?>  
          <?php if ($product['thumb']) { ?>
            <div class="image">
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name'] ?>" /></a>
            </div> 
          <?php } ?>
          <div class="name">
          <a href="<?php echo $product['href']; ?>"><?php echo $product['name'] ?></a>
          </div>
          <?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
                <span class="price-new"><?php echo $product['price']; ?></span>
              <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span><br/><span class="price-new"><?php echo $product['special']; ?></span>
              <?php } ?>
            </div>
          <?php } ?>
          <?php if ($product['rating']) { ?>
            <div class="rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($product['rating'] < $i) { ?>
              <i class="fa fa-star-o" aria-hidden="true"></i>
              <?php } else { ?>
              <i class="fa fa-star" aria-hidden="true"></i>
              <?php } ?>
              <?php } ?>
            </div>
          <?php } ?>
          <div class="cart">
            <?php if ($product['quantity'] > 0) { ?>
              <a class="button-cart" title="<?php echo $button_cart; ?>" onclick="get_oct_popup_add_to_cart('<?php echo $product['product_id']; ?>', '1');"><i class="fa fa-shopping-basket" aria-hidden="true"></i> <?php echo $button_cart; ?></a>
            <?php } else { ?>
              <a class="out-of-stock-button" href="javascript: void(0);" <?php if (isset($product['product_preorder_status']) && $product['product_preorder_status'] == 1) { ?>onclick="get_oct_product_preorder('<?php echo $product['product_id']; ?>'); return false;"<?php } ?>><?php echo $product['product_preorder_text']; ?></a>
            <?php } ?>
            <?php if (isset($oct_popup_view_data['status']) && $oct_popup_view_data['status']) { ?>
            <a data-effect="mfp-zoom-out" onclick="get_oct_popup_product_view('<?php echo $product['product_id']; ?>');" title="<?php echo $button_popup_view; ?>" class="more"><i class="fa fa-eye" aria-hidden="true"></i></a>
            <?php } else { ?>
          <a href="<?php echo $product['href']; ?>" title="<?php echo $button_popup_view; ?>" class="more"><i class="fa fa-eye" aria-hidden="true"></i></a>    
          <?php } ?>      
            <a data-effect="mfp-zoom-out" onclick="get_oct_popup_add_to_wishlist('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>" class="wishlist"><i class="fa fa-heart" aria-hidden="true"></i></a>
            <a data-effect="mfp-zoom-out" onclick="get_oct_popup_add_to_compare('<?php echo $product['product_id']; ?>');" title="<?php echo $button_compare; ?>" class="compare"><i class="fa fa-sliders" aria-hidden="true"></i></a>
          </div> 
        </div>  
      <?php } ?>       
    </div>
  </div>
</div>
<script>
$('#owl-carousel-module-related').owlCarousel({
  items: 4,
itemsDesktop : [1599,4],
itemsDesktop : [1199,4],
itemsDesktopSmall : [979,4],
itemsTablet : [768,2],
itemsMobile : [479,1],
  autoPlay: false,
  navigation: true,
  slideMargin: 10,
  navigationText: ['<i class="fa fa-angle-left fa-5x" aria-hidden="true"></i>', '<i class="fa fa-angle-right fa-5x" aria-hidden="true"></i>'],
  stopOnHover:true,
  smartSpeed: 800,
  loop: true,
  pagination: false
});
</script>
<!-- ********** End of Related ********** -->
<?php } ?>
<?php echo $content_bottom; ?>
<?php if (isset($oct_product_reviews_data['status']) && $oct_product_reviews_data['status']) { ?>
<script>
    function review_reputation(review_id, reputation_type) {
      $.ajax({
        url: 'index.php?route=product/product/oct_review_reputation&review_id='+review_id+'&reputation_type='+reputation_type,
        dataType: 'json',
        success: function(json) {
          $('#form-review .alert-success, #form-review .alert-danger').remove();

	       if (json['error']) {
	          alert(json['error']);
	        }

           if (json['success']) {
	          alert(json['success']);
	          $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
	        }

        }
      });
    }
</script>
<?php } ?>
<?php echo $footer; ?>

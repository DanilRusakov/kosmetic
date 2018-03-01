<div class="box-4in1">
  <div class="container">
  <div class="row">
    <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-latest" data-toggle="tab"><?php echo $tab_latest; ?></a></li>
			<?php if ($special_products) { ?>
            <li><a href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></li>
            <?php } ?>
			<?php if ($bestseller_products) { ?>
            <li><a href="#tab-bestseller" data-toggle="tab"><?php echo $tab_bestseller; ?></a></li>
            <?php } ?>
            <?php if ($featured_products) { ?>
            <li><a href="#tab-featured" data-toggle="tab"><?php echo $tab_featured; ?></a></li>
            <?php } ?>
</ul>
<div class="tab-content">
 <?php if ($latest_products){ ?>
        <div id="tab-latest" class="tab-pane active">
          <div id="owl-example1" class="owl-carousel owl-theme">
            <?php foreach ($latest_products as $product) { ?>            
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
                    <?php if (isset($oct_popup_view_data['status']) && $oct_popup_view_data['status'] && $product['quantity'] > 0) { ?>
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
      <?php } ?>
       <?php if ($special_products){ ?>
        <div id="tab-special" class="tab-pane">
          <div id="owl-example2" class="owl-carousel owl-theme">
            <?php foreach ($special_products as $product) { ?>            
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
                   <?php if (isset($oct_popup_view_data['status']) && $oct_popup_view_data['status'] && $product['quantity'] > 0) { ?>
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
      <?php } ?>
      <?php if ($bestseller_products){ ?>
        <div id="tab-bestseller" class="tab-pane">
          <div id="owl-example3" class="owl-carousel owl-theme">
            <?php foreach ($bestseller_products as $product) { ?>            
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
                   <?php if (isset($oct_popup_view_data['status']) && $oct_popup_view_data['status'] && $product['quantity'] > 0) { ?>
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
      <?php } ?>
       <?php if ($featured_products){ ?>
        <div id="tab-featured" class="tab-pane">
          <div id="owl-example4" class="owl-carousel owl-theme">
            <?php foreach ($featured_products as $product) { ?>            
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
                   <?php if (isset($oct_popup_view_data['status']) && $oct_popup_view_data['status'] && $product['quantity'] > 0) { ?>
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
      <?php } ?>
</div>
    <script type="text/javascript">
    function initialize_owl(el) {
      el.owlCarousel({
      items: 4,
	  itemsDesktop : [1599,4],
	  itemsDesktop : [1199,4],
	  itemsDesktopSmall : [979,3],
	  itemsTablet : [768,2],
	  itemsMobile : [479,1],
      autoPlay: false,
      navigation: true,
        navigationText: ['<i class="fa fa-angle-left fa-5x" aria-hidden="true"></i>', '<i class="fa fa-angle-right fa-5x" aria-hidden="true"></i>'],
        stopOnHover:true,
        smartSpeed: 800,
        loop: true,
        pagination: false
      });
    }
    
    function destroy_owl(el) {
      // el.data('owlCarousel').destroy();
    }

    $(function () {
      initialize_owl($('#owl-example1'));
    
        $('a[href="#tab-latest"]').on('shown.bs.tab', function () {
            initialize_owl($('#owl-example1'));
        }).on('hide.bs.tab', function () {
            destroy_owl($('#owl-example1'));
        });
    
        $('a[href="#tab-special"]').on('shown.bs.tab', function () {
            initialize_owl($('#owl-example2'));
        }).on('hide.bs.tab', function () {
            destroy_owl($('#owl-example2'));
        });
    
        $('a[href="#tab-bestseller"]').on('shown.bs.tab', function () {
            initialize_owl($('#owl-example3'));
        }).on('hide.bs.tab', function () {
            destroy_owl($('#owl-example3'));
        });
         $('a[href="#tab-featured"]').on('shown.bs.tab', function () {
            initialize_owl($('#owl-example4'));
        }).on('hide.bs.tab', function () {
            destroy_owl($('#owl-example4'));
        });       
        
        
    
    });
    </script>
  </div>
  </div>
</div>
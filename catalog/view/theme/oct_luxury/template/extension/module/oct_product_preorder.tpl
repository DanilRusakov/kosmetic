<div id="popup-product-preorder-wrapper" class="white-popup mfp-with-anim">
  <h2 class="popup-header"><?php echo $heading_title; ?></h2>
  <div class="popup-center">
	  <div class="popup-text">
    <?php if (isset($heading_title_product)) { ?>
    <h3><?php echo $heading_title_product; ?></h3>
    <?php } ?>
    <?php if (isset($thumb)) { ?>
    <img src="<?php echo $thumb; ?>" />
    <?php } ?>
    <?php if (isset($price) && isset($special)) { ?>
    <?php if (!$special) { ?>
        <p><?php echo $price; ?></p>
        <?php } else { ?>
        <p><span class="cheaper-price-old" style="text-decoration: line-through;"><?php echo $price; ?></span> <span class="cheaper-price-new"><?php echo $special; ?></span></p>
        <?php } ?>
    <?php } ?>
		<?php if ($text_promo) { ?>
		<div class="popup-promo-text"><?php echo $text_promo; ?></div>
		<?php } ?>
	  </div>
    <form method="post" enctype="multipart/form-data" id="product-preorder-form">
      <div class="popup-form-box">
        <?php if ($oct_product_preorder_data['name']) { ?>
        <input name="name" value="<?php echo $name;?>" placeholder="<?php echo $enter_name; ?>" />
        <?php } ?>
        <?php if ($oct_product_preorder_data['telephone']) { ?>
        <input class="input-text" name="telephone" value="<?php echo $telephone;?>" placeholder="<?php echo $enter_telephone; ?>" />
          <?php if ($mask) { ?>
          <script>
            var isMobile = {
      		    Android: function() {
    		        return navigator.userAgent.match(/Android/i);
      		    },
      		    BlackBerry: function() {
    		        return navigator.userAgent.match(/BlackBerry/i);
      		    },
      		    iOS: function() {
    		        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
      		    },
      		    Opera: function() {
    		        return navigator.userAgent.match(/Opera Mini/i);
    		     },
      		    Windows: function() {
    		        return navigator.userAgent.match(/IEMobile/i);
      		    },
      		    Chrome: function() {
    		        return navigator.userAgent.match(/Chrome/i);
      		    }
      		  };
        		 
        		if (!isMobile.Android() ) {
              $("#popup-product-preorder-wrapper [name='telephone']").inputmask('<?php echo $mask; ?>');
            }
          </script>
          <?php } ?>
        <?php } ?>
        <?php if ($oct_product_preorder_data['email']) { ?>
        <input name="email" value="<?php echo $email;?>" placeholder="<?php echo $enter_email; ?>" />
         <?php } ?>
        <?php if ($oct_product_preorder_data['comment']) { ?>
        <textarea name="comment" placeholder="<?php echo $enter_comment; ?>"><?php echo $comment;?></textarea>
        <?php } ?>
        <?php if ($text_terms) { ?>
          <div>
            <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width:auto;height:auto;display:inline-block;margin: 0;" />
          </div>
        <?php } ?>
        <button class="subscr-button" title="<?php echo $button_send; ?>" type="button" id="popup-send-button"><?php echo $button_send; ?></button>
      </div>
	  <input type="hidden" name="pid" value="<?php echo $href; ?>">
      <input type="hidden" name="mid" value="<?php echo $model; ?>">
    </form>
  </div>
<script><!--
function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}
$('#popup-send-button').on('click', function() {
  masked('#popup-product-preorder-wrapper', true);
  $.ajax({
      type: 'post',
      url:  'index.php?route=extension/module/oct_product_preorder/send',
      dataType: 'json',
      data: $('#product-preorder-form').serialize(),
      success: function(json) {
        if (json['error']) {
          if (json['error']['field']) {
            masked('#popup-product-preorder-wrapper', false);
            $('#popup-product-preorder-wrapper .text-danger').remove();
            $.each(json['error']['field'], function(i, val) {
              $('#popup-product-preorder-wrapper [name="' + i + '"]').addClass('error_style').after('<div class="text-danger">' + val + '</div>');
            });
          }
        } else {
          if (json['output']) {
            masked('#popup-product-preorder-wrapper', false);
            $('#popup-send-button').remove();
						$('#popup-product-preorder-wrapper .popup-footer').remove();
            $('#popup-product-preorder-wrapper .popup-center').html(json['output']);
          }
        }
      }
  });
});
//--></script>
</div>

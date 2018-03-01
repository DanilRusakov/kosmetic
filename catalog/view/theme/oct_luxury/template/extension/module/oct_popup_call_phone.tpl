<div id="callback-popup" class="white-popup mfp-with-anim">
  <h2 class="popup-header"><?php echo $heading_title; ?></h2>
  <div class="popup-form-box">
    <div class="popup-center">
      <?php if((isset($oct_luxury_data['ps_whatsapp_id']) && strlen($oct_luxury_data['ps_whatsapp_id']) > 1) || (isset($oct_luxury_data['ps_telegram_id']) && strlen($oct_luxury_data['ps_telegram_id']) > 1) || (isset($oct_luxury_data['ps_viber_id']) && strlen($oct_luxury_data['ps_viber_id']) > 1)) { ?>
      <div class="oct-messengers">
      <?php if(isset($oct_luxury_data['ps_whatsapp_id']) && strlen($oct_luxury_data['ps_whatsapp_id']) > 1) { ?>
      <a class="oct-messengers-whatsapp" rel="nofollow" href="https://api.whatsapp.com/send?phone=<?php echo $oct_luxury_data['ps_whatsapp_id']; ?>" title="Whatsapp" target="_blank"><i class="fa fa-whatsapp" aria-hidden="true"></i></a>
      <?php } ?>
      <?php if(isset($oct_luxury_data['ps_telegram_id']) && strlen($oct_luxury_data['ps_telegram_id']) > 1) { ?>
      <a class="oct-messengers-telegram" rel="nofollow" href="http://t.me/<?php echo $oct_luxury_data['ps_telegram_id']; ?>" title="Telegram" target="_blank"><i class="fa fa-telegram" aria-hidden="true"></i></a>
      <?php } ?>
      <?php if(isset($oct_luxury_data['ps_viber_id']) && strlen($oct_luxury_data['ps_viber_id']) > 1) { ?>
      <a rel="nofollow" class="oct-messengers-viber viber-mobile" href="viber://add?number=<?php echo $oct_luxury_data['ps_viber_id']; ?>" title="Viber" target="_blank"><i class="fa fa-viber" aria-hidden="true"></i></a>
      <a rel="nofollow" class="oct-messengers-viber viber-desktop" href="viber://chat?number=<?php echo $oct_luxury_data['ps_viber_id']; ?>" title="Viber" target="_blank"><i class="fa fa-viber" aria-hidden="true"></i></a>
      <?php } ?>
      </div>
      <?php } ?>
      <form method="post" enctype="multipart/form-data" id="call-phone-form">
        <?php if ($oct_popup_call_phone_data['name']) { ?>
        <input class="input-text" value="<?php echo $name;?>" placeholder="<?php echo $enter_name; ?>" type="text" name="name" />
        <?php } ?>
        <?php if ($oct_popup_call_phone_data['telephone']) { ?>
        <input class="input-text" value="<?php echo $telephone;?>" placeholder="<?php echo $enter_telephone; ?>" type="text" name="telephone" />
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
  		 
  		    if( !isMobile.Android() ) {
            $("#callback-popup [name='telephone']").inputmask('<?php echo $mask; ?>');
          }
        </script>
        <?php } ?>
        <?php } ?>
        <?php if ($oct_popup_call_phone_data['time']) { ?>
        <input class="input-text datetime" value="<?php echo $time;?>" placeholder="<?php echo $enter_time; ?>" type="text" name="time" />
        <?php } ?>
        <?php if ($oct_popup_call_phone_data['comment']) { ?>
        <textarea name="comment" placeholder="<?php echo $enter_comment; ?>"><?php echo $comment;?></textarea>
        <?php } ?>
        <?php if ($text_terms) { ?>
          <div class="oct-terms">
            <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width:auto;height:auto;display:inline-block;margin: 0;" />
          </div>
        <?php } ?>
      </form>
    </div>
    <button class="subscr-button" title="Отправить" type="button" id="popup-send-button"><?php echo $button_send; ?></button>
  </div>
<?php if ($oct_popup_call_phone_data['time']) { ?>
<script src="catalog/view/javascript/jquery/datetimepicker/moment.js"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/locale/ru.js"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"></script>		
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script><!--
$('#callback-popup .date').datetimepicker({
  pickTime: false,
});

var nowDate = new Date();
var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);

$('#callback-popup .datetime').datetimepicker({
  pickDate: true,
  pickTime: true,
  minDate: today
});

$('#callback-popup .time').datetimepicker({
  pickDate: false,
});
//--></script>
<?php } ?>
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
  masked('#callback-popup .popup-center', true);
  $.ajax({
      type: 'post',
      url:  'index.php?route=extension/module/oct_popup_call_phone/send',
      dataType: 'json',
      data: $('#call-phone-form').serialize(),
      success: function(json) {
        if (json['error']) {
          if (json['error']['field']) {
            masked('#callback-popup .popup-center', false);
            $('#callback-popup .text-danger').remove();
            $.each(json['error']['field'], function(i, val) {
              $('#callback-popup [name="' + i + '"]').addClass('error_style').after('<div class="text-danger">' + val + '</div>');
            });
          }
        } else {
          if (json['output']) {
            masked('#callback-popup .popup-center', false);
            $('#popup-send-button').remove();
            $('#callback-popup .popup-center').html(json['output']);
          }
        }
      }
  });
});
//--></script>
</div>

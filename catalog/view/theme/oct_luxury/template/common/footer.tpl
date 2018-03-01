<footer>
	<?php
	if(isset($oct_popup_call_phone_data) && $oct_popup_call_phone_data['status'] > 0) { 
		echo '<a class="field-tip" onclick="get_oct_popup_call_phone();" id="uptocall-mini"><div class="uptocall-mini-phone"></div><span class="tip-content">' . $popup_call_phone_text['call_back'] . '</span></a>';
	}
	?>
	<?php if($oct_luxury_foot_1stline == "on") { ?>
	<div class="top-footer">
		<div class="container">
			<?php if($oct_luxury_foot_logo == "on") { ?> 
			<div class="row">
				<div class="col-sm-2 col-sm-offset-5 logo-box">
					<a href="javascript:void(0);"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
				</div>
			</div>
			<?php } ?>
			<?php if ($oct_luxury_foot_infolinks == "on") { ?>
				<div class="row footer-info-row">
			      <div class="col-md-3 col-sm-6">
			        <div class="oct-footer-h5"><?php echo $text_information; ?><a class="f-acc-toggle current-link"></a></div>
			        <ul class="list-unstyled">
			           <?php foreach ($footer_informations as $information) { ?>
		                   <?php if (isset($oct_luxury_footer_information_links) && in_array($information['information_id'], $oct_luxury_footer_information_links)) { ?>
		                    	<li><a href="<?php echo $information['href']; ?>" title="<?php echo $information['title']; ?>"><?php echo $information['title']; ?></a></li>
		                    <?php } ?>
	                    <?php } ?>
			        </ul>
			      </div>
			      <div class="col-md-3 col-sm-6">
			        <div class="oct-footer-h5"><?php echo $text_service; ?><a class="f-acc-toggle current-link"></a></div>
			        <ul class="list-unstyled">
			          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
			        
			          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
			        </ul>
			      </div>
			      <div class="col-md-3 col-sm-6">
			        <div class="oct-footer-h5"><?php echo $text_extra; ?><a class="f-acc-toggle current-link"></a></div>
			        <ul class="list-unstyled">
			          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
			         
			          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
			          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
			        </ul>
			      </div>
			      <div class="col-md-3 col-sm-6">
			        <div class="oct-footer-h5"><?php echo $text_account; ?><a class="f-acc-toggle current-link"></a></div>
			        <ul class="list-unstyled">
			          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
			          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
			          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
			        </ul>
			      </div>
		    </div>
		    <hr>
		    <?php } ?>
		     <?php if($oct_luxury_garanted!='') { echo html_entity_decode($oct_luxury_garanted);  } ?>
		</div>
	</div>
	<script>
		var m4 = viewport().width;
		if (m4 < 768) {
			$('.oct-footer-h5').on('click', function() {
			 	$(this).next().slideToggle();
			 	$(this).toggleClass('open');
	          });
		}
	</script>
	<?php } ?>
	<?php if($oct_luxury_foot_2ndline == "on") { ?>
	<div class="middle-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-sm-3 col-lg-offset-2">
					<p><i class="fa fa-map-marker" aria-hidden="true"></i> <?php echo $oct_luxury_cont_adress; ?></p>
				</div>
				<div class="col-lg-2 col-sm-3">
				<?php while ($element = each($oct_luxury_cont_phones)) {
					    echo "<p><i class=\"fa fa-phone\" aria-hidden=\"true\"></i><a href=\"#\" class=\"phoneclick\" onclick=\"window.location.href='tel:+".preg_replace('/\D/', '', $element['value'])."';\">".$element['value']."</a></p>";
					} ?>
				</div>
				<div class="col-lg-2 col-sm-3">
					<?php while ($element = each($oct_luxury_cont_clock)) {
						    echo "<p><i class=\"fa fa-calendar\" aria-hidden=\"true\"></i><span>".$element['value']."</span></p>";
						} ?>
				</div>
				<div class="col-lg-3 col-sm-3">
					<?php if($oct_luxury_cont_email!='') { ?><p><i class="fa fa-envelope" aria-hidden="true"></i> <span><a href="mailto:<?php echo $oct_luxury_cont_email; ?>"><?php echo $oct_luxury_cont_email; ?></a></span></p><?php } ?>
					<?php if($oct_luxury_cont_skype!='') { ?><p><i class="fa fa-skype" aria-hidden="true"></i> <span><a href="skype:<?php echo $oct_luxury_cont_skype; ?>"><?php echo $oct_luxury_cont_skype; ?></a></span></p><?php } ?>
					<?php if(strlen($oct_luxury_ps_whatsapp_id) > 1 || strlen($oct_luxury_ps_telegram_id) > 1 || strlen($oct_luxury_ps_viber_id) > 1) { ?>
					<div class="oct-messengers">
					<?php } ?>
                    <?php if(strlen($oct_luxury_ps_whatsapp_id) > 1) { ?>
                    <a class="oct-messengers-whatsapp" rel="nofollow" href="https://api.whatsapp.com/send?phone=<?php echo $oct_luxury_ps_whatsapp_id; ?>" title="Whatsapp" target="_blank"><i class="fa fa-whatsapp" aria-hidden="true"></i><span class="hidden-lg hidden-md-hidden-sm visible-xs">Whatsapp</span></a>
                    <?php } ?>
                    <?php if(strlen($oct_luxury_ps_telegram_id) > 1) { ?>
                    <a class="oct-messengers-telegram" rel="nofollow" href="http://t.me/<?php echo $oct_luxury_ps_telegram_id; ?>" title="Telegram" target="_blank"><i class="fa fa-telegram" aria-hidden="true"></i><span class="hidden-lg hidden-md-hidden-sm visible-xs">Telegram</span></a>
                    <?php } ?>
                    <?php if(strlen($oct_luxury_ps_viber_id) > 1) { ?>
                    <a rel="nofollow" class="oct-messengers-viber viber-mobile" href="viber://add?number=<?php echo $oct_luxury_ps_viber_id; ?>" title="Viber" target="_blank"><i class="fa fa-viber" aria-hidden="true"></i><span class="hidden-lg hidden-md-hidden-sm visible-xs">Viber</span></a>
                    <a rel="nofollow" class="oct-messengers-viber viber-desktop" href="viber://chat?number=<?php echo $oct_luxury_ps_viber_id; ?>" title="Viber" target="_blank"><i class="fa fa-viber" aria-hidden="true"></i></a>
                    <?php } ?>
                    <?php if(strlen($oct_luxury_ps_whatsapp_id) > 1 || strlen($oct_luxury_ps_telegram_id) > 1 || strlen($oct_luxury_ps_viber_id) > 1) { ?>
                    </div>
                    <?php } ?>
				</div>
			</div>
			<div class="row payment-row">
				<div class="col-sm-12">
					<div class="payment-box">
						<?php if($oct_luxury_ps_privat == "on") { ?> 
                            <span class="privat24"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_sberbank == "on") { ?> 
                            <span class="sberbank"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_visa == "on") { ?> 
                            <span class="visa"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_skrill == "on") { ?> 
                            <span class="skrill"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_interkassa == "on") { ?> 
                            <span class="interkassa"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_liqpay == "on") { ?> 
                            <span class="liqpay"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_paypal == "on") { ?> 
                            <span class="paypal"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_robokassa == "on") { ?> 
                            <span class="robokassa"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_yamoney == "on") { ?> 
                            <span class="yandex-money"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_webmoney == "on") { ?> 
                            <span class="webmoney"></span>
                        <?php } ?>
						<?php if($oct_luxury_ps_qiwi == "on") { ?> 
                            <span class="qiwi"></span>
                        <?php } ?>
                        <?php foreach ($ps_additional_icons as $ps_additional_icon) { ?>
                            <span class="custom-payment"><img src="<?php echo $ps_additional_icon['image']; ?>" alt=""></span>
                        <?php } ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php } ?>
	<?php if($oct_luxury_foot_3dline == "on") { ?>
	<div class="bottom-footer">
		<div class="container">
		    <div class="row powered-row">
	    		<div class="socials-box">
	    			<?php if($oct_luxury_ps_facebook_id != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_facebook_id; ?>" target="_blank"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></p>
					<?php } ?>
	    			<?php if($oct_luxury_ps_instagram != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_instagram; ?>" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></p>
					<?php } ?>
	    			<?php if($oct_luxury_ps_vk_id != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_vk_id; ?>" target="_blank"><i class="fa fa-vk" aria-hidden="true"></i></a></p>
					<?php } ?>
	    			<?php if($oct_luxury_ps_gplus_id != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_gplus_id; ?>" target="_blank"><i class="fa fa-google-plus" aria-hidden="true"></i></a></p>
					<?php } ?>
	    			<?php if($oct_luxury_ps_odnoklass_id != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_odnoklass_id; ?>" target="_blank"><i class="fa fa-odnoklassniki" aria-hidden="true"></i></a></p>
					<?php } ?>
	    			<?php if($oct_luxury_ps_twitter_username != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_twitter_username; ?>" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a></p>
					<?php } ?>
	    			<?php if($oct_luxury_ps_vimeo_id != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_vimeo_id; ?>" target="_blank"><i class="fa fa-vimeo" aria-hidden="true"></i></a></p>
					<?php } ?>
	    			<?php if($oct_luxury_ps_pinterest_id != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_pinterest_id; ?>" target="_blank"><i class="fa fa-pinterest" aria-hidden="true"></i></a></p>
					<?php } ?>
	    			<?php if($oct_luxury_ps_flick_id != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_flick_id; ?>" target="_blank"><i class="fa fa-flickr" aria-hidden="true"></i></a></p>
					<?php } ?>
	    			<?php if($oct_luxury_ps_youtube_id != '') { ?>
						<p><a href="<?php echo $oct_luxury_ps_youtube_id; ?>" target="_blank"><i class="fa fa-youtube" aria-hidden="true"></i></a></p>
					<?php } ?>
	    		</div>
		    </div>
		</div>
	</div>
	<?php } ?>
	<p id="back-top">
       <a href="#top"><span class="ti-angle-up"></span></a>
    </p>
</footer>
<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter46088541 = new Ya.Metrika({
                    id:46088541,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true,
                    trackHash:true,
                    ecommerce:"dataLayer"
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://cdn.jsdelivr.net/npm/yandex-metrica-watch/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/46088541" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
<!-- Top100 (Kraken) Counter -->
<script>
    (function (w, d, c) {
    (w[c] = w[c] || []).push(function() {
        var options = {
            project: 5146731,
            attributes_dataset: [ "your-attribute" ],
            trackHashes: true,
            user_id: null,
        };
        try {
            w.top100Counter = new top100(options);
        } catch(e) { }
    });
    var n = d.getElementsByTagName("script")[0],
    s = d.createElement("script"),
    f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src =
    (d.location.protocol == "https:" ? "https:" : "http:") +
    "//st.top100.ru/top100/top100.js";

    if (w.opera == "[object Opera]") {
    d.addEventListener("DOMContentLoaded", f, false);
} else { f(); }
})(window, document, "_top100q");
</script>
<noscript>
  <img src="//counter.rambler.ru/top100.cnt?pid=5146731" alt="Топ-100" />
</noscript>
<!-- END Top100 (Kraken) Counter -->
</body></html>
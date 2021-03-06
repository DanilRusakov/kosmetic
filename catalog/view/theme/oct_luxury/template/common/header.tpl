<?php
if(!isset($oct_luxury_status) || $oct_luxury_status == "off") {
	exit("<a href=\"http://luxury.octemplates.net/docs\" target=\"_blank\"><img style=\"display: block;margin: 100px auto;\" src='http://sstore2.octemplates.net/scr/hlplux.png' border='0'></a>");
}
?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ".$text_page ." ". ((int) $_GET['page']);} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<?php if (isset($og_url)) { ?><meta property="og:url" content="<?php echo $og_url; ?>" /><?php } ?>
<?php if (isset($og_image)) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script src="catalog/view/theme/oct_luxury/js/jquery-ui.js"></script>
<script src="catalog/view/javascript/octemplates/common.js"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<script src="catalog/view/theme/oct_luxury/js/main.js"></script>
<script src="catalog/view/theme/oct_luxury/js/barrating.js"></script>
<script src="catalog/view/theme/oct_luxury/js/jquery.mmenu.all.min.js"></script>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js"></script>
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>
<script src="catalog/view/theme/oct_luxury/js/input-mask.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<?php foreach ($scripts as $script) { ?>
<script  src="<?php echo $script; ?>"></script>
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/oct_luxury/stylesheet/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="catalog/view/theme/oct_luxury/stylesheet/themify-icons.css" rel="stylesheet" />
<link href="catalog/view/theme/oct_luxury/stylesheet/stylesheet.css" rel="stylesheet" />
<link href="catalog/view/theme/oct_luxury/stylesheet/menu.css" rel="stylesheet" />
<link href="catalog/view/theme/oct_luxury/stylesheet/jquery.mmenu.all.css" rel="stylesheet" />
<link href="catalog/view/theme/oct_luxury/stylesheet/fonts.css" rel="stylesheet" />
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" rel="stylesheet" />
<link href="catalog/view/theme/oct_luxury/stylesheet/popup.css" rel="stylesheet" />
<link href="catalog/view/theme/oct_luxury/stylesheet/responsive.css" rel="stylesheet" />
<link href="catalog/view/theme/oct_luxury/stylesheet/autosearch.css" rel="stylesheet" />
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>


<?php if (isset($oct_popup_found_cheaper_data['status']) && $oct_popup_found_cheaper_data['status']) { ?>
<script>
  function get_oct_popup_found_cheaper(product_id) {
    setTimeout(function() { 
      $.magnificPopup.open({
        tLoading: '<img src="catalog/view/theme/oct_luxury/image/ring-alt.svg" />',
        items: {
          src: 'index.php?route=extension/module/oct_popup_found_cheaper&product_id='+product_id,
          type: 'ajax'
        },
        midClick: true, 
  		  removalDelay: 200
      });
    }, 1);
  }
</script>
<?php } ?>
<?php if (isset($oct_popup_purchase_data['status']) && $oct_popup_purchase_data['status']) { ?>
<script>
  function get_oct_popup_purchase(product_id) {  
    setTimeout(function() { 
      $.magnificPopup.open({
        tLoading: '<img src="catalog/view/theme/oct_luxury/image/ring-alt.svg" />',
        items: {
          src: 'index.php?route=extension/module/oct_popup_purchase&product_id='+product_id,
          type: 'ajax'
        },
        midClick: true, 
  		  removalDelay: 200
      });
    }, 1);
  }
</script>
<?php } ?>
<?php if (isset($oct_popup_subscribe_form_data['status']) && $oct_popup_subscribe_form_data['status']) { ?>
<script>
$(function() {
  <?php $expire = $oct_popup_subscribe_form_data['expire'] ? $oct_popup_subscribe_form_data['expire'] : '1'; 
   $expire_ms = isset($oct_popup_subscribe_form_data['seconds']) ? $oct_popup_subscribe_form_data['seconds'] : '10000'; ?>
  <?php setcookie('oct_popup_subscribe', 1, time() + (60*60*24*$expire), "/"); ?>
  var expire_timer = "<?php echo $expire_ms; ?>";
  var expire_timeout = setTimeout(function(){
  get_oct_popup_subscribe();
  }, expire_timer);
  <?php if (isset($_COOKIE['oct_popup_subscribe'])) { ?>
  clearTimeout(expire_timeout);
  <?php } ?>
});

function get_oct_popup_subscribe() {
  $.magnificPopup.open({
    tLoading: '<img src="catalog/view/theme/oct_luxury/image/ring-alt.svg" />',
    items: {
      src: 'index.php?route=extension/module/oct_popup_subscribe',
      type: 'ajax'
    },
    midClick: true, 
    removalDelay: 200
  });
}
</script>
<?php } ?>
<?php if (isset($oct_popup_call_phone_data['status']) && $oct_popup_call_phone_data['status']) { ?>
<script>
function get_oct_popup_call_phone() {  
  $.magnificPopup.open({
    tLoading: '<img src="catalog/view/theme/oct_luxury/image/ring-alt.svg" />',
    items: {
      src: 'index.php?route=extension/module/oct_popup_call_phone',
      type: 'ajax'
    },
    midClick: true, 
    removalDelay: 200
  });
}
</script>
<?php } ?>
<?php if ( isset($oct_product_preorder_data['status']) && $oct_product_preorder_data['status'] ) { ?>
	<script>
	function get_oct_product_preorder(product_id) {  
		$.magnificPopup.open({
			tLoading: '<img src="catalog/view/theme/oct_luxury/stylesheet/oct_product_preorder/ring-alt.svg" />',
			items: {
				src: 'index.php?route=extension/module/oct_product_preorder&product_id='+product_id,
				type: 'ajax'
			}
		});
	}
	</script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<?php if ($oct_luxury_status == 1) { ?>
    <style>
    	<?php if($oct_luxury_maincolor1 !='') { ?>
            .slideshow-box p:before, .blog-img-box span, #product .selected, #product .btn-minus button, #product .btn-plus button, #product #button-cart, #product .button-cart, ul.account-ul li:hover, .wishlist-tr, h2.popup-header:after, #oneclick-popup .price-tax, #main-product-you-save {
				background-color: #<?php echo $oct_luxury_maincolor1; ?>;
            }
            .slideshow-box p, .box-4in1 .owl-wrapper-outer .owl-item .price .price-new, .box-4in1 .owl-wrapper-outer .owl-item .more, .box-4in1 .owl-wrapper-outer .owl-item .wishlist, .box-4in1 .owl-wrapper-outer .owl-item .compare, .goods-of-day .owl-wrapper-outer .owl-item .price .price-new, .flip-clock-wrapper ul li a div div.inn, .breadcrumb > li a, .compare-box a, .compare-box a:visited, .sort-row select, .product-thumb .price .price-new, .product-thumb .button-group .more, .product-thumb .button-group .wishlist, .product-thumb .button-group .compare, .account-content form legend, .account-content h2, .account-content .buttons div .button-back, ul.account-ul li a, .account-content .table-div table .button-back, .wishlist-content-tr a, .account-content .well h2, .mfp-close-btn-in .mfp-close, #auth-popup .auth-popup-links a.forget-popup-link, .gold, #cart-popup .popup-text .gold, .popup-cart-box .table > thead > tr > td, .popup-cart-box .table > thead > tr > th, td.delete-td button, #oneclick-popup #main-price, .carousel-module-row .owl-wrapper-outer .owl-item .price .price-new, .carousel-module-row .owl-wrapper-outer .owl-item .more, .carousel-module-row .owl-wrapper-outer .owl-item .wishlist, .carousel-module-row .owl-wrapper-outer .owl-item .compare, .sort-row .select-box:before, .advantage-item .img-box i, .mfp-close, .cheaper-price-new, .review-table .admin_answer .admin_answer_text  {
				color: #<?php echo $oct_luxury_maincolor1; ?>!important;
            }
            .goods-of-day .owl-wrapper-outer .owl-item .image, .goods-of-day, .form-control, .box-4in1 .nav-tabs, #product div.radio .selected-img img, .popup-form-box input, #back-top span {
	            border-color: #<?php echo $oct_luxury_maincolor1; ?>!important;
            }
            @media (min-width: 992px) {
				#menu-fix.fixed .fixed-right-menu ul li.fixed-cart {
				    background-color: #<?php echo $oct_luxury_maincolor1; ?>!important;
				}
			}
        <?php } ?>
        
    	<?php if($oct_luxury_maincolor2 !='') { ?>
            .goods-of-day .owl-wrapper-outer .owl-item .cart .button-cart:hover, .box-4in1 .owl-wrapper-outer .owl-item .cart .button-cart:hover, .box-4in1 .owl-wrapper-outer .owl-item .more:hover, .box-4in1 .owl-wrapper-outer .owl-item .wishlist:hover, .box-4in1 .owl-wrapper-outer .owl-item .compare:hover, .carousel-module-row .owl-wrapper-outer .owl-item .cart .button-cart:hover, .carousel-module-row .owl-wrapper-outer .owl-item .more:hover, .carousel-module-row .owl-wrapper-outer .owl-item .wishlist:hover, .carousel-module-row .owl-wrapper-outer .owl-item .compare:hover, .about-box .button-more:hover, .brands-box .brands-button:hover, .slideshow-box .button-more:hover, .product-thumb .button-group .button-cart:hover, .desc-cat-button .button-more:hover, #product .btn-plus button:hover, #product .btn-minus button:hover, #product #button-cart:hover, #product .button-cart:hover, .wishlist-btn:hover, .compare-btn:hover, .popup-form-box button:hover, .popup-button:hover, .box-4in1 .nav-tabs>li.active, .product-thumb .button-group .more:hover, .product-thumb .button-group .wishlist:hover, .product-thumb .button-group .compare:hover, #back-top, #column-left .list-group li, #search .btn-lg {
				background-color: #<?php echo $oct_luxury_maincolor2; ?>;
            }
            .btn-primary:hover, .button:hover, .luxury-button:hover, .pagination>.active>span {
	            background-color: #<?php echo $oct_luxury_maincolor2; ?>!important;
            }
            .product-thumb h4 a, .slideshow-box h2, .advantages-box .carousel-module-row-header, .box-4in1 .nav-tabs>li.active, .box-4in1 .nav-tabs>li>a, .box-4in1 .owl-wrapper-outer .owl-item .name a, .box-4in1 .owl-wrapper-outer .owl-item .cart .button-cart, .goods-of-day .carousel-module-row-header, .goods-of-day .owl-wrapper-outer .owl-item .name a, .reviews-row .carousel-module-row-header, .reviews-row .owl-wrapper-outer .owl-item .name a, .carousel-module-row-header, .carousel-module-row .carousel-module-row-header, .carousel-module-row .owl-wrapper-outer .owl-item .name a, .carousel-module-row .owl-wrapper-outer .owl-item .cart .button-cart, .about-box .carousel-module-row-header, .news-row .carousel-module-row-header, .brands-box .carousel-module-row-header, .cat-header, .subcat-header, .subcat-box a, #menu-fix.fixed .fixed-right-menu ul li.fixed-cart i, .product-thumb .button-group .button-cart, h2.popup-header, .account-content h1, .oct-fastorder-payment input[type=button]#button-confirm, .oct-related-caption .h4 a {
				color: #<?php echo $oct_luxury_maincolor2; ?>!important;
            }
            .pagination>li:first-child>a, .pagination>li:first-child>span, .pagination>li>a, .pagination>li>span, .pagination>li:last-child>a, .pagination>li:last-child>span, .right-info .short-desc, .account-content, .form-control, .popup-text a, .popup-text, #oneclick-popup h3, .item-header, body, h1, h2, h3, h4, h5, h6, .fastorder-panel-default .panel-heading {
	            color: #<?php echo $oct_luxury_maincolor2; ?>;
            }
            @media (min-width: 992px) {
				#menu-fix.fixed .fixed-right-menu ul li.fixed-cart span {
				    color: #<?php echo $oct_luxury_maincolor2; ?>!important;
				}
			}
        <?php } ?>
        
    	<?php if($oct_luxury_maincolor3 !='') { ?>
            .about-box .button-more, .brands-box .brands-button, .slideshow-box .button-more, .box-4in1 .owl-wrapper-outer .owl-item .price:before, .box-4in1 .owl-wrapper-outer .owl-item .cart .button-cart, .goods-of-day .owl-wrapper-outer .owl-item .cart .button-cart, .reviews-row .owl-wrapper-outer .owl-item .rating:after, .carousel-module-row .owl-wrapper-outer .owl-item .price:before, .about-box .carousel-module-row-header:after, .product-thumb .button-group .button-cart, .desc-cat-button .button-more, #product .not-selected, .wishlist-btn, .compare-btn, .popup-form-box button, .button, .popup-button, .product-thumb .price:before, .carousel-module-row .owl-wrapper-outer .owl-item .cart .button-cart, .fastorder-panel-default .panel-heading, #menu-fix.fixed .fixed-right-menu ul li .fixed-right-menu-ul li:hover a {
				background-color: #<?php echo $oct_luxury_maincolor3; ?>;
            }
            .luxury-button, .btn-primary, .oct-fastorder-payment input[type=button]#button-confirm {
	            background-color: #<?php echo $oct_luxury_maincolor3; ?>!important;
            }
            .box-4in1 .nav-tabs>li.active>a, .box-4in1 .owl-wrapper-outer .owl-item .cart .button-cart:hover, .goods-of-day .owl-wrapper-outer .owl-item .cart .button-cart:hover, .carousel-module-row .owl-wrapper-outer .owl-item .cart .button-cart:hover, .about-box .button-more:hover, .brands-box .brands-button:hover, .slideshow-box .button-more:hover, .box-4in1 .owl-wrapper-outer .owl-item .price .price-old, .goods-of-day .fa-diamond, .goods-of-day .owl-wrapper-outer .owl-item .price .price-old, .flip-clock-divider .flip-clock-label, .carousel-module-row .owl-wrapper-outer .owl-item .price .price-old, .product-thumb .price .price-old, .product-thumb .not-selected, .product-thumb .button-group .button-cart:hover, .desc-cat-button .button-more:hover, #product #button-cart:hover, #product .button-cart:hover, .popup-form-box button:hover, #auth-popup .popup-text, .button:hover, .right-menu-col ul li a:hover, .luxury-button:hover, .btn-primary:hover, .pagination>.active>span, .pagination>.active:hover>span, .middle-footer .oct-messengers i {
	            color: #<?php echo $oct_luxury_maincolor3; ?>!important;
            }
            .popup-text .link a, .popup-button:hover, #cart-popup .popup-text, #oneclick-popup .prise-old, #auth-popup .auth-popup-links a.reg-popup-link, .middle-footer .phoneclick:hover, .rating .fa-star, .rating .fa-star + .fa-star-o, .rating .fa-star-o, #tab-review .white-tr .fa-stack, #back-top a, .popup-cart-box .table small, #column-left .list-group li a {
	            color: #<?php echo $oct_luxury_maincolor3; ?>;
            }
            .thumbnails-one a, .thumbnails-one a:hover, #image-additional.image-additional .owl-item img {
	            border-color: #<?php echo $oct_luxury_maincolor3; ?>;
            }
            @media (min-width: 1025px) {
	            .box-4in1 .owl-wrapper-outer .owl-item:hover, .left-info .thumbnail, .left-info a.thumbnail:hover, #product div.radio img, .carousel-module-row .owl-wrapper-outer .owl-item:hover {
		            border-color: #<?php echo $oct_luxury_maincolor3; ?>;
	            }
	        }
            @media (min-width: 992px) {
				#menu-fix.fixed .fixed-right-menu ul li i {
				    color: #<?php echo $oct_luxury_maincolor3; ?>!important;
				}
			}
        <?php } ?>
    	<?php if($oct_luxury_head_1bge !='') { ?>
            #top {
				background-color: #<?php echo $oct_luxury_head_1bge; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_1linkcolore !='') { ?>
            #top ul li a, #top ul li a:visited, #top .btn-group > .btn-link, #top .btn-group > .btn-link i, #top ul li a + i {
				color: #<?php echo $oct_luxury_head_1linkcolore; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_2bg !='') { ?>
            header, #menu-fix.fixed, #mob-search-div, #menu-fix.fixed .fixed-right-menu ul li .fixed-right-menu-ul {
				background-color: #<?php echo $oct_luxury_head_2bg; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_infocolor !='') { ?>
            .right-menu-col ul li a {
				color: #<?php echo $oct_luxury_head_infocolor; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_linecolor !='') { ?>
            #menu-fix .menu-row {
				border-top: 1px solid #<?php echo $oct_luxury_head_linecolor; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_linecolor_hover !='') { ?>
            .right-menu-col ul li:hover a:before {
				background: #<?php echo $oct_luxury_head_linecolor_hover; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_tooltiplinkcolor !='') { ?>
            #top .dropdown-menu li a, #top #form-currency .dropdown-menu li button, #top #form-language .dropdown-menu li button, #top ul li ul li.shedule-li, #top ul li ul.phohes-dropdown li {
				color: #<?php echo $oct_luxury_head_tooltiplinkcolor; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_text_head_tooltiplinkcolor_h !='') { ?>
            #top .dropdown-menu li a:hover, #top #form-currency .dropdown-menu li button:hover {
				color: #<?php echo $oct_luxury_text_head_tooltiplinkcolor_h; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_bgsrchcat !='') { ?>
            #search .cats-button {
				background: #<?php echo $oct_luxury_head_bgsrchcat; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_bgsrchcattext !='') { ?>
            #search .dropdown-menu li a {
				color: #<?php echo $oct_luxury_head_bgsrchcattext; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_srch !='') { ?>
            #search .form-control.input-lg {
				background: #<?php echo $oct_luxury_head_srch; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_head_srchcolors !='') { ?>
            #search .form-control.input-lg, #search .btn-search {
				color: #<?php echo $oct_luxury_head_srchcolors; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_head_srchcolors !='') { ?>
            #search .input-lg::-webkit-input-placeholder {
				color: #<?php echo $oct_luxury_head_srchcolors; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_head_srchcolors !='') { ?>
            #search .input-lg::-moz-placeholder {
				color: #<?php echo $oct_luxury_head_srchcolors; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_head_srchcolors !='') { ?>
            #search .input-lg:-moz-placeholder {
				color: #<?php echo $oct_luxury_head_srchcolors; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_head_srchcolors !='') { ?>
            #search .input-lg:-ms-input-placeholder {
				color: #<?php echo $oct_luxury_head_srchcolors; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_bgcart !='') { ?>
            #cart .cart-name {
				background: #<?php echo $oct_luxury_head_bgcart; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_bgcart2 !='') { ?>
            #cart .cart-btn {
				background: #<?php echo $oct_luxury_head_bgcart2; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_head_textcart2 !='') { ?>
            #cart .cart-btn {
				color: #<?php echo $oct_luxury_head_textcart2; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_head_menu_text !='') { ?>
        	@media (min-width: 992px) {
	            .oct_megamenutoggle-wrapper {
					color: #<?php echo $oct_luxury_head_menu_text; ?>!important;
	            }
            }
        <?php } ?>
    	<?php if($oct_luxury_head_bgmenu !='') { ?>
            .vertical .megamenu-wrapper {
				background: #<?php echo $oct_luxury_head_bgmenu; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_head_maincolormenu !='') { ?>
            ul.oct_megamenu > li > a, #menu-fix.fixed .fixed-right-menu ul li .fixed-right-menu-ul li a {
				color: #<?php echo $oct_luxury_head_maincolormenu; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_maincolormenu_h !='') { ?>
            .vertical ul.oct_megamenu > li.active, .vertical ul.oct_megamenu > li:hover {
				background: #<?php echo $oct_luxury_head_maincolormenu_h; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_head_bgchildmenu !='') { ?>
            ul.oct_megamenu li .sub-menu .content {
				background: #<?php echo $oct_luxury_head_bgchildmenu; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_head_parentcolor !='') { ?>
            ul.oct_megamenu li .sub-menu .content .static-menu a.main-menu {
				color: #<?php echo $oct_luxury_head_parentcolor; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_head_parentcolor_hover !='') { ?>
            ul.oct_megamenu li .sub-menu .content .static-menu a.main-menu:hover {
				color: #<?php echo $oct_luxury_head_parentcolor_hover; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_head_childcolor !='') { ?>
            ul.oct_megamenu li .sub-menu .content .wide-menu-row .static-menu .menu ul li a {
				color: #<?php echo $oct_luxury_head_childcolor; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_head_childcolor_hover !='') { ?>
            ul.oct_megamenu li .sub-menu .content .wide-menu-row .static-menu .menu ul li a:hover {
				color: #<?php echo $oct_luxury_head_childcolor_hover; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_foot_1stlinebg !='') { ?>
            .top-footer {
				background: #<?php echo $oct_luxury_foot_1stlinebg; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_foot_linelogo !='') { ?>
            .top-footer .logo-box a {
				border-bottom: 1px solid #<?php echo $oct_luxury_foot_linelogo; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_foot_titlecolor !='') { ?>
            .top-footer .footer-info-row > div .oct-footer-h5 {
				color: #<?php echo $oct_luxury_foot_titlecolor; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_foot_linkcolor !='') { ?>
            .top-footer .footer-info-row > div li a {
				color: #<?php echo $oct_luxury_foot_linkcolor; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_foot_linelinks !='') { ?>
            footer hr {
				border-bottom: 1px solid #<?php echo $oct_luxury_foot_linelinks; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_foot_garantedcolors !='') { ?>
            .top-footer .advantages-row i {
				color: #<?php echo $oct_luxury_foot_garantedcolors; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_foot_garantedtext !='') { ?>
            .top-footer .advantages-row p {
				color: #<?php echo $oct_luxury_foot_garantedtext; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_foot_2ndlinebg !='') { ?>
            .middle-footer {
				background: #<?php echo $oct_luxury_foot_2ndlinebg; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_foot_iconscolor !='') { ?>
            .middle-footer p i {
				color: #<?php echo $oct_luxury_foot_iconscolor; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_foot_2ndlinetcolor !='') { ?>
            .middle-footer p {
				color: #<?php echo $oct_luxury_foot_2ndlinetcolor; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_foot_2linelink !='') { ?>
            .middle-footer p span a, .middle-footer .phoneclick, .oct-messengers span {
				color: #<?php echo $oct_luxury_foot_2linelink; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_foot_3dlinebg !='') { ?>
            .bottom-footer {
				background: #<?php echo $oct_luxury_foot_3dlinebg; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_foot_icocolor !='') { ?>
            .bottom-footer .powered-row .socials-box p i {
				color: #<?php echo $oct_luxury_foot_icocolor; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_sorttype =='off') { ?>
            .sort-row {
				display: none;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_sortcolor !='') { ?>
            .appearance .btn-group .btn-default {
				color: #<?php echo $oct_luxury_cat_sortcolor; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_hovercolor !='') { ?>
        	@media (min-width: 1025px) {
	            .product-grid .product-thumb:hover {
					border: 1px solid #<?php echo $oct_luxury_cat_hovercolor; ?>;
	            }
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_discountbg !='') { ?>
            .cat-discount {
				background: #<?php echo $oct_luxury_cat_discountbg; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_discountcolor !='') { ?>
            .cat-discount {
				color: #<?php echo $oct_luxury_cat_discountcolor; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_boxtext !='') { ?>
            .box-heading {
				color: #<?php echo $oct_luxury_cat_boxtext; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_boxbg !='') { ?>
            .box-heading {
				background: #<?php echo $oct_luxury_cat_boxbg; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_moduleborder !='') { ?>
            .box-content.filtered {
				border: 1px solid #<?php echo $oct_luxury_cat_moduleborder; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_modulebg !='') { ?>
            .box-content.filtered {
				background: #<?php echo $oct_luxury_cat_modulebg; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_itembg !='') { ?>
            .filtered .list-group-item.item-name, .filtered .list-group-item.item-name:hover {
				background: #<?php echo $oct_luxury_cat_itembg; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_plusminus !='') { ?>
            .filtered .link i {
				color: #<?php echo $oct_luxury_cat_plusminus; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_checkbox !='') { ?>
            .filtered input[type="checkbox"] + label::before, .filtered input[type="radio"] + label::before, .filtered input[type="checkbox"]:checked + label::before, .filtered input[type="radio"]:checked + label::before {
				border: 1px solid #<?php echo $oct_luxury_cat_checkbox; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_checkboxactive !='') { ?>
            .filtered input[type="checkbox"]:checked + label::before, .filtered input[type="radio"]:checked + label::before {
				background: #<?php echo $oct_luxury_cat_checkboxactive; ?>;
				border-width: 3px;
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_1levelbg !='') { ?>
            #sstore-3-level > ul > li > a {
				background: #<?php echo $oct_luxury_cat_1levelbg; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_1levelcolor !='') { ?>
            #sstore-3-level > ul > li > a {
				color: #<?php echo $oct_luxury_cat_1levelcolor; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_2levelbg !='') { ?>
            #sstore-3-level ul ul li a {
				background: #<?php echo $oct_luxury_cat_2levelbg; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_2levelcolor !='') { ?>
            #sstore-3-level ul ul li a {
				color: #<?php echo $oct_luxury_cat_2levelcolor; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_3levelbg !='') { ?>
            #sstore-3-level ul ul ul li a {
				background: #<?php echo $oct_luxury_cat_3levelbg; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_3levelcolor !='') { ?>
            #sstore-3-level ul ul ul li a {
				color: #<?php echo $oct_luxury_cat_3levelcolor; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_cat_3levelbgactive !='') { ?>
            #sstore-3-level ul ul ul li a.current-link {
				background: #<?php echo $oct_luxury_cat_3levelbgactive; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_cat_3leveltextactive !='') { ?>
            #sstore-3-level ul ul ul li a.current-link {
				color: #<?php echo $oct_luxury_cat_3leveltextactive; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_garantedcolor !='') { ?>
            #product .advantages i + p {
				color: #<?php echo $oct_luxury_pr_garantedcolor; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_garantedicon !='') { ?>
            #product .advantages i {
				color: #<?php echo $oct_luxury_pr_garantedicon; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_photoborder !='') { ?>
            .thumbnails-one a, #image-additional.image-additional .owl-item img {
				border: 2px solid #<?php echo $oct_luxury_pr_photoborder; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_photoborderhover !='') { ?>
            .thumbnails-one a:hover, #image-additional.image-additional .owl-item img:hover {
				border: 2px solid #<?php echo $oct_luxury_pr_photoborderhover; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_pr_bgright !='') { ?>
            .right-info {
				background: #<?php echo $oct_luxury_pr_bgright; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_activetabtext !='') { ?>
            .tabs-row .nav-tabs>li.active>a {
				color: #<?php echo $oct_luxury_pr_activetabtext; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_pr_activetabbg !='') { ?>
            .tabs-row .nav-tabs>li.active>a, .tabs-row .nav-tabs>li.active>a:focus, .tabs-row .nav-tabs>li.active>a:hover {
				background: #<?php echo $oct_luxury_pr_activetabbg; ?>;
            }
        <?php } ?>
    	<?php if($oct_luxury_pr_activetabbgcont !='') { ?>
            .tabs-row .tab-content {
				background: #<?php echo $oct_luxury_pr_activetabbgcont; ?>;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_activetabbgtext !='') { ?>
            #tab-description p {
				color: #<?php echo $oct_luxury_pr_activetabbgtext; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_tabtext !='') { ?>
            .tabs-row .nav-tabs>li>a {
				color: #<?php echo $oct_luxury_pr_tabtext; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_manufact_and_code !='') { ?>
            .right-info .manufacturers, .right-info .gold {
				color: #<?php echo $oct_luxury_pr_manufact_and_code; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_foundcheaper !='') { ?>
            #product .found-cheaper a {
				color: #<?php echo $oct_luxury_pr_foundcheaper; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_buyoneclick !='') { ?>
            #product .buy-in-click i, #product .buy-in-click a {
				color: #<?php echo $oct_luxury_pr_buyoneclick; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_pricecolor !='') { ?>
            #product h2.price {
				color: #<?php echo $oct_luxury_pr_pricecolor; ?>!important;
            }
        <?php } ?>
        <?php if($oct_luxury_pr_oldpricecolor !='') { ?>
            #product .price-old {
				color: #<?php echo $oct_luxury_pr_oldpricecolor; ?>!important;
            }
        <?php } ?>
    	<?php if($oct_luxury_mob_mainlinebg !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		#top {
					background: #<?php echo $oct_luxury_mob_mainlinebg; ?>;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_cartbg !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		#top-links #fixed-cart {
					background: #<?php echo $oct_luxury_mob_cartbg; ?>;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_carttexticocolor !='') { ?>
    		@media only screen and (max-width: 767px) {
	    		#top-links #fixed-cart #cart-total, #top-links #fixed-cart i {
					color: #<?php echo $oct_luxury_mob_carttexticocolor; ?>;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_menubg !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		#sidebar-toggle, #search-toggle, #search-toggle:focus {
					color: #<?php echo $oct_luxury_mob_menubg; ?>;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_menucolor !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		.mm-menu {
					background: #<?php echo $oct_luxury_mob_menucolor; ?>;
	            }
    		}
        <?php } ?>
        <?php if($oct_luxury_mob_sbbg !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		.mob-menu-ul h2, .mob-menu-ul .oct-sidebar-header {
					color: #<?php echo $oct_luxury_mob_sbbg; ?>;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_sbh3 !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		.mm-listview>li>a, .mm-listview>li>span, #currency-div .btn-link, #language-div .btn-link, li.sidebar-adress, #sidebar-contacts li.sidebar-shedule-item {
					color: #<?php echo $oct_luxury_mob_sbh3; ?>;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_sblinkcolor !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		.mob-menu-ul h2, .mob-menu-ul .oct-sidebar-header {
					background: #<?php echo $oct_luxury_mob_sblinkcolor; ?>;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_sbbuttoncolor !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		.mm-menu>.mm-navbar {
					background: #<?php echo $oct_luxury_mob_sbbuttoncolor; ?>;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_sbbuttonicon !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		.mm-navbar .mm-title {
					color: #<?php echo $oct_luxury_mob_sbbuttonicon; ?>!important;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_sbbuttoncoloropened !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		.mm-menu .mm-btn:after, .mm-menu .mm-btn:before {
					border-color: #<?php echo $oct_luxury_mob_sbbuttoncoloropened; ?>;
	            }
    		}
        <?php } ?>
    	<?php if($oct_luxury_mob_sbbuttoniconopened !='') { ?>
    		@media only screen and (max-width: 992px) {
	    		.mm-menu .mm-listview>li .mm-next:after {
					border-color: #<?php echo $oct_luxury_mob_sbbuttoniconopened; ?>;
	            }
    		}
        <?php } ?>
         <?php if($oct_luxury_customcss !='') { ?>
            <?php echo $oct_luxury_customcss; ?>
         <?php } ?>
         
         <?php if($oct_luxury_stick != "on") { ?>
		    #menu-fix.fixed {
			    display: none;
		    }
         <?php } ?>
    </style>
    
    
<?php if($oct_luxury_customjavascrip !='') { ?>
            <?php echo html_entity_decode($oct_luxury_customjavascrip); ?>
<?php } ?>
    
    
<?php } ?>
       
       

</head>
<body class="<?php echo $class; ?>">
<div id="bluring"></div>
<nav id="top">
  <div class="container">
	  <div id="left-top-links" class="nav pull-left">
		<a class="new-menu-toggle" href="#menu-mobile" data-toggle="body" id="sidebar-toggle">
			<span class="ti-menu"></span>
		</a>
		<a class="mobile-search-toggle" href="javascript:void(0);" id="search-toggle">
			<i class="fa fa-search"></i>
		</a>
		<nav id="menu-mobile">
			
		</nav>
		<div class="cd-panel from-left">
			<div class="cd-panel-container">
				<div class="cd-panel-content">
					<div class="sidebar-panel-header">
					
					</div>
					<div class="sidebar-div">
						<div class="sidebar-account-header oct-sidebar-header"><?php echo $text_account; ?></div>
						<ul class="sidebar-account">
							<?php if ($logged) { ?>
				            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
				            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
				            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
				            <?php } else { ?>
				            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
				            <li><a onclick="get_oct_popup_login();"><?php echo $text_login; ?></a></li>
				            <?php } ?>
						</ul>
					</div>
					<div class="sidebar-div">
						<div class="sidebar-account-header oct-sidebar-header"><?php echo $oct_head_info; ?></div>
						<ul class="sidebar-info">
							
						</ul>
					</div>
					<div class="sidebar-div">
						<div class="sidebar-account-header oct-sidebar-header"><i class="fa fa-cog" aria-hidden="true"></i> <?php echo $oct_head_settings; ?></div>
						<ul class="sidebar-settings">
							<li id="sidebar-currency"><i class="fa fa-circle" aria-hidden="true"></i> </li>
							<li id="sidebar-language"><i class="fa fa-circle" aria-hidden="true"></i> </li>
						</ul>
					</div>
					<div class="sidebar-div">
						<div class="sidebar-account-header oct-sidebar-header"><?php echo $oct_head_feedback; ?></div>
	                    <ul id="sidebar-contacts">
                            <?php if($oct_luxury_cont_phones) {
	                             while ($element = each($oct_luxury_cont_phones)) {
								    echo "<li><i class=\"fa fa-volume-control-phone\" aria-hidden=\"true\"></i> <a href=\"#\" class=\"phoneclick\" onclick=\"window.location.href='tel:+".preg_replace('/\D/', '', $element['value'])."';\">".$element['value']."</a></li>";
								} 
							} ?>
                            <li>
    						<li class="sidebar-adress"><i class="fa fa-map-marker" aria-hidden="true"></i> <p><?php echo $oct_luxury_cont_adress; ?></p></li>
    						<?php if($oct_luxury_cont_clock) {
	                            while ($element = each($oct_luxury_cont_clock)) {
							    	echo "<li class=\"sidebar-shedule-item\"><i class=\"fa fa-calendar\" aria-hidden=\"true\"></i> ".$element['value']."</li>";
								}
							} ?>
	                                               
	                    </ul>
            		</div>
            		<div class="sidebar-div" id="sidebar-map">
	            		<?php if($oct_luxury_cont_contactmap !='') { ?>
						    <?php echo html_entity_decode($oct_luxury_cont_contactmap); ?>
						<?php } ?>
            		</div>
				</div>
			</div>
		</div>
		  <ul class="list-inline">
			  <li class="dropdown acc-dropdown hidden-xs"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs visible-sm visible-md visible-lg"><?php echo $text_account; ?></span> <span class="caret"></span></a>
		          <ul class="dropdown-menu dropdown-menu-left">
			        <li class="wishlist-acc-dropdown"><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
			        <li class="compare-acc-dropdown"><a href="<?php echo $compare; ?>" id="compare-total-head"><?php echo $text_compare; ?></a></li>
		            <?php if ($logged) { ?>
		            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
		            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
		            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
		            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
		            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
		            <?php } else { ?>
		            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
		            <li><a onclick="get_oct_popup_login();"><?php echo $text_login; ?></a></li>
		            <?php } ?>
		          </ul>
		        </li>
		        <?php if($oct_luxury_cont_clock) { ?>
		        <li class="dropdown hidden-xs visible-sm visible-md visible-lg"><a href="<?php echo $account; ?>" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i class="fa fa-clock-o" aria-hidden="true"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $oct_luxury_cont_clock[0]; ?></span> <span class="caret"></span></a>
				<ul class="dropdown-menu dropdown-menu-left shedule-dropdown">
					<li class="shedule-li">
						<?php foreach($oct_luxury_cont_clock as $element_clock) {
							    echo $element_clock."<br>";
						} ?>
					</li>
				</ul>
				</li>
		      	<?php } ?>
		  </ul>
	  </div>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
	      <?php if($oct_luxury_cont_phones) { ?>
        <li class="dropdown info-dropdown">
        	<a href="<?php echo $contact; ?>" aria-expanded="false" data-toggle="dropdown" data-hover="dropdown"><i class="fa fa-phone" aria-hidden="true"></i><i class="fa fa-info-circle" aria-hidden="true"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $oct_luxury_cont_phones[0]; ?></span></a> <i class="fa fa-caret-down"></i>
        	<ul class="dropdown-menu dropdown-menu-right phohes-dropdown">
	        	<?php foreach($oct_luxury_cont_phones as $element) {
					 echo "<li class=\"header-phone\"><i class=\"fa fa-volume-control-phone\" aria-hidden=\"true\"></i><a href=\"#\" class=\"phoneclick\" onclick=\"window.location.href='tel:+".preg_replace('/\D/', '', $element)."';\">".$element."</a></li>";
					}  ?>
				<li class="header-location"><i class="fa fa-map-marker" aria-hidden="true"></i><?php echo $oct_luxury_cont_adress; ?></li>
			</ul>
        	 <span class="hidden-xs hidden-sm hidden-md"></span>
        </li>
        <?php } ?>
		<?php echo $currency; ?>
		<?php echo $language; ?>
		<?php if (!$language && !$currency) { ?>
			<style>
			 .sidebar-settings-header{
				 display:none !important;
			 }
			</style>
		<?php } ?>
      </ul>
    </div>
  </div>
    <div id="mob-search-div" class="container">
	    <input type="search" name="search-mobile" class="col-xs-10 form-control" id="mob-search-input" value="" placeholder="<?php echo $oct_search; ?>" onclick="this.value = '';">
		<button type="submit" class="col-xs-2 mob-search-submit"><i class="fa fa-search"></i></button>
    </div>
</nav>
<header>
  <div class="container first-header-container">
    <div class="row">
      <div class="col-sm-2 luxury-logo-box">
        <div id="logo">
          <?php if ($logo) { ?>
             <?php if($_SERVER['REQUEST_URI'] == "/index.php?route=common/home" OR $_SERVER['REQUEST_URI'] == "/") { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } ?>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div id="top-search" class="col-sm-7"><?php echo $search; ?></div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
  <div id="menu-fix">
		<div class="container responsive">
			<div class="row menu-row">
				<?php echo $oct_megamenu; ?>
	
				<div class="col-md-9 right-menu-col">
				      <button type="button" class="right-menu-btn">
				        <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $oct_head_info; ?>
				      </button>
				    <div class="right-menu-info">
					    <ul class="right-menu-ul">
							<?php foreach ($header_informations as $information) { ?>
		                   <?php if (isset($oct_luxury_header_information_links) && in_array($information['information_id'], $oct_luxury_header_information_links)) { ?>
		                    	<li><a href="<?php echo $information['href']; ?>" title="<?php echo $information['title']; ?>"><?php echo $information['title']; ?></a></li>
		                    <?php } ?>
	                    <?php } ?>
	                    <?php if($shownews == "on") { ?>
	                    	<li><a href="<?php echo $newslink; ?>" title="<?php echo $oct_head_news; ?>"><?php echo $oct_head_news; ?></a></li>
	                    <?php } ?>
	                    <?php if($showcontacts == "on") { ?>
	                    	<li><a href="<?php echo $contactlink; ?>" title="<?php echo $oct_head_contact; ?>"><?php echo $oct_head_contact; ?></a></li>
	                    <?php } ?>
						</ul>
						<div class="clearfix"></div>
				    </div>
				</div>
				<div class="col-sm-offset-3 col-sm-6 fixed-right-menu">
					<ul>
						<li class="dropdown info-dropdown">
							<a data-toggle="dropdown" aria-expanded="false" data-hover="dropdown"><i class="fa fa-info-circle" aria-hidden="true"></i></a>
							<ul id="right-menu-ul" class="dropdown-menu fixed-right-menu-ul">
							</ul>
						</li>
						<li class="dropdown">
							<a data-toggle="dropdown" aria-expanded="false" data-hover="dropdown"><i class="fa fa-user" aria-hidden="true"></i></a>
							<ul class="dropdown-menu fixed-right-menu-ul">
								<li class="fixed-wishlist"></li>
								<li class="compare-acc-dropdown"><a href="<?php echo $compare; ?>"><?php echo $text_compare; ?></a></li>
					            <?php if ($logged) { ?>
					            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
					            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
					            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
					            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
					            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
					            <?php } else { ?>
					            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
					            <li><a onclick="get_oct_popup_login();"><?php echo $text_login; ?></a></li>
					            <?php } ?>
					        </ul>
						</li>
						<li class="fixed-cart">
							<a id="fixed-cart" onclick="get_oct_popup_cart();"><i class="fa fa-shopping-basket" aria-hidden="true"></i> </a>
						</li>
					</ul>
				</div>
			</div>
	  </div>
	</div>

</header>


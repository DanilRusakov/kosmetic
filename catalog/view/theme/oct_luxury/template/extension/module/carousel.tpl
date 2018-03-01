<!-- ********** Brands ********** -->
<div class="brands-box1">
  <div class="container">
  <div class="row">
    <div id="carousel-<?php echo $module; ?>" class="owl-carousel">
      <?php foreach ($banners as $banner) { ?>
      <div class="item text-center">
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
        <?php } else { ?>
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
        <?php } ?>
      </div>
      <?php } ?>
    </div>
  </div>
  </div>
</div>
<script><!--
$('#carousel-<?php echo $module; ?>').owlCarousel({
	items: 5,
	itemsDesktop : [1599,5],
	itemsDesktop : [1199,5],
	itemsDesktopSmall : [979,4],
	itemsTablet : [768,2],
	itemsMobile : [479,1],
	autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="fa fa-angle-left fa-5x" aria-hidden="true"></i>', '<i class="fa fa-angle-right fa-5x" aria-hidden="true"></i>'],
	pagination: false
});
--></script>
<!-- ********** End of brands ********** -->
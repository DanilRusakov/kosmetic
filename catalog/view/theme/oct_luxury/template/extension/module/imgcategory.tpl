<div class="container">
   <div class="row carousel-module-row">
	<h2><?php echo $heading_title; ?></h2>
	<div class="imgcategory">
	    <?php foreach ($categories as $category) { ?>
	        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
	            <div class="product-thumb transition">
	                <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>"/></a></div>
	                <h4><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h4>
	            </div>
	        </div>
	    <?php } ?>
	    </div>
	</div>
</div>
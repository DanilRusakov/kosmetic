<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $count=> $breadcrumb) { ?>
		<?php if($count == 0) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } elseif($count+1<count($breadcrumbs)) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } else { ?>
			<li><span><?php echo $breadcrumb['text']; ?></span></li>
		<?php } ?>
	<?php } ?>
  </ul>
</div>
<?php echo $content_top; ?>
<div class="container">
	<div class="row top-row">
	  <div class="col-sm-12">
		  <h1 class="cat-header"><?php echo $heading_title; ?></h1>
	  </div>
  </div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
	    <div class="row">
		    <div class="col-sm-6 contact-form-box">
			    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
			        <fieldset>
			          <div class="form-group required">
			            <label class="col-sm-3 control-label" for="input-name"><?php echo $entry_name; ?></label>
			            <div class="col-sm-9">
			              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
			              <?php if ($error_name) { ?>
			              <div class="text-danger"><?php echo $error_name; ?></div>
			              <?php } ?>
			            </div>
			          </div>
			          <div class="form-group required">
			            <label class="col-sm-3 control-label" for="input-email"><?php echo $entry_email; ?></label>
			            <div class="col-sm-9">
			              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
			              <?php if ($error_email) { ?>
			              <div class="text-danger"><?php echo $error_email; ?></div>
			              <?php } ?>
			            </div>
			          </div>
			          <div class="form-group required">
			            <label class="col-sm-3 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
			            <div class="col-sm-9">
			              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
			              <?php if ($error_enquiry) { ?>
			              <div class="text-danger"><?php echo $error_enquiry; ?></div>
			              <?php } ?>
			            </div>
			          </div>
			          <?php if ($text_terms) { ?>
			            <div class="form-group required">
			              <label class="col-sm-3"></label>
			              <div class="col-sm-9">
			              <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width: auto;" <?php if ($terms) { ?>checked="checked"<?php } ?>/>
			              <?php if ($error_terms) { ?>
			              <div class="text-danger"><?php echo $error_terms; ?></div>
			              <?php } ?>
			              </div>
			            </div>
			          <?php } ?>
			          <div class="col-sm-offset-3 col-sm-9 captcha-box">
				          <?php echo $captcha; ?>
			          </div>
			        <div class="col-sm-offset-3 col-sm-9 contact-button-box">
			            <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
			        </div>
			        </fieldset>
			    </form>
		    </div>
		    <div class="col-sm-6">
			    <?php if ($oct_luxury_cont_contacthtml !='') { echo "<div class=\"contacthtml-box\">" . $oct_luxury_cont_contacthtml . "</div>"; } ?>
		    </div>
	    </div>
	    <div class="row map-box-row">
		    <div class="col-sm-12">
			    <?php if ($oct_luxury_cont_contactmap !='') {  echo "<div class=\"map-box\">" . html_entity_decode($oct_luxury_cont_contactmap, ENT_QUOTES, 'UTF-8') . "</div>"; } ?>
		    </div>
		</div>
	    
	    
      
      
      
      </div>
    <?php echo $column_right; ?></div>
</div><?php echo $content_bottom; ?>
<?php echo $footer; ?>

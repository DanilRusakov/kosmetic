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
        <div class="col-sm-10">
          <input type="text" name="tag" value="<?php echo $tag; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-tag" style="height: 49px;" class="form-control" />
        </div>
        <div class="col-sm-2">
	        <input type="button" value="<?php echo $button_search; ?>" id="button-tag" class="btn btn-primary" />
	     </div>     
      </div>
      
      <h2><?php echo $text_search; ?></h2>
      <?php if ($articles) { ?>
      <div class="row" style="display: none;">
        <div class="col-md-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-3 text-right">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
      <div class="row">
        <?php foreach ($articles as $article) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
                <p><?php echo $article['description']; ?></p>
                <p>
                  <div style="float:left;margin-right:20px;">
                    <?php echo $text_date_added; ?>
                    <span class="badge"><?php echo $article['date_added']; ?></span>
                  </div>
                  <div style="float:left;margin-right:20px;">
                    <?php echo $text_comments; ?>
                    <span class="badge"><?php echo $article['comments']; ?></span>
                  </div>
                  <div style="float:left;margin-right:20px;">
                    <?php echo $text_viewed; ?>
                    <span class="badge"><?php echo $article['viewed']; ?></span>
                  </div>
                  <div style="float:left;margin-right:20px;">
                    <?php echo $text_rating; ?>
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($article['rating'] < $i) { ?>
                    <span class="fa fa-stack" style="width: 12px;height: 15px;"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack" style="width: 12px;height: 15px;"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } ?>
                    <?php } ?>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
        </div>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script><!--
$('#button-tag').bind('click', function() {
  url = 'index.php?route=octemplates/blog_search';

  var tag = $('#content input[name=\'tag\']').prop('value');

  if (tag) {
    url += '&tag=' + encodeURIComponent(tag);
  }

  location = url;
});

$('#content input[name=\'tag\']').bind('keydown', function(e) {
  if (e.keyCode == 13) {
    $('#button-tag').trigger('click');
  }
});
--></script>
<?php echo $footer; ?>

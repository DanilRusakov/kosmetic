<div class="panel panel-default oct-article-categories-box">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="list-group">
  <?php foreach ($categories as $category) { ?>
    <?php if ($category['oct_blog_category_id'] == $oct_blog_category_id) { ?>
      <a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
        <?php foreach ($category['children'] as $child) { ?>
          <?php if ($child['oct_blog_category_id'] == $oct_blog_category_child_id) { ?>
            <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
          <?php } else { ?>
            <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
          <?php } ?>
        <?php } ?>
      <?php } ?>
    <?php } else { ?>
      <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
    <?php } ?>
  <?php } ?>
  </div>
</div>




<div class="box">
	<h3><?php echo $heading_title; ?></h3>
    <div class="box-content" id="sstore-3-level">
      <?php foreach ($manufacturers as $manufacturer) { ?>
      <ul>
		    <li>
		    <a class="category-name-a" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
		   
		     </li>
      </ul>    
      <?php } ?>
    </div>
</div>
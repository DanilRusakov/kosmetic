<div class="box">
    <div class="box-content" id="sstore-3-level">
      <?php foreach ($categories as $category) { ?>
          <ul>
		    <li class="<?php if ($category['category_id'] == $category_id) { echo "active";} if ($category['children']) {echo " has-sub";} ?>">
		    <a class="category-name-a" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
		    <a class="toggle-a" href="<?php echo $category['href']; ?>"></a>
		    <?php if ($category['children']) { ?>
	    		<ul>
			          <?php foreach ($category['children'] as $child) { ?>
			              <li class="<?php if ($child['category_id'] == $child_id) { echo "active";} if ($child['children2']) { echo " has-sub";} ?>">
		                  <a href="<?php echo $child['href']; ?>" class="list-group-item active">- <?php echo $child['name']; ?></a>
		                  <a style="<?php if (!$child['children2']) { echo "display: none";}?>" class="<?php if ($child['children2']) { echo "toggle-a";} ?>"></a>
						        <?php if ($child['children2']) { ?>
									 <ul>
		                      			<?php foreach ($child['children2'] as $child_lv3) { ?>
			                    		<li class="<?php if ($child_id == $child_lv3['category_id']) { echo "active";} ?>">
			                            <a href="<?php echo $child_lv3['href']; ?>">- <?php echo $child_lv3['name']; ?></a>
				                            <?php if (isset($child2['children3'])) { ?>
												  <?php foreach ($child2['children3'] as $child3) { ?>
													<?php if ($child3['category_id'] == $child_id3) { ?>
													<a href="<?php echo $child3['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <?php echo $child3['name']; ?></a>
													<?php } else { ?>
													<a href="<?php echo $child3['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <?php echo $child3['name']; ?></a>
													<?php } ?>
												  <?php } ?>
											 <?php } ?>
			                            </li>
				                 	  <?php } ?>
								 	</ul> 
								 <?php } ?>
							</li>
			          <?php } ?>
				</ul>      
			<?php } ?>
		    </li>
      </ul> 		  
      <?php } ?>
    </div>
</div>

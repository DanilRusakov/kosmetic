<?php
 class ModelCatalogAttributesToText extends Model{public function getText($a762c48ca732021c0a23bb276181d303a,$aef4d1635a3b937c1a34957e55617339a){$a2169f4b3288ab687b9c33bc262b9bd9c="";$this->load->model('catalog/product');$a4eb7f56ee5636550cfca0febe8af31b1=$this->model_catalog_product->getProductAttributes($a762c48ca732021c0a23bb276181d303a);$a42f40f7ad9b42e568ae04c0e09d94753=array();foreach($a4eb7f56ee5636550cfca0febe8af31b1 as $a582b13c248c5d4b3c3598b7d3edb0038){foreach($a582b13c248c5d4b3c3598b7d3edb0038['attribute']as $a959c14aa84677f0790c552c96c0a2a34){if(isset($aef4d1635a3b937c1a34957e55617339a['attributes'][$a959c14aa84677f0790c552c96c0a2a34['attribute_id']])){if($aef4d1635a3b937c1a34957e55617339a['attributes'][$a959c14aa84677f0790c552c96c0a2a34['attribute_id']]['show']==1){$a42f40f7ad9b42e568ae04c0e09d94753[]=$a959c14aa84677f0790c552c96c0a2a34['text'];}else if($aef4d1635a3b937c1a34957e55617339a['attributes'][$a959c14aa84677f0790c552c96c0a2a34['attribute_id']]['show']==2&&in_array($a959c14aa84677f0790c552c96c0a2a34['text'],explode(',',$aef4d1635a3b937c1a34957e55617339a['attributes'][$a959c14aa84677f0790c552c96c0a2a34['attribute_id']]['replace']))){$a42f40f7ad9b42e568ae04c0e09d94753[]=$a959c14aa84677f0790c552c96c0a2a34['name'];}}}}if($a42f40f7ad9b42e568ae04c0e09d94753){$a956b4a06a5cec86d029652dcef253080=isset($aef4d1635a3b937c1a34957e55617339a['attributes_separator'])?$aef4d1635a3b937c1a34957e55617339a['attributes_separator']:"/";$a2169f4b3288ab687b9c33bc262b9bd9c=implode($a42f40f7ad9b42e568ae04c0e09d94753,$a956b4a06a5cec86d029652dcef253080);}if(isset($aef4d1635a3b937c1a34957e55617339a['attributes_cut'])){$a697b642e645842650f565fda60be86e5=strlen($a2169f4b3288ab687b9c33bc262b9bd9c)>$aef4d1635a3b937c1a34957e55617339a['attributes_cut']?'..':'';$a2169f4b3288ab687b9c33bc262b9bd9c=utf8_substr($a2169f4b3288ab687b9c33bc262b9bd9c,0,$aef4d1635a3b937c1a34957e55617339a['attributes_cut']).$a697b642e645842650f565fda60be86e5;}return $a2169f4b3288ab687b9c33bc262b9bd9c;}}
//author sv2109 (sv2109@gmail.com) license for 1 product copy granted for xdivers ( ivoryprof.ru)
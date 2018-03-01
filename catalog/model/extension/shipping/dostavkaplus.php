<?php
class ModelExtensionShippingDostavkaPlus extends Model {
    private $pretype = 'extension';
    private $type = 'shipping';
    private $name = 'dostavkaplus';
    private $common = array();

    public function getQuote($address, $code = '') {
        $method_data = array();

        if ($this->config->get($this->name.'_status') == true) {
            $this->language->load($this->pretype . '/' . $this->type . '/' . $this->name);
            $quote_data = array();

            if (!isset($this->session->data['currency'])) {
                $this->session->data['currency'] = $this->config->get('config_currency');
            }

            if (file_exists(DIR_APPLICATION.'/controller/extension/module/product_groups.php') ) {
                $show_product_groups = true;
                $this->load->model('extension/module/product_groups');
            }
            else {
                $show_product_groups = false;
            }

            $products = $this->cart->getProducts();

            if (is_array($this->config->get($this->name.'_module')) and count($this->config->get($this->name.'_module')) > 0) {

                foreach($this->config->get($this->name.'_module') as $key => $module) {

				    $arr_lock = array();
					$arr_unlock = array();
                    $arr_error = array();

                    if ($module['status'] == 1) {

                        if (isset($module['group']) and is_array($module['group']) and in_array((int)$this->customer->getGroupId(), $module['group'])) {

                            if (isset($module['store']) and is_array($module['store']) and in_array((int)$this->config->get('config_store_id'), $module['store'])) {

                                $status = true;

                                $this->load->model('extension/extension');

                                $totals = array();
                                $taxes = $this->cart->getTaxes();
                                $order_total = 0;

                                $total_data = array(
                                    'totals' => &$totals,
                                    'taxes'  => &$taxes,
                                    'total'  => &$order_total
                                );


                                $sort_order = array();

                                $results = $this->model_extension_extension->getExtensions('total');

                                if (count($results) > 0) {
                                    foreach ($results as $tkey => $value) {
                                        $sort_order[$tkey] = $this->config->get($value['code'] . '_sort_order');
                                    }

                                    array_multisort($sort_order, SORT_ASC, $results);

                                    //print_r($results);

                                    foreach ($results as $ot) {
                                        if ($this->config->get($ot['code'] . '_status')) {
                                            //    echo $ot['code'].'===='.'model_total_' . $ot['code']."\n";

                                            $this->load->model('extension/total/' . $ot['code']);
                                            $this->{'model_extension_total_' . $ot['code']}->getTotal($total_data);
                                        }

                                        if (isset($module['total_value']) and $ot['code'] == $module['total_value']) {
                                            break;
                                        }

                                    }
                                }


                                //echo $module['title'][$this->config->get('config_language_id')].'=='.$module['total_value'];
                                //echo ">>>>".$order_total."<<<<<br/>\n\n\n";

                                $total = $order_total;

                                $weight = $this->weight->convert($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $module['weight_class_id']);

                                if (isset($module['geo_zone']) and is_array($module['geo_zone']) and count($module['geo_zone']) > 0 ) {

                                    $sql = "SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone
                                        WHERE geo_zone_id IN (" . implode(',', $module['geo_zone']) . ") AND country_id = " . (int)$address['country_id'] . "
                                        AND (zone_id = " . (int)$address['zone_id'] . " OR zone_id = 0)";

                                    $query = $this->db->query($sql);
                                    if ($query->num_rows) {
                                        $status = true;

                                        if ($module['city_rate'] != '' and isset($address['city']) and $address['city'] != '') {
                                            $rates = explode(';', $module['city_rate']);

                                            if (count($rates) > 0) {
                                                foreach ($rates as $rate) {
                                                    $data = trim($rate);

                                                    if (mb_strtolower($data, 'UTF-8') == mb_strtolower(trim($address['city']), 'UTF-8')) {
                                                        $arr_lock[] = $key;
                                                    }
                                                }
                                            }
                                        }


                                        if ($module['city_rate2'] != '' and isset($address['city']) and $address['city'] != '') {
                                            $rates = explode(';', $module['city_rate2']);
                                            //print_r($rates);
                                            if (count($rates) > 0) {
                                                foreach ($rates as $rate) {
                                                    $data = trim($rate);

                                                    if (mb_strtolower($data, 'UTF-8') == mb_strtolower(trim($address['city']), 'UTF-8')) {
                                                        $arr_unlock[] = $key;
                                                    }
                                                }
                                            }
                                        }


                                        if ( !in_array($key,$arr_lock)
                                            and (empty($module['city_rate2']) or (!empty($module['city_rate2']) and in_array($key,$arr_unlock)))
                                        ) {
                                            $status = true;
                                        }
                                        else {
                                            if (isset($module['bibb']) and in_array('zone',$module['bibb'])) {
                                                $arr_error[] = $this->language->get('error_description_zone');
                                            }
                                            $status = false;
                                        }
                                    }
                                    else {
                                        if (isset($module['bibb']) and in_array('zone',$module['bibb'])) {
                                            $arr_error[] = $this->language->get('error_description_zone');
                                        }
                                        $status = false;
                                    }
                                }


                                if ($status == true) {
                                    if ($show_product_groups == true and is_array($this->config->get($this->name.'_pgroups')) and count($this->config->get($this->name.'_pgroups')) > 0) {

                                        foreach ($this->config->get($this->name.'_pgroups') as $pgroup) {
                                            // print_r($pgroup);

                                            if ( (isset($pgroup['key']) and count($pgroup['key']) > 0) and in_array($this->name.'.sh'.$key, $pgroup['key'])
                                                and isset($pgroup['filter_group_id']) and $pgroup['filter_group_id'] > 0 ) {

                                                if ($pgroup['logic'] == 'all') {
                                                    $in_group = true;

                                                    if (count($products) > 0) {
                                                        foreach ($products as $product) {
                                                            $locals_in_group = $this->model_extension_module_product_groups->isProductInGroup($product['product_id'], $pgroup['filter_group_id']);
                                                            if ($locals_in_group == false) {
                                                                $in_group = false;
                                                                break;
                                                            }
                                                        }
                                                    }
                                                }
                                                elseif ($pgroup['logic'] == 'any') {
                                                    $in_group = false;

                                                    if (count($products) > 0) {
                                                        foreach ($products as $product) {
                                                            $locals_in_group = $this->model_extension_module_product_groups->isProductInGroup($product['product_id'], $pgroup['filter_group_id']);
                                                            if ($locals_in_group == true) {
                                                                $in_group = true;
                                                                break;
                                                            }
                                                        }
                                                    }
                                                }
                                                else {
                                                    $in_group = true;

                                                    if (count($products) > 0) {
                                                        foreach ($products as $product) {
                                                            $locals_in_group = $this->model_extension_module_product_groups->isProductInGroup($product['product_id'], $pgroup['filter_group_id']);
                                                            if ($locals_in_group == true) {
                                                                $in_group = false;
                                                                break;
                                                            }
                                                        }
                                                    }
                                                }

                                                if ($in_group == false) {
                                                    $status = false;
                                                }

                                                if ($status == false) {
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                }


                                if ($status == true) {
                                    if (isset($module['bibb']) and in_array('quantity',$module['bibb'])) {
                                        $in_stock = true;

                                        $products = $this->cart->getProducts();

                                        if (count($products) > 0) {
                                            foreach ($products as $product) {
                                                if (!$product['stock']) {
                                                    $in_stock = false;
                                                    break;
                                                }
                                            }
                                        }

                                        if ($in_stock == false) {
                                            $arr_error[] = $this->language->get('error_description_quantity');
                                            $status = false;
                                        }
                                    }
                                }


                                if ($status == true) {
                                    if (!isset($module['min_total'])) {
                                        $module['min_total'] = 0;
                                    }

                                    if (!isset($module['max_total'])) {
                                        $module['max_total'] = 0;
                                    }

                                    $module['min_total'] = (int)$module['min_total'];
                                    $module['max_total'] = (int)$module['max_total'];

                                    if (($module['min_total'] > 0 and $module['max_total'] > 0 and $total >= $module['min_total'] and $total < $module['max_total']) or
                                        ($module['min_total'] > 0 and $module['max_total'] == 0 and $total >= $module['min_total']) or
                                        ($module['max_total'] > 0 and $module['min_total'] == 0 and $total < $module['max_total']) or
                                        ($module['max_total'] == 0 and $module['min_total'] == 0)) {

                                        $status = true;
                                    }
                                    else {
                                        if (isset($module['bibb']) and in_array('total',$module['bibb']) and $total < (float)$module['min_total']) {
                                            $arr_error[] = html_entity_decode(sprintf($this->language->get('error_description_total'), $this->currency->format($this->tax->calculate($module['min_total'],'', $this->config->get('config_tax')),$this->session->data['currency'],1), $this->currency->format($this->tax->calculate($module['min_total']-$total,'', $this->config->get('config_tax')),$this->session->data['currency'],1)), ENT_QUOTES, 'UTF-8');
                                        }
                                        $status = false;
                                    }
                                }


                                if ($status == true) {
                                    if (!isset($module['min_weight'])) {
                                        $module['min_weight'] = 0;
                                    }

                                    if (!isset($module['max_weight'])) {
                                        $module['max_weight'] = 0;
                                    }

                                    $module['min_weight'] = (int)$module['min_weight'];
                                    $module['max_weight'] = (int)$module['max_weight'];

                                    if (($module['min_weight'] > 0 and $module['max_weight'] > 0 and $weight >= $module['min_weight'] and $weight < $module['max_weight']) or
                                        ($module['min_weight'] > 0 and $module['max_weight'] == 0 and $weight >= $module['min_weight']) or
                                        ($module['max_weight'] > 0 and $module['min_weight'] == 0 and $weight < $module['max_weight']) or
                                        ($module['max_weight'] == 0 and $module['min_weight'] == 0)) {

                                        $status = true;
                                    }
                                    else {
                                        $weight_unit = $this->weight->getUnit($module['weight_class_id']);

                                        if (isset($module['bibb']) and in_array('weight',$module['bibb']) and $weight > (float)$module['max_weight']) {
                                            $arr_error[] = sprintf($this->language->get('error_description_weight'), $module['max_weight'].' '.$weight_unit, ($weight - $module['max_weight']).' '.$weight_unit);
                                        }
                                        $status = false;
                                    }
                                }


                                if ($status == true or ($status == false and count($arr_error) > 0)) {
                                    //print_r($module);

                                    $price = $module['price'];

                                    if ($module['rate'] != '') {
                                        $rates = explode(',', $module['rate']);

                                        if (count($rates) > 0) {
                                            foreach ($rates as $rate) {
                                                $data = explode(':', $rate);

                                                $data[0] = trim($data[0]);

                                                if ($data[0] >= $weight) {
                                                    if (isset($data[1])) {
                                                        $price = trim($data[1]);
                                                    }

                                                    break;
                                                }
                                            }
                                        }
                                    }


                                    if (isset($module['cost']) and $module['cost'] != '') {
                                        $price = $price + (int)$module['cost'];
                                    }

                                    if (!isset($module['image'])) {
                                        $module['image'] = '';
                                    }

                                    $title = html_entity_decode($module['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

                                    if (isset($module['info'][$this->config->get('config_language_id')])) {
                                        $description = html_entity_decode($module['info'][$this->config->get('config_language_id')]);
                                    }
                                    else {
                                        $description = '';
                                    }


                                    if (isset($module['notes'])) {
                                        $description .= html_entity_decode($module['notes']);
                                    }


                                    if (isset($module['currency']) and $module['currency'] != $this->session->data['currency']) {
                                        $price = $this->currency->convert($price, $module['currency'], $this->session->data['currency']);
                                    }


                                    if (is_array($this->config->get($this->name.'_discounts')) and count($this->config->get($this->name.'_discounts')) > 0) {
                                        foreach ($this->config->get($this->name.'_discounts') as $discount) {

                                            if ( (empty($discount['total']) or (!empty($discount['total']) and $discount['total'] <= $total)) and
                                                (isset($discount['key']) and is_array($discount['key']) and in_array($this->name.'.sh'.$key, $discount['key'])) and
                                                (isset($discount['customer_group_id']) and is_array($discount['customer_group_id']) and in_array((int)$this->customer->getGroupId(), $discount['customer_group_id']))
                                            ) {

                                                if (isset($discount['geo_zone']) and is_array($discount['geo_zone'])) {
                                                    $sql = "SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone
                                                    WHERE geo_zone_id IN (" . implode(',', $discount['geo_zone']) . ") AND country_id = " . (int)$address['country_id'] . "
                                                    AND (zone_id = " . (int)$address['zone_id'] . " OR zone_id = 0)";

                                                    $query = $this->db->query($sql);
                                                    if ($query->num_rows) {
                                                        $right_geo_zone = true;
                                                    }
                                                    else {
                                                        $right_geo_zone = false;
                                                    }
                                                }
                                                else {
                                                    $right_geo_zone = true;
                                                }


                                                if ($right_geo_zone == true) {
                                                    $natsenka_number = 0;

                                                    if ($discount['prefix'] == '-') {
                                                        if ($discount['mode'] == 'percent') {
                                                            $natsenka_number = -$total * $discount['value'] / 100;
                                                        } // -%
                                                        elseif ($discount['mode'] == 'percent_shipping') {
                                                            $natsenka_number = -$price * $discount['value'] / 100;
                                                        } elseif ($discount['mode'] == 'factor') {
                                                            $natsenka_number = -($price + $total) * $discount['value'];
                                                        } else {
                                                            $natsenka_number = -$discount['value'];
                                                        } // -ed
                                                    }
                                                    elseif ($discount['prefix'] == '+') {
                                                        if ($discount['mode'] == 'percent') {
                                                            $natsenka_number = $total * $discount['value'] / 100;
                                                        } // +%
                                                        elseif ($discount['mode'] == 'percent_shipping') {
                                                            $natsenka_number = $price * $discount['value'] / 100;
                                                        } elseif ($discount['mode'] == 'factor') {
                                                            $natsenka_number = ($price + $total) * $discount['value'];
                                                        } else {
                                                            $natsenka_number = $discount['value'];
                                                        } // +ed
                                                    }

                                                    //echo '$natsenka_number='.$natsenka_number;
                                                    $price += $natsenka_number;
                                                }

                                            }
                                        }
                                    }

                                    if ($price < 0) {
                                        $price = 0;
                                    }


                                    if ($price == 0) {
                                        if (isset($module['price_text'][$this->config->get('config_language_id')]) and !empty($module['price_text'][$this->config->get('config_language_id')])) {
                                            $text = trim($module['price_text'][$this->config->get('config_language_id')]);
                                        }
                                        else {
                                            $text = $this->language->get('text_free');
                                        }
                                    }
                                    else {
                                        $text = $this->currency->format($this->tax->calculate($price, $this->config->get($this->name.'_tax_class_id'), $this->config->get('config_tax')),$this->session->data['currency'],1);
                                    }

                                    $description = str_replace("<p><br></p>", "", $description);


                                    if (isset($module['show_description']) and $module['show_description'] == 1) {
                                        $show_text_description = 1;
                                    }
                                    else {
                                        $show_text_description = 2;
                                    }

                                    $path1 = str_replace("/system/", "", DIR_SYSTEM);
                                    $path2 = str_replace($path1, "", DIR_IMAGE);

                                    $quote_data['sh'.$key] = array(
                                        'code'            => $this->name.'.sh'.$key,
                                        'title'           => $title,
                                        'image'           => ($module['image']) ? $path2.$module['image'] : '',
                                        'cost'            => $price,
                                        'dummy'           => isset($arr_error[0]) ? $arr_error[0] : '',
                                        'description'     => isset($arr_error[0]) ? $arr_error[0] : $description,
                                        'show_description' => $show_text_description,
                                        'tax_class_id'    => $this->config->get($this->name.'_tax_class_id'),
                                        'sort_order'      => isset($arr_error[0]) ? ($module['sort_order'] + 1000) : $module['sort_order'],
                                        'text'            => isset($arr_error[0]) ? '' : $text,
                                        'error'           => isset($arr_error[0]) ? true : false
                                    );

                                    if (isset($arr_error[0])) {
                                        $error = true;
                                    }
                                    //print_R($quote_data['sh'.$key]);
                                }
                            }
                        }
                    }
                }
            }

            if (isset($quote_data) and count($quote_data) > 0) {
                $sort_by = array();
                foreach ($quote_data as $key => $value) $sort_by[$key] = $value['sort_order'];
                array_multisort($sort_by, SORT_ASC, $quote_data);
            }

            if ((isset($quote_data) and count($quote_data) > 0) or isset($error)) {
                $title = $this->config->get($this->name.'_name');

                $method_data = array(
                    'code'       => $this->name,
                    'title'      => html_entity_decode($title[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8'),
                    'quote'      => $quote_data,
                    'error'      => false,
                    'sort_order' => isset($error) ? ($this->config->get($this->name.'_sort_order') + 1000) : $this->config->get($this->name.'_sort_order')
                );
            }
        }

        //print_r($method_data);

        return $method_data;
    }

}
?>
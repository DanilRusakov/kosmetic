<?php
class ModelExtensionModuleOctPopupCallPhone extends Model {
	public function addRequest($data) {
		$this->db->query("INSERT INTO ".DB_PREFIX."oct_popup_call_phone SET info = '".$this->db->escape($data['info'])."', date_added = NOW()");
	}
}
?>
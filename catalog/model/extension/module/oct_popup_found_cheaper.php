<?php
class ModelExtensionModuleOctPopupFoundCheaper extends Model {
	public function addRequest($data, $linkgood) {
		$this->db->query("INSERT INTO ".DB_PREFIX."oct_popup_found_cheaper SET info = '".$this->db->escape($data['info'])."', note = '".$this->db->escape($linkgood)."', date_added = NOW()");
	}
}
?>
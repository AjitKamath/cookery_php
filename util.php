<?php

	function check_for_null($value) {
		if (is_array($value)) {
			if (count($value) > 0) {
				return TRUE;
			} else {
				return FALSE;
			}
		} else {
			if (($value != '') && ($value !== NULL) && (strlen(trim($value)) > 0)) {
				return TRUE;
			} else {
				return FALSE;
			}
		}
	}
?>
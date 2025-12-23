extends Control

func _get_drag_data(position: Vector2):
	print("drag")
	var data := {
		"sprite" : $sprite.texture,
		"amount" : $amount.text,
		"backup" : self
	}
	
	var preview = self.duplicate()
	preview.get_node("background").hide()
	preview.get_node("amount").hide()
	preview.get_node("sprite").position = preview.size / 2
	
	
	set_drag_preview(preview)
	
	return data
	
func set_empty_slot() -> void:
	$sprite.texture = null
	$amount.text = ""
	
	
func _can_drop_data(position: Vector2, data) -> bool:
	return true
	
func _drop_data(position: Vector2, data) -> void:
	var origin = data["backup"]

	# stack
	if $sprite.texture == data["sprite"]:
		var drop_item := int($amount.text if $amount.text != "" else "0")
		drop_item += int(data["amount"])
		$amount.text = str(drop_item)

		origin.set_empty_slot()

	# troca
	else:
		origin.get_node("sprite").texture = $sprite.texture
		origin.get_node("amount").text = $amount.text

		$sprite.texture = data["sprite"]
		$amount.text = data["amount"]

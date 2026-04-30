extends Node2D


func _on_playbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_quitbutton_pressed() -> void:
	get_tree().quit()

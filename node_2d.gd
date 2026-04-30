extends Node2D

# Textures of each drums
@onready var kick_button = $Kick
@onready var kick_normal = preload("res://kick_image.png")
@onready var kick_pressed = preload("res://kick_clicked.png")

@onready var snare_button = $Snare
@onready var snare_normal = preload("res://snare_image.png")
@onready var snare_pressed = preload("res://snare_click.png")

@onready var hightom_button = $HighTom
@onready var hightom_normal = preload("res://hightom_image.png")
@onready var hightom_pressed = preload("res://hightom_click.png")

@onready var lowtom_button = $LowTom
@onready var lowtom_normal = preload("res://lowtom.png")
@onready var lowtom_pressed = preload("res://lowtom_click.png")

@onready var closehh_button = $ClosedHiHat
@onready var closehh_normal = preload("res://closehh.png")
@onready var closehh_pressed = preload("res://closehh_click.png")

@onready var openhh_button = $OpenHiHat
@onready var openhh_normal = preload("res://openhh.png")
@onready var openhh_pressed = preload("res://openhh_click.png")

@onready var crash_button = $Crash
@onready var crash_normal = preload("res://crash.png")
@onready var crash_pressed = preload("res://crash_click.png")

@onready var ride_button = $Ride
@onready var ride_normal = preload("res://ride.png")
@onready var ride_pressed = preload("res://ride_click.png")



# Code for MIDI
func play_note(note, duration, channel):
	var m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_ON
	m.pitch = note
	m.velocity = 100
	m.channel = channel
	
	$MidiPlayer.receive_raw_midi_message(m)
	
	await get_tree().create_timer(duration).timeout
	
	m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_OFF
	m.pitch = note
	m.velocity = 100
	m.channel = channel
	
	$MidiPlayer.receive_raw_midi_message(m)



# Functions for each sounds
func _on_kick_pressed() -> void:
	play_note(36, 0.2, 9)


func _on_snare_pressed() -> void:
	play_note(38, 0.2, 9)


func _on_closed_hi_hat_pressed() -> void:
	play_note(42, 0.2, 9)


func _on_open_hi_hat_pressed() -> void:
	play_note(46, 0.2, 9)


func _on_crash_pressed() -> void:
	play_note(49, 0.2, 9)


func _on_ride_pressed() -> void:
	play_note(51, 0.2, 9)


func _on_high_tom_pressed() -> void:
	play_note(50, 0.2, 9)


func _on_low_tom_pressed() -> void:
	play_note(45, 0.2, 9)



# Keyboard inputs
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("play_kick"):
		animate_kick()
		play_note(36, 0.2, 9)
	
	if Input.is_action_just_pressed("play_snare"):
		animate_snare()
		play_note(38, 0.2, 9)
	
	if Input.is_action_just_pressed("play_closehh"):
		animate_closehh()
		play_note(42, 0.2, 9)
	
	if Input.is_action_just_pressed("play_openhh"):
		animate_openhh()
		play_note(46, 0.2, 9)
	
	if Input.is_action_just_pressed("play_crash"):
		animate_crash()
		play_note(49, 0.2, 9)
	
	if Input.is_action_just_pressed("play_ride"):
		animate_ride()
		play_note(51, 0.2, 9)
	
	if Input.is_action_just_pressed("play_hightom"):
		animate_hightom()
		play_note(50, 0.2, 9)
	
	if Input.is_action_just_pressed("play_lowtom"):
		animate_lowtom()
		play_note(45, 0.2, 9)



# Functions for animating each key press
func animate_kick():
	kick_button.texture_normal = kick_pressed
	await get_tree().create_timer(0.10).timeout
	kick_button.texture_normal = kick_normal

func animate_snare():
	snare_button.texture_normal = snare_pressed
	await get_tree().create_timer(0.10).timeout
	snare_button.texture_normal = snare_normal

func animate_hightom():
	hightom_button.texture_normal = hightom_pressed
	await get_tree().create_timer(0.10).timeout
	hightom_button.texture_normal = hightom_normal

func animate_lowtom():
	lowtom_button.texture_normal = lowtom_pressed
	await get_tree().create_timer(0.10).timeout
	lowtom_button.texture_normal = lowtom_normal

func animate_closehh():
	closehh_button.texture_normal = closehh_pressed
	await get_tree().create_timer(0.10).timeout
	closehh_button.texture_normal = closehh_normal

func animate_openhh():
	openhh_button.texture_normal = openhh_pressed
	await get_tree().create_timer(0.10).timeout
	openhh_button.texture_normal = openhh_normal

func animate_crash():
	crash_button.texture_normal = crash_pressed
	await get_tree().create_timer(0.10).timeout
	crash_button.texture_normal = crash_normal

func animate_ride():
	ride_button.texture_normal = ride_pressed
	await get_tree().create_timer(0.10).timeout
	ride_button.texture_normal = ride_normal



# Button to go to main menu scene
func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

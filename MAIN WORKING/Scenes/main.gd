extends Node3D

@onready var al_collision: Area3D = $Al_Collision
@onready var albert: Node3D = $Albert
@onready var albert_sound: AudioStreamPlayer3D = $Albert/Albert_sound
@onready var fridge_sfx: AudioStreamPlayer3D = $Freezer_audio/Fridge_sfx

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	albert.visible= true

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#show albert and play audio
func _on_al_collision_body_entered(body: Node3D) -> void:
	albert.show()
	albert_sound.play()
	al_collision.set_deferred("disabled", true)
	
#audio no longer plays and albert disspears
func _on_al_collision_body_exited(body: Node3D) -> void:
	albert.position += Vector3(0, -10, 0)
	albert_sound.set_deferred("playing", false)
	albert_sound.volume_db = -80


func _on_freezer_audio_body_entered(body: Node3D) -> void:
	fridge_sfx.play()


func _on_freezer_audio_body_exited(body: Node3D) -> void:
	fridge_sfx.stop()

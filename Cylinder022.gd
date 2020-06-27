extends MeshInstance
onready var myAnimation = get_node("AnimationPlayer")
onready var selected = preload("res://materials/SelectedCylinder.tres")
onready var usual = preload("res://materials/UsualCylinder.tres")
onready var seedable = preload("res://materials/Seedable.tres")
onready var SeedMesh = get_node("SeedMesh")
var seed_state = 0
var can_seed = false
signal seeded

func _ready():
	var Seed = get_tree().get_root().find_node("Seed",true,false)
	var Root = get_tree().get_root().find_node("photosynthesis",true,false)
	Seed.connect("clicked",self, "_on_Clicked")
	Root.connect("got_seeded",self,"_on_got_seeded")
	self.set_surface_material(0,usual)


func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT and can_seed == true and seed_state == 0:
			SeedMesh.set_visible(true)
			seed_state = 1
			emit_signal("seeded")



func _on_StaticBody_mouse_entered():
	if can_seed != true:
		self.set_surface_material(0,selected)
#		var v = Vector3(0, 0.1, 0)
#		self.translate_object_local(v)
		myAnimation.play("color")


func _on_StaticBody_mouse_exited():
	if can_seed != true:
		self.set_surface_material(0,usual)
#		var v = Vector3(0, -0.1, 0)
#		self.translate_object_local(v)

func _on_Clicked():
	if seed_state == 0:
		can_seed = true
		self.set_surface_material(0,seedable)
		myAnimation.play("seedable")

func _on_got_seeded():
	can_seed = false
	self.set_surface_material(0,usual)

extends Resource
class_name Item

@export var icon : Texture2D
@export var name : String
@export var slot : int

# types of items
@export_enum("piece")
var type = "piece"

# item description
@export_multiline var description : String

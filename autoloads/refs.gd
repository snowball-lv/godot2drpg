extends Node

var player: Player
var hud: HUD
var navigation: TileMapLayer

const DAMAGE_FX_SCENE = preload("res://scenes/effects/damage_fx.tscn")
const DAMAGE_TEXT_SCENE = preload("res://scenes/effects/damage_text.tscn")
const NEW_LEVEL_FX_SCENE = preload("res://scenes/effects/new_level_fx.tscn")
const DROP_ITEM_SCENE = preload("res://scenes/drop_item/drop_item.tscn")
const SHOP_BUTTON_SCENE = preload("res://scenes/ui/shop_panel/shop_button.tscn")

func create_damage_fx(pos: Vector2) -> void:
	create_fx_at_pos(DAMAGE_FX_SCENE, pos)
	
func create_new_level_fx(pos: Vector2) -> void:
	create_fx_at_pos(NEW_LEVEL_FX_SCENE, pos)
	
func create_damage_text(pos: Vector2, amount: float) -> void:
	var label: Label = DAMAGE_TEXT_SCENE.instantiate()
	label.text = str(amount)
	label.global_position = pos + Vector2.RIGHT.rotated(randf_range(0, TAU)) * 4
	get_tree().root.add_child(label)
	var tween = create_tween()
	tween.tween_property(label, "global_position:y", label.global_position.y - 24, 0.7)
	tween.tween_callback(label.queue_free)
	
func create_fx_at_pos(scene: PackedScene, pos: Vector2) -> void:
	var fx: AnimatedSprite2D = scene.instantiate()
	fx.global_position = pos
	get_tree().root.add_child(fx)
	fx.animation_finished.connect(func(): fx.queue_free())

extends CanvasLayer
class_name HUD

@onready var equipment_panel: EquipmentPanel = %EquipmentPanel
@onready var inventory_panel: IventoryPanel = %InventoryPanel
@onready var stats_panel: StatsPanel = %StatsPanel
@onready var skills_panel: SkillPanel = %SkillsPanel

@onready var health_bar: ProgressBar = $HealthBar
@onready var mana_bar: ProgressBar = $ManaBar
@onready var exp_bar: ProgressBar = $ExpBar

@onready var health_label: Label = %HealthLabel
@onready var mana_label: Label = %ManaLabel

func _ready() -> void:
	EventBus.on_player_health_updated.connect(_on_player_health_updated)
	EventBus.on_player_mana_updated.connect(_on_player_mana_updated)
	EventBus.on_player_new_level.connect(_on_player_new_level)
	
func _on_player_health_updated(curr: float, max: float) -> void:
	health_bar.value = curr / max
	health_label.text = "%d / %d" % [curr, max]
	
func _on_player_mana_updated(curr: float, max: float) -> void:
	mana_bar.value = curr / max
	mana_label.text = "%d / %d" % [curr, max]
	
func _on_player_new_level(curr: float, new_level_exp: float) -> void:
	exp_bar.value = curr / new_level_exp

func toggle_panel(panel: PanelContainer) -> void:
	panel.visible = !panel.visible

func _on_equipment_button_pressed() -> void:
	toggle_panel(equipment_panel)

func _on_inventory_button_pressed() -> void:
	toggle_panel(inventory_panel)

func _on_stats_button_pressed() -> void:
	toggle_panel(stats_panel)

func _on_skills_button_pressed() -> void:
	toggle_panel(skills_panel)

extends Node

var PODE_ARAR = false
var tile_map: TileMap
var PLAYER: CharacterBody2D
var TERRA_ARADA: PackedScene

func _ready() -> void:
	await get_tree().process_frame

	tile_map = $"../../TileMap"
	PLAYER = $"../../FAZENDEIRO"
	TERRA_ARADA =load("res://CENAS/terra_arada.tscn")

#VERIFICAR
	#if PLAYER and tile_map and TERRA_ARADA:
		#print("Player e TileMap encontrados ✅")
	#else:
		#print("ERRO: Player ou TileMap não encontrados ❌")
func tem_algo_na_celula(cell: Vector2i) -> bool:
	for child in get_parent().get_children():
		if not child is Node2D:
			continue

		var child_local = tile_map.to_local(child.global_position)
		var child_cell = tile_map.local_to_map(child_local)

		if child_cell == cell:
			return true

	return false


func _physics_process(delta: float) -> void:
	if PLAYER == null or tile_map == null:
		return
	if TERRA_ARADA == null or tile_map == null:
		return

	var player_global_position = PLAYER.global_position
	var local_pos = tile_map.to_local(player_global_position)
	var cell: Vector2i = tile_map.local_to_map(local_pos)

	var layer_index = 3
	var tile_id = tile_map.get_cell_source_id(layer_index, cell)

	if tile_id != -1:
		PODE_ARAR = true
		#print(PODE_ARAR)
		#print("Player está sobre um tile ✅")
	if tile_id == -1:
		PODE_ARAR = false
		#print(PODE_ARAR)
		#print("Player NAO está sobre um tile  ❌")
	#print(PODE_ARAR)
	if PODE_ARAR == true and Input.is_action_just_released("interagir"):
		if tem_algo_na_celula(cell):
			return # já tem algo ali, não ara
		#print("debug")
		var instance = TERRA_ARADA.instantiate()
		# converte a cell para a posição global certinha
		var tile_global_pos = tile_map.to_global(tile_map.map_to_local(cell))
		instance.position = tile_global_pos
		get_parent().add_child(instance)

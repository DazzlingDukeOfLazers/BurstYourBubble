extends Node

class_name Thing

@export var thing_name : String = "apple"

func _ready():
	var thing_json = load_thing(thing_name)
	print(thing_json.name + " " + thing_json.attributes.mass)


func load_thing(thing_name):
	var file_path = "res://things/" + thing_name + ".thing"
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	var json = JSON.new()
	var thing_data:Dictionary = json.parse_string(content)		
	return thing_data
	



#
#@export var description : String
#@export var mass : float
#
#@export var density : float
#@export var length : float 
#@export var width : float
#@export var height : float

#3. Size (Width, Height, Depth)
#4. Acceleration
#5. Material
#6. Color
#7. Texture
#8. Flammability
#9. Friction
#10. Elasticity
#11. Opacity
#12. Solidity (Can it be passed through?)
#13. Collectability (Can it be collected?)
#14. Visibility (Can it be seen?)
#15. Interactivity (Can it be interacted with?)
#16. Life/Health
#17. Strength/Power
#18. Range (for attacks or interactions)
#19. Agility
#20. Speed
#21. Endurance
#22. Damage (How much damage can it inflict?)
#23. Defense (How much damage can it withstand?)
#24. Energy consumption
#25. Energy regeneration
#26. Temperature
#27. Durability
#28. Permeability
#29. Resistance (to elements, attacks, etc.)
#30. Condition (Healthy, Damaged, Destroyed, etc.)
#31. State (Active, Inactive, Sleep, etc.)
#32. Light emission (Brightness, color, range)
#33. Sound emission (Volume, pitch, range)
#34. AI state (Passive, Aggressive, Fleeing, etc.)
#35. AI behavior (Patrol path, Follow, Wander, etc.)
#36. Inventory (List of carried items)
#37. Equipped item
#38. Use state (Unused, In use, Expended)
#39. Fuel level
#40. Expiry time
#41. Spawn time
#42. Value (in in-game currency)
#43. Rarity
#44. Level
#45. Experience points
#46. Quest association (if it's part of a quest)
#47. Owner
#48. Alignment (Good, Evil, Neutral)
#49. Faction affiliation
#50. Spell resistance
#51. Enchantability (Can it be enchanted?)
#52. Enchantment (What enchantment does it have?)
#53. Stacking limit
#54. Cooldown time
#55. Charge time
#56. Repairability
#57. Biome preference (Preferred or native biome)
#58. Feeding cycle (For animals or monsters)
#59. Sleep cycle

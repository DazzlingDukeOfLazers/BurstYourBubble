extends Node2D

# Research and development using the Noun Project API V2 and Godot 4 HTTPRequest 
# - https://api.thenounproject.com/documentation.html
var NOUN_KEY = "your_noun_project_api_key"
var NOUN_SECRET = "your_noun_project_api_secret"


func _process(_delta):
	pass

# # Function to read NOUN_KEY and NOUN_SECRET from environmental variables
# func readNounCredentials():
# 	NOUN_KEY = OS.get_environment("NOUN_KEY")
# 	NOUN_SECRET = OS.get_environment("NOUN_SECRET")
# 	# print(NOUN_KEY)
# 	# print(NOUN_SECRET)
# 	print("Noun Project API Key:", NOUN_KEY)
# 	print("Noun Project API Secret:", NOUN_SECRET)


func _ready():

	print("[starting]")

	# Create an HTTP request node and connect its completion signal.
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)

	# Perform a GET request. The URL below returns JSON as of writing.
	var error = http_request.request("https://httpbin.org/get")
	if error != OK:
		push_error("An error occurred in the HTTP request.")


	

	# Perform a POST request. The URL below returns JSON as of writing.
	# Note: Don't make simultaneous requests using a single HTTPRequest node.
	# The snippet below is provided for reference only.
	# var body = JSON.new().stringify({"name": "Godette"})
	# error = http_request.request("https://httpbin.org/post", [], HTTPClient.METHOD_POST, body)
	# if error != OK:
	# 	push_error("An error occurred in the HTTP request.")

# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	print("request complete")

	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print(response)

	# Will print the user agent string used by the HTTPRequest node (as recognized by httpbin.org).
	print(response.headers["User-Agent"])




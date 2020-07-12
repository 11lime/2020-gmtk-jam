extends Control

onready var player = $MusicPlayer;
onready var effects = $EffectPlayer;

var playing : bool = false;
var currentTrack : String;

func playTrack(track_url : String):
	var track = load(track_url);
	player.stream = track;
	player.play();
	playing = true;
	currentTrack = track_url;
	
func stop():
	player.stop();
	playing = false;
	
func startPlaying(track_url : String):
	
	if currentTrack != track_url:
		playTrack(track_url);

func playCurrentTrack():
	if (currentTrack != null):
		playTrack(currentTrack);

func setAudioLevel(db : float):
	player.volume_db = db;

func playSoundeffect(effectName : String):
	var path = "res://Music/" + effectName + ".wav"
	var track = load(path);
	
	if !effects.playing:
		effects.stream = track;
		effects.play();
	else:
		var asp = effects.duplicate(DUPLICATE_USE_INSTANCING)
		get_parent().add_child(asp)
		asp.stream = track
		asp.play()
		yield(asp, "finished")
		asp.queue_free()

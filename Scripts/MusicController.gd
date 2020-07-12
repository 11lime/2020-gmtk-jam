extends Control

onready var player = $MusicPlayer;

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

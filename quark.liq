
set("log.file",true)
set("log.level",3)
set("log.file.path","/home/gabios/quark.log")

%include "/home/gabios/quarklib.liq"

intropoetry = playlist(mode = "normal", reload = 1, reload_mode = "rounds", length = 50.,  "/home/gabios/media/intropoetry");
intronews = playlist(mode = "normal", reload = 1, reload_mode = "rounds", length = 50.,  "/home/gabios/media/intronews");
intromusic = playlist(mode = "normal", reload = 1, reload_mode = "rounds", length = 50.,  "/home/gabios/media/intromusic");
introlive = playlist(mode = "normal", reload = 1, reload_mode = "rounds", length = 50.,  "/home/gabios/media/introlive");

music = request.dynamic(id="musicscheduler",default_duration=30.,length=1.,
    fun () ->
      request.create(get_process_output("/usr/local/bin/musicscheduler.sh 2>> /home/gabios/quarkscripts.log")));

news = request.dynamic(id="newsscheduler",default_duration=30.,length=1.,
    fun () ->
      request.create(get_process_output("/usr/local/bin/newsscheduler.sh 2>> /home/gabios/quarkscripts.log")));

poetry = request.dynamic(id="poetryscheduler",default_duration=30.,length=1.,
    fun () ->
      request.create(get_process_output("/usr/local/bin/poetryscheduler.sh 2>> /home/gabios/quarkscripts.log")));

jingle = playlist(mode = "normal", reload = 1, reload_mode = "rounds", length = 50.,  "/home/gabios/media/jingle");

laststand = playlist.safe(mime_type = "audio/ogg", "/usr/share/liquidsoap/laststand.txt");

music = random(weights = [1, 1], [delay(1.,jingle), music])

poetry = delay(600.,poetry);


def tr_poetry(old,new)
 sequence([ intropoetry , new ])
end
def tr_live(old,new)
 #sequence([ introlive , new ])
 add(normalize=false,
      [ sequence(merge=true,
                 [ blank(duration=3.),introlive,
                   fade.initial(duration=6.,new) ]),
        sequence([fade.final(duration=9.,old),
                  fallback([])]) ])
end

def tr_news(old,new)
 #sequence([ intronews , new ])
 add(normalize=false,
      [ sequence(merge=true,
                 [ blank(duration=3.),intronews,
                   fade.initial(duration=6.,new) ]),
        sequence([fade.final(duration=9.,old),
                  fallback([])]) ])
end

def tr_music(old,new)
 sequence([ intromusic , new ])
end

muzic_and_poetry = fallback(track_sensitive=true,
			transitions = [
			tr_poetry,
			tr_music
			],
			[
			poetry,
			on_track(createnext, music)
			]);

radio = fallback(track_sensitive=false,
	transitions = [
	tr_live,
	tr_news
	],
	[
        request.queue(id="quarkq"),
	request.queue(id="quarknews"),
	switch([({false},news)]),
	muzic_and_poetry,
	laststand
	])

radio = amplify(1.,override="replay_gain",radio)

radio = map_metadata(rewrite_metadata, radio)

output.icecast.vorbis(host = "localhost", port = 8000, password = "*******", mount = "liq.ogg", radio)
